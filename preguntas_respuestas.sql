select * from public.encuestas enc
join public.cuestionario c on c.id_encuesta=enc.id_encuesta
join public.preguntas p on p.id_cuestionario = c.id_cuestionario
join public.respuestas r on r.id_pregunta=p.id_pregunta
order by enc.id_encuesta;
