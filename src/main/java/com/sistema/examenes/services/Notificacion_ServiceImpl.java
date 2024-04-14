package com.sistema.examenes.services;

import com.sistema.examenes.entity.Notificacion;
import com.sistema.examenes.repository.Notificacion_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import com.google.firebase.messaging.*;
import com.sistema.examenes.entity.TokenFCM;
import com.sistema.examenes.repository.TokenFCMRepository;


import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class Notificacion_ServiceImpl extends GenericServiceImpl<Notificacion,Long> implements NotificacionService {
    @Autowired
    private Notificacion_repository notificacionRepository;
    @Autowired
    private TokenFCMRepository tokenFCMRepository;

    @Override
    public CrudRepository<Notificacion, Long> getDao() {
        return notificacionRepository;
    }

    @Override
    public List<Notificacion> listarTodasNotificaciones() {
        return notificacionRepository.listarTodasNotificaciones();
    }

    @Override
    public List<Notificacion> listar(Long user) {
        return notificacionRepository.listarUserNoti(user);
    }

    @Override
    public List<Notificacion> listarmovil(Long user) {
        Pageable pageable = PageRequest.of(0, 15, Sort.by("fecha").descending());
        return notificacionRepository.listarUserNotimovil(user, pageable);
    }

    @Override
    public void eliminar(Long id) {
        notificacionRepository.borrar(id);
    }

    @Override
    public List<Notificacion> listarNotifi(String fecha) {
        return notificacionRepository.listarNot(fecha);
    }

    @Override
    public List<Notificacion> listarulNoti(Long us) {
        return notificacionRepository.listarulNoti(us);
    }

    @Override
    public List<Notificacion> all(String roluser) {
        Pageable pageable = PageRequest.of(0, 20); // Página 0 y tamaño de página 20
        return notificacionRepository.all(roluser, pageable);
    }

    @Override
    public List<Notificacion> allmovil(String roluser) {
        Pageable pageable = PageRequest.of(0, 15); // Página 0 y tamaño de página 20
        return notificacionRepository.allmovil(roluser, pageable);
    }

    @Override
    public List<Notificacion> all2(String roluser, Long userId) {
        return notificacionRepository.all2(roluser, userId);
    }

    @Override
    public Date fechaeliminar() {
        return notificacionRepository.fechaeliminar();
    }

  public void procesarNotificaciones() {
      LocalDateTime fechaUltimaConsulta = LocalDateTime.now();
      java.sql.Date fechaUltimaConsultaDate = new java.sql.Date(
              Date.from(fechaUltimaConsulta.atZone(ZoneId.systemDefault()).toInstant()).getTime());

      // Obtener todos los IDs de los usuarios con notificaciones nuevas no vistas
      List<Long> userIds = notificacionRepository.findUserIdsWithNewNotificacionesNoVistas(fechaUltimaConsultaDate);

      if (userIds.isEmpty()) {
          System.out.println("No hay nuevas notificaciones para ningún usuario");
          return;
      }

      System.out.println("Notificaciones nuevas encontradas para usuarios: " + userIds.size());

      // Actualizar la fecha de última consulta para todos los usuarios
      fechaUltimaConsulta = LocalDateTime.now();

      System.out.println("Buscando tokens FCM para los usuarios: " + userIds);
      List<TokenFCM> tokensNoVistos = notificacionRepository.findTokensByUserIds(userIds);
      System.out.println("Tokens FCM encontrados: " + tokensNoVistos.size());

      if (tokensNoVistos.isEmpty()) {
          System.out.println("No hay tokens FCM asociados a los usuarios con notificaciones nuevas.");
          return;
      }

      // Filtrar las notificaciones nuevas no vistas por usuario y enviar notificaciones
      userIds.forEach(userId -> {
          List<Notificacion> notificacionesNuevasPorUsuario = notificacionRepository.findNotificacionesNuevasNoVistasByUserId( fechaUltimaConsultaDate);

          System.out.println("Notificaciones nuevas para el usuario " + userId + ": " + notificacionesNuevasPorUsuario.size());

          if (!notificacionesNuevasPorUsuario.isEmpty()) {
              List<TokenFCM> tokensPorUsuario = tokensNoVistos.stream()
                      .filter(token -> token.getUsuario().getId().equals(userId))
                      .collect(Collectors.toList());

              tokensPorUsuario.forEach(tokenFCM -> {
                  notificacionesNuevasPorUsuario.forEach(notificacion -> {
                      Message message = Message.builder()
                              .setToken(tokenFCM.getToken())
                              .setNotification(Notification.builder()
                                      .setTitle("Nueva notificación")
                                      .setBody(notificacion.getMensaje())
                                      .build())
                              .build();

                      System.out.println("Enviando mensaje a token: " + tokenFCM.getToken());
                      System.out.println("Mensaje: " + notificacion.getMensaje());

                      try {
                          String response = FirebaseMessaging.getInstance().send(message);
                          System.out.println("Mensaje enviado con éxito: " + response);

                          // Marcar la notificación como vista después de enviarla
                          notificacion.setVisto(true);
                          notificacionRepository.save(notificacion);
                          System.out.println("Notificación marcada como vista.");

                      } catch (FirebaseMessagingException e) {
                          System.err.println("Error al enviar el mensaje: " + e.getMessage());
                          e.printStackTrace();
                      } catch (Exception ex) {
                          System.err.println("Otro error al enviar el mensaje: " + ex.getMessage());
                          ex.printStackTrace();
                      }
                  });
              });
          }
      });
  }

}
