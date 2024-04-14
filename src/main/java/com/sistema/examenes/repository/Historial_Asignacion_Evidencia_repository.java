package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Historial_Asignacion_Evidencia;
import com.sistema.examenes.projection.HistorialAsignacionEvidenciaProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface Historial_Asignacion_Evidencia_repository extends JpaRepository<Historial_Asignacion_Evidencia, Long> {
    @Query("SELECT per.primer_nombre ||' '|| per.primer_apellido AS nombre_usuario, " +
            "h.fecha AS fecha, " +
            "a.fecha_fin AS fecha_fin, " +
            "a.fecha_inicio AS fecha_inicio, " +
            "e.estado AS estado, " +
            "e.descripcion AS titulo_evidencia, " +
            "i.nombre AS titulo_indicador, " +
            "sc.nombre AS titulo_subcriterio, " +
            "c.nombre AS titulo_criterio " +
            "FROM Historial_Asignacion_Evidencia h " +
            "JOIN h.asignacion_evi a " +
            "JOIN a.evidencia e  " +
            "JOIN e.indicador i " +
            "JOIN i.subcriterio sc " +
            "JOIN sc.criterio c " +
            "JOIN Usuario u ON u.id = a.usuario.id " +
            "JOIN u.persona per " +
            "WHERE c.id_criterio = :critId " +
            "and a.visible= :veri " +
            "ORDER BY h.fecha DESC")
    List<HistorialAsignacionEvidenciaProjection> obtenerHistorialPorUsuario( @Param("critId") Long critId, boolean veri);
}
