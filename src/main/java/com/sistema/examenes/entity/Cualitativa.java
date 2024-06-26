package com.sistema.examenes.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "cualitativa")
public class Cualitativa implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cualitativa")
    private Long id_cualitativa;

    @Column(name = "valor")
    private double valor;

    @Column(name = "escala")
    private String escala;

    @Column(name = "visible")
    private boolean visible;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "cualitativa")
    private Set<Evaluar_Cualitativa> lista_eva_cual = new HashSet<>();
}
