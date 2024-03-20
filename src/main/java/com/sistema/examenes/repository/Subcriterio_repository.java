package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Indicador;
import com.sistema.examenes.entity.Subcriterio;
import com.sistema.examenes.projection.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface Subcriterio_repository extends JpaRepository<Subcriterio, Long> {
    @Query("SELECT s from Subcriterio s where s.visible =true")
    List<Subcriterio> listarSubcriterio();

    // un query para buscar por id_criterio
    @Query("SELECT s FROM Subcriterio s " +
            "WHERE s.criterio.id_criterio = :id_criterio " +
            "AND s.visible =true")
    List<Subcriterio> listarSubcriterioPorCriterio(Long id_criterio);

    @Query("SELECT s.id_subcriterio AS id_subcriterio, s.nombre AS nombre, s.descripcion AS descripcion, s.visible AS visible, " +
            "(SELECT COUNT(i2.id_indicador) " +
            "FROM Indicador i2 " +
            "WHERE i2.subcriterio.id_subcriterio = s.id_subcriterio " +
            "AND i2.visible = true) AS cantidadIndicadores " +
            "FROM Subcriterio s " +
            "LEFT JOIN Indicador i " +
            "ON s.id_subcriterio = i.subcriterio.id_subcriterio "+
            "where s.visible =true and s.criterio.id_criterio=:id_criterio "+
            "GROUP BY s.id_subcriterio " +
            "ORDER BY s.descripcion ASC")
    List<SubcriterioIndicadoresProjection> obtenerSubcirteriosConCantidadIndicador(Long id_criterio);
    @Query(value = "SELECT s.id_subcriterio, s.nombre, s.descripcion, s.visible, c.nombre AS nombreCriterio, " +
            "(SELECT COUNT(i2.id_indicador) " +
            "FROM indicador i2 WHERE i2.subcriterio_id_subcriterio = s.id_subcriterio AND i2.visible = true) " +
            "AS cantidadIndicadores " +
            "FROM subcriterio s " +
            "join criterio c " +
            "on s.id_criterio=c.id_criterio " +
            "LEFT JOIN indicador i " +
            "ON s.id_subcriterio = i.subcriterio_id_subcriterio "+
            "where s.visible =true AND c.visible = true " +
            "GROUP BY s.id_subcriterio, c.nombre " +
            "ORDER BY c.nombre, s.id_subcriterio", nativeQuery = true)
    List<SubcriterioIndicadoresProjectionFull> obtenerSubcirteriosConCantidadIndicadorFull();

    @Query(value = "SELECT DISTINCT s.id_subcriterio,s.nombre,s.descripcion FROM subcriterio s " +
            "JOIN criterio cri ON cri.id_criterio=s.id_criterio " +
            "JOIN indicador i ON i.subcriterio_id_subcriterio=s.id_subcriterio " +
            "JOIN asignacion_indicador ai ON ai.indicador_id_indicador=i.id_indicador AND ai.visible=true " +
            "WHERE cri.id_criterio=:id_criterio AND ai.modelo_id_modelo=:id_modelo  " +
            "ORDER BY s.descripcion ASC", nativeQuery = true)
    List<SubcriterioIndicadoresProjection> obtenerSubcriterios(Long id_criterio,Long id_modelo);

    //Grafica de barras, porcentajes de subcriterios por criterio

    @Query("SELECT sub.id_subcriterio AS id_subcriterio, " +
            "sub.nombre AS nombre, " +
            "SUM(i.porc_utilida_obtenida) AS total, " +
            "SUM(i.peso) - SUM(i.porc_utilida_obtenida) AS faltante " +
            "FROM Indicador i " +
            "JOIN i.subcriterio sub " +
            "JOIN sub.criterio cri " +
            "WHERE sub.visible=true AND cri.id_criterio =:id_criterio " +
            "GROUP BY sub.nombre, sub.id_subcriterio " +
            "ORDER BY sub.id_subcriterio")
    List<SubcriterioPorcProjection> subcriteriosporCriterio(Long id_criterio);

}
