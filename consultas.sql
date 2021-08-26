------------------------------------------------------------
-- menu------------------------------------------------------
------------------------------------------------------------

use turista_db;

SELECT * FROM turista_db.menu;

--insertar datos menu
INSERT INTO `turista_db`.`menu` (`id_menu`, `id_rol`, `name_menu`) VALUES ('023', '01', 'client');

--borrar datos menu
DELETE FROM turista_db.menu WHERE ('id_menu' = '203');

--borrar datos tabla menu
DELETE FROM turista_db.menu;


--consulta especifica id de numeros terminados en 1

SELECT * FROM turista_db.menu
where id_menu like '%1';







------------------------------------------------------------
-- path tour------------------------------------------------------
------------------------------------------------------------



SELECT * FROM turista_db.path_tour;

--insertar datos path_tour

INSERT INTO turista_db.path_tour ('id_path') VALUES ('01');


--borrar  datos especificos  path_tour
DELETE FROM turista_db.path_tour WHERE ('id_path' = '3');


--borrar datos de la tabla path_tour
DELETE FROM turista_db.path_tour;

--consulta datos de la tabla path_tour
SELECT * FROM turista_db.path_tour
where id_path like '1%';





------------------------------------------------------------
-- payment method------------------------------------------------------
------------------------------------------------------------


SELECT * FROM turista_db.payment_method;

INSERT INTO `turista_db`.`payment_method` (`id_payment`, `name`) VALUES ('101', 'tarjeta credito');


--eliminar datos especificos
DELETE FROM turista_db.payment_method WHERE ('id_payment' = '4');


-- eliminar datos toda la tabla
DELETE FROM turista_db.payment_method;

--consulta especifica
SELECT * FROM turista_db.payment_method
where ip_payment like '1%';



------------------------------------------------------------
-- Rol------------------------------------------------------
------------------------------------------------------------


SELECT * FROM turista_db.rol;

INSERT INTO turista_db.rol ('id_rol') VALUES ('01');

DELETE FROM turista_db.rol WHERE ('id_rol' = '4');

DELETE FROM turista_db.rol;












------------------------------------------------------------
-- Services------------------------------------------------------
------------------------------------------------------------




SELECT * FROM turista_db.service;

INSERT INTO turista_db.service ('id_service', 'name_service', 'price') VALUES ('0201', 'rutas rapidas', '200000');

DELETE FROM turista_db.service WHERE ('id_service' = '202');

DELETE FROM turista_db.service;






------------------------------------------------------------
-- select user----------------------------------------------
------------------------------------------------------------

SELECT * FROM turista_db.users;

--select distinct
SELECT distinct	id_user FROM turista_db.users ;

SELECT MIN(id_user) as min_user
from users;

-- insert
INSERT INTO turista_db.users ('id_user', 'username', 'password') VALUES ('12344', 'alexa', '3141dd');

---delete
DELETE FROM turista_db.users WHERE ('id_user' = '123456');
DELETE FROM turista_db.users;

--min and max 

select min(id_user) as smallestID_user
from turista_db.users;

select max(id_user) as LargestID_user
from turista_db.users;






------------------------------------------------------------
-- orden----------------------------------------------
------------------------------------------------------------




SELECT * FROM turista_db.orders;

    INSERT INTO `turista_db`.`orders` (`id_order`, `id_payment_method`, `total`, `users_id_user`, `shopping_cart_id_shopping`, `status`) VALUES ('3514', '102', '599494', '23344', '1042', 'avalible');


-- extraer datos 
use turista_db;
select sum(cantidad * precio) as total
from detail_order , orders;






DELETE FROM turista_db.orders WHERE ('id_order' = '1');

DELETE FROM turista_db.orders;








------------------------------------------------------------
-- user has rol----------------------------------------------
------------------------------------------------------------



SELECT * FROM turista_db.users_has_rol;
INSERT INTO `turista_db`.`users_has_rol` (`users_id_user`, `rol_id_rol`) VALUES ('12344', '01');
DELETE FROM turista_db.user_has_rol
where id_user='1';




------------------------------------------------------------
-- path tour has service----------------------------------------------
------------------------------------------------------------





SELECT * FROM turista_db.path_tour_has_service;

INSERT INTO `turista_db`.`path_tour_has_service` (`path_tour_id_path`, `service_id_service`) VALUES ('043', '0202');

DELETE from turista_db.path_tour_has_service;




--update
UPDATE `turista_db`.`path_tour` SET `created_at` = '2021-08-19 00:00:00' WHERE (`id_path` = '043');


------------------------------------------------------------
-- shopping_cart----------------------------------------------
------------------------------------------------------------





SELECT * FROM turista_db.shopping_cart;

INSERT INTO `turista_db`.`shopping_cart` (`id_shopping`, `id_user`, `cantidad`) VALUES ('1020', '12344', '12');
DELETE FROM turista_db.shopping_cart WHERE ('id_shopping' = '1031');



SELECT * FROM turista_db.shopping_cart
where id_shopping like '1%';





------------------------------------------------------------
-- shopping_cart_has_a_service -----------------------------
------------------------------------------------------------




SELECT * FROM turista_db.shopping_cart_has_service;

INSERT INTO `turista_db`.`shopping_cart_has_service` (`shopping_cart_id_shopping`, `service_id_service`) VALUES ('1032', '0201');











--pendientes e insertar mas tipos de consultas

SELECT * FROM turista_db.detail_order;



INSERT INTO `turista_db`.`detail_order` (`id_detail`, `id_order`, `cantidad`, `precio`) VALUES ('787', '3514', '15', '12551');

UPDATE `turista_db`.`detail_order` SET `precio` = '' WHERE (`id_detail` = '787');
