package com.sistema.examenes.repository;
import com.sistema.examenes.entity.TokenFCM;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TokenFCMRepository extends JpaRepository<TokenFCM, Long> {
    // Métodos personalizados de ser necesarios
}