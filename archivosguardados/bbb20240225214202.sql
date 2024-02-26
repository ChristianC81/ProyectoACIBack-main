SELECT u.*
FROM usuarios u
JOIN persona per ON per.id_persona = u.persona_id_persona
JOIN usuariorol ur ON u.id = ur.usuario_id
JOIN roles r ON ur.rol_rolid = r.rolid
LEFT JOIN asignacion_responsable asigres ON asigres.usuarioresponsable_id = u.id
LEFT JOIN asignacion_admin asigadm ON asigres.usuarioresponsable_id = asigadm.usuario_id
WHERE r.rolnombre = 'RESPONSABLE'
    AND (
        (asigres.usuarioadmin_id = 34 AND asigres.visible = true)
        OR
        (u.id IN (
            SELECT ae_inner.usuario_id
            FROM asignacion_evidencia ae_inner
            JOIN evidencia e ON ae_inner.evidencia_id_evidencia = e.id_evidencia
            JOIN indicador i ON e.indicador_id_indicador = i.id_indicador
            JOIN subcriterio sc ON i.subcriterio_id_subcriterio = sc.id_subcriterio
            JOIN criterio c ON sc.id_criterio = c.id_criterio
            WHERE c.id_criterio IN (
                SELECT criterio_id_criterio
                FROM asignacion_admin
                WHERE usuario_id = 34
            )
        ))
    )
    AND u.visible = true;
	
---------------------------------------

SELECT ac.fecha_fin, ac.fecha_inicio, ac.id_modelo, e.descripcion, e.estado, u.username, pe.primer_nombre ||' '|| pe.primer_apellido AS responsable, 
    (SELECT p.primer_nombre ||' '|| p.primer_apellido  
     FROM usuarios u 
     JOIN persona p ON u.persona_id_persona = p.id_persona
     WHERE u.id = 2
    ) AS administrador
FROM asignacion_evidencia ac 
JOIN evidencia e ON ac.evidencia_id_evidencia = e.id_evidencia
JOIN indicador i ON e.indicador_id_indicador = i.id_indicador
JOIN asignacion_indicador ag ON ag.indicador_id_indicador = i.id_indicador
JOIN usuarios u ON ac.usuario_id = u.id 
JOIN persona pe ON u.persona_id_persona = pe.id_persona
WHERE (LOWER(e.estado) = 'pendiente')
    AND ag.modelo_id_modelo = (SELECT MAX(id_modelo) FROM modelo) 
    AND ac.id_usuario_asignador = 2
    AND EXISTS (
        SELECT 1
        FROM usuarios u
        JOIN persona per ON per.id_persona = u.persona_id_persona
        JOIN usuariorol ur ON u.id = ur.usuario_id
        JOIN roles r ON ur.rol_rolid = r.rolid
        LEFT JOIN asignacion_responsable asigres ON asigres.usuarioresponsable_id = u.id
        LEFT JOIN asignacion_admin asigadm ON asigres.usuarioresponsable_id = asigadm.usuario_id
        WHERE r.rolnombre = 'RESPONSABLE'
            AND (
                (asigres.usuarioadmin_id = 2 AND asigres.visible = true)
                OR
                (u.id IN (
                    SELECT ae_inner.usuario_id
                    FROM asignacion_evidencia ae_inner
                    JOIN evidencia e ON ae_inner.evidencia_id_evidencia = e.id_evidencia
                    JOIN indicador i ON e.indicador_id_indicador = i.id_indicador
                    JOIN subcriterio sc ON i.subcriterio_id_subcriterio = sc.id_subcriterio
                    JOIN criterio c ON sc.id_criterio = c.id_criterio
                    WHERE c.id_criterio IN (
                        SELECT criterio_id_criterio
                        FROM asignacion_admin
                        WHERE usuario_id = 2
                    )
                ))
            )
            AND u.visible = true
    );
--------------------------


SELECT ac.fecha_fin, ac.fecha_inicio, ac.id_modelo, e.descripcion, e.estado,u.username, pe.primer_nombre ||' '|| pe.primer_apellido AS responsable, 
(SELECT p.primer_nombre ||' '|| p.primer_apellido  
 from usuarios u join persona p on u.persona_id_persona = p.id_persona
 where u.id = 34
) AS administrador
FROM asignacion_evidencia ac 
JOIN evidencia e ON ac.evidencia_id_evidencia = e.id_evidencia
JOIN indicador i ON e.indicador_id_indicador = i.id_indicador
JOIN asignacion_indicador ag ON ag.indicador_id_indicador = i.id_indicador
JOIN usuarios u ON ac.usuario_id = u.id 
JOIN persona pe ON u.persona_id_persona = pe.id_persona
WHERE (LOWER(e.estado) = 'aprobada')
AND ag.modelo_id_modelo = (SELECT MAX(id_modelo) FROM modelo) AND ac.id_usuario_asignador = 34

SELECT pe.primer_nombre ||' '|| pe.primer_apellido AS responsable,
c.nombre AS nombre_criterio, s.nombre AS nombre_subcriterio, i.nombre AS nombre_indicador,
e.descripcion AS evidencia, ae.fecha_fin, ae.fecha_inicio, e.estado 
FROM asignacion_evidencia ae 
JOIN evidencia e ON ae.evidencia_id_evidencia = e.id_evidencia
JOIN indicador i ON e.indicador_id_indicador = i.id_indicador
JOIN subcriterio s ON i.subcriterio_id_subcriterio = s.id_subcriterio
JOIN criterio c ON s.id_criterio = c.id_criterio
JOIN asignacion_indicador ag ON ag.indicador_id_indicador = i.id_indicador
JOIN usuarios u ON ae.usuario_id = u.id 
JOIN persona pe ON u.persona_id_persona = pe.id_persona
WHERE (LOWER(e.estado) = 'aprobada')
AND ag.modelo_id_modelo = (SELECT MAX(id_modelo) FROM modelo) 











select * from persona where cedula = '0103846234'
select * from usuarios 






