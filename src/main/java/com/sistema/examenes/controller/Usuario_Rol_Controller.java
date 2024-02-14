package com.sistema.examenes.controller;


import com.sistema.examenes.entity.Rol;
import com.sistema.examenes.entity.Usuario;
import com.sistema.examenes.entity.UsuarioRol;
import com.sistema.examenes.services.RolService;
import com.sistema.examenes.services.UsuarioRolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/usuariorol")
@CrossOrigin("*")
public class Usuario_Rol_Controller {
    @Autowired
    private UsuarioRolService usuarioService;

    @Autowired
    private RolService rolService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @GetMapping("/listarv")
    public ResponseEntity<List<UsuarioRol>> obtenerLista() {
        try {
            System.out.println(usuarioService.listarv());

            return new ResponseEntity<>(usuarioService.listarv(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/listarrolesporusername/{username}")
        public ResponseEntity<List<Rol>> listaRolesPorUsername( @PathVariable String username) {
        try {
            return new ResponseEntity<>(rolService.listaRolesPorUsername(username), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PutMapping("/actualizar/{usuarioRolId}")
    public ResponseEntity<UsuarioRol> actualizarRol(@RequestBody UsuarioRol usuarioRol, @PathVariable Long usuarioRolId) {
        try {
            UsuarioRol usuarioRolExistente = usuarioService.findById(usuarioRolId);
            if (usuarioRolExistente != null) {
                String nuevaContraseña = usuarioRol.getUsuario().getPassword();
                // Actualizar la contraseña en el usuario existente
                if (!nuevaContraseña.equals(usuarioRolExistente.getUsuario().getPassword())) {
                    usuarioRolExistente.getUsuario().setPassword(bCryptPasswordEncoder.encode(nuevaContraseña));
                }
                usuarioRolExistente.setRol(usuarioRol.getRol());
                UsuarioRol usuarioRolActualizado = usuarioService.save(usuarioRolExistente);
                return new ResponseEntity<>(usuarioRolActualizado, HttpStatus.OK);
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PutMapping("/actualizarsup/{usuarioRolId}")
    public ResponseEntity<UsuarioRol> actualizarRolSup(@RequestBody UsuarioRol usuarioRol, @PathVariable Long usuarioRolId, @RequestParam("rolIds") List<Long> rolIds) {
        try {
            UsuarioRol usuarioRolExistente = usuarioService.findById(usuarioRolId);
            if (usuarioRolExistente != null) {
                String nuevaContraseña = usuarioRol.getUsuario().getPassword();
                // Actualizar la contraseña en el usuario existente
                if (!nuevaContraseña.equals(usuarioRolExistente.getUsuario().getPassword())) {
                    usuarioRolExistente.getUsuario().setPassword(bCryptPasswordEncoder.encode(nuevaContraseña));
                }
                // Limpiar roles existentes
                // Obtener los registros de UsuarioRol que tiene el usuario
                List<UsuarioRol> rolesUsuario = usuarioService.findByUsuarios_UsuarioId(usuarioRolExistente.getUsuarioRolId());
               for (UsuarioRol rolUsuario: rolesUsuario) {
                   for (Long idRol : rolIds) {
                       Rol rol = rolService.findById(idRol);
                       if (rol != null) {
                           rolUsuario.setUsuario(usuarioRolExistente.getUsuario());
                           rolUsuario.setRol(rol);
                       }
                   }
               }

                usuarioRolExistente.setRol(usuarioRol.getRol());
                UsuarioRol usuarioRolActualizado = usuarioService.save(usuarioRolExistente);
                return new ResponseEntity<>(usuarioRolActualizado, HttpStatus.OK);
            }
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
