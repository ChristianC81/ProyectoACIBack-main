package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Criterio;
import com.sistema.examenes.entity.Evidencia;
import com.sistema.examenes.projection.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface Evidencia_repository extends JpaRepository<Evidencia, Long> {
    @Query("SELECT e FROM Evidencia e WHERE e.visible = true")
    List<Evidencia> listarEvidencia();

    @Query("SELECT e FROM Evidencia e " +
            "JOIN e.lista_evidencias ae " +
            "JOIN ae.usuario u " +
            "WHERE u.username = :username " +
            "AND e.visible = true " +
            "AND ae.visible = true " +
            "AND ae.id_modelo = (SELECT MAX(m.id_modelo) FROM Modelo m)")
    public List<Evidencia> evidenciaUsuario(@Param("username") String username);

    @Query(value = "SELECT e.* " +
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
            "JOIN usuarios u ON ae.usuario_id = u.id " +
            "WHERE ae.visible = true " +
            "AND aa.usuario_id = :usuarioId " +
            "AND aa.visible = true " +
            "AND u.username = :username " +
            "ORDER BY ae.usuario_id, cri.id_criterio, s.id_subcriterio, i.id_indicador", nativeQuery = true)
    List<Evidencia> evidenciaFiltraCriterio(String username, Long usuarioId);

    @Query("SELECT e.id_evidencia AS id_evidencia, cri.nombre AS criterio, s.nombre AS subcriterio, i.nombre AS indicador, " +
            "e.descripcion AS descripcion, e.estado AS estado, ae.id_asignacion_evidencia AS id_asignacion_evidencia, " +
            "(SELECT COUNT(a.id_archivo) FROM Archivo_s a WHERE a.actividad.id_asignacion_evidencia = ae.id_asignacion_evidencia AND a.visible = true) AS countarchivos " +
            "FROM Evidencia e " +
            "JOIN e.indicador i " +
            "JOIN i.subcriterio s " +
            "JOIN s.criterio cri " +
            "JOIN e.lista_evidencias ae " +
            "JOIN ae.usuario u " +
            "WHERE u.username = :username " +
            "AND ae.visible = true " +
            "AND ae.id_modelo = (SELECT MAX(m.id_modelo) FROM Modelo m)")
    public List<EvidenciaProjection> evidenUsuario(@Param("username") String username);

    @Query("SELECT e.id_evidencia AS id_evidencia, cri.nombre AS criterio, s.nombre AS subcriterio, i.nombre AS indicador, " +
            "e.descripcion AS descripcion, e.estado AS estado " +
            "FROM Evidencia e " +
            "JOIN e.indicador i " +
            "JOIN i.subcriterio s " +
            "JOIN s.criterio cri " +
            "JOIN e.lista_evidencias ae " +
            "JOIN ae.usuario u " +
            "WHERE u.username = :username " +
            "AND ae.visible = true " +
            "AND ae.archsubido = false " +
            "AND ae.id_modelo = (SELECT MAX(m.id_modelo) FROM Modelo m)")
    public List<EvidenciaProjection> evidenUserPendiente(@Param("username") String username);

   /* @Query(value = " SELECT e.* FROM evidencia e  \n" +
            "               LEFT JOIN asignacion_evidencia ae ON e.id_evidencia = ae.evidencia_id_evidencia \n" +
            "               WHERE ae.id_asignacion_evidencia IS NULL AND e.visible=true",nativeQuery = true)*/

    @Query(value = "SELECT cri.nombre criterio, s.nombre subcriterio, i.nombre indicador, e.* FROM evidencia e " +
            "JOIN indicador i ON i.id_indicador = e.indicador_id_indicador " +
            "JOIN subcriterio s ON s.id_subcriterio = i.subcriterio_id_subcriterio " +
            "JOIN criterio cri ON cri.id_criterio = s.id_criterio " +
            "LEFT JOIN asignacion_evidencia ae ON ae.evidencia_id_evidencia = e.id_evidencia AND ae.visible = true " +
            "LEFT JOIN asignacion_admin aa ON aa.criterio_id_criterio = cri.id_criterio AND aa.visible = true " +
            "WHERE aa.id_modelo = (SELECT MAX(id_modelo) FROM modelo) AND aa.usuario_id =:idUser " +
            "AND (e.id_evidencia IS NULL OR e.id_evidencia NOT IN (SELECT evidencia_id_evidencia FROM asignacion_evidencia WHERE visible = true)) " +
            "AND e.visible = true ORDER BY e.id_evidencia;", nativeQuery = true)
    List<Evidencia> listarEvidenciaAsigna(Long idUser);

    @Query(value = "SELECT DISTINCT e.id_evidencia, e.*, c.id_criterio FROM evidencia e " +
            "JOIN indicador i ON e.indicador_id_indicador = i.id_indicador " +
            "JOIN subcriterio sc ON i.subcriterio_id_subcriterio = sc.id_subcriterio " +
            "JOIN criterio c ON sc.id_criterio = c.id_criterio " +
            "JOIN asignacion_admin aa ON c.id_criterio = aa.criterio_id_criterio AND aa.visible = true " +
            "WHERE c.id_criterio=:idcriterio AND e.visible = true AND aa.id_modelo = (SELECT MAX(id_modelo) FROM modelo) " +
            "AND e.id_evidencia NOT IN (SELECT evidencia_id_evidencia FROM asignacion_evidencia  WHERE visible=true) " +
            "ORDER BY c.id_criterio,e.id_evidencia", nativeQuery = true)
    List<Evidencia> evidenciacriterio(Long idcriterio);

    @Query(value = "SELECT DISTINCT e.id_evidencia AS idev,c.id_criterio AS idcri,c.nombre AS nombcri, " +
            "sc.id_subcriterio AS idsub,sc.nombre AS nombsub,i.id_indicador AS idind,i.nombre AS nombind, e.descripcion AS descripc " +
            "FROM evidencia e JOIN indicador i ON e.indicador_id_indicador = i.id_indicador " +
            "LEFT JOIN asignacion_evidencia ae ON ae.evidencia_id_evidencia = e.id_evidencia AND ae.visible = true " +
            "JOIN subcriterio sc ON i.subcriterio_id_subcriterio = sc.id_subcriterio " +
            "JOIN criterio c ON sc.id_criterio = c.id_criterio " +
            "JOIN asignacion_admin aa ON c.id_criterio = aa.criterio_id_criterio AND aa.id_modelo = (SELECT MAX(id_modelo) FROM modelo) " +
            "WHERE c.id_criterio=:idcriterio AND e.visible = true " +
            "AND e.id_evidencia NOT IN (SELECT evidencia_id_evidencia FROM asignacion_evidencia  WHERE visible=true) " +
            "ORDER BY sc.nombre, i.nombre, e.descripcion ASC", nativeQuery = true)
    List<AsigEvidProjection> evidenciatab(Long idcriterio);

    @Query(value = "SELECT cri.id_criterio AS idcri, cri.nombre AS nombcri, s.id_subcriterio AS idsub, s.nombre AS nombsub,i.id_indicador AS idind, i.nombre AS nombind, e.id_evidencia AS idev,e.descripcion AS descripc " +
            "FROM evidencia e JOIN indicador i ON i.id_indicador = e.indicador_id_indicador " +
            "JOIN subcriterio s ON s.id_subcriterio = i.subcriterio_id_subcriterio " +
            "JOIN criterio cri ON cri.id_criterio = s.id_criterio " +
            "LEFT JOIN asignacion_evidencia ae ON ae.evidencia_id_evidencia = e.id_evidencia AND ae.visible = true " +
            "LEFT JOIN asignacion_admin aa ON aa.criterio_id_criterio = cri.id_criterio AND aa.visible = true " +
            "WHERE aa.id_modelo = (SELECT MAX(id_modelo) FROM modelo) AND aa.usuario_id =:idUser " +
            "AND (e.id_evidencia IS NULL OR e.id_evidencia NOT IN (SELECT evidencia_id_evidencia FROM asignacion_evidencia WHERE visible = true)) " +
            "AND e.visible = true " +
            "ORDER BY  cri.nombre, s.nombre, i.nombre, e.descripcion ASC", nativeQuery = true)
    List<AsigEvidProjection> listarEvidenciaAdmin(Long idUser);
    // SELECT evidencia.*
    // FROM public.indicador join public.evidencia ON
    // evidencia.indicador_id_indicador = indicador.id_indicador
    // WHERE evidencia.indicador_id_indicador=6 And evidencia.visible=true;
    @Query(value = "SELECT evidencia.* FROM public.indicador JOIN public.evidencia ON evidencia.indicador_id_indicador = indicador.id_indicador " +
            "WHERE evidencia.indicador_id_indicador=:id_indicador AND evidencia.visible=true " +
            "ORDER BY evidencia.descripcion ASC", nativeQuery = true)
    List<Evidencia> listarEvidenciaPorIndicador(Long id_indicador);

    @Query(value = "SELECT DISTINCT e.id_evidencia AS idev,per.primer_nombre||' '||per.primer_apellido AS enca, " +
            "cri.nombre AS crit, s.nombre AS subc, i.nombre AS indic, e.descripcion AS descr FROM detalle_evaluacion d " +
            "JOIN evidencia e ON d.evidencia_id_evidencia=e.id_evidencia " +
            "JOIN indicador i ON i.id_indicador=e.indicador_id_indicador " +
            "JOIN subcriterio s ON s.id_subcriterio=i.subcriterio_id_subcriterio " +
            "JOIN criterio cri ON cri.id_criterio=s.id_criterio " +
            "JOIN asignacion_evidencia ae ON ae.evidencia_id_evidencia=e.id_evidencia " +
            "JOIN usuarios u ON u.id=ae.usuario_id " +
            "JOIN persona per ON per.id_persona=u.persona_id_persona AND d.estado=true " +
            "WHERE d.id_modelo=:id_modelo", nativeQuery = true)
    List<EvidenciasProjection> evidenciaAprobada(Long id_modelo);

    @Query(value = "SELECT DISTINCT e.id_evidencia AS idev,per.primer_nombre||' '||per.primer_apellido AS enca, " +
            "cri.nombre AS crit, s.nombre AS subc, i.nombre AS indic, e.descripcion AS descr FROM detalle_evaluacion d " +
            "JOIN evidencia e ON d.evidencia_id_evidencia=e.id_evidencia " +
            "JOIN indicador i ON i.id_indicador=e.indicador_id_indicador " +
            "JOIN subcriterio s ON s.id_subcriterio=i.subcriterio_id_subcriterio " +
            "JOIN criterio cri ON cri.id_criterio=s.id_criterio " +
            "JOIN asignacion_evidencia ae ON ae.evidencia_id_evidencia=e.id_evidencia " +
            "JOIN usuarios u ON u.id=ae.usuario_id " +
            "JOIN persona per ON per.id_persona=u.persona_id_persona AND d.estado=false " +
            "WHERE d.id_modelo=:id_modelo", nativeQuery = true)
    List<EvidenciasProjection> evidenciaRechazada(Long id_modelo);

    @Query(value = "SELECT i.tipo AS tipo, i.id_indicador AS id_in,i.peso AS peso,  e.descripcion AS descrip, " +
            "e.estado AS est from evidencia e JOIN asignacion_evidencia ae ON ae.evidencia_id_evidencia = e.id_evidencia " +
            "JOIN indicador i ON i.id_indicador = e.indicador_id_indicador AND i.visible = true " +
            "JOIN usuarios u ON ae.usuario_id = u.id where e.visible =true AND e.id_evidencia=:id_evidencia " +
            "AND ae.visible=true AND ae.id_modelo=:id_modelo ", nativeQuery = true)
    EvidenciaCalProjection evidenciacal(Long id_evidencia, Long id_modelo);

    @Query(value = "SELECT " +
            "SUM(CASE WHEN LOWER(e.estado) = 'pendiente' THEN 1 ELSE 0 END) AS pendientes, \n" +
            "SUM(CASE WHEN LOWER(e.estado) = 'aprobada' THEN 1 ELSE 0 END) AS aprobados, \n" +
            "SUM(CASE WHEN LOWER(e.estado) = 'rechazada' THEN 1 ELSE 0 END) AS rechazados, \n" +
            "COUNT(*) AS total, "+
            "TRUNC((SUM(CASE WHEN LOWER(e.estado) = 'pendiente' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS porcentaje_pendientes, " +
            "TRUNC((SUM(CASE WHEN LOWER(e.estado) = 'aprobada' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS porcentaje_aprobados, " +
            "TRUNC((SUM(CASE WHEN LOWER(e.estado) = 'rechazada' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS porcentaje_rechazados " +
            "FROM " +
            "evidencia e " +
            "JOIN " +
            "asignacion_evidencia asi ON e.id_evidencia = asi.evidencia_id_evidencia " +
            "JOIN " +
            "usuarios u ON u.id = asi.usuario_id " +
            "WHERE " +
            "u.id = :responsableId AND e.visible = true", nativeQuery = true)
    ActiDiagramaPieProjection porcentajeEstadosdeActividadesByResponsableId(@Param("responsableId") Long responsableId);
}
