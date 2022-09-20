select * from dojos;
select * from ninjas;
-- crear 3 dojos nuevos
INSERT INTO dojos(nombre) VALUES ("Dojo Rojo"), ("Dojo Azul"), ("Dojo Verde");

-- eliminar los 3 dojos creados
-- delete from dojos;
delete from dojos where id=1;
delete from dojos where id=2;
delete from dojos where id=3;

-- crear 3 nuevos dojos
insert into dojos(nombre) values ("Dojo 1"),("Dojo 2"),("Dojo 3");

-- crear 3 ninjas que pertenezcan al primer dojo
insert into ninjas(nombre, apellido, edad, dojo_id) values ("Sofia","Guzman",22,4),("Cristina","Perez",34,4),("Emilia","Soto",25,4);
-- crear 3 ninjas que pertenezcan al segundo dojo
insert into ninjas(nombre, apellido, edad, dojo_id) values ("Elissa","Machado",46,5),("Angelina","Valverde",47,5),("Tania","Rios",40,5);
-- crear 3 ninjas que pertenezcan al tercer dojo
insert into ninjas(nombre, apellido, edad, dojo_id) values ("Victoria","Leon",19,6),("Cristina","Perez",27,6),("Emilia","Soto",31,6);

-- obtener todos los ninjas del primer dojo
select * from ninjas where dojo_id=4;
-- obtener todos los ninjas del ultimo dojo
SELECT * FROM ninjas where dojo_id= 6;
-- obtener el dojo del ultimo ninja
select nombre, apellido,dojo_id from ninjas order by id desc limit 1;