-- Creacion de tablas -- 

create table estudiantes (
estudiantes_id serial primary key,
nombre_estudiante varchar(50) not null,
apellido_estudiante varchar(50) not null,
fecha_nacimiento date not null,
direccion varchar(50) not null,
ciudad varchar(50) not null,
email varchar(50) not null
);

create table departamentos ( 
departamentos_id serial primary key,
nombre_departamento varchar(50) not null,
edificio varchar(20) not null
);

create table cursos (
curso_id serial primary key,
name_curso varchar(50) not null,
descripcion varchar(50) not null,
creditos  int not null check (creditos > 0),
semestre int not null check (semestre > 0),
departamentos_id int references departamentos (departamentos_id)
);

create table inscripciones (
inscripcion_id serial primary key,
estudiantes_id int references estudiantes(estudiantes_id),
curso_id int references cursos(curso_id),
fecha_inscripcion date not null,
calificacion decimal(3,1) not null
);

create table profesores (
profesor_id serial primary key,
nombre_profesor varchar(50) not null,
apellido_profesor varchar(50) not null,
titulo varchar(50) not null,
departamento_id int references departamentos(departamentos_id)
);

create table aulas (
aula_id serial primary key,
nombre_aula varchar(50) not null,
capacidad int not null,
ubicacion varchar(50) not null
);

create table horarios (
horario_id serial primary key,
curso_id int references cursos(curso_id),
aula_id int references aulas(aula_id),
fecha_inicio date not null,
fecha_fin date not null,
hora_inicio time not null,
hora_fin time not null
);

create table cursos_profesores (
curso_profesor_id serial primary key,
curso_id int references cursos(curso_id),
profesor_id int references profesores(profesor_id)
);

create table programas_estudio (
programa_id serial primary key,
nombre_programa varchar(50) not null,
descripcion_programa varchar(50) not null
);

create table programas_cursos (
programa_curso_id serial primary key,
programas_id int references programas_estudio(programa_id),
curso_id int references cursos(curso_id)
);

-- Creacion Tabla Campus--
create table campus (
campus_id serial primary key,
nombre_campus varchar(50) not null,
direccion_campus varchar(50) not null
);

-- Creacion Tabla Carreras --
create table carreras (
carreras_id serial primary key,
nombre_carrera varchar(50) not null,
titulo_otorgado varchar(50) not null
);

-- Creacion relacion Estudiantes/Carrera --
create table estudiantes_carreras (
estudiantes_carrearas_id serial primary key,
estudiantes_id int references estudiantes(estudiantes_id),
carreras_id int references carreras(carreras_id)
);

-- Modificacion de Tablas --

-- Agregar clave foranea a Estudiantes -- 
alter table estudiantes
add carreras_id int references carreras(carreras_id);

-- Agregar clave foranea a Cursos --
alter table cursos
add campus_id int references campus(campus_id);

-- Agregar columna a Profesores --
alter table profesores
add email varchar(50);

-- Eliminar columna a Estudiantes --
alter table estudiantes
drop column ciudad;

-- Eliminar tabla Aulas --
alter table horarios
drop column aula_id;
drop table aulas;

-- Reiniciar ID de las tablas para comenzar en 1 -- 
alter sequence estudiantes_estudiantes_id_seq restart with 1;
alter sequence departamentos_departamentos_id_seq restart with 1;
alter sequence cursos_curso_id_seq restart with 1;
alter sequence inscripciones_inscripcion_id_seq restart with 1;
alter sequence profesores_profesor_id_seq restart with 1;
alter sequence horarios_horario_id_seq restart with 1;
alter sequence cursos_profesores_curso_profesor_id_seq restart with 1;
alter sequence programas_estudio_programa_id_seq restart with 1;
alter sequence programas_cursos_programa_curso_id_seq restart with 1;
alter sequence campus_campus_id_seq restart with 1;
alter sequence carreras_carreras_id_seq restart with 1;
alter sequence estudiantes_carreras_estudiantes_carrearas_id_seq restart with 1;

-- Inserccion de datos --
insert into departamentos (nombre_departamento, edificio) values
('Ingeniería', 'A1'),
('Ingenieria', 'B1'),
('Contabilidad', 'C1'),
('Matemáticas', 'A2'),
('Contabilidad', 'B2'),
('Derecho', 'C2'),
('Educación', 'D1');

insert into campus (nombre_campus, direccion_campus) values
('Campus Mexicali', 'Lazaro 1'),
('Campus Monterrey', 'Lazaro 2'),
('Campus Tijuana', 'Lazaro 3'),
('Campus Ensenada', 'Lazaro 4'),
('Campus Tecate', 'Lazaro 5'),
('Campus Mexico', 'Lazaro 6'),
('Campus Jalisco', 'Lazaro 7');

insert into carreras (nombre_carrera, titulo_otorgado) values
('Sistemas Computacionales', 'Ingeniero en Sistemas'),
('Contabilidad', 'Licenciado en Contabilidad'),
('Derecho', 'Abogado'),
('Educación Primaria', 'Licenciado en Educación'),
('Matemáticas', 'Licenciado en Matemáticas'),
('Psicología', 'Licenciado en Psicología'),
('Deportes', 'Licenciado en Deportes');

insert into programas_estudio (nombre_programa, descripcion_programa) values
('Plan Ingenieria', 'Plan ingenieria basica'),
('Plan Ingeniería', 'Plan especializado en ingeniería'),
('Plan Contabilidad', 'Contabilidad'),
('Plan Educación', 'Docencia y pedagogía'),
('Plan Derecho', 'Derecho Penal'),
('Plan Ciencias', 'Ciencias básicas'),
('Plan Humanidades', 'Deportes');

insert into estudiantes (nombre_estudiante, apellido_estudiante, fecha_nacimiento, direccion, email, carreras_id) values
('Ana', 'López', '2000-01-15', 'Calle 1', 'ana@gmail.com', 1),
('Luis', 'Pérez', '1999-06-22', 'Calle 2', 'luis@gmail.com', 2),
('María', 'Ramírez', '2001-03-30', 'Calle 3', 'maria@gmail.com', 1),
('Carlos', 'Soto', '2002-11-11', 'Calle 4', 'carlos@gmail.com', 3),
('Lucía', 'Fernández', '2000-09-09', 'Calle 5', 'lucia@gmail.com', 1),
('Pedro', 'Gómez', '1998-12-25', 'Calle 6', 'pedro@gmail.com', 4),
('Sofía', 'Díaz', '2001-05-05', 'Calle 7','sofia@gmail.com', 2);

insert into profesores (nombre_profesor, apellido_profesor, titulo, departamento_id, email) values
('Jose', 'Bogarin', 'Ing.', 1, 'jose@tec.edu'),
('Elena', 'Ruiz', 'Dra.', 2, 'elena@tec.edu'),
('Raúl', 'Cano', 'Ing', 1, 'raul@tec.edu'),
('Laura', 'Jiménez', 'Mtra.', 4, 'laura@tec.edu'),
('Miguel', 'Torres', 'Dr.', 3, 'miguel@tec.edu'),
('Claudia', 'Ríos', 'Ing.', 1, 'claudia@tec.edu'),
('Andrés', 'Luna', 'Mtro', 5, 'andres@tec.edu');

insert into cursos (name_curso, descripcion, creditos, semestre, departamentos_id, campus_id) values
('Bases de Datos', 'Introducción a BD', 3, 2, 1, 1),
('Contabilidad', 'Contabilidad 1', 4, 2, 5, 2),
('Derecho Civil', 'Leyes', 3, 3, 6, 2),
('Matemáticas Discretas', 'Compuertas Logicas', 3, 2, 4, 1),
('Programación I', 'Fundamentos de código', 4, 1, 1, 1),
('Psicologia General', 'Teoría básica', 3, 2, 2, 3),
('Didáctica', 'Estrategias educativas', 3, 3, 7, 4);


insert into inscripciones (estudiantes_id, curso_id, fecha_inscripcion, calificacion) values
(1, 1, '2024-01-10', 8.5),
(2, 2, '2024-01-11', 9.0),
(3, 1, '2024-01-12', 7.0),
(4, 3, '2024-01-13', 6.5),
(5, 4, '2024-01-14', 8.0),
(6, 5, '2024-01-15', 7.5),
(7, 2, '2024-01-16', 9.5);

insert into horarios (curso_id, fecha_inicio, fecha_fin, hora_inicio, hora_fin) values
(1, '2024-02-01', '2024-06-01', '08:00', '10:00'),
(2, '2024-02-01', '2024-06-01', '10:00', '12:00'),
(3, '2024-02-01', '2024-06-01', '12:00', '14:00'),
(4, '2024-02-01', '2024-06-01', '14:00', '16:00'),
(5, '2024-02-01', '2024-06-01', '08:00', '10:00'),
(6, '2024-02-01', '2024-06-01', '10:00', '12:00'),
(7, '2024-02-01', '2024-06-01', '12:00', '14:00');

insert into cursos_profesores (curso_id, profesor_id) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 1), 
(6, 5),
(7, 6);

insert into programas_cursos (programas_id, curso_id) values
(1, 1),
(1, 2),
(2, 1), 
(3, 2), 
(4, 4),
(5, 3),
(6, 6);

insert into estudiantes_carreras (estudiantes_id, carreras_id) values
(1, 1),
(2, 2),
(3, 1), 
(4, 3),
(5, 1), 
(6, 4),
(7, 2); 

-- Consultas Especificas -- 

-- 1. Seleccion Basica --
select e.nombre_estudiante, e.apellido_estudiante
from estudiantes e;

-- 2. Clausula WHERE --
select c.name_curso as nombre_curso, c.creditos
from cursos c
where creditos = 3;

-- 3. INNER JOIN -- 
select e.nombre_estudiante || ' ' || e.apellido_estudiante as nombre_estudiante , c.name_curso as nombre_curso
from inscripciones i
inner join estudiantes e on i.estudiantes_id = e.estudiantes_id
inner join cursos c on i.curso_id = c.curso_id;

-- 4. LEFT JOIN --
select e.nombre_estudiante || ' ' || e.apellido_estudiante as nombre_estudiante , c.name_curso as nombre_curso
from estudiantes e
left join inscripciones i on e.estudiantes_id = i.estudiantes_id
left join cursos c on i.curso_id = c.curso_id;

-- 5. RIGHT JOIN -- 
select c.name_curso as nombre_curso, e.nombre_estudiante || ' ' || e.apellido_estudiante as nombre_estudiante
from inscripciones i
right join cursos c ON c.curso_id = i.curso_id
left join estudiantes e ON i.estudiantes_id = e.estudiantes_id;

-- 6. GROUP BY y COUNT --
select c.name_curso as nombre_curso, count(i.estudiantes_id) as total_estudiantes
from cursos c
left join inscripciones i on c.curso_id = i.curso_id
group by c.name_curso;

-- 7. BETWEEN --
select e.nombre_estudiante || ' ' || e.apellido_estudiante as nombre, e.fecha_nacimiento 
from estudiantes e
where e.fecha_nacimiento between '1995-01-01' and '1998-12-31'; 

-- 8. ORDER BY --
select c.name_curso 
from cursos c
order by c.name_curso asc;

-- 9. CTE --
with inscripcion_estudiantes as (
select e.estudiantes_id, e.nombre_estudiante || ' ' || e.apellido_estudiante AS nombre_completo,
count(i.inscripcion_id) as total_inscripciones
from estudiantes e
left join inscripciones i on e.estudiantes_id = i.estudiantes_id
group by e.estudiantes_id, nombre_completo
)

select nombre_completo, total_inscripciones
from inscripcion_estudiantes
order by  total_inscripciones DESC
limit 3;

-- Consulta Avanzada 1 --
with conteo_inscripciones as (
select d.nombre_departamento, c.name_curso,
count (i.inscripcion_id) as total_inscritos,
rank() over (partition by d.departamentos_id order by count (i.inscripcion_id) desc) as posicion
from cursos c
inner join departamentos d on c.departamentos_id = d.departamentos_id
left join inscripciones i on c.curso_id = i.curso_id
group by d.departamentos_id, d.nombre_departamento, c.name_curso
)

select nombre_departamento, name_curso, total_inscritos
from conteo_inscripciones
where posicion = 1;

-- Consulta Avanzada 2 --
select p.nombre_profesor || ' ' ||p.apellido_profesor as nombrecompleto_profesor,
count(cp.curso_id) as cantidad_cursos
from profesores p
inner join cursos_profesores cp on p.profesor_id = cp.profesor_id
group by p.profesor_id, nombrecompleto_profesor
having count(cp.curso_id) > 2;

-- Consulta Avanzada 3 --
with promedio_cursos as (
select pe.nombre_programa, c.name_curso as nombre_curso,
round(avg(i.calificacion), 2) as promedio,
rank() over (partition by pe.programa_id order by avg(i.calificacion) desc) as posicion
from programas_estudio pe
inner join programas_cursos pc on pe.programa_id = pc.programas_id
inner join cursos c on pc.curso_id = c.curso_id
inner join inscripciones i on c.curso_id = i.curso_id
group by pe.programa_id, pe.nombre_programa, c.name_curso
)

select nombre_programa, nombre_curso, promedio
from promedio_cursos
where posicion = 1;



