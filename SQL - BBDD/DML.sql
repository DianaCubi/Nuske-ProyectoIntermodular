--TABLA NUSKE_USUARIO
INSERT INTO NUSKE_USUARIO VALUES (1, 'dianasoriano.alu@iespacomolla.es', 'contraseña1234', 'Diana', 'Soriano Cubí', TO_DATE('15/07/1999','DD/MM/YYYY'), 644546576, './images/foto.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (2, 'estelasoriano.alu@iespacomolla.es', 'password1234', 'Estela', 'Soriano Cubí', TO_DATE('20/05/1997','DD/MM/YYYY'), 644532121, './images/foto2.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (3, 'yaizasoriano.alu@iespacomolla.es', 'yaiza0000', 'Yaiza', 'Soriano Cubí', TO_DATE('12/08/2001','DD/MM/YYYY'), 644532121, './images/foto3.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (4, 'ivanayuso.alu@iespacomolla.es', 'contraseñaSecreta', 'Iván', 'Ayuso Olivera', TO_DATE('24/04/1999','DD/MM/YYYY'), 644532121, './images/foto4.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (5, 'psflores79@gmail.com', 'maricarmenysusmu�ecos', 'Pedro', 'Sanchez Flores', TO_DATE('07/09/1979', 'DD/MM/YYYY'), 603765902, './images/foto5.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (6, 'c_ledesma03@gmail.com', 'elpatriotaperdido03', 'Cristian', 'Ledesma Jimenez',  TO_DATE('07/11/1985', 'DD/MM/YYYY'), 552265002, './images/fotoc_ledesma.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (7, 'lamejordelpueblo777@gmail.es', 'lasranascantanysaltan777', 'Silvia', 'Amorós Nosequé',  TO_DATE('19/10/1983', 'DD/MM/YYYY'), 652365985, './images/foto_lacubanaalegre.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (8, 'mamertoeldelpueblo58@gmail.com', 'mamerto58pueblo', 'Ubaldo', 'Singanas Devivir',  TO_DATE('10/08/2000', 'DD/MM/YYYY'), 888596325, './images/foto_mamerto.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (9, 'yanoseniloquehago789@gmail.com', 'cuatrolobitostienelaboa', 'Cristian', 'Castro Elcantante', TO_DATE('01/03/1977', 'DD/MM/YYYY'), 2255369, './images/foto_elCristian.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (10, 'jpesemarrano@gmail.es', 'meencantalacomidadecerditos25', 'Juan Pablo', 'Serrano Marrano', TO_DATE('15/06/1988', 'DD/MM/YYYY'), 604485922, './images/foto_elJPmarrranillo.jpeg', sysdate);
INSERT INTO NUSKE_USUARIO VALUES (11, 'elmojamedespues5@gmail.com', 'seloquesoy55yloquevargo', 'Mohadmed', 'Wassiwassi Mahunche', TO_DATE('07/05/1985', 'DD/MM/YYYY'), 603885925, './images/foto_ermoja5.jpeg', sysdate);

--TABLA NUSKE_ADMINISTRADOR
INSERT INTO NUSKE_ADMINISTRADOR VALUES (1);
INSERT INTO NUSKE_ADMINISTRADOR VALUES (5);
INSERT INTO NUSKE_ADMINISTRADOR VALUES (7);

--TABLA NUSKE_RESPONSABLE
INSERT INTO NUSKE_RESPONSABLE VALUES (2, '54643524R');
INSERT INTO NUSKE_RESPONSABLE VALUES (5, '44587965W');
INSERT INTO NUSKE_RESPONSABLE VALUES (6, '55266998W');
INSERT INTO NUSKE_RESPONSABLE VALUES (8, '55226889L');
INSERT INTO NUSKE_RESPONSABLE VALUES(10, '48256325R');

--TABLA NUSKE_SOCIO
INSERT INTO NUSKE_SOCIO VALUES (4, 'Ayuso S.L.', 644354444, 'ayusoSL@gmail.es');
INSERT INTO NUSKE_SOCIO VALUES (8, 'Mamerto y sus cosas, S.L.', 653258956, 'admin@elmamerto.es');
INSERT INTO NUSKE_SOCIO VALUES (9, 'Azul como el mar azul, S.A.', 589625315, 'admin@elcristianylarosalia.es');

--TABLA NUSKE_CLIENTE
INSERT INTO NUSKE_CLIENTE VALUES(3, '87867234K');
INSERT INTO NUSKE_CLIENTE VALUES(7, '22589654T');
INSERT INTO NUSKE_CLIENTE VALUES(5, '44587965W');
INSERT INTO NUSKE_CLIENTE VALUES(11, '88526325X');
INSERT INTO NUSKE_CLIENTE VALUES(10, '48256325R');

--TABLA NUSKE_MASCOTA
--cambiar codigo de cliente por codigo de responsable
INSERT INTO NUSKE_MASCOTA VALUES(1, 'Nano', 'Pinscher Mediano', 'No agresivo, se acerca a todo el mundo y le encanta jugar.', './images/nano,jpeg', null, 'Negro', 'EN_CASA', 2, null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(2, 'Zeus', 'Americano', 'Hiperactivo. A veces muerde.', './images/zeus,jpeg', null, 'Naranja', 'EN_CASA', 2,null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(3, 'Bruno Tomás', 'Cacri de Raza', '¡Cuidado! Es como un tigre pero en peque�o.', './images/BT,jpeg', 20, 'Naranja', 'EN_CASA', 5,null, null,null,'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(4, 'Luis Paolo', 'Burmes con Siames', 'Es como una pantera, en chiquitito, que puedes abrazar y ronronea.', './images/elPaolo,jpeg', 4, 'Gris Claro', 'EN_CASA', 5,null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(5, 'Mechin', 'Cacri', 'Ninfa de cara blanca', './images/Mechin.jpeg', 7, 'Blanco', 'EN_CASA', 10,null, null,null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(6, 'Calcifer', 'Cacri', 'Ninfa con coloretes', './images/Caciferjpeg', 2, 'Blanco manchado', 'EN_CASA', 10,null, null, null, 'En casita');
INSERT INTO NUSKE_MASCOTA VALUES(7, 'Pikachu', 'Cacri', 'Ninfa con coloretes en las mejillas', './images/Picacku.jpeg', 5, 'Amarillo', 'EN_CASA', 10,null, null, null, 'En casita');

--TABLA NUSKE_LISTA
INSERT INTO NUSKE_LISTA VALUES ('Favoritos de Yaiza', 3);
INSERT INTO NUSKE_LISTA VALUES ('Favoritos de La Silvia', 7);
INSERT INTO NUSKE_LISTA VALUES ('Favoritos de Pedrito', 5);
INSERT INTO NUSKE_LISTA VALUES ('La lista del JP', 10);
INSERT INTO NUSKE_LISTA VALUES ('Mi lista, mis cosas', 11);

--TABLA NUSKE_CESTA
INSERT INTO NUSKE_CESTA VALUES (1, 3);
INSERT INTO NUSKE_CESTA VALUES (2, 7);
INSERT INTO NUSKE_CESTA VALUES (3, 5);
INSERT INTO NUSKE_CESTA VALUES (4, 10);
INSERT INTO NUSKE_CESTA VALUES (5, 11);

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
INSERT INTO NUSKE_PEDIDO VALUES (1, 'PROCESANDO', sysdate, 1, 3, 1, null);
INSERT INTO NUSKE_PEDIDO VALUES (2, 'COMPLETADO', sysdate, 2, 7, 2, 25);
INSERT INTO NUSKE_PEDIDO VALUES (3, 'COMPLETADO', sysdate, 3, 5, 3, 50);
INSERT INTO NUSKE_PEDIDO VALUES (4, 'EN_ESPERA', sysdate, 14, 10, 4, 10);
INSERT INTO NUSKE_PEDIDO VALUES (5, 'CANCELADO', sysdate, 12, 11, 5, 5);

--TABLA NUSKE_FACTURA
INSERT INTO NUSKE_FACTURA VALUES (1, sysdate, 1, 1, 3);
INSERT INTO NUSKE_FACTURA VALUES (2, sysdate, 2, 2, 7);
INSERT INTO NUSKE_FACTURA VALUES (3, sysdate, 3, 3, 5);

--TABLA NUSKE_ARTICULO
INSERT INTO NUSKE_ARTICULO VALUES (1, './images/articulo.jpeg', 'Cama de perro', 'Para perros medianos. Cama marrón', 156, 100, 3, 21, 25, TO_DATE('14/02/2023','DD/MM/YYYY'), 1, 'CAMAS', 'PERROS', 'HOGAR');
INSERT INTO NUSKE_ARTICULO VALUES (2, './images/articulo2.jpeg', 'Champú de gato', 'Champú anticaspa', 342, 100, 65, 21, 14, TO_DATE('18/01/2023','DD/MM/YYYY'), 1, 'CHAMPUS', 'GATOS', 'SALUD_E_HIGIENE');
INSERT INTO NUSKE_ARTICULO VALUES (3, './images/articulo3.jpeg', 'Juguete para gato', 'Juguete interactivo con forma de rata', 211, 100, 73, 21, 20.5, TO_DATE('01/02/2023','DD/MM/YYYY'), 1, 'JUGUETES_INTERACTIVOS', 'GATOS', 'ENTRETENIMIENTO');
INSERT INTO NUSKE_ARTICULO VALUES (4, './images/articulo4.jpeg', 'Comedero pajaros', 'Comedero jaula para pajaros pequeños', 250, 50, 10, 21, 17.5, TO_DATE('14/02/2023','DD/MM/YYYY'), 5, 'COMEDEROS', 'ANIMALES_EXOTICOS', 'HOGAR');
INSERT INTO NUSKE_ARTICULO VALUES (5, './images/articulo5.jpeg', 'Transport�n de gato', 'Transport�n profesional para gatos', 100, 50, 5, 21, 49.9, TO_DATE('18/01/2023','DD/MM/YYYY'), 5, 'TRANSPORTINES', 'GATOS', 'HOGAR');
INSERT INTO NUSKE_ARTICULO VALUES (6, './images/articulo6.jpeg', 'Pelota para perros', 'Pelota de rugbi para perros', 500, 100, 225, 21, 9.9, TO_DATE('01/02/2023','DD/MM/YYYY'), 5, 'PELOTAS', 'PERROS', 'ENTRETENIMIENTO');
INSERT INTO NUSKE_ARTICULO VALUES (7, './images/articulo7.jpeg', 'Comida para gatos', 'Comida húmeda para gatos pequeños', 250, 50, 12, 21, 2.5, TO_DATE('14/02/2023','DD/MM/YYYY'), 7, 'COMIDAS_HUMEDAS', 'GATOS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (8, './images/articulo8.jpeg', 'Comida para perros', 'Comida en forma de estrella para perros', 100, 50, 5, 21, 12.5, TO_DATE('18/01/2023','DD/MM/YYYY'), 7, 'PIENSOS', 'PERROS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (9, './images/articulo9.jpeg', 'Alpiste para p�jaros', 'Alpiste para Agapornis y Ninfas', 250, 50, 10, 21, 5.5, TO_DATE('01/02/2023','DD/MM/YYYY'), 7, 'PIENSOS', 'ANIMALES_EXOTICOS', 'ALIMENTACION');
INSERT INTO NUSKE_ARTICULO VALUES (10, './images/articul104.jpeg', 'Corta u�as gato', 'Cortauñas para gatos', 50, 10, 5, 21, 19.5, TO_DATE('14/02/2023','DD/MM/YYYY'), 5, 'OTROS', 'GATOS', 'SALUD_E_HIGIENE');



--TABLA NUSKE_ARTICULO_EN_CESTA
INSERT INTO NUSKE_ARTICULO_EN_CESTA VALUES (1, 1, 3, 25);
INSERT INTO NUSKE_ARTICULO_EN_CESTA VALUES (2, 2, 2, 14);
INSERT INTO NUSKE_ARTICULO_EN_CESTA VALUES (3, 3, 1, 20);


--TABLA NUSKE_ARTICULO_EN_LISTA
INSERT INTO NUSKE_ARTICULO_EN_LISTA VALUES ('Favoritos de Yaiza', 3, 1);
INSERT INTO NUSKE_ARTICULO_EN_LISTA VALUES ('Favoritos de La Silvia', 7, 2);
INSERT INTO NUSKE_ARTICULO_EN_LISTA VALUES ('Favoritos de Pedrito', 5, 3);


--TABLA NUSKE_RECOMENDACION_SOCIOS
INSERT INTO NUSKE_RECOMENDACION_SOCIOS VALUES (4, 2, 'ayusoSL@gmail.es', 'Recomendado para gatos adultos');
INSERT INTO NUSKE_RECOMENDACION_SOCIOS VALUES (8, 3, 'mamertoeldelpueblo58@gmail.com', 'Mi gato lo ama. Amamanta.');
INSERT INTO NUSKE_RECOMENDACION_SOCIOS VALUES (9, 1, 'yanoseniloquehago789@gmail.com', 'Recomendado para mi hermano. Es un perro.');

--TABLA NUSKE_VENTAS_SOCIOS
INSERT INTO NUSKE_VENTAS_SOCIOS VALUES (4, 2, 4);
INSERT INTO NUSKE_VENTAS_SOCIOS VALUES (8, 3, 25);
INSERT INTO NUSKE_VENTAS_SOCIOS VALUES (9, 2, 35);

--TABLA NUSKE_COMENTARIO
INSERT INTO NUSKE_COMENTARIO VALUES (1, 1, 'Anónimo', 8, 'MUY_BUENA', sysdate, 'Mi perro está encantado.', 'Buen precio', 'Tardo 2 días en llegar');
INSERT INTO NUSKE_COMENTARIO VALUES (2, 3, 'El del perro', 7, 'ACEPTABLE', sysdate, 'El gato juega. Pero se me ha vuelto hiperactivo', 'Buen precio', 'Si la pasa algo a mi gato os denuncio.');
INSERT INTO NUSKE_COMENTARIO VALUES (3, 2, 'Araña Zancuda', 10, 'EXCELENTE', sysdate, 'Mi hermano lo usa para la caspa.', 'Buen precio', 'Mi cuñada lo va a comprar de nuevo.');

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



