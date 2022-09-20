-- recupera todos los usuarios
SELECT * FROM users;

-- crear usuarios
INSERT INTO users(nombre, apellido, email) VALUES ("Carolina", "Miranda", "caro@mail.com");
INSERT INTO users(nombre, apellido, email) VALUES ("Sofia", "Onell", "popi@mail.com");
INSERT INTO users(nombre, apellido, email) VALUES ("Elissa", "Onell", "lili@mail.com");

-- seleccionar un usuario que cumpla con una condicion especifica (email)
SELECT * FROM users WHERE email="caro@mail.com";

-- recuperar el primer usuario ingresado por su email
select * from users order by email asc limit 1;

-- recuperar el ultimo usuario usando su id
SELECT * FROM users order by id desc limit 1;

-- cambiar apellido de usuario con id=3 a Panqueques
update users set apellido="Panqueques" where id=3;

-- eliminar usuario con id=2
delete from users where id=2;

-- obtener todos los usuarios ordenados por nombre
select * from users order by nombre;

-- obtener todos los usuarios ordenados por nombre descendentemente
select * from users order by nombre desc;