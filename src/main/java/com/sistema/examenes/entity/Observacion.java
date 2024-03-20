package com.sistema.examenes.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@Table(name = "observacion")
public class Observacion implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_observacion")
    private Long id_observacion;
    @Column(name = "observacion", length = 10000 )
    private String observacion;
    private boolean visible;
    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario usuario;
    @ManyToOne(fetch = FetchType.LAZY)
    private Asignacion_Evidencia actividad;
}
