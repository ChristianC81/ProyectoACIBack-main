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
import java.util.List;

@Service
public class Notificacion_ServiceImpl extends GenericServiceImpl<Notificacion,Long> implements NotificacionService {
    @Autowired
    private Notificacion_repository notificacionRepository;
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
        return notificacionRepository.all2(roluser,userId);
    }

    @Override
    public Date fechaeliminar() {
        return notificacionRepository.fechaeliminar();
    }

}
