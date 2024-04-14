package com.sistema.examenes.repository;
import com.sistema.examenes.entity.TokenFCM;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface TokenFCMRepository extends JpaRepository<TokenFCM, Long> {
    // Métodos personalizados de ser necesarios

    @Transactional
    @Modifying
    @Query("DELETE FROM TokenFCM t WHERE t.usuario.id = :userId")
    void deleteTokensByUserId(@Param("userId") Long userId);

}