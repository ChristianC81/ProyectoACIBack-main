package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Asignacion_Responsable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface Asignacion_Responsable_repository extends JpaRepository<Asignacion_Responsable, Long> {

}
