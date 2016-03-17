update expedientes set propietario_expediente=18 where propietario_expediente is null
--select count(*)from expedientes
select 
ROW_NUMBER() OVER (ORDER BY a.ano,a.expediente) AS id,
0 as version,
a.ano as anho,
'Particular' as caracter,
(case
	when a.estado=3 then a.referencia||' OBSERVACION: EXPEDIENTE ANULADO'
	when a.estado!=3 then a.referencia
end) as caratula,
a.propietario_expediente as cedula,
b.descripcion as dependencia,
'null' as dependencias,
'null' as entidad_id,
'null' as expediente_relacionado_id,
fecha as fecha_ingreso,
'null' as fecha_salida,
c.nombre as nombre_persona,
a.expediente||'/'||a.ano as numero,
(ROW_NUMBER() OVER (ORDER BY a.ano,a.expediente))::int as pin,
(case
	when a.tipo_operacion=1 then 1
	when a.tipo_operacion=2 then 2
end
)as serie_id,
(
case
	when a.documento=2 and a.tipo_operacion=1 then 2
	when a.documento=2 and a.tipo_operacion=2 then 42
	when a.documento=35 and a.tipo_operacion=1 then 35
	when a.documento=35 and a.tipo_operacion=2 then 59
	when a.documento=14 and a.tipo_operacion=1 then 14
	when a.documento=14 and a.tipo_operacion=2 then 46
	when a.documento=40 and a.tipo_operacion=1 then 40
	when a.documento=40 and a.tipo_operacion=2 then 62
	when a.documento=25 and a.tipo_operacion=1 then 25
	when a.documento=25 and a.tipo_operacion=2 then 49
	when a.documento=4 and a.tipo_operacion=1 then 4
	when a.documento=4 and a.tipo_operacion=2 then 44
	when a.documento=37 and a.tipo_operacion=1 then 37
	when a.documento=37 and a.tipo_operacion=2 then 60
	when a.documento=34 and a.tipo_operacion=1 then 34
	when a.documento=34 and a.tipo_operacion=2 then 58
	when a.documento=24 and a.tipo_operacion=1 then 24
	when a.documento=24 and a.tipo_operacion=2 then 48
	when a.documento=8 and a.tipo_operacion=1 then 8
	when a.documento=8 and a.tipo_operacion=2 then 45
	when a.documento=15 and a.tipo_operacion=1 then 15
	when a.documento=15 and a.tipo_operacion=2 then 47
	when a.documento=31 and a.tipo_operacion=1 then 31
	when a.documento=31 and a.tipo_operacion=2 then 55
	when a.documento=30 and a.tipo_operacion=1 then 30
	when a.documento=30 and a.tipo_operacion=2 then 54
	when a.documento=33 and a.tipo_operacion=1 then 33
	when a.documento=33 and a.tipo_operacion=2 then 57
	when a.documento=3 and a.tipo_operacion=1 then 3
	when a.documento=3 and a.tipo_operacion=2 then 43
	when a.documento=27 and a.tipo_operacion=1 then 27
	when a.documento=27 and a.tipo_operacion=2 then 51
	when a.documento=1 and a.tipo_operacion=1 then 1
	when a.documento=1 and a.tipo_operacion=2 then 41
	when a.documento=29 and a.tipo_operacion=1 then 29
	when a.documento=29 and a.tipo_operacion=2 then 53
	when a.documento=39 and a.tipo_operacion=1 then 39
	when a.documento=39 and a.tipo_operacion=2 then 61
	when a.documento=28 and a.tipo_operacion=1 then 28
	when a.documento=28 and a.tipo_operacion=2 then 52
	when a.documento=32 and a.tipo_operacion=1 then 32
	when a.documento=32 and a.tipo_operacion=2 then 56
	when a.documento=26 and a.tipo_operacion=1 then 26
	when a.documento=26 and a.tipo_operacion=2 then 50
end
)as tipo_id,
(case
	when a.tipo_operacion=1 then 'Interno'
	when a.tipo_operacion=2 then 'Entrante'
end
)as clase,
'null' as numero_sumario,
'null' as archivado_en,
folio,
'null' as fecha_estimada,
--/*
(
select a2.nombre 
from movimientos a1 
inner join personas a2 on a2.persona=a1.responsable
where a1.expediente=a.expediente and a1.ano=a.ano order by a1.fecha_inicio limit 1
) as usuario,
/*
(
select a2.nick
from movimientos a1 
inner join usuarios a2 on a2.persona=a1.responsable
where a1.expediente=a.expediente and a1.ano=a.ano order by a1.fecha_inicio limit 1
) as usuario2
--*/
--count(*)
--f.nombre as responsable,
(
select a3.nombre from responsables a1
inner join departamentos a2 on a2.departamento=a1.departamento
inner join personas a3 on a3.persona=a2.jefactura
where a1.periodo=a.ano and a1.expediente=a.expediente
order by responsable limit 1
) as responsable
 from expedientes a
inner join departamentos b on b.departamento=a.departamento
left join personas c on c.persona=a.propietario_expediente
--where a.propietario_expediente is null



