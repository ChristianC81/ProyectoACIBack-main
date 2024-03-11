package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Criterio;
import com.sistema.examenes.entity.Detalle_Evaluacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface Detalle_Evaluacion_repository extends JpaRepository<Detalle_Evaluacion, Long> {

    //el de abajo no se utiliza
    @Query(value = "SELECT * from detalle_evaluacion where visible =true",nativeQuery = true)
    List<Detalle_Evaluacion> listarDetalleEvaluacion();
    @Query("SELECT d FROM Detalle_Evaluacion d " +
            "WHERE d.evidencia.id_evidencia = :id_evidencia " +
            "AND d.id_modelo = :id_modelo " +
            "AND d.fecha = (SELECT MAX(d2.fecha) FROM Detalle_Evaluacion d2 " +
            "WHERE d2.evidencia.id_evidencia = :id_evidencia " +
            "AND d2.id_modelo = :id_modelo)")
    List<Detalle_Evaluacion> listarbservaciones(Long id_evidencia, Long id_modelo);
    @Query("SELECT d FROM Detalle_Evaluacion d " +
            "WHERE d.visible = true " +
            "AND d.evidencia.id_evidencia = :idEvidencia")
    List<Detalle_Evaluacion> listarDetalleEvaluacion(Long idEvidencia);

    @Query("SELECT CASE WHEN COUNT(d.id_detalle_evaluacion) > 0 THEN true ELSE false END " +
            "FROM Detalle_Evaluacion d " +
            "WHERE d.evidencia.id_evidencia = :id_evidencia " +
            "AND d.usuario.id = :id " +
            "AND d.id_modelo = :id_modelo")
    Boolean existeeva(Long id_evidencia, Long id, Long id_modelo);

    @Query("SELECT d.id_detalle_evaluacion " +
            "FROM Detalle_Evaluacion d " +
            "WHERE d.evidencia.id_evidencia = :id_evidencia " +
            "AND d.usuario.id = :id " +
            "AND d.id_modelo = :id_modelo " +
            "AND d.estado = true")
    Long iddetalle(Long id_evidencia, Long id, Long id_modelo);

}
