package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Asignacion_Responsable;
import com.sistema.examenes.projection.ResponsableProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface Asignacion_Responsable_repository extends JpaRepository<Asignacion_Responsable, Long> {
    @Query(value = "SELECT * from asignacion_responsable where  usuarioadmin_id = ?1 and usuarioresponsable_id = ?2", nativeQuery = true)
    Asignacion_Responsable asignacion_existente(Long id_usuarioAdmin, Long id_usuarioResponsable);
    @Query(value = "SELECT " +
            "    u.id, " +
            "    CONCAT(per.primer_nombre, ' ', per.primer_apellido) AS nombres, " +
            "    u.username AS usua, " +
            "    r.rolnombre AS rol, " +
            "    a.fecha_inicio, " +
            "    a.fecha_fin, " +
            "    CASE " +
            "        WHEN ae.count_evidencias IS NULL THEN 'Sin evidencias asignadas' " +
            "        ELSE 'Tiene ' || ae.count_evidencias || ' evidencia/s asignada/s' " +
            "    END AS evidencias " +
            "FROM " +
            "    usuarios u " +
            "JOIN " +
            "    asignacion_responsable asigres ON asigres.usuarioresponsable_id = u.id " +
            "JOIN " +
            "    persona per ON per.id_persona = u.persona_id_persona " +
            "JOIN " +
            "    usuariorol ur ON u.id = ur.usuario_id " +
            "JOIN " +
            "    roles r ON ur.rol_rolid = r.rolid " +
            "LEFT JOIN " +
            "    ( " +
            "        SELECT " +
            "            usuario_id, " +
            "            COUNT(DISTINCT evidencia_id_evidencia) AS count_evidencias " +
            "        FROM " +
            "            asignacion_evidencia ae_inner " +
            "        JOIN " +
            "            evidencia e_inner ON e_inner.id_evidencia = ae_inner.evidencia_id_evidencia " +
            "        JOIN " +
            "            indicador i_inner ON i_inner.id_indicador = e_inner.indicador_id_indicador " +
            "        JOIN " +
            "            asignacion_indicador po_inner ON po_inner.indicador_id_indicador = i_inner.id_indicador " +
            "        JOIN " +
            "            (SELECT MAX(id_modelo) AS max_id_modelo FROM modelo) max_mo ON po_inner.modelo_id_modelo = max_mo.max_id_modelo " +
            "        WHERE " +
            "            ae_inner.visible = true " +
            "        GROUP BY " +
            "            usuario_id " +
            "    ) ae ON u.id = ae.usuario_id " +
            "LEFT JOIN " +
            "    actividad a ON u.id = a.usuario_id " +
            "WHERE " +
            "    r.rolnombre = 'RESPONSABLE' " +
            "    AND asigres.usuarioadmin_id = ?1" +
            "    AND asigres.visible=true" +
            "    AND u.visible=true " +
            "GROUP BY " +
            "    u.id, " +
            "    per.primer_nombre, " +
            "    per.primer_apellido, " +
            "    u.username, " +
            "    r.rolnombre, " +
            "    ae.count_evidencias, " +
            "    a.fecha_fin, " +
            "    a.fecha_inicio", nativeQuery = true)
    List<ResponsableProjection> listadeResponsablesByAdmin(@Param("idAdministrador") Long idAdministrador);
    @Query(value = "SELECT * from asignacion_responsable where usuarioresponsable_id = ?1", nativeQuery = true)
    Asignacion_Responsable asignacionByIdUsuarioResponsable(Long id_usuarioResponsable);
}
