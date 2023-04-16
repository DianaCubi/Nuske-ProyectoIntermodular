--CONSULTAS NUSKE
--By Pedro y Diana

--3 consultas de la sintaxis select básica (práctica 5.1)
    --1. Selecciona todas las mascotas que están en estado 'En Casa'.
    -- Esto es útil para saber cuantas mascotas de nuestra base de datos están en casa, esto se podría utilizar para los diferentes estados de las mascotas.
    SELECT *
    FROM nuske_mascota
    WHERE estado LIKE 'EN_CASA';
    
    --2. Selecciona el nombre, los apellidos y el teléfono de los usuarios según su última conexión.
    -- Ejemplo de uso: Necesitamos saber los usuarios que se han conectado en nuestra web hoy ya que ha nacido una camada de gatos y queremos enviar un
    -- aviso a todos los usuarios más activos por si alguno quiere adoptar.
    SELECT nombre, apellidos, e_mail, telefono
    FROM nuske_usuario
    WHERE ultima_conexion LIKE SYSDATE;
    
    --3. Muestra el nombre, descripción y subcategoría de aquellos artículos que hayan sido creados por el administrador 5 ordenados por nombre descendentemente
    -- Ejemplo de uso: El administrador nº 5 se ha liado y ha añadido varíos artículos erróneamente, tenemos que saber cuáles son antes de que se vendan para poder eliminarlos.
    SELECT nombre, descripcion, subcategoria
    FROM nuske_articulo
    WHERE cod_admin=5
    ORDER BY 1 DESC;
    
    
--3 consultas usando funciones SQL (práctica 5.2)
    --1. Muestra el precio máximo, medio y mínimo de los artículos registrados restando el IVA al PVP de estos y concatenando la moneda.
    -- Ejemplo de uso: Necesitamos saber los precios que rondan nuestros artículos para hacer una campaña de marketing.
    SELECT ROUND(MIN(PVP-(PVP*(IVA/100))), 2) || ' euros' "Precio mínimo", ROUND(AVG(PVP-(PVP*(IVA/100))), 2) || ' euros' "Precio medio", ROUND(MAX(PVP-(PVP*(IVA/100))), 2) || ' euros' "Precio máximo"
    FROM nuske_articulo;
    
    --2. Muestra la fecha de un pedido más la fecha correspondiente a su devolución.
    -- Ejemplo de uso: Cuando un usuario hace un pedido, queremos informarle de la fecha máxima para realizar una posible devolución (que siempre serán 3 meses después de realizar el pedido)
    SELECT fecha "Fecha pedido", ADD_MONTHS(fecha, 3) "Fecha devolución"
    FROM NUSKE_PEDIDO;
    
    --3. Muestra el nombre de la mascota con los apellidos de su dueño.
    -- Ejemplo de uso: Queremos hacerle un collar personalizado como regalo a nuestros responsables, para ello necesitamos concatenar el nombre de la mascota al apellido de nuestros responsables.
    SELECT CONCAT(m.nombre||' ', u.apellidos) "Nombre de animal completo"
    FROM NUSKE_MASCOTA m
    LEFT JOIN NUSKE_USUARIO u ON m.cod_responsable=u.codigo;

--3 consultas usando Agrupaciones, combinaciones u operaciones de conjuntos (práctica 5.3).
    --1. Muestra el nombre, email y el telefono de un usuario dependiendo de su localización
    -- Ejemplo de uso: Se ha perdido una mascota en X ciudad, necesitamos saber que usuarios hay registrados en esa ciudad para ponernos en contacto con ellos.
    SELECT u.nombre, u.e_mail, u.telefono
    FROM NUSKE_USUARIO u
    LEFT JOIN NUSKE_DIRECCION d ON u.codigo=d.cod_usuario
    WHERE UPPER(d.poblacion) LIKE 'PETRER';
    

    --2. Muestra la categoría, subcategoría, el tipo y la cantidad de articulos correspondientes a estos.
    --Ejemplo de uso: Necesitamos saber cuantos artículos tenemos registrados en cada categoría.
    SELECT categoria, subcategoria, tipo, count(*)"Artículos"
    FROM NUSKE_ARTICULO
    GROUP BY categoria,subcategoria, tipo
    ORDER BY categoria;
    
    --3. Muestra el codigo, el nombre y la descripción de un artículo dependiendo del proveedor seleccionado.
    --Ejemplo de uso: Nuestro proveedor X nos ha proporcionado un código de descuento que debemos implementarle a todos los artículos proporcionados por este.
    SELECT a.codigo, a.nombre, a.descripcion
    FROM NUSKE_ARTICULO a
    INNER JOIN NUSKE_PROVEEDOR_SUM_ART s ON s.cod_articulo=a.codigo 
    LEFT JOIN NUSKE_PROVEEDOR p ON p.codigo=s.cod_proveedor
    WHERE UPPER(p.nombre) LIKE 'CARREFOUR';
    
--1 vista, un insert y un borrado o actualización desde select, en total, serán tres sentencias. (práctica 5.4).
    --VISTA. El departamento de administración necesita revisar mensualmente los pedidos que han sido cancelados y contactar a los clientes 
    -- para obtener más información sobre las razones detrás de la cancelación, para ello necesita saber tanto el nombre como el email y el teléfono de los usuarios y el número del pedido.
    CREATE OR REPLACE VIEW PedidosCancelados AS
    SELECT p.codigo "Nº pedido", c.nombre, c.e_mail, c.telefono
    FROM NUSKE_PEDIDO p
    INNER JOIN NUSKE_USUARIO c ON p.cod_usuario=c.codigo
    WHERE UPPER(estado) LIKE 'CANCELADO';
    
    SELECT * FROM PedidosCancelados;
    
    --INSERT. Hemos firmado un contrato con Primark donde ahora nos va a proporcionar también comida para gatos por lo que debemos insertarlo en la base de datos. El
    -- único problema es que no sabemos cuál es el código de Primark por lo que habría que consultarlo primero :(
    INSERT INTO NUSKE_PROVEEDOR_SUM_ART
    SELECT p.codigo, a.codigo
    FROM NUSKE_PROVEEDOR p, NUSKE_ARTICULO a
    WHERE UPPER(p.nombre) LIKE 'PRIMARK' AND UPPER(a.nombre) LIKE 'COMIDA PARA GATOS';
    
    SELECT * FROM NUSKE_PROVEEDOR_SUM_ART;
    
    --DELETE. Con el acuerdo firmado con Primark y tras habernos dicho Carrefour que no va a volver a distribuir en España comida para gatos por temas legales,
    -- debemos borrar esta relación en la base de datos.
    DELETE FROM NUSKE_PROVEEDOR_SUM_ART 
    WHERE cod_proveedor=(SELECT codigo FROM NUSKE_PROVEEDOR WHERE UPPER(nombre) LIKE 'CARREFOUR')
    AND cod_articulo LIKE (SELECT codigo FROM NUSKE_ARTICULO WHERE UPPER(nombre) LIKE '%COMIDA%GATO%');
    
    SELECT * FROM NUSKE_PROVEEDOR;
