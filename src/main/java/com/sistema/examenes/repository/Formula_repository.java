package com.sistema.examenes.repository;

import com.sistema.examenes.entity.Criterio;
import com.sistema.examenes.entity.Formula;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface Formula_repository extends JpaRepository<Formula, Long> {
    @Query("SELECT f from Formula f where f.visible =true")
    List<Formula> listarFormula();
}
