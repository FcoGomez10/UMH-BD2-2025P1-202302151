create database	db_DebitoCredito;

/*drop table db_DebitoCredito.cuenta;
drop table db_DebitoCredito.transacciones;*/

CREATE TABLE db_DebitoCredito.cuenta (
    Cuenta INT primary key,
    tcredito DECIMAL(10, 2),
    tdebito DECIMAL(10, 2),
    saldo DECIMAL(10, 2)
);

CREATE TABLE db_DebitoCredito.transacciones (
    n_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    cuenta INT,
    fecha date,
    credito DECIMAL(10, 2),
    debito DECIMAL(10, 2)
);

INSERT INTO db_DebitoCredito.cuenta (cuenta, tcredito, tdebito, saldo)
values (20010001, 800, 0.00, 800),
	(20010002, 560, 0.00, 560),
    (20010003, 1254, 0.00, 1254),
    (20010004, 15000, 0.00, 15000),
    (20010005, 256, 0.00, 256);

/*delete from db_DebitoCredito.cuenta;*/
select * from db_DebitoCredito.cuenta;
    
INSERT INTO db_DebitoCredito.transacciones (cuenta, fecha, credito, debito)
values (20010001, '2024/12/12', 800, 0.00),
	(20010002, '2025/01/05', 560, 0.00),
    (20010003, '2024/10/30', 1254, 0.00),
    (20010004, '2025/01/14', 15000, 0.00),
    (20010005, '2024/11/23', 256, 0.00);
    
/*delete from db_DebitoCredito.transacciones;*/
select * from db_DebitoCredito.transacciones;

/*delimiter //
drop procedure db_DebitoCredito.sp_gestion;*/

Delimiter // 
create procedure db_DebitoCredito.sp_gestion (
	in p_credito DECIMAL(10, 2),
	in p_debito DECIMAL(10, 2),
	in p_cuenta INT
)

BEGIN 
	declare v_credito DECIMAL (10, 2);
    declare v_debito DECIMAL (10, 2);
    declare v_cuenta int;
    declare v_fecha date default current_date;
    
    set v_credito = p_credito;
    set v_debito = p_debito;
    set v_cuenta = p_cuenta;
    
if p_credito > 0 and p_debito = 0 then 
	update cuenta set tcredito =  tcredito + v_credito
		where cuenta = v_cuenta;
	update cuenta set saldo =  saldo + v_credito
		where cuenta = v_cuenta;
        
	insert into transacciones (cuenta, fecha, credito, debito)
	values (v_cuenta, v_fecha, v_credito, v_debito);
        
elseif p_debito > 0 and p_credito = 0 then 
	update cuenta set tdebito =  tdebito + v_debito
		where cuenta = v_cuenta;
	update cuenta set saldo =  saldo - v_debito
		where cuenta = v_cuenta;
        
	insert into transacciones (cuenta, fecha, credito, debito)
	values (v_cuenta, v_fecha, v_credito, v_debito);
    
	end if;
end;

call db_DebitoCredito.sp_gestion (100, 0, 20010001);
call db_DebitoCredito.sp_gestion (0, 100, 20010001);

/*delete from db_DebitoCredito.cuenta;
delete from db_DebitoCredito.transacciones;*/

select * from db_DebitoCredito.cuenta;
select * from db_DebitoCredito.transacciones;
