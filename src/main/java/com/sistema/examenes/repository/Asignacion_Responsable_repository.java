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
    @Query(value = "SELECT \n" +
            "    u.id,\n" +
            "    CONCAT(per.primer_nombre, ' ', per.primer_apellido) AS nombres,\n" +
            "    u.username AS usua,\n" +
            "    r.rolnombre AS rol,\n" +
            "    MIN(a.fecha_inicio) AS fecha_inicio_min,\n" +
            "    MAX(a.fecha_fin) AS fecha_fin_max,\n" +
            "    CASE\n" +
            "        WHEN ae.count_evidencias IS NULL THEN 'Sin evidencias asignadas'\n" +
            "        ELSE 'Tiene ' || ae.count_evidencias || ' evidencia/s asignada/s'\n" +
            "    END AS evidencias\n" +
            "FROM\n" +
            "    usuarios u\n" +
            "JOIN\n" +
            "    persona per ON per.id_persona = u.persona_id_persona\n" +
            "JOIN\n" +
            "    usuariorol ur ON u.id = ur.usuario_id\n" +
            "JOIN\n" +
            "    roles r ON ur.rol_rolid = r.rolid\n" +
            "LEFT JOIN\n" +
            "    (\n" +
            "        SELECT\n" +
            "            usuario_id,\n" +
            "            COUNT(DISTINCT evidencia_id_evidencia) AS count_evidencias\n" +
            "        FROM\n" +
            "            asignacion_evidencia\n" +
            "        WHERE\n" +
            "            visible = true\n" +
            "        GROUP BY\n" +
            "            usuario_id\n" +
            "    ) ae ON u.id = ae.usuario_id\n" +
            "LEFT JOIN\n" +
            "    asignacion_responsable asigres ON asigres.usuarioresponsable_id = u.id\n" +
            "LEFT JOIN\n" +
            "    actividad a ON u.id = a.usuario_id\n" +
            "WHERE\n" +
            "    r.rolnombre = 'RESPONSABLE'\n" +
            "    AND (\n" +
            "        (asigres.usuarioadmin_id = ?1 AND asigres.visible = true)\n" +
            "        OR\n" +
            "        (u.id IN (\n" +
            "            SELECT ae_inner.usuario_id\n" +
            "            FROM asignacion_evidencia ae_inner\n" +
            "            JOIN evidencia e ON ae_inner.evidencia_id_evidencia = e.id_evidencia\n" +
            "            JOIN indicador i ON e.indicador_id_indicador = i.id_indicador\n" +
            "            JOIN subcriterio sc ON i.subcriterio_id_subcriterio = sc.id_subcriterio\n" +
            "            JOIN criterio c ON sc.id_criterio = c.id_criterio\n" +
            "            WHERE c.id_criterio IN (\n" +
            "                SELECT criterio_id_criterio\n" +
            "                FROM asignacion_admin\n" +
            "                WHERE usuario_id = ?1\n" +
            "            )\n" +
            "        ))\n" +
            "    )\n" +
            "    AND u.visible = true\n" +
            "    AND (\n" +
            "        (asigres.usuarioadmin_id IS NULL AND ae.count_evidencias IS NOT NULL)\n" +
            "        OR\n" +
            "        (asigres.usuarioadmin_id IS NOT NULL)\n" +
            "    )\n" +
            "GROUP BY\n" +
            "    u.id,\n" +
            "    nombres,\n" +
            "    usua,\n" +
            "    rol,\n" +
            "    evidencias", nativeQuery = true)
    List<ResponsableProjection> listadeResponsablesByAdmin(@Param("idAdministrador") Long idAdministrador);


    @Query(value = "SELECT * from asignacion_responsable where usuarioresponsable_id = ?1", nativeQuery = true)
    Asignacion_Responsable asignacionByIdUsuarioResponsable(Long id_usuarioResponsable);
}
