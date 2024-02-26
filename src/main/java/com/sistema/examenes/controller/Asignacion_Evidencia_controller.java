package com.sistema.examenes.controller;

import com.sistema.examenes.entity.Asignacion_Evidencia;
import com.sistema.examenes.entity.Historial_Asignacion_Evidencia;
import com.sistema.examenes.entity.Usuario;
import com.sistema.examenes.projection.*;
import com.sistema.examenes.entity.dto.Asignacion_EvidenciaDTO;
import com.sistema.examenes.services.Asignacion_Evidencia_Service;
import com.sistema.examenes.services.Historial_Asignacion_Evidencia_Service;
import com.sistema.examenes.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin({"https://apps.tecazuay.edu.ec","http://localhost:4200/"})
@RestController
@RequestMapping("/aseguramiento/api/asignacionevidencia")
public class Asignacion_Evidencia_controller {
    @Autowired
    Asignacion_Evidencia_Service Service;
    @Autowired
    Historial_Asignacion_Evidencia_Service ServiceHistorialAsignacion;
    @Autowired
    UsuarioService usuarioService;
    Historial_Asignacion_Evidencia nuevoRegistroAsignacion;
    Usuario usuarioAsignador;
    @PostMapping("/crear")
    public ResponseEntity<List<Asignacion_Evidencia>> crear(@RequestBody List<Asignacion_Evidencia> evidencias) {
        try {

            List<Asignacion_Evidencia> asignacionesGuardadas = new ArrayList<>();

            for (Asignacion_Evidencia evidencia : evidencias) {
                evidencia.setVisible(true);
                evidencia.setArchsubido(false);
                Asignacion_Evidencia asignacionGuardada = Service.save(evidencia);
                usuarioAsignador = usuarioService.findById(evidencia.getId_usuario_asignador());

                nuevoRegistroAsignacion = new Historial_Asignacion_Evidencia();
                nuevoRegistroAsignacion.setUsuario_asignador(usuarioAsignador);
                nuevoRegistroAsignacion.setAsignacion_evi(asignacionGuardada);
                nuevoRegistroAsignacion.setVisible(true);
                ServiceHistorialAsignacion.save(nuevoRegistroAsignacion);

                asignacionesGuardadas.add(asignacionGuardada);
            }

            return new ResponseEntity<>(asignacionesGuardadas, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/listar")
    public ResponseEntity<List<Asignacion_Evidencia>> obtenerLista() {
        try {
            return new ResponseEntity<>(Service.findByAll(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/listarv")
    public ResponseEntity<List<Asignacion_Evidencia>> obtenerListav() {
        try {
            return new ResponseEntity<>(Service.listar(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/listasignacion")
    public ResponseEntity<List<AsignaProjection>> obtenerListaasig() {
        try {
            return new ResponseEntity<>(Service.listarAsigEvidencia(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/listasignacioneviporuser/{usuarioId}")
    public ResponseEntity<List<AsignaProjection>> obtenerListaAsignacion(@PathVariable("usuarioId") Long usuarioId) {
        try {
            List<AsignaProjection> asignaciones = Service.listarAsigEvidenciaPorUsuario(usuarioId);
            return new ResponseEntity<>(asignaciones, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/listarpruebasevi")
    public ResponseEntity<List<AsignacionEvidenciaProyeccion>> listarpruebasevi() {
        try {
            return new ResponseEntity<>(Service.listarAsignacionEvidenciaProyeccion(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/actCalendar/{id}")
    public ResponseEntity<List<ActiCalendarProjection>> getActCalUserById(@PathVariable("id") Long id) {
        try {
            List<ActiCalendarProjection> actividades = Service.listarActiCalendarbyuser(id);
            return new ResponseEntity<>(actividades, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/buscar/{id}")
    public ResponseEntity<Asignacion_Evidencia> getById(@PathVariable("id") Long id) {
        try {
            return new ResponseEntity<>(Service.findById(id), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/eliminarlogic/{id}")
    public ResponseEntity<?> eliminarloginc(@PathVariable Long id) {
        Asignacion_Evidencia asignacion_evidencia = Service.findById(id);
        if (asignacion_evidencia == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            try {
                asignacion_evidencia.setVisible(false);
                return new ResponseEntity<>(Service.save(asignacion_evidencia), HttpStatus.CREATED);
            } catch (Exception e) {
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }

        }
    }

    @PutMapping("/elimasig/{id}/{id_evi}/{id_usuario}/{id_modelo}")
    public ResponseEntity<?> eliminarasig(@PathVariable Long id, @PathVariable Long id_evi, @PathVariable Long id_usuario, @PathVariable Long id_modelo) {
        Asignacion_Evidencia asignacion_evidencia = Service.findById(id);
        if (asignacion_evidencia == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            try {
                Boolean existe=Service.verificarAsignacionUsuario(id_usuario,id_evi,id_modelo);
                if(existe){
                asignacion_evidencia.setVisible(false);
                return new ResponseEntity<>(Service.save(asignacion_evidencia), HttpStatus.CREATED);
                }else{
                    String mensaje="Solo el administrador del criterio puede eliminar la asignación";
                    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(mensaje);
                }
            } catch (Exception e) {
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
    }
    @GetMapping("/listarEviUsua/{username}")
    public ResponseEntity<List<Asignacion_Evidencia>> listarAsigEvi(@PathVariable("username") String  username) {
        try {
            return new ResponseEntity<>(Service.listarporUsuario(username), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/fecha/{id_evidencia}/{id_modelo}")
    public ResponseEntity<Asignacion_Evidencia> listarfecha(@PathVariable("id_evidencia") Long id_evidencia, @PathVariable("id_modelo") Long id_modelo) {
        try {
            return new ResponseEntity<>(Service.fechaactividades(id_evidencia, id_modelo), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PutMapping("/actualizar/{id}")
    public ResponseEntity<Asignacion_Evidencia> actualizar(@PathVariable Long id,@RequestBody Asignacion_Evidencia p) {
        Asignacion_Evidencia asignacion_evidencia = Service.findById(id);
        if (asignacion_evidencia == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            try {
                asignacion_evidencia.setEvidencia(p.getEvidencia());
                return new ResponseEntity<>(Service.save(asignacion_evidencia), HttpStatus.CREATED);
            } catch (Exception e) {
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }

        }
    }

    @PutMapping("/editar/{id}")
    public ResponseEntity<Asignacion_Evidencia> editar(@PathVariable Long id,@RequestBody Asignacion_Evidencia p) {
        Asignacion_Evidencia asignacion_evidencia = Service.findById(id);
        if (asignacion_evidencia == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            try {
                asignacion_evidencia.setFecha_fin(p.getFecha_fin());
                asignacion_evidencia.setFecha_inicio(p.getFecha_inicio());
                return new ResponseEntity<>(Service.save(asignacion_evidencia), HttpStatus.CREATED);
            } catch (Exception e) {
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }

        }
    }

    @PutMapping("/editarArchSubido/{id}/{estado}")
    public ResponseEntity<Asignacion_Evidencia> editarArchSubido(@PathVariable Long id, @PathVariable boolean estado) {
        Asignacion_Evidencia asignacion_evidencia = Service.findById(id);
        if (asignacion_evidencia == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            try {
                // Aquí actualizamos el estado de archsubido a true
                asignacion_evidencia.setArchsubido(estado);
                return new ResponseEntity<>(Service.save(asignacion_evidencia), HttpStatus.CREATED);
            } catch (Exception e) {
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
    }

    @GetMapping("/countArchivos/{idAsignacionEv}")
    public int countArchivos(@PathVariable("idAsignacionEv") Long idAsignacionEv) {
        return Service.countArchivosByIdAsigEv(idAsignacionEv);
    }

    @GetMapping("/listarAsigEviUser/{username}/{id_evidencia}")
    public List<Asignacion_EvidenciaDTO> listarAsigEviUser(@PathVariable("username") String username,@PathVariable("id_evidencia") Long id_evidencia) {
        return Service.listarAsigEviUser(username,id_evidencia);
    }

    @GetMapping("/buscarusuario/{username}")
    public ResponseEntity <List<Asignacion_Evidencia>> listaractiUsuario(@PathVariable("username") String username) {

        try {
            return new ResponseEntity<>(Service.listarporusuario(username), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/buscarporEvide/{idEviden}")
    public ResponseEntity <List<Asignacion_Evidencia>> listarporEvidencia(@PathVariable("idEviden") Long idEvidencia) {
        try {
            return new ResponseEntity<>(Service.listarporEvidencia(idEvidencia), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/evidencias/{estado}")
    public ResponseEntity<List<EvidenciaReApPeAtrProjection>> obtenerEvidenciasPorEstado(@PathVariable("estado") String estado) {

        try {
            return new ResponseEntity<>(Service.listarEvideByEstado(estado), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/evidenciasAdm/{estado}/{id_admin}")
    public ResponseEntity<List<EvidenciaReApPeAtrProjection>> obtenerEvidenciasPorEstadoAdm(@PathVariable("estado") String estado, @PathVariable("id_admin") Long id_admin) {
        try {
            return new ResponseEntity<>(Service.listarEvideByEstadoAdm(estado,id_admin), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/listaractividad")
    public ResponseEntity<List<ActivProyection>> listarActividad () {
        try {
            return new ResponseEntity<>(Service.listarByActividad(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
