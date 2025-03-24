/*delimiter //
drop function fn_get_producto;*/

delimiter //
create function fn_get_total ( p_precio double, p_numNoches double)
returns double deterministic 
begin 
	declare total double; 
    
	set total = p_precio * p_numNoches; 
	return total;
end;

select fn_get_total (142, 3) as Total;
