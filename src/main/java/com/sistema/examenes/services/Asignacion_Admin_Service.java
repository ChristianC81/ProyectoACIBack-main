package com.sistema.examenes.services;

import com.sistema.examenes.entity.Asignacion_Admin;
import com.sistema.examenes.projection.*;

import java.util.List;

public interface Asignacion_Admin_Service extends GenericService<Asignacion_Admin, Long> {
    public List<Asignacion_Admin> listar();

    public Asignacion_Admin listarAsignacion_AdminPorUsuario(Long id_usuario,Long id_modelo);

    public Asignacion_Admin buscar_asignacion_especifica(Long usuarioId, Long modeloId, Long criterioId);
    public List<Asignacion_Admin> listarAsignacion_AdminPorUsuarioCriterio(Long id_criterio, Long id_modelo);
    public List<AsignacionProjection> asignacionAdmin(Long id_modelo, String veri);
    public Asignacion_Admin asignacion_existente(Long id_criterio, Long id_modelo,Long id_usuario);

    public NombreAsigProjection listarnombre_Admin(Long id_modelo, Long id_criterio);

   public List<AsignacionProjection> veradminsporcriterio(Long id_modelo, Long id_criterio);

    public List<AsignacionProjection> verresponsablesporcriterio (Long id_modelo, Long id_criterio);

    public List<Asignacion_Admin> listaAsignacionAdminPorIdUsuario(Long id_usuario);

    public List<ActivAprobadaProjection> actividadAtrasada(Long id_modelo);
    public List<ActivAprobadaProjection> actividadAprobada(Long id_modelo);

    List<ActivAprobadaProjection> actividadpendiente(Long id_modelo);
    public List<ActividadesAvanceProjection> actividadCont(Long id_modelo);
    public List<ActivProyection> listarEvidenciasCumplidas();
    public List<ActivProyection> evidenciaUsu(Long id);




}
