--TABLA NUSKE_USUARIO
INSERT INTO NUSKE_USUARIO VALUES (1, 'dianasoriano.alu@iespacomolla.es', 'ninguna', 'Diana', 'Soriano Cubí', TO_DATE('15/07/1999','DD/MM/YYYY'), 644546576, 'diana.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (2, 'estelasoriano.alu@iespacomolla.es', 'ninguna', 'Estela', 'Soriano Cubí', TO_DATE('20/05/1997','DD/MM/YYYY'), 644532121, 'estela.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (3, 'yaizasoriano.alu@iespacomolla.es', 'ninguna', 'Yaiza', 'Soriano Cubí', TO_DATE('12/08/2001','DD/MM/YYYY'), 644532121, 'yaiza.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (4, 'ivanayuso.alu@iespacomolla.es', 'ninguna', 'Iván', 'Ayuso Olivera', TO_DATE('24/04/1999','DD/MM/YYYY'), 644532121, 'ivan.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (5, 'psflores79@gmail.com', 'ninguna', 'Pedro', 'Sanchez Flores', TO_DATE('07/09/1979', 'DD/MM/YYYY'), 603765902, 'pedro.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (6, 'c_ledesma03@gmail.com', 'ninguna', 'Cristian', 'Ledesma Jimenez',  TO_DATE('07/11/1985', 'DD/MM/YYYY'), 552265002, 'cristian.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (7, 'lamejordelpueblo777@gmail.es', 'ninguna', 'Silvia', 'Amorós Nosequé',  TO_DATE('19/10/1983', 'DD/MM/YYYY'), 652365985, 'silvia.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (8, 'mamertoeldelpueblo58@gmail.com', 'ninguna', 'Ubaldo', 'Singanas Devivir',  TO_DATE('10/08/2000', 'DD/MM/YYYY'), 888596325, 'ubaldo.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (9, 'yanoseniloquehago789@gmail.com', 'ninguna', 'Robert', 'Castro Elcantante', TO_DATE('01/03/1977', 'DD/MM/YYYY'), 2255369, 'robert.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (10, 'jpesemarrano@gmail.es', 'ninguna', 'Juan Pablo', 'Serrano Marrano', TO_DATE('15/06/1988', 'DD/MM/YYYY'), 604485922, 'jp.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (11, 'elmojamedespues5@gmail.com', 'ninguna', 'Mohadmed', 'Wassiwassi Mahunche', TO_DATE('07/05/1985', 'DD/MM/YYYY'), 603885925, 'mohadmed.jpeg', sysdate);

--TABLA NUSKE_ADMINISTRADOR
INSERT INTO NUSKE_ADMINISTRADOR VALUES (1);
INSERT INTO NUSKE_ADMINISTRADOR VALUES (5);

--TABLA NUSKE_RESPONSABLE
INSERT INTO NUSKE_RESPONSABLE VALUES (2, '54643524R');
INSERT INTO NUSKE_RESPONSABLE VALUES (6, '55266998W');
INSERT INTO NUSKE_RESPONSABLE VALUES (8, '55226889L');

--TABLA NUSKE_SOCIO
INSERT INTO NUSKE_SOCIO VALUES (4, 'Ayuso S.L.', 644354444, 'ayusoSL@gmail.es');
INSERT INTO NUSKE_SOCIO VALUES (9, 'Azul como el mar azul, S.A.', 589625315, 'admin@elcristianylarosalia.es');

--TABLA NUSKE_CLIENTE
INSERT INTO NUSKE_CLIENTE VALUES(3, '87867234K');
INSERT INTO NUSKE_CLIENTE VALUES(7, '22589654T');
INSERT INTO NUSKE_CLIENTE VALUES(11, '88526325X');
INSERT INTO NUSKE_CLIENTE VALUES(10, '48256325R');

--TABLA NUSKE_MASCOTA
--cambiar codigo de cliente por codigo de responsable
INSERT INTO NUSKE_MASCOTA VALUES(1, 'Nano', 'Pinscher Mediano', 'No agresivo, se acerca a todo el mundo y le encanta jugar.', './images/nano,jpeg', null, 'Negro', 'EN_CASA', 2, null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(2, 'Zeus', 'Americano', 'Hiperactivo. A veces muerde.', './images/zeus,jpeg', null, 'Naranja', 'EN_CASA', 2,null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(3, 'Bruno Tomás', 'Cacri de Raza', '¡Cuidado! Es como un tigre pero en pequeño.', './images/BT,jpeg', 20, 'Naranja', 'EN_CASA', 2,null, null,null,'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(4, 'Luis Paolo', 'Burmes con Siames', 'Es como una pantera, en chiquitito, que puedes abrazar y ronronea.', './images/elPaolo,jpeg', 4, 'Gris Claro', 'EN_CASA', 2,null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(5, 'Mechin', 'Cacri', 'Ninfa de cara blanca', './images/Mechin.jpeg', 7, 'Blanco', 'EN_CASA', 8,null, null,null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(6, 'Calcifer', 'Cacri', 'Ninfa con coloretes', './images/Caciferjpeg', 2, 'Blanco manchado', 'EN_CASA', 8,null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(7, 'Pikachu', 'Cacri', 'Ninfa con coloretes en las mejillas', './images/Picacku.jpeg', 5, 'Amarillo', 'EN_CASA', 8,null, null, null, 'En casita');

--TABLA NUSKE_LISTA
INSERT INTO NUSKE_LISTA VALUES ('Favoritos de Yaiza', 3);
INSERT INTO NUSKE_LISTA VALUES ('Favoritos de La Silvia', 7);
INSERT INTO NUSKE_LISTA VALUES ('La lista del JP', 10);
INSERT INTO NUSKE_LISTA VALUES ('Mi lista, mis cosas', 11);

--TABLA NUSKE_CESTA
/*
INSERT INTO NUSKE_CESTA VALUES (1, 3);  
INSERT INTO NUSKE_CESTA VALUES (2, 7);
INSERT INTO NUSKE_CESTA VALUES (4, 10);
INSERT INTO NUSKE_CESTA VALUES (5, 11);
*/

--TABLA NUSKE_DIRECCIÓN
INSERT INTO NUSKE_DIRECCION VALUES (1, 3, 'San Fernando, 25', 'Villena', 'ALICANTE', 03400, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (2, 7, 'San Pedro de Cuba, 10', 'Alava', 'ALAVA', 85026, 'Paseo');
INSERT INTO NUSKE_DIRECCION VALUES (3, 5, 'Vampiro, 72', 'Elda', 'ALICANTE', 03600, 'Plaza');
INSERT INTO NUSKE_DIRECCION VALUES (4, 1, 'La otra banda, 125', 'Elda', 'ALICANTE', 03600, 'Paseo');
INSERT INTO NUSKE_DIRECCION VALUES (5, 2, 'Lo que faltaba, 2', 'Elda', 'ALICANTE', 03600, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (6, 4, 'Estoy hasta el regalo, 221', 'Elda', 'ALICANTE', 03600, 'Plaza');
INSERT INTO NUSKE_DIRECCION VALUES (7, 6, 'La subidita, 1', 'Elda', 'ALICANTE', 03600, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (8, 8, 'Ya esta listo, 125', 'Elda', 'ALICANTE', 03600, 'Rotonda');
INSERT INTO NUSKE_DIRECCION VALUES (9, 9, 'Villena, 221', 'Elda', 'ALICANTE', 03600, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (10, 10, 'Del coño, 216', 'Benidorm', 'ALICANTE', 03825, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (11, 11, 'Avda de Ronda, 21', 'Elda', 'ALICANTE', 03600, 'Avenida');
INSERT INTO NUSKE_DIRECCION VALUES (12, 11, 'El saladar, s/n', 'San Juan de Alicante', 'ALICANTE', 03628, 'Avenida');
INSERT INTO NUSKE_DIRECCION VALUES (13, 11, 'La Rosalia, 2', 'Petrer', 'ALICANTE', 03610, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (14, 10, 'Hasta aquí, 5', 'Elda', 'ALICANTE', 03600, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (15, 10, 'Las rosaletas, 16', 'Alicante', 'ALICANTE', 03030, 'Avenida');
INSERT INTO NUSKE_DIRECCION VALUES (16, 3, 'Lucrecia, 5', 'Novelda', 'ALICANTE', 03025, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (17, 7, 'La piojosa, s/n', 'Arnedo', 'LA_RIOJA', 87105, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (18, 5, 'Licantropo, 22', 'Petrer', 'ALICANTE', 03610, 'Calle');
INSERT INTO NUSKE_DIRECCION VALUES (19, 3, 'Malvarosa, 55', 'Valencia', 'VALENCIA', 03332, 'Avenida');
INSERT INTO NUSKE_DIRECCION VALUES (20, 7, 'Te enveneno esta noche, 69', 'Monovar', 'ALICANTE', 03612, 'Paseo');
INSERT INTO NUSKE_DIRECCION VALUES (21, 5, 'Golosina, 222', 'San Juan de Alicante', 'ALICANTE', 03628, 'Avenida');



--TABLA NUSKE_PEDIDO
/*
INSERT INTO NUSKE_PEDIDO VALUES (1, 'PROCESANDO', sysdate, 1, 3, 1, null);
INSERT INTO NUSKE_PEDIDO VALUES (2, 'COMPLETADO', sysdate, 2, 7, 2, 25);
INSERT INTO NUSKE_PEDIDO VALUES (4, 'EN_ESPERA', sysdate, 14, 10, 4, 10);
INSERT INTO NUSKE_PEDIDO VALUES (5, 'CANCELADO', sysdate, 12, 11, 5, 5);

--TABLA NUSKE_FACTURA
INSERT INTO NUSKE_FACTURA VALUES (1, sysdate, 1, 1, 3);
INSERT INTO NUSKE_FACTURA VALUES (2, sysdate, 2, 2, 7);
*/


--TABLA NUSKE_ARTICULO
INSERT INTO NUSKE_ARTICULO VALUES (1, 'articulo.png', 'Cama de perro', 'Para perros medianos. Cama marrón', 356, 100, 3, 21, 25, TO_DATE('14/02/2023','DD/MM/YYYY'), 1, 'CAMAS', 'PERROS', 'HOGAR');
INSERT INTO NUSKE_ARTICULO VALUES (2, 'articulo2.png', 'Champú de gato', 'Champú anticaspa para pieles sensibles', 342, 100, 65, 21, 14, TO_DATE('18/01/2023','DD/MM/YYYY'), 1, 'CHAMPUS', 'GATOS', 'SALUD_E_HIGIENE');
INSERT INTO NUSKE_ARTICULO VALUES (3, 'articulo3.png', 'Juguete para gato', 'Juguete interactivo con forma de rata con mando', 241, 100, 73, 21, 20.5, TO_DATE('01/02/2023','DD/MM/YYYY'), 1, 'JUGUETES_INTERACTIVOS', 'GATOS', 'ENTRETENIMIENTO');
INSERT INTO NUSKE_ARTICULO VALUES (4, 'articulo4.png', 'Comedero pajaros', 'Comedero jaula para pajaros pequeños', 250, 50, 10, 21, 17.5, TO_DATE('14/02/2023','DD/MM/YYYY'), 5, 'COMEDEROS', 'EXÓTICOS', 'HOGAR');
INSERT INTO NUSKE_ARTICULO VALUES (5, 'articulo5.png', 'Transportín de gato', 'Transportín profesional para gatos', 170, 50, 5, 21, 49.9, TO_DATE('18/01/2023','DD/MM/YYYY'), 5, 'TRANSPORTINES', 'GATOS', 'HOGAR');
INSERT INTO NUSKE_ARTICULO VALUES (6, 'articulo6.png', 'Pelota para perros', 'Pelota de rugbi para perros', 210, 100, 225, 21, 9.9, TO_DATE('01/02/2023','DD/MM/YYYY'), 5, 'PELOTAS', 'PERROS', 'ENTRETENIMIENTO');
INSERT INTO NUSKE_ARTICULO VALUES (7, 'articulo7.png', 'Comida húmeda gourmet gold con pollo', 'Comida húmeda para gatos pequeños', 250, 50, 12, 21, 2.5, TO_DATE('14/02/2023','DD/MM/YYYY'), 5, 'COMIDAS_HUMEDAS', 'GATOS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (8, 'articulo8.png', 'Comida para perros adultos marca Ultima', 'Comida en forma de estrella para perros', 170, 50, 5, 21, 12.5, TO_DATE('18/01/2023','DD/MM/YYYY'), 1, 'PIENSOS', 'PERROS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (9, 'articulo9.png', 'Alpiste para pájaros High Quality', 'Alpiste para Agapornis y Ninfas', 250, 50, 10, 21, 5.5, TO_DATE('01/02/2023','DD/MM/YYYY'), 1, 'PIENSOS', 'EXÓTICOS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (10, 'articulo10.png', 'Corta uñas gato', 'Cortauñas para gatos', 80, 10, 5, 21, 19.5, TO_DATE('14/02/2023','DD/MM/YYYY'), 5, 'OTROS', 'GATOS', 'SALUD_E_HIGIENE');

INSERT INTO NUSKE_ARTICULO VALUES (11, 'articulo11.png', 'Collar para perros', 'Collar negro con colgante en forma de hueso para perro', 100, 40, 1, 21, 15.99, TO_DATE('18/03/2023','DD/MM/YYYY'), 1, 'CORREAS', 'PERROS', 'ENTRETENIMIENTO');
INSERT INTO NUSKE_ARTICULO VALUES (12, 'articulo12.png', 'Terrario para iguana', 'Terrario para iguanas y reptiles decorado con plantas y agujeros para la incorporación de comedero extraíble', 20, 10, 1, 21, 49.99, TO_DATE('21/03/2023','DD/MM/YYYY'), 1, 'CAMAS', 'EXÓTICOS', 'HOGAR');
INSERT INTO NUSKE_ARTICULO VALUES (13, 'articulo13.png', 'Empapador para cachorro', 'Empapador para cachorros pequeños o para perros con problemas renales.', 200, 50, 30, 21, 8.99, TO_DATE('25/04/2023','DD/MM/YYYY'), 5, 'EMPAPADORES', 'PERROS', 'SALUD_E_HIGIENE');
INSERT INTO NUSKE_ARTICULO VALUES (14, 'articulo14.png', 'Transportín para hurón', 'Transportín para hurones y animales pequeños', 150, 50, 1, 21, 29.99, TO_DATE('30/04/2023','DD/MM/YYYY'), 1, 'TRANSPORTINES', 'EXÓTICOS', 'ENTRETENIMIENTO');

INSERT INTO NUSKE_ARTICULO VALUES (15, 'articulo15.png', 'Pienso para perros adultos[20 KG]', '20kg de pienso seco para perros adultos de todas las razas con 45% de carne', 100, 20, 1, 21, 39.99, TO_DATE('05/05/2023','DD/MM/YYYY'), 5, 'PIENSOS', 'PERROS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (16, 'articulo17.png', 'Pienso para gatos esterilizados', 'Pienso seco para gatos adultos y esterilizados. Marca Ultima', 80, 10, 1, 21, 29.99, TO_DATE('15/05/2023','DD/MM/YYYY'), 5, 'PIENSOS', 'GATOS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (17, 'articulo19.png', 'Pienso para loros Tropican', 'Pienso seco para loros y aves exóticas', 40, 10, 1, 21, 24.99, TO_DATE('25/05/2023','DD/MM/YYYY'), 1, 'PIENSOS', 'EXÓTICOS', 'ALIMENTACION');

--TABLA NUSKE_ARTICULO_EN_CESTA
/*
INSERT INTO NUSKE_ARTICULO_EN_CESTA VALUES (1, 1, 3, 25);
INSERT INTO NUSKE_ARTICULO_EN_CESTA VALUES (2, 2, 2, 14);
--INSERT INTO NUSKE_ARTICULO_EN_CESTA VALUES (3, 3, 1, 20);
*/

--TABLA NUSKE_ARTICULO_EN_LISTA
INSERT INTO NUSKE_ARTICULO_EN_LISTA VALUES ('Favoritos de Yaiza', 3, 1);
INSERT INTO NUSKE_ARTICULO_EN_LISTA VALUES ('Favoritos de La Silvia', 7, 2);


--TABLA NUSKE_RECOMENDACION_SOCIOS
INSERT INTO NUSKE_RECOMENDACION_SOCIOS VALUES (4, 2, 'ayusoSL@gmail.es', 'Recomendado para gatos adultos');
INSERT INTO NUSKE_RECOMENDACION_SOCIOS VALUES (4, 3, 'ayusoSL@gmail.es', 'Mi gato lo ama. Amamanta.');
INSERT INTO NUSKE_RECOMENDACION_SOCIOS VALUES (9, 1, 'yanoseniloquehago789@gmail.com', 'Recomendado para mi hermano. Es un perro.');

--TABLA NUSKE_VENTAS_SOCIOS
INSERT INTO NUSKE_VENTAS_SOCIOS VALUES (4, 2, 4);
INSERT INTO NUSKE_VENTAS_SOCIOS VALUES (9, 3, 25);
INSERT INTO NUSKE_VENTAS_SOCIOS VALUES (9, 2, 35);

--TABLA NUSKE_COMENTARIO
INSERT INTO NUSKE_COMENTARIO VALUES (1, 1, 'Anónimo', 8, 'MUY_BUENA', sysdate, 'Mi perro está encantado.', 'Buen precio', 'Tardo 2 días en llegar');
INSERT INTO NUSKE_COMENTARIO VALUES (2, 1, 'Paco', 7, 'BUENA', sysdate, 'Buen producto, pero tardó en llegar', 'Buena calidad', 'Tardanza en el envío');
INSERT INTO NUSKE_COMENTARIO VALUES (3, 2, 'Luisa', 10, 'EXCELENTE', sysdate, 'Me encanta este producto, lo recomiendo 100%', 'Excelente relación calidad-precio', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (4, 2, 'Pedro', 5, 'NORMAL', sysdate, 'No cumplió mis expectativas', 'Precio asequible', 'No era lo que esperaba');
INSERT INTO NUSKE_COMENTARIO VALUES (5, 3, 'Ana', 9, 'MUY_BUENA', sysdate, 'Muy satisfecha con mi compra', 'Buena calidad', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (6, 3, 'Carlos', 6, 'ACEPTABLE', sysdate, 'No está mal, pero no es lo mejor', 'Precio razonable', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (7, 4, 'María', 4, 'MALA', sysdate, 'No lo recomiendo', 'No es muy caro', 'Mala calidad');
INSERT INTO NUSKE_COMENTARIO VALUES (8, 4, 'Jorge', 2, 'MUY_MALA', sysdate, 'Un desastre', 'No demasiado caro', 'Muy mala calidad');
INSERT INTO NUSKE_COMENTARIO VALUES (9, 5, 'Sofía', 8, 'MUY_BUENA', sysdate, 'Gran producto a buen precio', 'Buena calidad', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (10, 5, 'Elena', 3, 'NORMAL', sysdate, 'No es lo que esperaba', 'Precio asequible', 'No cumple mis expectativas');
INSERT INTO NUSKE_COMENTARIO VALUES (11, 6, 'Juan', 9, 'MUY_BUENA', sysdate, 'Muy buen producto', 'Excelente relación calidad-precio', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (12, 6, 'Laura', 6, 'ACEPTABLE', sysdate, 'Podría ser mejor', 'Precio justo', 'No es lo mejor');
INSERT INTO NUSKE_COMENTARIO VALUES (13, 7, 'Raúl', 7, 'BUENA', sysdate, 'Buen producto', 'Buen precio', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (14, 7, 'Cristina', 4, 'MALA', sysdate, 'No me gustó', 'No es caro', 'Mala calidad');
INSERT INTO NUSKE_COMENTARIO VALUES (15, 8, 'Pepe', 8, 'MUY_BUENA', sysdate, 'Me encanta este producto', 'Buena calidad', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (16, 8, 'Marta', 6, 'ACEPTABLE', sysdate, 'No está mal', 'Calidad decente', 'Ninguno');
INSERT INTO NUSKE_COMENTARIO VALUES (18, 3, 'El del perro', 7, 'ACEPTABLE', sysdate, 'El gato juega. Pero se me ha vuelto hiperactivo', 'Buen precio', 'Si la pasa algo a mi gato os denuncio.');
INSERT INTO NUSKE_COMENTARIO VALUES (17, 2, 'Araña Zancuda', 10, 'EXCELENTE', sysdate, 'Mi hermano lo usa para la caspa.', 'Buen precio', 'Mi cuñada lo va a comprar de nuevo.');

--TABLA NUSKE_PROVEEDOR
INSERT INTO NUSKE_PROVEEDOR VALUES (1, 'Primark', 'Carrer Jacarilla', 'José Ramón', 672345612, 'proveedor@primark.es', 'Comprar en lotes de 50 unidades', null);
INSERT INTO NUSKE_PROVEEDOR VALUES (2, 'Carrefour', 'San Luis', 'Clara', 672345612, 'proveedor@carrefour.es', 'Comprar en lotes de 100 unidades', null);
INSERT INTO NUSKE_PROVEEDOR VALUES (3, 'Corte Inglés', 'Av. de ľ Alcalde Ramón Pastor', 'Antonio', 672345612, 'proveedor@corteingles.es', 'Comprar en lotes de 12 unidades', null);

--TABLA NUSKE_PROVEEDOR_SUM_ART
INSERT INTO NUSKE_PROVEEDOR_SUM_ART VALUES (1, 1);
INSERT INTO NUSKE_PROVEEDOR_SUM_ART VALUES (2, 1);
INSERT INTO NUSKE_PROVEEDOR_SUM_ART VALUES (2, 3);
INSERT INTO NUSKE_PROVEEDOR_SUM_ART VALUES (2, 5);
INSERT INTO NUSKE_PROVEEDOR_SUM_ART VALUES (2, 6);
INSERT INTO NUSKE_PROVEEDOR_SUM_ART VALUES (2, 7);
INSERT INTO NUSKE_PROVEEDOR_SUM_ART VALUES (3, 1);


----------------- MODIFICACIONES -----------------

UPDATE nuske_ventas_socios SET comision=25 WHERE cod_socio=9;
UPDATE nuske_articulo_en_cesta SET pvp_art=22.5 WHERE codigo_cesta=3;
UPDATE nuske_comentario SET ventajas='Buen precio. Bueno para la caspa de los perros' WHERE num_comentario=3;

--------------- BORRADOS -----------------------

DELETE FROM nuske_comentario WHERE num_comentario=3;
DELETE FROM nuske_recomendacion_socios WHERE cod_socio=9;



