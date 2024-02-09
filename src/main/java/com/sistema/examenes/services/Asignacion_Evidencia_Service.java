package com.sistema.examenes.services;

import com.sistema.examenes.entity.Actividad;
import com.sistema.examenes.entity.Asignacion_Evidencia;
import com.sistema.examenes.entity.dto.Asignacion_EvidenciaDTO;
import com.sistema.examenes.projection.AsignaProjection;
import com.sistema.examenes.projection.AsignacionEvidenciaProyeccion;

import java.util.List;

public interface Asignacion_Evidencia_Service extends GenericService<Asignacion_Evidencia, Long>{
    public List<Asignacion_Evidencia> listar() ;
    public List<Asignacion_Evidencia> listarporUsuario (String usuario  ) ;

    List<AsignacionEvidenciaProyeccion> listarAsignacionEvidenciaProyeccion();
    Boolean verificarAsignacionUsuario(Long id_usuario, Long id_evidencia,Long id_modelo);
    List<AsignaProjection> listarAsigEvidencia();
    Asignacion_Evidencia fechaactividades(Long id_evidencia,Long id_modelo);

    List<Asignacion_EvidenciaDTO>listarAsigEviUser(String username, Long id_evidencia);
    public List<Asignacion_Evidencia> listarporusuario(String username);
    public List<Asignacion_Evidencia>listarporEvidencia(Long idEvidencia );
}
