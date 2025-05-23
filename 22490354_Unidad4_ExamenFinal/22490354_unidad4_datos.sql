--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.5 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.campus VALUES (1, 'Campus Mexicali', 'Lazaro 1');
INSERT INTO public.campus VALUES (2, 'Campus Monterrey', 'Lazaro 2');
INSERT INTO public.campus VALUES (3, 'Campus Tijuana', 'Lazaro 3');
INSERT INTO public.campus VALUES (4, 'Campus Ensenada', 'Lazaro 4');
INSERT INTO public.campus VALUES (5, 'Campus Tecate', 'Lazaro 5');
INSERT INTO public.campus VALUES (6, 'Campus Mexico', 'Lazaro 6');
INSERT INTO public.campus VALUES (7, 'Campus Jalisco', 'Lazaro 7');


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carreras VALUES (1, 'Sistemas Computacionales', 'Ingeniero en Sistemas');
INSERT INTO public.carreras VALUES (2, 'Contabilidad', 'Licenciado en Contabilidad');
INSERT INTO public.carreras VALUES (3, 'Derecho', 'Abogado');
INSERT INTO public.carreras VALUES (4, 'Educación Primaria', 'Licenciado en Educación');
INSERT INTO public.carreras VALUES (5, 'Matemáticas', 'Licenciado en Matemáticas');
INSERT INTO public.carreras VALUES (6, 'Psicología', 'Licenciado en Psicología');
INSERT INTO public.carreras VALUES (7, 'Deportes', 'Licenciado en Deportes');


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos VALUES (1, 'Ingeniería', 'A1');
INSERT INTO public.departamentos VALUES (2, 'Ingenieria', 'B1');
INSERT INTO public.departamentos VALUES (3, 'Contabilidad', 'C1');
INSERT INTO public.departamentos VALUES (4, 'Matemáticas', 'A2');
INSERT INTO public.departamentos VALUES (5, 'Contabilidad', 'B2');
INSERT INTO public.departamentos VALUES (6, 'Derecho', 'C2');
INSERT INTO public.departamentos VALUES (7, 'Educación', 'D1');


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos VALUES (1, 'Bases de Datos', 'Introducción a BD', 3, 2, 1, 1);
INSERT INTO public.cursos VALUES (2, 'Contabilidad', 'Contabilidad 1', 4, 2, 5, 2);
INSERT INTO public.cursos VALUES (3, 'Derecho Civil', 'Leyes', 3, 3, 6, 2);
INSERT INTO public.cursos VALUES (4, 'Matemáticas Discretas', 'Compuertas Logicas', 3, 2, 4, 1);
INSERT INTO public.cursos VALUES (5, 'Programación I', 'Fundamentos de código', 4, 1, 1, 1);
INSERT INTO public.cursos VALUES (6, 'Psicologia General', 'Teoría básica', 3, 2, 2, 3);
INSERT INTO public.cursos VALUES (7, 'Didáctica', 'Estrategias educativas', 3, 3, 7, 4);


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesores VALUES (1, 'Jose', 'Bogarin', 'Ing.', 1, 'jose@tec.edu');
INSERT INTO public.profesores VALUES (2, 'Elena', 'Ruiz', 'Dra.', 2, 'elena@tec.edu');
INSERT INTO public.profesores VALUES (3, 'Raúl', 'Cano', 'Ing', 1, 'raul@tec.edu');
INSERT INTO public.profesores VALUES (4, 'Laura', 'Jiménez', 'Mtra.', 4, 'laura@tec.edu');
INSERT INTO public.profesores VALUES (5, 'Miguel', 'Torres', 'Dr.', 3, 'miguel@tec.edu');
INSERT INTO public.profesores VALUES (6, 'Claudia', 'Ríos', 'Ing.', 1, 'claudia@tec.edu');
INSERT INTO public.profesores VALUES (7, 'Andrés', 'Luna', 'Mtro', 5, 'andres@tec.edu');


--
-- Data for Name: cursos_profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos_profesores VALUES (1, 1, 1);
INSERT INTO public.cursos_profesores VALUES (2, 2, 2);
INSERT INTO public.cursos_profesores VALUES (3, 3, 3);
INSERT INTO public.cursos_profesores VALUES (4, 4, 4);
INSERT INTO public.cursos_profesores VALUES (5, 5, 1);
INSERT INTO public.cursos_profesores VALUES (6, 6, 5);
INSERT INTO public.cursos_profesores VALUES (7, 7, 6);


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estudiantes VALUES (1, 'Ana', 'López', '2000-01-15', 'Calle 1', 'ana@gmail.com', 1);
INSERT INTO public.estudiantes VALUES (2, 'Luis', 'Pérez', '1999-06-22', 'Calle 2', 'luis@gmail.com', 2);
INSERT INTO public.estudiantes VALUES (3, 'María', 'Ramírez', '2001-03-30', 'Calle 3', 'maria@gmail.com', 1);
INSERT INTO public.estudiantes VALUES (4, 'Carlos', 'Soto', '2002-11-11', 'Calle 4', 'carlos@gmail.com', 3);
INSERT INTO public.estudiantes VALUES (5, 'Lucía', 'Fernández', '2000-09-09', 'Calle 5', 'lucia@gmail.com', 1);
INSERT INTO public.estudiantes VALUES (6, 'Pedro', 'Gómez', '1998-12-25', 'Calle 6', 'pedro@gmail.com', 4);
INSERT INTO public.estudiantes VALUES (7, 'Sofía', 'Díaz', '2001-05-05', 'Calle 7', 'sofia@gmail.com', 2);


--
-- Data for Name: estudiantes_carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estudiantes_carreras VALUES (1, 1, 1);
INSERT INTO public.estudiantes_carreras VALUES (2, 2, 2);
INSERT INTO public.estudiantes_carreras VALUES (3, 3, 1);
INSERT INTO public.estudiantes_carreras VALUES (4, 4, 3);
INSERT INTO public.estudiantes_carreras VALUES (5, 5, 1);
INSERT INTO public.estudiantes_carreras VALUES (6, 6, 4);
INSERT INTO public.estudiantes_carreras VALUES (7, 7, 2);


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.horarios VALUES (1, 1, '2024-02-01', '2024-06-01', '08:00:00', '10:00:00');
INSERT INTO public.horarios VALUES (2, 2, '2024-02-01', '2024-06-01', '10:00:00', '12:00:00');
INSERT INTO public.horarios VALUES (3, 3, '2024-02-01', '2024-06-01', '12:00:00', '14:00:00');
INSERT INTO public.horarios VALUES (4, 4, '2024-02-01', '2024-06-01', '14:00:00', '16:00:00');
INSERT INTO public.horarios VALUES (5, 5, '2024-02-01', '2024-06-01', '08:00:00', '10:00:00');
INSERT INTO public.horarios VALUES (6, 6, '2024-02-01', '2024-06-01', '10:00:00', '12:00:00');
INSERT INTO public.horarios VALUES (7, 7, '2024-02-01', '2024-06-01', '12:00:00', '14:00:00');


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inscripciones VALUES (1, 1, 1, '2024-01-10', 8.5);
INSERT INTO public.inscripciones VALUES (2, 2, 2, '2024-01-11', 9.0);
INSERT INTO public.inscripciones VALUES (3, 3, 1, '2024-01-12', 7.0);
INSERT INTO public.inscripciones VALUES (4, 4, 3, '2024-01-13', 6.5);
INSERT INTO public.inscripciones VALUES (5, 5, 4, '2024-01-14', 8.0);
INSERT INTO public.inscripciones VALUES (6, 6, 5, '2024-01-15', 7.5);
INSERT INTO public.inscripciones VALUES (7, 7, 2, '2024-01-16', 9.5);


--
-- Data for Name: programas_estudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programas_estudio VALUES (1, 'Plan Ingenieria', 'Plan ingenieria basica');
INSERT INTO public.programas_estudio VALUES (2, 'Plan Ingeniería', 'Plan especializado en ingeniería');
INSERT INTO public.programas_estudio VALUES (3, 'Plan Contabilidad', 'Contabilidad');
INSERT INTO public.programas_estudio VALUES (4, 'Plan Educación', 'Docencia y pedagogía');
INSERT INTO public.programas_estudio VALUES (5, 'Plan Derecho', 'Derecho Penal');
INSERT INTO public.programas_estudio VALUES (6, 'Plan Ciencias', 'Ciencias básicas');
INSERT INTO public.programas_estudio VALUES (7, 'Plan Humanidades', 'Deportes');


--
-- Data for Name: programas_cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programas_cursos VALUES (1, 1, 1);
INSERT INTO public.programas_cursos VALUES (2, 1, 2);
INSERT INTO public.programas_cursos VALUES (3, 2, 1);
INSERT INTO public.programas_cursos VALUES (4, 3, 2);
INSERT INTO public.programas_cursos VALUES (5, 4, 4);
INSERT INTO public.programas_cursos VALUES (6, 5, 3);
INSERT INTO public.programas_cursos VALUES (7, 6, 6);


--
-- Name: campus_campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_campus_id_seq', 7, true);


--
-- Name: carreras_carreras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_carreras_id_seq', 7, true);


--
-- Name: cursos_curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_curso_id_seq', 7, true);


--
-- Name: cursos_profesores_curso_profesor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_profesores_curso_profesor_id_seq', 7, true);


--
-- Name: departamentos_departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_departamentos_id_seq', 7, true);


--
-- Name: estudiantes_carreras_estudiantes_carrearas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_carreras_estudiantes_carrearas_id_seq', 7, true);


--
-- Name: estudiantes_estudiantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_estudiantes_id_seq', 7, true);


--
-- Name: horarios_horario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_horario_id_seq', 7, true);


--
-- Name: inscripciones_inscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_inscripcion_id_seq', 7, true);


--
-- Name: profesores_profesor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_profesor_id_seq', 7, true);


--
-- Name: programas_cursos_programa_curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programas_cursos_programa_curso_id_seq', 7, true);


--
-- Name: programas_estudio_programa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programas_estudio_programa_id_seq', 7, true);


--
-- PostgreSQL database dump complete
--

