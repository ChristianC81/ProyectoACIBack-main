package com.sistema.examenes.projection;

public interface ActivProyection {
    Long getidpersona();
    String getprimer_nombre();
    String getprimer_apellido();
    String getpercorreo();

    String getNombres();
    Long getTotal();
    Double getAvance();

    //AUTORIDAD
    String getNombre();
    String getFechainicio();
    String getFechafin();
    String getNombreresponsable();

    //
    String getNombreevidencia();
    String getInicio();
    String getFin();

}
