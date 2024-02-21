package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Asignacion_Admin;
import com.sistema.examenes.projection.ActivAprobadaProjection;
import com.sistema.examenes.projection.ActivProyection;
import com.sistema.examenes.projection.AsignacionProjection;
import com.sistema.examenes.projection.NombreAsigProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface Asignacion_Admin_repository extends JpaRepository<Asignacion_Admin, Long> {
    @Query(value = "SELECT * from asignacion_admin where visible =true", nativeQuery = true)
    List<Asignacion_Admin> listarAsignacion_Admin();
    @Query(value = "SELECT DISTINCT u.id as enc, per.primer_nombre||' '||per.primer_apellido as nombrescri, cri.nombre as actividasi " +
            "FROM asignacion_admin aa JOIN usuarios u ON aa.usuario_id=u.id " +
            "JOIN persona per ON per.id_persona=u.persona_id_persona AND u.visible=true " +
            "JOIN criterio cri ON cri.id_criterio=aa.criterio_id_criterio AND cri.visible=true " +
            "JOIN subcriterio s ON s.id_criterio=cri.id_criterio AND s.visible=true " +
            "JOIN indicador i ON i.subcriterio_id_subcriterio= s.id_subcriterio AND i.visible=true " +
            "JOIN asignacion_indicador ai ON ai.indicador_id_indicador=i.id_indicador AND ai.visible=true " +
            "JOIN modelo mo ON mo.id_modelo=ai.modelo_id_modelo " +
            "WHERE aa.visible=CAST(:veri AS BOOLEAN) AND aa.id_modelo=:id_modelo ORDER BY u.id;", nativeQuery = true)
    List<AsignacionProjection> asignacionAdmin(Long id_modelo, String veri);

    @Query(value = "SELECT * from asignacion_admin where usuario_id = ?1 and id_modelo = ?2 and visible =true ", nativeQuery = true)
    Asignacion_Admin listarAsignacion_AdminPorUsuario(Long id_usuario,Long id_modelo);
    @Query(value = "SELECT * from asignacion_admin where criterio_id_criterio = ?1 and id_modelo = ?2 AND visible=true", nativeQuery = true)
    List<Asignacion_Admin> listarAsignacion_AdminPorUsuarioCriterio(Long id_criterio, Long id_modelo);

    @Query(value = "SELECT * from asignacion_admin where criterio_id_criterio = ?1 and id_modelo = ?2 and usuario_id = ?3", nativeQuery = true)
    Asignacion_Admin asignacion_existente(Long id_criterio, Long id_modelo,Long id_usuario);
    @Query(value = "SELECT per.primer_nombre ||' '|| per.segundo_nombre||' '||per.primer_apellido||' '||per.segundo_apellido AS nombreaa FROM persona per\n" +
            "JOIN usuarios u ON u.persona_id_persona=per.id_persona\n" +
            "JOIN asignacion_admin aa ON aa.usuario_id=u.id AND aa.visible=true\n" +
            "JOIN modelo mo ON mo.id_modelo=aa.id_modelo\n" +
            "WHERE aa.id_modelo=:id_modelo AND aa.criterio_id_criterio=:id_criterio", nativeQuery = true)
    NombreAsigProjection listarnombre_Admin(Long id_modelo, Long id_criterio);

    @Query(value = "SELECT DISTINCT u.id as enc, " +
            "per.primer_nombre || ' ' || per.primer_apellido as nombrescri, " +
            "cri.nombre as actividasi " +
            "FROM asignacion_admin aa " +
            "JOIN usuarios u ON aa.usuario_id = u.id " +
            "JOIN persona per ON per.id_persona = u.persona_id_persona AND u.visible = true " +
            "JOIN criterio cri ON cri.id_criterio = aa.criterio_id_criterio AND cri.visible = true " +
            "JOIN subcriterio s ON s.id_criterio = cri.id_criterio AND s.visible = true " +
            "JOIN indicador i ON i.subcriterio_id_subcriterio = s.id_subcriterio AND i.visible = true " +
            "JOIN asignacion_indicador ai ON ai.indicador_id_indicador = i.id_indicador AND ai.visible = true " +
            "JOIN modelo mo ON mo.id_modelo = ai.modelo_id_modelo " +
            "JOIN usuariorol ur ON ur.usuario_id = u.id " +
            "WHERE aa.visible = true " +
            "AND aa.id_modelo = :id_modelo " +
            "AND cri.id_criterio = :id_criterio " +
            "AND ur.rol_rolid = 1 " +  // Nuevo filtro por rol_rolid
            "ORDER BY u.id;", nativeQuery = true)
    List<AsignacionProjection> veradminsporcriterio(Long id_modelo, Long id_criterio);

    @Query(value = "SELECT aa FROM Asignacion_Admin aa WHERE aa.usuario.id = ?1 AND aa.id_modelo.id_modelo = ?2 AND aa.criterio.id_criterio = ?3 AND aa.visible = true")
    Asignacion_Admin buscar_asignacion_especifica(Long usuarioId, Long modeloId, Long criterioId);


    @Query(value = "SELECT DISTINCT u.id as enc, " +
            "per.primer_nombre || ' ' || per.primer_apellido as nombrescri, " +
            "cri.nombre as actividasi " +
            "FROM asignacion_admin aa " +
            "JOIN usuarios u ON aa.usuario_id = u.id " +
            "JOIN persona per ON per.id_persona = u.persona_id_persona AND u.visible = true " +
            "JOIN criterio cri ON cri.id_criterio = aa.criterio_id_criterio AND cri.visible = true " +
            "JOIN subcriterio s ON s.id_criterio = cri.id_criterio AND s.visible = true " +
            "JOIN indicador i ON i.subcriterio_id_subcriterio = s.id_subcriterio AND i.visible = true " +
            "JOIN asignacion_indicador ai ON ai.indicador_id_indicador = i.id_indicador AND ai.visible = true " +
            "JOIN modelo mo ON mo.id_modelo = ai.modelo_id_modelo " +
            "JOIN usuariorol ur ON ur.usuario_id = u.id " +
            "WHERE aa.visible = true " +
            "AND aa.id_modelo = :id_modelo " +
            "AND cri.id_criterio = :id_criterio " +
            "AND ur.rol_rolid = 3 " +  // Nuevo filtro por rol_rolid
            "ORDER BY u.id;", nativeQuery = true)
    List<AsignacionProjection> verresponsablesporcriterio(Long id_modelo, Long id_criterio);

    List<Asignacion_Admin> findAsignacion_AdminByUsuario_Id(Long id_usuario);

    @Query(value = "SELECT pe.primer_nombre||' '||pe.primer_apellido as encargado, ac.nombre as actividades,\n " +
            "ac.fecha_inicio as inicio, c.nombre as criterio,\n " +
            "s.nombre as subcriterio, i.nombre as indicador,\n " +
            "ac.fecha_fin as fin, ar.enlace as enlace, ar.nombre AS nomb, ev.descripcion as evidencia\n" +
            "FROM actividad ac JOIN evidencia ev ON ac.id_evidencia=ev.id_evidencia AND ac.visible=true \n" +
            "JOIN indicador i ON i.id_indicador = ev.indicador_id_indicador AND i.visible=true\n " +
            "JOIN asignacion_indicador ai ON ai.indicador_id_indicador=i.id_indicador AND ai.visible=true AND ai.modelo_id_modelo=:id_modelo\n" +
            "JOIN modelo mo ON mo.id_modelo=ai.modelo_id_modelo JOIN usuarios u ON u.id=ac.usuario_id\n " +
            "LEFT JOIN archivo ar ON ar.id_actividad = ac.id_actividad AND ar.visible = true\n " +
            "JOIN persona pe ON pe.id_persona=u.persona_id_persona \n" +
            "JOIN subcriterio s ON s.id_subcriterio = i.subcriterio_id_subcriterio\n " +
            "JOIN criterio c ON c.id_criterio = s.id_criterio\n " +
            "WHERE ac.fecha_inicio BETWEEN mo.fecha_inicio AND mo.fecha_fin \n" +
            "AND ac.fecha_fin BETWEEN mo.fecha_inicio AND mo.fecha_fin \n" +
            "AND ac.estado = 'Rechazada' AND ac.visible=true", nativeQuery = true)
    List<ActivAprobadaProjection> actividadRechazada(Long id_modelo);

    @Query(value = "SELECT pe.primer_nombre||' '||pe.primer_apellido as encargado, ac.nombre as actividades, \n" +
            "ac.fecha_inicio as inicio, c.nombre as criterio, \n" +
            "s.nombre as subcriterio, i.nombre as indicador, \n" +
            "ac.fecha_fin as fin, ar.enlace as enlace, ar.nombre AS nomb, ev.descripcion as evidencia\n" +
            "FROM actividad ac JOIN evidencia ev ON ac.id_evidencia=ev.id_evidencia AND ac.visible=true \n" +
            "JOIN indicador i ON i.id_indicador = ev.indicador_id_indicador AND i.visible=true \n" +
            "JOIN asignacion_indicador ai ON ai.indicador_id_indicador=i.id_indicador AND ai.visible=true AND ai.modelo_id_modelo=:id_modelo\n" +
            "JOIN modelo mo ON mo.id_modelo=ai.modelo_id_modelo JOIN usuarios u ON u.id=ac.usuario_id \n" +
            "LEFT JOIN archivo ar ON ar.id_actividad = ac.id_actividad AND ar.visible = true \n" +
            "JOIN persona pe ON pe.id_persona=u.persona_id_persona \n" +
            "JOIN subcriterio s ON s.id_subcriterio = i.subcriterio_id_subcriterio \n" +
            "JOIN criterio c ON c.id_criterio = s.id_criterio \n" +
            "WHERE ac.fecha_inicio BETWEEN mo.fecha_inicio AND mo.fecha_fin \n" +
            "AND ac.fecha_fin BETWEEN mo.fecha_inicio AND mo.fecha_fin \n" +
            "AND ac.estado = 'pendiente' AND ac.visible=true ", nativeQuery = true)
    List<ActivAprobadaProjection> actividadpendiente(Long id_modelo);

    @Query(value = "SELECT pe.primer_nombre||' '||pe.primer_apellido as encargado, ac.nombre as actividades, \n" +
            "ac.fecha_inicio as inicio, c.nombre as criterio, \n" +
            "s.nombre as subcriterio, i.nombre as indicador, \n" +
            "ac.fecha_fin as fin, ar.enlace as enlace, ar.nombre AS nomb, ev.descripcion as evidencia\n" +
            "FROM actividad ac JOIN evidencia ev ON ac.id_evidencia=ev.id_evidencia AND ac.visible=true \n" +
            "JOIN indicador i ON i.id_indicador = ev.indicador_id_indicador AND i.visible=true \n" +
            "JOIN asignacion_indicador ai ON ai.indicador_id_indicador=i.id_indicador AND ai.visible=true AND ai.modelo_id_modelo=:id_modelo\n" +
            "JOIN modelo mo ON mo.id_modelo=ai.modelo_id_modelo JOIN usuarios u ON u.id=ac.usuario_id \n" +
            "LEFT JOIN archivo ar ON ar.id_actividad = ac.id_actividad AND ar.visible = true \n" +
            "JOIN persona pe ON pe.id_persona=u.persona_id_persona \n" +
            "JOIN subcriterio s ON s.id_subcriterio = i.subcriterio_id_subcriterio \n" +
            "JOIN criterio c ON c.id_criterio = s.id_criterio \n" +
            "WHERE ac.fecha_inicio BETWEEN mo.fecha_inicio AND mo.fecha_fin \n" +
            "AND ac.fecha_fin BETWEEN mo.fecha_inicio AND mo.fecha_fin \n" +
            "AND ac.estado = 'Aprobada' AND ac.visible=true", nativeQuery = true)
    List<ActivAprobadaProjection> actividadAprobada(Long id_modelo);

    @Query(value = "SELECT per.primer_nombre || ' ' || per.primer_apellido as nombres, COUNT(ac.id_actividad) " +
            "as total, ROUND(SUM(CASE WHEN ac.estado = 'Aprobada' THEN 1 ELSE 0 END) * 100.0 / COUNT(ac.id_actividad), 2) as avance " +
            "FROM actividad ac JOIN evidencia ev ON ac.id_evidencia = ev.id_evidencia " +
            "JOIN indicador i ON i.id_indicador = ev.indicador_id_indicador " +
            "JOIN asignacion_indicador po ON po.indicador_id_indicador = i.id_indicador " +
            "JOIN modelo mo ON mo.id_modelo = po.modelo_id_modelo " +
            "JOIN usuarios u ON u.id = ac.usuario_id " +
            "JOIN persona per ON u.persona_id_persona = per.id_persona " +
            "WHERE mo.id_modelo =:id_modelo AND ac.fecha_inicio BETWEEN mo.fecha_inicio " +
            "AND mo.fecha_fin AND ac.fecha_fin  BETWEEN mo.fecha_inicio AND mo.fecha_fin " +
            "AND ac.visible = true " +
            "GROUP BY per.primer_nombre, per.primer_apellido;", nativeQuery = true)
    List<ActivProyection> actividadCont(Long id_modelo);




}
