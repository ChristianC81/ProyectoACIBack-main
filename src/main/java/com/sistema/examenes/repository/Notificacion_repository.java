package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Notificacion;
import com.sistema.examenes.entity.TokenFCM;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

public interface Notificacion_repository extends JpaRepository<Notificacion, Long> {

    TokenFCMRepository tokenFCMRepository = null;

    //ListarTODO
    @Query("SELECT n FROM Notificacion n ORDER BY n.fecha DESC")
    List<Notificacion> listarTodasNotificaciones();
    @Query("SELECT n FROM Notificacion n WHERE n.usuario=:user ORDER BY n.fecha DESC")
    List<Notificacion> listarUserNoti(Long user);

    @Query("SELECT n FROM Notificacion n WHERE n.usuario = :user ORDER BY n.fecha DESC")
    List<Notificacion> listarUserNotimovil(Long user, Pageable pageable);
    @Modifying
    @Transactional
    @Query(value = "DELETE FROM notificacion WHERE id=:id", nativeQuery = true)
    void borrar(Long id);

    @Query(value = "SELECT * FROM notificacion WHERE DATE(fecha)<CAST(:fec AS DATE)", nativeQuery = true)
    List<Notificacion> listarNot(String fec);
    @Query("SELECT n FROM Notificacion n WHERE n.rol = :roluser ORDER BY n.fecha DESC")
    List<Notificacion> all(@Param("roluser") String roluser, Pageable pageable);
    @Query("SELECT n FROM Notificacion n WHERE n.rol = :roluser ORDER BY n.fecha DESC")
    List<Notificacion> allmovil(@Param("roluser") String roluser, Pageable pageable);
    @Query("SELECT n FROM Notificacion n " +
            "WHERE n.rol = :roluser " +
            "AND n.idactividad IN ( " +
            "    SELECT ae.evidencia.id_evidencia " +
            "    FROM Asignacion_Evidencia ae " +
            "    WHERE ae.id_usuario_asignador = :userId )" +
            "ORDER BY n.fecha DESC")
    List<Notificacion> all2(@Param("roluser") String roluser, @Param("userId") Long userId);

    @Query(value = "SELECT DISTINCT ON (mensaje)* FROM notificacion WHERE usuario=:user ORDER BY mensaje, fecha DESC;",nativeQuery = true)
    List<Notificacion> listarulNoti(@Param("user") Long user);

    @Query(value = "SELECT DATE(fecha_fin) FROM modelo WHERE id_modelo=(SELECT MAX(id_modelo) FROM modelo WHERE id_modelo < (SELECT MAX(id_modelo) FROM modelo))", nativeQuery = true)
    Date fechaeliminar();


      @Query("SELECT n FROM Notificacion n WHERE n.usuario = :user AND n.visto = false ORDER BY n.fecha DESC")
    List<Notificacion> findNotificacionesNoVistasByUserId(Long user);

@Query("SELECT t FROM TokenFCM t WHERE t.usuario.id IN :userIds")
List<TokenFCM> findTokensByUserIds(@Param("userIds") List<Long> userIds);


    @Query("SELECT DISTINCT n.usuario  FROM Notificacion n WHERE n.fecha > :fechaUltimaConsulta AND n.visto = false")
    List<Long> findUserIdsWithNewNotificacionesNoVistas(@Param("fechaUltimaConsulta") Date fechaUltimaConsulta);


    @Query("SELECT n FROM Notificacion n WHERE n.visto = false AND n.fecha > :fechaUltimaConsulta")
    List<Notificacion> findNotificacionesNuevasNoVistasByUserId(@Param("fechaUltimaConsulta") java.util.Date fechaUltimaConsulta);




}
