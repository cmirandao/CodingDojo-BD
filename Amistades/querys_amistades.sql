use esquema_amistades;
select * from usuarios;
select * from amistades;
-- crear 6 usuarios
insert into usuarios(nombre, apellido)
values ("Sofia","Rojo"),("Elissa","Naranjo"),("Victoria","Mora"),
("Gustavo","Brito"),("Carolina","Valverde"),("Maria Jesus","Valle");

-- hacer que el usuario 1 sea amigo del usuario 2, 4 y 6
insert into amistades(usuario_id,amigo_id) 
select u1.id, user2.id
from usuarios as u1,usuarios as user2
where u1.id=1 and mod(user2.id,2)=0;

-- hacer que el usuario 2 sea amigo del usuario 1, 3 y 5
insert into amistades(usuario_id,amigo_id) 
select u1.id, user2.id
from usuarios as u1,usuarios as user2
where u1.id=2 and mod(user2.id,2)=1;

-- hacer que el usuario 3 sea amigo del usuario 2 y 5
insert into amistades(usuario_id,amigo_id) 
select u1.id, user2.id
from usuarios as u1,usuarios as user2
where u1.id=3 and user2.id in (2,5);

-- hacer que el usuario 4 sea amigo del usuario 3
insert into amistades(usuario_id,amigo_id)
select u1.id, u2.id
from usuarios as u1, usuarios as u2
where u1.id=4 and u2.id=3;

-- hacer que el usuario 5 sea amigo del usuario 1 y 6
insert into amistades(usuario_id,amigo_id) 
select u1.id, user2.id
from usuarios as u1,usuarios as user2
where u1.id=5 and user2.id in (1,6);

-- hacer que el usuario 6 sea amigo del usuario 2 y 3
insert into amistades(usuario_id,amigo_id) 
select u1.id, user2.id
from usuarios as u1,usuarios as user2
where u1.id=6 and user2.id in (2,3);

-- mostrar las relaciones
SELECT user1.nombre, user1.apellido, user2.nombre as nombre_amigo, user2.apellido as apellido_amigo 
FROM usuarios as user1
JOIN amistades as fsh ON fsh.usuario_id=user1.id
LEFT JOIN usuarios as user2 ON fsh.amigo_id=user2.id;

-- NINJA: devolver todos los usuarios que son amigos del primer usuario, 
-- muestra sus nombres en el resultado
SELECT user1.nombre, user1.apellido, user2.nombre as nombre_amigo, user2.apellido as apellido_amigo 
FROM usuarios as user1
JOIN amistades as fsh ON fsh.usuario_id=user1.id
LEFT JOIN usuarios as user2 ON fsh.amigo_id=user2.id
where user1.id=1;

-- NINJA: devuelve el recuento de todas las amistades
SELECT user1.nombre, user1.apellido, count(fsh.amigo_id) as total_amigos
FROM usuarios as user1, amistades as fsh
where fsh.usuario_id=user1.id 
group by user1.id order by total_amigos desc;

-- NINJA: quien tiene mas amigos y devolver la cuenta de sus amigos
SELECT user1.nombre, user1.apellido, count(fsh.amigo_id) as total_amigos
FROM usuarios as user1, amistades as fsh
where fsh.usuario_id=user1.id 
group by user1.id order by total_amigos desc limit 1;

-- NINJA: devuelve los amigos del tercer usuario en orden alfabetico
SELECT user1.nombre, user1.apellido, user2.nombre as nombre_amigo, user2.apellido as apellido_amigo 
FROM usuarios as user1
JOIN amistades as fsh ON fsh.usuario_id=user1.id
LEFT JOIN usuarios as user2 ON fsh.amigo_id=user2.id
where user1.id=3 order by apellido_amigo asc;