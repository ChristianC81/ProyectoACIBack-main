package com.sistema.examenes.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "asignacion_responsable")
public class Asignacion_Responsable implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_asignacion")
    private Long id_asignacion;

    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario usuarioAdmin;

    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario usuarioResponsable;

   /* @Column(name = "id_modelo") // Columna para guardar el Modelo que viene del admin
    private Long id_modelo;*/

    @Column(name = "visible")
    private boolean visible;

}
