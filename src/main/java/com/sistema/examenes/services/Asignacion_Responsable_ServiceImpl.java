package com.sistema.examenes.services;

import com.sistema.examenes.entity.Asignacion_Responsable;
import com.sistema.examenes.repository.Asignacion_Responsable_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class Asignacion_Responsable_ServiceImpl extends GenericServiceImpl<Asignacion_Responsable, Long>
        implements Asignacion_Responsable_Service {
    @Autowired
    private Asignacion_Responsable_repository repository;

    @Override
    public CrudRepository<Asignacion_Responsable, Long> getDao() {
        return repository;
    }

}
