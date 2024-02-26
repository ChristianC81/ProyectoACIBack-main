SELECT c.id_criterio, c.nombre, c.descripcion, c.visible,
    (SELECT COUNT(s2.id_subcriterio) FROM subcriterio s2 WHERE s2.id_criterio = c.id_criterio AND s2.visible = true) AS cantidadSubcriterios
FROM criterio c
WHERE c.visible = true
ORDER BY c.descripcion ASC;
----------------------------------
SELECT s.id_subcriterio, s.nombre, s.descripcion, s.visible,
    (SELECT COUNT(i2.id_indicador)
    FROM indicador i2
    WHERE i2.subcriterio_id_subcriterio = s.id_subcriterio AND i2.visible = true)
    AS cantidadIndicadores
FROM subcriterio s
LEFT JOIN indicador i ON s.id_subcriterio = i.subcriterio_id_subcriterio
WHERE s.visible = true AND s.id_criterio = 3
GROUP BY s.id_subcriterio
ORDER BY s.id_subcriterio ASC;
-----------------------------------
SELECT evidencia.* FROM public.indicador join public.evidencia ON evidencia.indicador_id_indicador = 1 
WHERE evidencia.indicador_id_indicador=1 And evidencia.visible=true ORDER BY evidencia.id_evidencia
-------------------------------------------------------------------------------------------------------------------------------
SELECT evidencia.* FROM public.indicador join public.evidencia ON evidencia.indicador_id_indicador = indicador.id_indicador 
WHERE evidencia.indicador_id_indicador=1 And evidencia.visible=true ORDER BY evidencia.descripcion ASC
-------------------------------------------------
SELECT * FROM INDICADOR ORDER BY id_indicador ASC
------------------------------------------------
SELECT * FROM EVIDENCIA
---------------------------------------
SELECT evidencia.* FROM public.indicador 
join public.evidencia ON evidencia.indicador_id_indicador = indicador.id_indicador 
WHERE evidencia.indicador_id_indicador=1  And evidencia.visible=true
ORDER BY evidencia.descripcion ASC
---------------------------------------
SELECT * FROM INDICADOR
--------------------------------------
SELECT *
FROM evidencia e
JOIN asignacion_evidencia ae ON ae.evidencia_id_evidencia = e.id_evidencia
JOIN usuarios u ON ae.usuario_id = u.id
WHERE u.username = '0105760284'
    AND e.visible = true
    AND ae.visible = true
    AND ae.id_modelo = (SELECT MAX(id_modelo) FROM modelo)
	ORDER BY e.descripcion ASC;
-----------------------------------------------------------------------
SELECT pe.primer_nombre || ' ' || pe.primer_apellido AS responsable,
    c.nombre AS nombre_criterio,
    s.nombre AS nombre_subcriterio,
    i.nombre AS nombre_indicador,
    e.descripcion AS evidencia,
    ae.fecha_fin,
    ae.fecha_inicio,
    e.estado
FROM asignacion_evidencia ae
JOIN evidencia e ON ae.evidencia_id_evidencia = e.id_evidencia
JOIN indicador i ON e.indicador_id_indicador = i.id_indicador
JOIN subcriterio s ON i.subcriterio_id_subcriterio = s.id_subcriterio
JOIN criterio c ON s.id_criterio = c.id_criterio
JOIN asignacion_indicador ag ON ag.indicador_id_indicador = i.id_indicador
JOIN usuarios u ON ae.usuario_id = u.id
JOIN persona pe ON u.persona_id_persona = pe.id_persona
WHERE LOWER(e.estado) = LOWER('APROBADA')
    AND ag.modelo_id_modelo = (SELECT MAX(id_modelo) FROM modelo)
ORDER BY e.id_evidencia DESC;
------------------------------------------------------------------------
SELECT cri.nombre AS criterionomj,
    sub.nombre AS subcrierioj,
    i.id_indicador AS id_indicardorj,
    i.nombre AS ind_nombrej,
    i.descripcion AS ides,
    i.tipo AS tip,
    ev.descripcion AS descrip,
    i.peso AS pes,
    i.porc_obtenido AS obt,
    i.porc_utilida_obtenida AS uti,
    i.valor_obtenido AS val,
    CASE WHEN ai.visible IS NOT NULL THEN ai.visible ELSE false END AS visi,
    arc.nombre AS archivo_nombre,
    arc.enlace AS archivo_enlace
FROM criterio cri
JOIN subcriterio sub ON cri.id_criterio = sub.id_criterio AND sub.visible = true
LEFT JOIN indicador i ON sub.id_subcriterio = i.subcriterio_id_subcriterio AND i.visible = true
LEFT JOIN asignacion_indicador ai ON i.id_indicador = ai.indicador_id_indicador
LEFT JOIN evidencia ev ON i.id_indicador = ev.indicador_id_indicador AND ev.visible = true
LEFT JOIN asignacion_evidencia ac ON ev.id_evidencia = ac.evidencia_id_evidencia AND ac.visible = true
LEFT JOIN archivo arc ON ac.id_asignacion_evidencia = arc.id_asignacion_evidencia AND arc.visible = true
WHERE ai.modelo_id_modelo = 11 AND cri.nombre = 'INFRAESTRUCTURA'
ORDER BY i.descripcion , ev.descripcion ASC;
-----------------------------------------------------------------------
SELECT cri.nombre AS criterionomj,
       sub.nombre AS subcrierioj,
       i.id_indicador AS id_indicardorj,
       i.nombre AS ind_nombrej,
       ev.descripcion AS descrip,
       i.peso AS pes,
       i.porc_obtenido AS obt,
       i.tipo AS tip,
       i.porc_utilida_obtenida AS uti,
       i.valor_obtenido AS val,
       CASE WHEN ai.visible IS NOT NULL THEN ai.visible ELSE false END AS visi,
       arc.nombre AS archivo_nombre,
       arc.enlace AS archivo_enlace
FROM criterio cri
JOIN subcriterio sub ON cri.id_criterio = sub.id_criterio AND sub.visible = true
LEFT JOIN indicador i ON sub.id_subcriterio = i.subcriterio_id_subcriterio AND i.visible = true
LEFT JOIN asignacion_indicador ai ON i.id_indicador = ai.indicador_id_indicador
LEFT JOIN evidencia ev ON i.id_indicador = ev.indicador_id_indicador AND ev.visible = true
LEFT JOIN asignacion_evidencia ac ON ev.id_evidencia = ac.evidencia_id_evidencia AND ac.visible = true
LEFT JOIN archivo arc ON ac.id_asignacion_evidencia = arc.id_asignacion_evidencia AND arc.visible = true
JOIN asignacion_admin aa ON aa.criterio_id_criterio = cri.id_criterio AND aa.visible = true AND aa.id_modelo = 11
WHERE ai.modelo_id_modelo = 11 AND aa.usuario_id = 34
ORDER BY ev.descripcion ASC;
------------------------------------------------------------------------------------------------------------------------
SELECT * FROM PERSONA WHERE CEDULA = '0105760284'












