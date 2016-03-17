--delete from k2.expediente
--delete from k2.historial_expediente
--alter table k2.expediente
--add column folio varchar(10);
--add column fecha_estimada date;
--add column responsable varchar(40);
--add column usuario varchar(50)


select 
b.movimiento as id,
1 as version,
'null' as con_copia,
b.derivado as dependencia_id,
'null' as dependencia_destino,
a.id as expediente_id,
b.fecha_inicio as fecha_ingreso,
b.fecha_inicio as fecha_salida,
a.caratula as providencia,
--b.responsable as usuario,
(case when c.nombre is null then 'admin' else c.nombre end) as usuario
--b.*
--ROW_NUMBER() OVER (ORDER BY campo) AS id
--select count(*)
from k2.expediente a
inner join movimientos_mesa b on substring(numero,0,position('/' in numero))::int=b.expediente and substring(numero,position('/' in numero)+1,character_length(numero))::int=b.ano
left join personas_mesa c on c.persona=b.responsable
order by b.movimiento