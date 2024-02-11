package com.sistema.examenes.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@Table(name = "asignacion_admin")
public class Asignacion_Responsable implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_asignacion")
    private Long id_asignacion;

    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario usuarioAdmin;

    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario usuarioResponsable;

    // Columna para el eliminado logico no borrar
    @Column(name = "visible")
    private boolean visible;

    //@ManyToOne(fetch = FetchType.EAGER)
    //@JoinColumn(name = "id_modelo") // Columna en Asignacion_Responsable que referencia a Modelo
   // private Modelo id_modelo;
    public Asignacion_Responsable() {
    }

    public Long getId_asignacion() {
        return id_asignacion;
    }

    public Usuario getUsuarioAdmin() {
        return usuarioAdmin;
    }
    public Usuario getUsuarioResponsable() {
        return usuarioResponsable;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setId_asignacion(Long id_asignacion) {
        this.id_asignacion = id_asignacion;
    }

    public void setUsuarioAdmin(Usuario usuarioAdmin) {
        this.usuarioAdmin = usuarioAdmin;
    }
    public void setUsuarioResponsable(Usuario usuarioResponsable) {
        this.usuarioResponsable = usuarioResponsable;
    }
    public void setVisible(boolean visible) {
        this.visible = visible;
    }

}
