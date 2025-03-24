/* Procedmiento tblTarjeta*/
/*drop procedure proyecto2.sp_tarjeta_upd;*/
    
Delimiter //

CREATE PROCEDURE proyecto2.sp_tarjeta_upd (
    IN p_id_tarjeta INT,
    IN p_id_cliente INT,
    IN p_tipoTarjeta INT,
    IN p_numTarjeta VARCHAR(45),
    IN p_fechaVencimiento DATE,
    IN p_nombreTitular VARCHAR(45)
)
BEGIN
    DECLARE v_idExiste INT;
    
    # Verifica si la tarjeta existe
    SELECT COUNT(*) INTO v_idExiste
    FROM tarjeta
    WHERE id_tarjeta = p_id_tarjeta;
    
    # Condición para realizar el update de la tabla tarjeta
    IF v_idExiste > 0 THEN
        UPDATE tarjeta
        SET numTarjeta = p_numTarjeta,
            fechaVencimiento = p_fechaVencimiento,
            nombreTitular = p_nombreTitular,
            id_cliente = p_id_cliente,
            id_tipoTarjeta = p_tipoTarjeta
        WHERE id_tarjeta = p_id_tarjeta;
    ELSE
        SELECT 'No se puede realizar el proceso' AS Resultado;
    END IF;
END;

call proyecto2.sp_tarjeta_upd (1, 1, 1, '8888-8888-8888-8888', '2025/02/24', 'Carlos Gonzales');

    select * from tarjeta;
    
/* Procedmiento tblCliente*/

Delimiter //
CREATE PROCEDURE proyecto2.sp_cliente_upd (
    IN p_id_cliente INT,
    IN p_nombre VARCHAR (45),
    IN p_apellido VARCHAR (45),
    IN p_organizacion VARCHAR (45),
    IN p_cargo VARCHAR (45),
    IN p_numPasaporte VARCHAR (45),
    IN p_fechaNacimiento DATE,
    IN p_nacionalidad VARCHAR (45),
    IN p_telefono VARCHAR(45),
    IN p_fax VARCHAR(45),
    IN p_email VARCHAR (45),
    IN p_id_domicilio INT
)

BEGIN
    DECLARE v_idExiste INT;
    
    # Verifica si la tarjeta existe
    SELECT COUNT(*) INTO v_idExiste
    FROM cliente
    WHERE id_cliente = p_id_cliente;
    
    # Condición para realizar el update de la tabla tarjeta
    IF v_idExiste > 0 THEN
        UPDATE cliente
        SET id_cliente = p_id_cliente,
            nombre = p_nombre,
            apellido = p_apellido,
            organizacion = p_organizacion,
            cargo = p_cargo,
            numPasaporte = p_numPasaporte,
            fechaNacimiento = p_fechaNacimiento,
            nacionalidad = p_nacionalidad,
            telefono = p_telefono,
            fax = p_fax,
            email = p_email,
            id_domicilio = p_id_domicilio
        WHERE id_cliente = p_id_cliente;
    ELSE
        SELECT 'No se puede realizar el proceso' AS Resultado;
    END IF;
END;

call proyecto2.sp_cliente_upd (1, 'Gustavo', 'Ferrufino', 'Empresa B', 'Gerente General', 'Z123456', '1990/05/30', 'Americano', '9885-2587', '9885-2588', 'gferrufino@email.com', 2);

    select * from cliente;
