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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    campus_id integer NOT NULL,
    nombre_campus character varying(50) NOT NULL,
    direccion_campus character varying(50) NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_campus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_campus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campus_campus_id_seq OWNER TO postgres;

--
-- Name: campus_campus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_campus_id_seq OWNED BY public.campus.campus_id;


--
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    carreras_id integer NOT NULL,
    nombre_carrera character varying(50) NOT NULL,
    titulo_otorgado character varying(50) NOT NULL
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- Name: carreras_carreras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_carreras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carreras_carreras_id_seq OWNER TO postgres;

--
-- Name: carreras_carreras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_carreras_id_seq OWNED BY public.carreras.carreras_id;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    curso_id integer NOT NULL,
    name_curso character varying(50) NOT NULL,
    descripcion character varying(50) NOT NULL,
    creditos integer NOT NULL,
    semestre integer NOT NULL,
    departamentos_id integer,
    campus_id integer,
    CONSTRAINT cursos_creditos_check CHECK ((creditos > 0)),
    CONSTRAINT cursos_semestre_check CHECK ((semestre > 0))
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- Name: cursos_curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_curso_id_seq OWNER TO postgres;

--
-- Name: cursos_curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_curso_id_seq OWNED BY public.cursos.curso_id;


--
-- Name: cursos_profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos_profesores (
    curso_profesor_id integer NOT NULL,
    curso_id integer,
    profesor_id integer
);


ALTER TABLE public.cursos_profesores OWNER TO postgres;

--
-- Name: cursos_profesores_curso_profesor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_profesores_curso_profesor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_profesores_curso_profesor_id_seq OWNER TO postgres;

--
-- Name: cursos_profesores_curso_profesor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_profesores_curso_profesor_id_seq OWNED BY public.cursos_profesores.curso_profesor_id;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    departamentos_id integer NOT NULL,
    nombre_departamento character varying(50) NOT NULL,
    edificio character varying(20) NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: departamentos_departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_departamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_departamentos_id_seq OWNER TO postgres;

--
-- Name: departamentos_departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_departamentos_id_seq OWNED BY public.departamentos.departamentos_id;


--
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    estudiantes_id integer NOT NULL,
    nombre_estudiante character varying(50) NOT NULL,
    apellido_estudiante character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    direccion character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    carreras_id integer
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- Name: estudiantes_carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes_carreras (
    estudiantes_carrearas_id integer NOT NULL,
    estudiantes_id integer,
    carreras_id integer
);


ALTER TABLE public.estudiantes_carreras OWNER TO postgres;

--
-- Name: estudiantes_carreras_estudiantes_carrearas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_carreras_estudiantes_carrearas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_carreras_estudiantes_carrearas_id_seq OWNER TO postgres;

--
-- Name: estudiantes_carreras_estudiantes_carrearas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_carreras_estudiantes_carrearas_id_seq OWNED BY public.estudiantes_carreras.estudiantes_carrearas_id;


--
-- Name: estudiantes_estudiantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_estudiantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_estudiantes_id_seq OWNER TO postgres;

--
-- Name: estudiantes_estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_estudiantes_id_seq OWNED BY public.estudiantes.estudiantes_id;


--
-- Name: horarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horarios (
    horario_id integer NOT NULL,
    curso_id integer,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);


ALTER TABLE public.horarios OWNER TO postgres;

--
-- Name: horarios_horario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horarios_horario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.horarios_horario_id_seq OWNER TO postgres;

--
-- Name: horarios_horario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horarios_horario_id_seq OWNED BY public.horarios.horario_id;


--
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    inscripcion_id integer NOT NULL,
    estudiantes_id integer,
    curso_id integer,
    fecha_inscripcion date NOT NULL,
    calificacion numeric(3,1) NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- Name: inscripciones_inscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_inscripcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_inscripcion_id_seq OWNER TO postgres;

--
-- Name: inscripciones_inscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_inscripcion_id_seq OWNED BY public.inscripciones.inscripcion_id;


--
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
    profesor_id integer NOT NULL,
    nombre_profesor character varying(50) NOT NULL,
    apellido_profesor character varying(50) NOT NULL,
    titulo character varying(50) NOT NULL,
    departamento_id integer,
    email character varying(50)
);


ALTER TABLE public.profesores OWNER TO postgres;

--
-- Name: profesores_profesor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesores_profesor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesores_profesor_id_seq OWNER TO postgres;

--
-- Name: profesores_profesor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesores_profesor_id_seq OWNED BY public.profesores.profesor_id;


--
-- Name: programas_cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programas_cursos (
    programa_curso_id integer NOT NULL,
    programas_id integer,
    curso_id integer
);


ALTER TABLE public.programas_cursos OWNER TO postgres;

--
-- Name: programas_cursos_programa_curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programas_cursos_programa_curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programas_cursos_programa_curso_id_seq OWNER TO postgres;

--
-- Name: programas_cursos_programa_curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programas_cursos_programa_curso_id_seq OWNED BY public.programas_cursos.programa_curso_id;


--
-- Name: programas_estudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programas_estudio (
    programa_id integer NOT NULL,
    nombre_programa character varying(50) NOT NULL,
    descripcion_programa character varying(50) NOT NULL
);


ALTER TABLE public.programas_estudio OWNER TO postgres;

--
-- Name: programas_estudio_programa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programas_estudio_programa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programas_estudio_programa_id_seq OWNER TO postgres;

--
-- Name: programas_estudio_programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programas_estudio_programa_id_seq OWNED BY public.programas_estudio.programa_id;


--
-- Name: campus campus_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN campus_id SET DEFAULT nextval('public.campus_campus_id_seq'::regclass);


--
-- Name: carreras carreras_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN carreras_id SET DEFAULT nextval('public.carreras_carreras_id_seq'::regclass);


--
-- Name: cursos curso_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN curso_id SET DEFAULT nextval('public.cursos_curso_id_seq'::regclass);


--
-- Name: cursos_profesores curso_profesor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores ALTER COLUMN curso_profesor_id SET DEFAULT nextval('public.cursos_profesores_curso_profesor_id_seq'::regclass);


--
-- Name: departamentos departamentos_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN departamentos_id SET DEFAULT nextval('public.departamentos_departamentos_id_seq'::regclass);


--
-- Name: estudiantes estudiantes_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN estudiantes_id SET DEFAULT nextval('public.estudiantes_estudiantes_id_seq'::regclass);


--
-- Name: estudiantes_carreras estudiantes_carrearas_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras ALTER COLUMN estudiantes_carrearas_id SET DEFAULT nextval('public.estudiantes_carreras_estudiantes_carrearas_id_seq'::regclass);


--
-- Name: horarios horario_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios ALTER COLUMN horario_id SET DEFAULT nextval('public.horarios_horario_id_seq'::regclass);


--
-- Name: inscripciones inscripcion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN inscripcion_id SET DEFAULT nextval('public.inscripciones_inscripcion_id_seq'::regclass);


--
-- Name: profesores profesor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores ALTER COLUMN profesor_id SET DEFAULT nextval('public.profesores_profesor_id_seq'::regclass);


--
-- Name: programas_cursos programa_curso_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos ALTER COLUMN programa_curso_id SET DEFAULT nextval('public.programas_cursos_programa_curso_id_seq'::regclass);


--
-- Name: programas_estudio programa_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_estudio ALTER COLUMN programa_id SET DEFAULT nextval('public.programas_estudio_programa_id_seq'::regclass);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (campus_id);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (carreras_id);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (curso_id);


--
-- Name: cursos_profesores cursos_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_pkey PRIMARY KEY (curso_profesor_id);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (departamentos_id);


--
-- Name: estudiantes_carreras estudiantes_carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_pkey PRIMARY KEY (estudiantes_carrearas_id);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (estudiantes_id);


--
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (horario_id);


--
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (inscripcion_id);


--
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (profesor_id);


--
-- Name: programas_cursos programas_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos
    ADD CONSTRAINT programas_cursos_pkey PRIMARY KEY (programa_curso_id);


--
-- Name: programas_estudio programas_estudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_estudio
    ADD CONSTRAINT programas_estudio_pkey PRIMARY KEY (programa_id);


--
-- Name: cursos cursos_campus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campus(campus_id);


--
-- Name: cursos cursos_departamentos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_departamentos_id_fkey FOREIGN KEY (departamentos_id) REFERENCES public.departamentos(departamentos_id);


--
-- Name: cursos_profesores cursos_profesores_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.cursos(curso_id);


--
-- Name: cursos_profesores cursos_profesores_profesor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesores(profesor_id);


--
-- Name: estudiantes_carreras estudiantes_carreras_carreras_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_carreras_id_fkey FOREIGN KEY (carreras_id) REFERENCES public.carreras(carreras_id);


--
-- Name: estudiantes_carreras estudiantes_carreras_estudiantes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_estudiantes_id_fkey FOREIGN KEY (estudiantes_id) REFERENCES public.estudiantes(estudiantes_id);


--
-- Name: estudiantes estudiantes_carreras_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_carreras_id_fkey FOREIGN KEY (carreras_id) REFERENCES public.carreras(carreras_id);


--
-- Name: horarios horarios_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.cursos(curso_id);


--
-- Name: inscripciones inscripciones_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.cursos(curso_id);


--
-- Name: inscripciones inscripciones_estudiantes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_estudiantes_id_fkey FOREIGN KEY (estudiantes_id) REFERENCES public.estudiantes(estudiantes_id);


--
-- Name: profesores profesores_departamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_departamento_id_fkey FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamentos_id);


--
-- Name: programas_cursos programas_cursos_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos
    ADD CONSTRAINT programas_cursos_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.cursos(curso_id);


--
-- Name: programas_cursos programas_cursos_programas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos
    ADD CONSTRAINT programas_cursos_programas_id_fkey FOREIGN KEY (programas_id) REFERENCES public.programas_estudio(programa_id);


--
-- PostgreSQL database dump complete
--

