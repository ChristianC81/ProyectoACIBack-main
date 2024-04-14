package com.sistema.examenes.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class NotificationScheduler {

    @Autowired
    private Notificacion_ServiceImpl algunServicio;

    @Scheduled(cron = "0 * * * * ?") // Ejecutar cada minuto
    public void enviarNotificacionesProgramadas() {
        algunServicio.procesarNotificaciones();
        System.out.println("aqui se envian las notificaciones");
    }
}