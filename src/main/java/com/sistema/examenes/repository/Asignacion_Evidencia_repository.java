package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Asignacion_Evidencia;
import com.sistema.examenes.projection.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface Asignacion_Evidencia_repository extends JpaRepository<Asignacion_Evidencia, Long> {
    @Query("SELECT e.descripcion AS descripcion, ae.fecha_inicio AS fecha_inicio," +
            "ae.fecha_fin AS fecha_fin " +
            "FROM Asignacion_Evidencia ae " +
            "JOIN ae.evidencia e " +
            "JOIN e.indicador i " +
            "JOIN i.lista_asignacion po " +
            "JOIN po.modelo mo " +
            "WHERE ae.visible = true " +
            "AND mo.id_modelo = (SELECT MAX(m.id_modelo) FROM Modelo m) " +
            "ORDER BY ae.usuario.id, ae.evidencia.id_evidencia")
    List<AsignacionEvidenciaCalendarProjection> listarAsignacionEvidencia();

    @Query("SELECT ae FROM Asignacion_Evidencia ae " +
            "WHERE ae.evidencia.id_evidencia = :id_evidencia " +
            "AND ae.visible = true " +
            "AND ae.id_modelo = :id_modelo")
    Asignacion_Evidencia fechaactividades(Long id_evidencia, Long id_modelo);
    @Query("SELECT ae.id_asignacion_evidencia AS idevid, e.id_evidencia AS ideviden, cri.nombre AS crite, s.nombre AS subcrite, i.nombre AS indi, " +
            "CONCAT(pe.primer_nombre, ' ', pe.segundo_nombre, ' ', pe.primer_apellido, ' ', pe.segundo_apellido) AS respon, e.descripcion AS descev, ae.fecha_inicio AS ini, ae.fecha_fin AS fini " +
            "FROM Asignacion_Evidencia ae " +
            "JOIN ae.evidencia e " +
            "JOIN ae.usuario u " +
            "JOIN u.persona pe " +
            "JOIN e.indicador i " +
            "JOIN i.subcriterio s " +
            "JOIN s.criterio cri " +
            "JOIN i.lista_asignacion po " +
            "JOIN po.modelo mo " +
            "WHERE ae.visible = true " +
            "AND mo.id_modelo = (SELECT MAX(m.id_modelo) FROM Modelo m) " +
            "ORDER BY u.id, cri.id_criterio, s.id_subcriterio, i.id_indicador")
    List<AsignaProjection> listarAsigEvidencia();

    @Query(value = "SELECT ae.id_asignacion_evidencia AS idevid, " +
            "e.id_evidencia AS ideviden, " +
            "cri.nombre AS crite, " +
            "s.nombre AS subcrite, " +
            "i.nombre AS indi, " +
            "CONCAT(pe_resp.primer_nombre, ' ', pe_resp.primer_apellido) AS respon, " +
            "CONCAT(pe_asig.primer_nombre, ' ', pe_asig.primer_apellido) AS asignador, " +
            "e.descripcion AS descev, " +
            "ae.fecha_inicio AS ini, " +
            "ae.fecha_fin AS fini " +
            "FROM asignacion_evidencia ae " +
            "JOIN evidencia e ON e.id_evidencia = ae.evidencia_id_evidencia AND ae.visible = true " +
            "JOIN usuarios u_resp ON u_resp.id = ae.usuario_id " +
            "JOIN persona pe_resp ON pe_resp.id_persona = u_resp.persona_id_persona " +
            "JOIN usuarios u_asig ON u_asig.id = ae.id_usuario_asignador " +
            "JOIN persona pe_asig ON pe_asig.id_persona = u_asig.persona_id_persona " +
            "JOIN indicador i ON e.indicador_id_indicador = i.id_indicador " +
            "JOIN subcriterio s ON s.id_subcriterio = i.subcriterio_id_subcriterio " +
            "JOIN criterio cri ON cri.id_criterio = s.id_criterio " +
            "JOIN asignacion_indicador po ON i.id_indicador = po.indicador_id_indicador " +
            "JOIN modelo mo ON mo.id_modelo = po.modelo_id_modelo " +
            "AND mo.id_modelo = (SELECT MAX(id_modelo) FROM modelo) " +
            "JOIN asignacion_admin aa ON aa.criterio_id_criterio = cri.id_criterio " +
            "WHERE ae.visible = true " +
            "AND aa.usuario_id = ?1 " +
            "AND aa.visible = true " +
            "AND ae.id_modelo = (SELECT MAX(id_modelo) FROM modelo) " +
            "ORDER BY ae.usuario_id, cri.id_criterio, s.id_subcriterio, i.id_indicador", nativeQuery = true)
    List<AsignaProjection> listarAsigEvidenciaPorUsuario(Long usuarioId);

    @Query(value = "SELECT ae.id_asignacion_evidencia as idAsignacionEvidencia, ae.usuario_id as usuarioId, ae.evidencia_id_evidencia as evidenciaId " +
            "FROM asignacion_evidencia ae " +
            "JOIN evidencia e ON e.id_evidencia = ae.evidencia_id_evidencia AND ae.visible = true " +
            "JOIN indicador i ON e.indicador_id_indicador = i.id_indicador " +
            "JOIN asignacion_indicador po ON i.id_indicador = po.indicador_id_indicador " +
            "JOIN modelo mo ON mo.id_modelo = po.modelo_id_modelo " +
            "AND mo.id_modelo = (SELECT MAX(id_modelo) FROM modelo) " +
            "WHERE ae.visible = true " +
            "ORDER BY ae.usuario_id, ae.evidencia_id_evidencia;", nativeQuery = true)
    List<AsignacionEvidenciaProyeccion> listarAsignacionEvidenciaProyeccion();
    @Query(value =
            "SELECT asignacion_evidencia.id_asignacion_evidencia, evidencia.id_evidencia, evidencia.descripcion, evidencia.nombre\n" +
                    "FROM asignacion_evidencia, evidencia, usuarios\n" +
                    "WHERE asignacion_evidencia.evidencia_id_evidencia = evidencia.id_evidencia\n" +
                    "AND asignacion_evidencia.usuario_id = usuarios.id\n" +
                    "AND evidencia.visible = true\n" +
                    "AND usuarios.username= :usuario", nativeQuery = true)
    List<Asignacion_Evidencia> listarporAsignacionUsuario(@Param("usuario") String usuario);
    @Query(value = "SELECT CASE WHEN COUNT(*) > 0 THEN true ELSE false END FROM asignacion_evidencia ae " +
                    "JOIN evidencia e ON e.id_evidencia=ae.evidencia_id_evidencia AND ae.visible=true AND e.visible=true " +
                    "JOIN indicador i ON i.id_indicador=e.indicador_id_indicador " +
                    "JOIN subcriterio s ON s.id_subcriterio=i.subcriterio_id_subcriterio " +
                    "JOIN criterio cri ON cri.id_criterio = s.id_criterio " +
                    "JOIN asignacion_admin aa ON aa.criterio_id_criterio=cri.id_criterio AND aa.visible=true " +
                    "WHERE aa.usuario_id=:id_usuario " +
                    "AND ae.evidencia_id_evidencia=:id_evidencia " +
                    "AND aa.id_modelo=:id_modelo", nativeQuery = true)
    Boolean verificarAsignacionUsuario(Long id_usuario, Long id_evidencia,Long id_modelo);

    @Query(value = "SELECT e.descripcion, a.fecha_inicio, a.fecha_fin " +
            "FROM asignacion_evidencia a " +
            "JOIN evidencia e ON e.id_evidencia = a.evidencia_id_evidencia " +
            "WHERE a.usuario_id = :usuarioId AND a.visible = true AND LOWER(e.estado)='pendiente' ", nativeQuery = true)
    List<ActiCalendarProjection> findActCalendarByUsuarioId(@Param("usuarioId") Long usuarioId);

    @Query(value = "SELECT ae.id_asignacion_evidencia, e.descripcion, ae.fecha_inicio, ae.fecha_fin, e.estado, e.id_evidencia, de.observacion, " +
            "(SELECT count(id_archivo) from archivo where id_asignacion_evidencia = ae.id_asignacion_evidencia AND visible = true) AS countarchivos " +
            "FROM asignacion_evidencia ae " +
            "JOIN usuarios u ON ae.usuario_id = u.id " +
            "JOIN evidencia e ON ae.evidencia_id_evidencia = e.id_evidencia " +
            "LEFT JOIN detalle_evaluacion de ON e.id_evidencia = de.evidencia_id_evidencia " +
            "WHERE u.username = :username AND ae.evidencia_id_evidencia=:id_evidencia AND ae.visible=true", nativeQuery = true)
    List<Object[]> listarAsigEviUser(String username, Long id_evidencia);

    @Query(value = "select * from  asignacion_evidencia ac JOIN usuarios u ON ac.usuario_id = u.id where u.username=:username and ac.visible =true",nativeQuery = true)
    List<Asignacion_Evidencia>listarporusuario(String username);

    @Query(value = "SELECT * FROM asignacion_evidencia WHERE visible= true AND evidencia_id_evidencia=:idEvidendicia ;",nativeQuery = true)
    List<Asignacion_Evidencia>listarporEvidencia(Long idEvidendicia);

    @Query(value = "SELECT * FROM asignacion_evidencia WHERE usuario_id = :userId AND visible = true;",nativeQuery = true)
    List<Asignacion_Evidencia> listarporUsuarioxd(Long userId);

    @Query(value = "SELECT pe.primer_nombre ||' '|| pe.primer_apellido AS responsable, " +
            "c.nombre AS nombre_criterio, s.nombre AS nombre_subcriterio, i.nombre AS nombre_indicador, " +
            "e.descripcion AS evidencia, ae.fecha_fin, ae.fecha_inicio, e.estado " +
            "FROM asignacion_evidencia ae " +
            "JOIN evidencia e ON ae.evidencia_id_evidencia = e.id_evidencia " +
            "JOIN indicador i ON e.indicador_id_indicador = i.id_indicador " +
            "JOIN subcriterio s ON i.subcriterio_id_subcriterio = s.id_subcriterio " +
            "JOIN criterio c ON s.id_criterio = c.id_criterio " +
            "JOIN asignacion_indicador ag ON ag.indicador_id_indicador = i.id_indicador " +
            "JOIN usuarios u ON ae.usuario_id = u.id " +
            "JOIN persona pe ON u.persona_id_persona = pe.id_persona " +
            "WHERE (LOWER(e.estado) = LOWER(:estado)) " +
            "AND ag.modelo_id_modelo = (SELECT MAX(id_modelo) FROM modelo)" +
            "AND u.visible= true  AND ae.visible=true AND e.visible=true " +
            "ORDER BY e.id_evidencia DESC", nativeQuery = true)
    List<EvidenciaReApPeAtrProjection> listarEvideByEstado(@Param("estado") String estado);

    @Query(value = "SELECT pe.primer_nombre || ' ' || pe.primer_apellido AS responsable, " +
            "c.nombre AS nombre_criterio, " +
            "s.nombre AS nombre_subcriterio, " +
            "i.nombre AS nombre_indicador, " +
            "e.descripcion AS evidencia, " +
            "ae.fecha_fin, " +
            "ae.fecha_inicio, " +
            "e.estado " +
            "FROM asignacion_evidencia ae " +
            "JOIN usuarios u ON ae.usuario_id = u.id " +
            "JOIN evidencia e ON ae.evidencia_id_evidencia = e.id_evidencia " +
            "JOIN indicador i ON e.indicador_id_indicador = i.id_indicador " +
            "JOIN subcriterio s ON i.subcriterio_id_subcriterio = s.id_subcriterio " +
            "JOIN criterio c ON s.id_criterio = c.id_criterio " +
            "JOIN asignacion_indicador ag ON ag.indicador_id_indicador = i.id_indicador " +
            "JOIN persona pe ON u.persona_id_persona = pe.id_persona " +
            "WHERE LOWER(e.estado) = LOWER(:estado) " +
            "AND ag.modelo_id_modelo = (SELECT MAX(id_modelo) FROM modelo) " +
            "AND u.visible = true " +
            "AND ae.visible = true " +
            "AND e.visible = true " +
            "AND ae.id_usuario_asignador = :id_admin " +
            "ORDER BY e.id_evidencia DESC", nativeQuery = true)
    List<EvidenciaReApPeAtrProjection> listarEvideByEstadoAdm(@Param("estado") String estado, @Param("id_admin") Long id_admin);

    @Query(value = "SELECT DISTINCT u.id AS idpersona, per.primer_nombre, per.primer_apellido, COALESCE(per.correo, 'Sin correo') AS percorreo " +
            "FROM asignacion_evidencia ac " +
            "JOIN evidencia e ON e.id_evidencia = ac.evidencia_id_evidencia " +
            "JOIN usuarios u ON u.id = ac.usuario_id " +
            "JOIN persona per ON per.id_persona = u.persona_id_persona " +
            "JOIN indicador i ON i.id_indicador = e.indicador_id_indicador " +
            "JOIN ponderacion po ON po.indicador_id_indicador = i.id_indicador " +
            "JOIN modelo mo ON mo.id_modelo = po.modelo_id_modelo " +
            "WHERE mo.id_modelo = (SELECT MAX(id_modelo) FROM modelo)", nativeQuery = true)
    List<ActivProyection>listarByActividad();

    @Query(value = "SELECT count(id_archivo) FROM archivo WHERE id_asignacion_evidencia = ?1 AND visible = true", nativeQuery = true)
    int countArchivosByIdAsigEv(Long idAsignacionEvidencia);
}
