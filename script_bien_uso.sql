select *from bienuso.clasifbu a
inner join bienuso.clasifbu b on a.id=b.padre_id
inner join bienuso.clasifbu c on b.id=c.padre_id
where a.cod='26112' and b.cod='04' 
and c.cod='08'
limit 1


select concat(substring('0',character_length(especificacion)),especificacion) from legajos.bienuso