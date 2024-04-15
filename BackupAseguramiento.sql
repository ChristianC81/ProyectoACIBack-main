PGDMP     9    /                |            Vinculacion    15.3    15.3 �    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    33895    Vinculacion    DATABASE     �   CREATE DATABASE "Vinculacion" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE "Vinculacion";
                postgres    false            �            1259    33896 	   actividad    TABLE     $  CREATE TABLE public.actividad (
    id_actividad bigint NOT NULL,
    descripcion character varying(10000),
    estado character varying(255),
    fecha_fin date,
    fecha_inicio date,
    nombre character varying(255),
    visible boolean,
    id_evidencia bigint,
    usuario_id bigint
);
    DROP TABLE public.actividad;
       public         heap    postgres    false            �            1259    33901    actividad_id_actividad_seq    SEQUENCE     �   CREATE SEQUENCE public.actividad_id_actividad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.actividad_id_actividad_seq;
       public          postgres    false    214            4           0    0    actividad_id_actividad_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.actividad_id_actividad_seq OWNED BY public.actividad.id_actividad;
          public          postgres    false    215            �            1259    33902    archivo    TABLE     +  CREATE TABLE public.archivo (
    id_archivo bigint NOT NULL,
    descripcion character varying(10000),
    enlace character varying(255),
    nombre character varying(10000),
    visible boolean,
    id_actividad bigint,
    id_asignacion_evidencia bigint,
    comentario character varying(255)
);
    DROP TABLE public.archivo;
       public         heap    postgres    false            �            1259    33907    archivo_id_archivo_seq    SEQUENCE        CREATE SEQUENCE public.archivo_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.archivo_id_archivo_seq;
       public          postgres    false    216            5           0    0    archivo_id_archivo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.archivo_id_archivo_seq OWNED BY public.archivo.id_archivo;
          public          postgres    false    217            �            1259    33908    asignacion_admin    TABLE     �   CREATE TABLE public.asignacion_admin (
    id_asignacion bigint NOT NULL,
    visible boolean,
    criterio_id_criterio bigint,
    usuario_id bigint,
    id_modelo bigint
);
 $   DROP TABLE public.asignacion_admin;
       public         heap    postgres    false            �            1259    33911 "   asignacion_admin_id_asignacion_seq    SEQUENCE     �   CREATE SEQUENCE public.asignacion_admin_id_asignacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.asignacion_admin_id_asignacion_seq;
       public          postgres    false    218            6           0    0 "   asignacion_admin_id_asignacion_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.asignacion_admin_id_asignacion_seq OWNED BY public.asignacion_admin.id_asignacion;
          public          postgres    false    219            �            1259    33912    asignacion_evidencia    TABLE       CREATE TABLE public.asignacion_evidencia (
    id_asignacion_evidencia bigint NOT NULL,
    fecha_fin timestamp without time zone,
    fecha_inicio timestamp without time zone,
    id_modelo bigint,
    visible boolean NOT NULL,
    evidencia_id_evidencia bigint,
    usuario_id bigint,
    id_usuario_asignador bigint,
    archsubido boolean,
    valor_obtenido double precision
);
 (   DROP TABLE public.asignacion_evidencia;
       public         heap    postgres    false            �            1259    33915 0   asignacion_evidencia_id_asignacion_evidencia_seq    SEQUENCE     �   CREATE SEQUENCE public.asignacion_evidencia_id_asignacion_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.asignacion_evidencia_id_asignacion_evidencia_seq;
       public          postgres    false    220            7           0    0 0   asignacion_evidencia_id_asignacion_evidencia_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.asignacion_evidencia_id_asignacion_evidencia_seq OWNED BY public.asignacion_evidencia.id_asignacion_evidencia;
          public          postgres    false    221            �            1259    33916    asignacion_indicador    TABLE     �   CREATE TABLE public.asignacion_indicador (
    id_asignacion_indicador bigint NOT NULL,
    visible boolean,
    indicador_id_indicador bigint,
    modelo_id_modelo bigint
);
 (   DROP TABLE public.asignacion_indicador;
       public         heap    postgres    false            �            1259    33919 0   asignacion_indicador_id_asignacion_indicador_seq    SEQUENCE     �   CREATE SEQUENCE public.asignacion_indicador_id_asignacion_indicador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.asignacion_indicador_id_asignacion_indicador_seq;
       public          postgres    false    222            8           0    0 0   asignacion_indicador_id_asignacion_indicador_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.asignacion_indicador_id_asignacion_indicador_seq OWNED BY public.asignacion_indicador.id_asignacion_indicador;
          public          postgres    false    223            �            1259    33920    asignacion_responsable    TABLE     �   CREATE TABLE public.asignacion_responsable (
    id_asignacion bigint NOT NULL,
    id_modelo bigint,
    visible boolean,
    usuarioadmin_id bigint,
    usuarioresponsable_id bigint
);
 *   DROP TABLE public.asignacion_responsable;
       public         heap    postgres    false            �            1259    33923 (   asignacion_responsable_id_asignacion_seq    SEQUENCE     �   CREATE SEQUENCE public.asignacion_responsable_id_asignacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.asignacion_responsable_id_asignacion_seq;
       public          postgres    false    224            9           0    0 (   asignacion_responsable_id_asignacion_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.asignacion_responsable_id_asignacion_seq OWNED BY public.asignacion_responsable.id_asignacion;
          public          postgres    false    225            �            1259    33924    criterio    TABLE     �   CREATE TABLE public.criterio (
    id_criterio bigint NOT NULL,
    descripcion character varying(10000),
    nombre character varying(255),
    visible boolean
);
    DROP TABLE public.criterio;
       public         heap    postgres    false            �            1259    33929    criterio_id_criterio_seq    SEQUENCE     �   CREATE SEQUENCE public.criterio_id_criterio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.criterio_id_criterio_seq;
       public          postgres    false    226            :           0    0    criterio_id_criterio_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.criterio_id_criterio_seq OWNED BY public.criterio.id_criterio;
          public          postgres    false    227            �            1259    33930    cualitativa    TABLE     �   CREATE TABLE public.cualitativa (
    id_cualitativa bigint NOT NULL,
    escala character varying(255),
    valor double precision,
    visible boolean
);
    DROP TABLE public.cualitativa;
       public         heap    postgres    false            �            1259    33933    cualitativa_id_cualitativa_seq    SEQUENCE     �   CREATE SEQUENCE public.cualitativa_id_cualitativa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.cualitativa_id_cualitativa_seq;
       public          postgres    false    228            ;           0    0    cualitativa_id_cualitativa_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.cualitativa_id_cualitativa_seq OWNED BY public.cualitativa.id_cualitativa;
          public          postgres    false    229            �            1259    33934    cuantitativa    TABLE     �   CREATE TABLE public.cuantitativa (
    id_cuantitativa bigint NOT NULL,
    abreviatura character varying(255),
    descripcion character varying(10000),
    visible boolean
);
     DROP TABLE public.cuantitativa;
       public         heap    postgres    false            �            1259    33939     cuantitativa_id_cuantitativa_seq    SEQUENCE     �   CREATE SEQUENCE public.cuantitativa_id_cuantitativa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cuantitativa_id_cuantitativa_seq;
       public          postgres    false    230            <           0    0     cuantitativa_id_cuantitativa_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.cuantitativa_id_cuantitativa_seq OWNED BY public.cuantitativa.id_cuantitativa;
          public          postgres    false    231            �            1259    33940    detalle_evaluacion    TABLE     !  CREATE TABLE public.detalle_evaluacion (
    id_detalle_evaluacion bigint NOT NULL,
    estado boolean,
    fecha timestamp without time zone,
    id_modelo bigint,
    observacion character varying(100000),
    visible boolean,
    evidencia_id_evidencia bigint,
    usuario_id bigint
);
 &   DROP TABLE public.detalle_evaluacion;
       public         heap    postgres    false            �            1259    33945 ,   detalle_evaluacion_id_detalle_evaluacion_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_evaluacion_id_detalle_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.detalle_evaluacion_id_detalle_evaluacion_seq;
       public          postgres    false    232            =           0    0 ,   detalle_evaluacion_id_detalle_evaluacion_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.detalle_evaluacion_id_detalle_evaluacion_seq OWNED BY public.detalle_evaluacion.id_detalle_evaluacion;
          public          postgres    false    233            �            1259    33946    encabezado_evaluar    TABLE     �   CREATE TABLE public.encabezado_evaluar (
    id_encabezado_evaluar bigint NOT NULL,
    visible boolean,
    formula_id_formula bigint,
    indicador_id_indicador bigint
);
 &   DROP TABLE public.encabezado_evaluar;
       public         heap    postgres    false            �            1259    33949 ,   encabezado_evaluar_id_encabezado_evaluar_seq    SEQUENCE     �   CREATE SEQUENCE public.encabezado_evaluar_id_encabezado_evaluar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.encabezado_evaluar_id_encabezado_evaluar_seq;
       public          postgres    false    234            >           0    0 ,   encabezado_evaluar_id_encabezado_evaluar_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.encabezado_evaluar_id_encabezado_evaluar_seq OWNED BY public.encabezado_evaluar.id_encabezado_evaluar;
          public          postgres    false    235            �            1259    33950    evaluar_cualitativa    TABLE     �   CREATE TABLE public.evaluar_cualitativa (
    id_evaluar_cualitativa bigint NOT NULL,
    visible boolean,
    id_cualitativa bigint,
    id_indicador bigint,
    cualitativa_id_cualitativa bigint,
    indicador_id_indicador bigint
);
 '   DROP TABLE public.evaluar_cualitativa;
       public         heap    postgres    false            �            1259    33953 .   evaluar_cualitativa_id_evaluar_cualitativa_seq    SEQUENCE     �   CREATE SEQUENCE public.evaluar_cualitativa_id_evaluar_cualitativa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.evaluar_cualitativa_id_evaluar_cualitativa_seq;
       public          postgres    false    236            ?           0    0 .   evaluar_cualitativa_id_evaluar_cualitativa_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.evaluar_cualitativa_id_evaluar_cualitativa_seq OWNED BY public.evaluar_cualitativa.id_evaluar_cualitativa;
          public          postgres    false    237            �            1259    33954    evaluar_cuantitativa    TABLE     �   CREATE TABLE public.evaluar_cuantitativa (
    id_evaluar_cuantitativa bigint NOT NULL,
    valor double precision,
    visible boolean,
    cuantitativa_id_cuantitativa bigint,
    encabezado_evaluar_id_encabezado_evaluar bigint
);
 (   DROP TABLE public.evaluar_cuantitativa;
       public         heap    postgres    false            �            1259    33957 0   evaluar_cuantitativa_id_evaluar_cuantitativa_seq    SEQUENCE     �   CREATE SEQUENCE public.evaluar_cuantitativa_id_evaluar_cuantitativa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.evaluar_cuantitativa_id_evaluar_cuantitativa_seq;
       public          postgres    false    238            @           0    0 0   evaluar_cuantitativa_id_evaluar_cuantitativa_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.evaluar_cuantitativa_id_evaluar_cuantitativa_seq OWNED BY public.evaluar_cuantitativa.id_evaluar_cuantitativa;
          public          postgres    false    239            �            1259    33958 	   evidencia    TABLE     c  CREATE TABLE public.evidencia (
    id_evidencia bigint NOT NULL,
    descripcion character varying(10000),
    enlace character varying(255),
    estado character varying(255),
    nombre character varying(10000),
    visible boolean,
    indicador_id_indicador bigint,
    valor_obtenido double precision,
    porc_utilidad_obtenido double precision
);
    DROP TABLE public.evidencia;
       public         heap    postgres    false            �            1259    33963    evidencia_id_evidencia_seq    SEQUENCE     �   CREATE SEQUENCE public.evidencia_id_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.evidencia_id_evidencia_seq;
       public          postgres    false    240            A           0    0    evidencia_id_evidencia_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.evidencia_id_evidencia_seq OWNED BY public.evidencia.id_evidencia;
          public          postgres    false    241            �            1259    33964    formula    TABLE     �   CREATE TABLE public.formula (
    id_formula bigint NOT NULL,
    descripcion character varying(10000),
    formula character varying(255),
    visible boolean
);
    DROP TABLE public.formula;
       public         heap    postgres    false            �            1259    33969    formula_id_formula_seq    SEQUENCE        CREATE SEQUENCE public.formula_id_formula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.formula_id_formula_seq;
       public          postgres    false    242            B           0    0    formula_id_formula_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.formula_id_formula_seq OWNED BY public.formula.id_formula;
          public          postgres    false    243            �            1259    33970    historial_asignacion_evidencia    TABLE     �   CREATE TABLE public.historial_asignacion_evidencia (
    id_haev bigint NOT NULL,
    fecha timestamp without time zone,
    visible boolean,
    asignacion_evi_id_asignacion_evidencia bigint,
    usuario_asignador_id bigint
);
 2   DROP TABLE public.historial_asignacion_evidencia;
       public         heap    postgres    false            �            1259    33973 *   historial_asignacion_evidencia_id_haev_seq    SEQUENCE     �   CREATE SEQUENCE public.historial_asignacion_evidencia_id_haev_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.historial_asignacion_evidencia_id_haev_seq;
       public          postgres    false    244            C           0    0 *   historial_asignacion_evidencia_id_haev_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.historial_asignacion_evidencia_id_haev_seq OWNED BY public.historial_asignacion_evidencia.id_haev;
          public          postgres    false    245            �            1259    33974 	   indicador    TABLE     �  CREATE TABLE public.indicador (
    id_indicador bigint NOT NULL,
    descripcion character varying(10000),
    estandar double precision,
    nombre character varying(255),
    peso double precision,
    porc_obtenido double precision,
    porc_utilida_obtenida double precision,
    tipo character varying(255),
    valor_obtenido double precision,
    visible boolean,
    subcriterio_id_subcriterio bigint
);
    DROP TABLE public.indicador;
       public         heap    postgres    false            �            1259    33979    indicador_id_indicador_seq    SEQUENCE     �   CREATE SEQUENCE public.indicador_id_indicador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.indicador_id_indicador_seq;
       public          postgres    false    246            D           0    0    indicador_id_indicador_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.indicador_id_indicador_seq OWNED BY public.indicador.id_indicador;
          public          postgres    false    247            �            1259    33980    modelo    TABLE       CREATE TABLE public.modelo (
    id_modelo bigint NOT NULL,
    fecha_fin timestamp without time zone,
    fecha_final_act timestamp without time zone,
    fecha_inicio timestamp without time zone,
    nombre character varying(255),
    visible boolean,
    usuario_id bigint
);
    DROP TABLE public.modelo;
       public         heap    postgres    false            �            1259    33983    modelo_id_modelo_seq    SEQUENCE     }   CREATE SEQUENCE public.modelo_id_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.modelo_id_modelo_seq;
       public          postgres    false    248            E           0    0    modelo_id_modelo_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.modelo_id_modelo_seq OWNED BY public.modelo.id_modelo;
          public          postgres    false    249            �            1259    33984    notificacion    TABLE     ,  CREATE TABLE public.notificacion (
    id bigint NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    idactividad bigint,
    mensaje character varying(10000),
    rol character varying(255),
    url character varying(255),
    usuario bigint,
    visto boolean
);
     DROP TABLE public.notificacion;
       public         heap    postgres    false            �            1259    33990    notificacion_id_seq    SEQUENCE     |   CREATE SEQUENCE public.notificacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.notificacion_id_seq;
       public          postgres    false    250            F           0    0    notificacion_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.notificacion_id_seq OWNED BY public.notificacion.id;
          public          postgres    false    251            �            1259    33991    observacion    TABLE     �   CREATE TABLE public.observacion (
    id_observacion bigint NOT NULL,
    observacion character varying(10000),
    visible boolean NOT NULL,
    usuario_id bigint,
    actividad_id_asignacion_evidencia bigint
);
    DROP TABLE public.observacion;
       public         heap    postgres    false            �            1259    33996    observacion_id_observacion_seq    SEQUENCE     �   CREATE SEQUENCE public.observacion_id_observacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.observacion_id_observacion_seq;
       public          postgres    false    252            G           0    0    observacion_id_observacion_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.observacion_id_observacion_seq OWNED BY public.observacion.id_observacion;
          public          postgres    false    253            �            1259    33997    persona    TABLE     �  CREATE TABLE public.persona (
    id_persona bigint NOT NULL,
    cedula character varying(255),
    celular character varying(255),
    correo character varying(255),
    direccion character varying(255),
    primer_apellido character varying(255),
    primer_nombre character varying(255),
    segundo_apellido character varying(255),
    segundo_nombre character varying(255),
    visible boolean
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    34002    persona_id_persona_seq    SEQUENCE        CREATE SEQUENCE public.persona_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.persona_id_persona_seq;
       public          postgres    false    254            H           0    0    persona_id_persona_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;
          public          postgres    false    255                        1259    34003    ponderacion    TABLE     R  CREATE TABLE public.ponderacion (
    id_ponderacion bigint NOT NULL,
    fecha date,
    peso double precision,
    porc_obtenido double precision,
    porc_utilida_obtenida double precision,
    valor_obtenido double precision,
    visible boolean,
    indicador_id_indicador bigint,
    modelo_id_modelo bigint,
    contador bigint
);
    DROP TABLE public.ponderacion;
       public         heap    postgres    false                       1259    34006    ponderacion_id_ponderacion_seq    SEQUENCE     �   CREATE SEQUENCE public.ponderacion_id_ponderacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ponderacion_id_ponderacion_seq;
       public          postgres    false    256            I           0    0    ponderacion_id_ponderacion_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ponderacion_id_ponderacion_seq OWNED BY public.ponderacion.id_ponderacion;
          public          postgres    false    257                       1259    34007    reporte    TABLE     �   CREATE TABLE public.reporte (
    id_reporte bigint NOT NULL,
    enlace character varying(255),
    fecha timestamp without time zone,
    visible boolean NOT NULL,
    modelo_id_modelo bigint
);
    DROP TABLE public.reporte;
       public         heap    postgres    false                       1259    34010    reporte_id_reporte_seq    SEQUENCE        CREATE SEQUENCE public.reporte_id_reporte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.reporte_id_reporte_seq;
       public          postgres    false    258            J           0    0    reporte_id_reporte_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.reporte_id_reporte_seq OWNED BY public.reporte.id_reporte;
          public          postgres    false    259                       1259    34011    roles    TABLE     _   CREATE TABLE public.roles (
    rolid bigint NOT NULL,
    rolnombre character varying(255)
);
    DROP TABLE public.roles;
       public         heap    postgres    false                       1259    34014    seguimiento_usuario    TABLE     �   CREATE TABLE public.seguimiento_usuario (
    id_seguimiento bigint NOT NULL,
    descripcion character varying(10000),
    fecha timestamp without time zone,
    usuario_id bigint
);
 '   DROP TABLE public.seguimiento_usuario;
       public         heap    postgres    false                       1259    34019 &   seguimiento_usuario_id_seguimiento_seq    SEQUENCE     �   CREATE SEQUENCE public.seguimiento_usuario_id_seguimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.seguimiento_usuario_id_seguimiento_seq;
       public          postgres    false    261            K           0    0 &   seguimiento_usuario_id_seguimiento_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.seguimiento_usuario_id_seguimiento_seq OWNED BY public.seguimiento_usuario.id_seguimiento;
          public          postgres    false    262                       1259    34020    subcriterio    TABLE     �   CREATE TABLE public.subcriterio (
    id_subcriterio bigint NOT NULL,
    descripcion character varying(10000),
    nombre character varying(255),
    visible boolean,
    id_criterio bigint
);
    DROP TABLE public.subcriterio;
       public         heap    postgres    false                       1259    34025    subcriterio_id_subcriterio_seq    SEQUENCE     �   CREATE SEQUENCE public.subcriterio_id_subcriterio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.subcriterio_id_subcriterio_seq;
       public          postgres    false    263            L           0    0    subcriterio_id_subcriterio_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.subcriterio_id_subcriterio_seq OWNED BY public.subcriterio.id_subcriterio;
          public          postgres    false    264            	           1259    34026 
   usuariorol    TABLE     �   CREATE TABLE public.usuariorol (
    usuariorolid bigint NOT NULL,
    rol_rolid bigint,
    usuario_id bigint,
    visible boolean
);
    DROP TABLE public.usuariorol;
       public         heap    postgres    false            
           1259    34029    usuariorol_usuariorolid_seq    SEQUENCE     �   CREATE SEQUENCE public.usuariorol_usuariorolid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.usuariorol_usuariorolid_seq;
       public          postgres    false    265            M           0    0    usuariorol_usuariorolid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.usuariorol_usuariorolid_seq OWNED BY public.usuariorol.usuariorolid;
          public          postgres    false    266                       1259    34030    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    password character varying(255),
    username character varying(255),
    visible boolean,
    persona_id_persona bigint
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false                       1259    34035    usuarios_id_seq    SEQUENCE     x   CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    267            N           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    268            �           2604    34036    actividad id_actividad    DEFAULT     �   ALTER TABLE ONLY public.actividad ALTER COLUMN id_actividad SET DEFAULT nextval('public.actividad_id_actividad_seq'::regclass);
 E   ALTER TABLE public.actividad ALTER COLUMN id_actividad DROP DEFAULT;
       public          postgres    false    215    214            �           2604    34037    archivo id_archivo    DEFAULT     x   ALTER TABLE ONLY public.archivo ALTER COLUMN id_archivo SET DEFAULT nextval('public.archivo_id_archivo_seq'::regclass);
 A   ALTER TABLE public.archivo ALTER COLUMN id_archivo DROP DEFAULT;
       public          postgres    false    217    216            �           2604    34038    asignacion_admin id_asignacion    DEFAULT     �   ALTER TABLE ONLY public.asignacion_admin ALTER COLUMN id_asignacion SET DEFAULT nextval('public.asignacion_admin_id_asignacion_seq'::regclass);
 M   ALTER TABLE public.asignacion_admin ALTER COLUMN id_asignacion DROP DEFAULT;
       public          postgres    false    219    218            �           2604    34039 ,   asignacion_evidencia id_asignacion_evidencia    DEFAULT     �   ALTER TABLE ONLY public.asignacion_evidencia ALTER COLUMN id_asignacion_evidencia SET DEFAULT nextval('public.asignacion_evidencia_id_asignacion_evidencia_seq'::regclass);
 [   ALTER TABLE public.asignacion_evidencia ALTER COLUMN id_asignacion_evidencia DROP DEFAULT;
       public          postgres    false    221    220            �           2604    34040 ,   asignacion_indicador id_asignacion_indicador    DEFAULT     �   ALTER TABLE ONLY public.asignacion_indicador ALTER COLUMN id_asignacion_indicador SET DEFAULT nextval('public.asignacion_indicador_id_asignacion_indicador_seq'::regclass);
 [   ALTER TABLE public.asignacion_indicador ALTER COLUMN id_asignacion_indicador DROP DEFAULT;
       public          postgres    false    223    222            �           2604    34041 $   asignacion_responsable id_asignacion    DEFAULT     �   ALTER TABLE ONLY public.asignacion_responsable ALTER COLUMN id_asignacion SET DEFAULT nextval('public.asignacion_responsable_id_asignacion_seq'::regclass);
 S   ALTER TABLE public.asignacion_responsable ALTER COLUMN id_asignacion DROP DEFAULT;
       public          postgres    false    225    224            �           2604    34042    criterio id_criterio    DEFAULT     |   ALTER TABLE ONLY public.criterio ALTER COLUMN id_criterio SET DEFAULT nextval('public.criterio_id_criterio_seq'::regclass);
 C   ALTER TABLE public.criterio ALTER COLUMN id_criterio DROP DEFAULT;
       public          postgres    false    227    226            �           2604    34043    cualitativa id_cualitativa    DEFAULT     �   ALTER TABLE ONLY public.cualitativa ALTER COLUMN id_cualitativa SET DEFAULT nextval('public.cualitativa_id_cualitativa_seq'::regclass);
 I   ALTER TABLE public.cualitativa ALTER COLUMN id_cualitativa DROP DEFAULT;
       public          postgres    false    229    228            �           2604    34044    cuantitativa id_cuantitativa    DEFAULT     �   ALTER TABLE ONLY public.cuantitativa ALTER COLUMN id_cuantitativa SET DEFAULT nextval('public.cuantitativa_id_cuantitativa_seq'::regclass);
 K   ALTER TABLE public.cuantitativa ALTER COLUMN id_cuantitativa DROP DEFAULT;
       public          postgres    false    231    230            �           2604    34045 (   detalle_evaluacion id_detalle_evaluacion    DEFAULT     �   ALTER TABLE ONLY public.detalle_evaluacion ALTER COLUMN id_detalle_evaluacion SET DEFAULT nextval('public.detalle_evaluacion_id_detalle_evaluacion_seq'::regclass);
 W   ALTER TABLE public.detalle_evaluacion ALTER COLUMN id_detalle_evaluacion DROP DEFAULT;
       public          postgres    false    233    232            �           2604    34046 (   encabezado_evaluar id_encabezado_evaluar    DEFAULT     �   ALTER TABLE ONLY public.encabezado_evaluar ALTER COLUMN id_encabezado_evaluar SET DEFAULT nextval('public.encabezado_evaluar_id_encabezado_evaluar_seq'::regclass);
 W   ALTER TABLE public.encabezado_evaluar ALTER COLUMN id_encabezado_evaluar DROP DEFAULT;
       public          postgres    false    235    234            �           2604    34047 *   evaluar_cualitativa id_evaluar_cualitativa    DEFAULT     �   ALTER TABLE ONLY public.evaluar_cualitativa ALTER COLUMN id_evaluar_cualitativa SET DEFAULT nextval('public.evaluar_cualitativa_id_evaluar_cualitativa_seq'::regclass);
 Y   ALTER TABLE public.evaluar_cualitativa ALTER COLUMN id_evaluar_cualitativa DROP DEFAULT;
       public          postgres    false    237    236            �           2604    34048 ,   evaluar_cuantitativa id_evaluar_cuantitativa    DEFAULT     �   ALTER TABLE ONLY public.evaluar_cuantitativa ALTER COLUMN id_evaluar_cuantitativa SET DEFAULT nextval('public.evaluar_cuantitativa_id_evaluar_cuantitativa_seq'::regclass);
 [   ALTER TABLE public.evaluar_cuantitativa ALTER COLUMN id_evaluar_cuantitativa DROP DEFAULT;
       public          postgres    false    239    238            �           2604    34049    evidencia id_evidencia    DEFAULT     �   ALTER TABLE ONLY public.evidencia ALTER COLUMN id_evidencia SET DEFAULT nextval('public.evidencia_id_evidencia_seq'::regclass);
 E   ALTER TABLE public.evidencia ALTER COLUMN id_evidencia DROP DEFAULT;
       public          postgres    false    241    240            �           2604    34050    formula id_formula    DEFAULT     x   ALTER TABLE ONLY public.formula ALTER COLUMN id_formula SET DEFAULT nextval('public.formula_id_formula_seq'::regclass);
 A   ALTER TABLE public.formula ALTER COLUMN id_formula DROP DEFAULT;
       public          postgres    false    243    242            �           2604    34051 &   historial_asignacion_evidencia id_haev    DEFAULT     �   ALTER TABLE ONLY public.historial_asignacion_evidencia ALTER COLUMN id_haev SET DEFAULT nextval('public.historial_asignacion_evidencia_id_haev_seq'::regclass);
 U   ALTER TABLE public.historial_asignacion_evidencia ALTER COLUMN id_haev DROP DEFAULT;
       public          postgres    false    245    244            �           2604    34052    indicador id_indicador    DEFAULT     �   ALTER TABLE ONLY public.indicador ALTER COLUMN id_indicador SET DEFAULT nextval('public.indicador_id_indicador_seq'::regclass);
 E   ALTER TABLE public.indicador ALTER COLUMN id_indicador DROP DEFAULT;
       public          postgres    false    247    246            �           2604    34053    modelo id_modelo    DEFAULT     t   ALTER TABLE ONLY public.modelo ALTER COLUMN id_modelo SET DEFAULT nextval('public.modelo_id_modelo_seq'::regclass);
 ?   ALTER TABLE public.modelo ALTER COLUMN id_modelo DROP DEFAULT;
       public          postgres    false    249    248            �           2604    34054    notificacion id    DEFAULT     r   ALTER TABLE ONLY public.notificacion ALTER COLUMN id SET DEFAULT nextval('public.notificacion_id_seq'::regclass);
 >   ALTER TABLE public.notificacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250            �           2604    34055    observacion id_observacion    DEFAULT     �   ALTER TABLE ONLY public.observacion ALTER COLUMN id_observacion SET DEFAULT nextval('public.observacion_id_observacion_seq'::regclass);
 I   ALTER TABLE public.observacion ALTER COLUMN id_observacion DROP DEFAULT;
       public          postgres    false    253    252                        2604    34056    persona id_persona    DEFAULT     x   ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);
 A   ALTER TABLE public.persona ALTER COLUMN id_persona DROP DEFAULT;
       public          postgres    false    255    254                       2604    34057    ponderacion id_ponderacion    DEFAULT     �   ALTER TABLE ONLY public.ponderacion ALTER COLUMN id_ponderacion SET DEFAULT nextval('public.ponderacion_id_ponderacion_seq'::regclass);
 I   ALTER TABLE public.ponderacion ALTER COLUMN id_ponderacion DROP DEFAULT;
       public          postgres    false    257    256                       2604    34058    reporte id_reporte    DEFAULT     x   ALTER TABLE ONLY public.reporte ALTER COLUMN id_reporte SET DEFAULT nextval('public.reporte_id_reporte_seq'::regclass);
 A   ALTER TABLE public.reporte ALTER COLUMN id_reporte DROP DEFAULT;
       public          postgres    false    259    258                       2604    34059 "   seguimiento_usuario id_seguimiento    DEFAULT     �   ALTER TABLE ONLY public.seguimiento_usuario ALTER COLUMN id_seguimiento SET DEFAULT nextval('public.seguimiento_usuario_id_seguimiento_seq'::regclass);
 Q   ALTER TABLE public.seguimiento_usuario ALTER COLUMN id_seguimiento DROP DEFAULT;
       public          postgres    false    262    261                       2604    34060    subcriterio id_subcriterio    DEFAULT     �   ALTER TABLE ONLY public.subcriterio ALTER COLUMN id_subcriterio SET DEFAULT nextval('public.subcriterio_id_subcriterio_seq'::regclass);
 I   ALTER TABLE public.subcriterio ALTER COLUMN id_subcriterio DROP DEFAULT;
       public          postgres    false    264    263                       2604    34061    usuariorol usuariorolid    DEFAULT     �   ALTER TABLE ONLY public.usuariorol ALTER COLUMN usuariorolid SET DEFAULT nextval('public.usuariorol_usuariorolid_seq'::regclass);
 F   ALTER TABLE public.usuariorol ALTER COLUMN usuariorolid DROP DEFAULT;
       public          postgres    false    266    265                       2604    34062    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267            �          0    33896 	   actividad 
   TABLE DATA           �   COPY public.actividad (id_actividad, descripcion, estado, fecha_fin, fecha_inicio, nombre, visible, id_evidencia, usuario_id) FROM stdin;
    public          postgres    false    214   a;      �          0    33902    archivo 
   TABLE DATA           �   COPY public.archivo (id_archivo, descripcion, enlace, nombre, visible, id_actividad, id_asignacion_evidencia, comentario) FROM stdin;
    public          postgres    false    216   j=      �          0    33908    asignacion_admin 
   TABLE DATA           o   COPY public.asignacion_admin (id_asignacion, visible, criterio_id_criterio, usuario_id, id_modelo) FROM stdin;
    public          postgres    false    218   A      �          0    33912    asignacion_evidencia 
   TABLE DATA           �   COPY public.asignacion_evidencia (id_asignacion_evidencia, fecha_fin, fecha_inicio, id_modelo, visible, evidencia_id_evidencia, usuario_id, id_usuario_asignador, archsubido, valor_obtenido) FROM stdin;
    public          postgres    false    220   �A      �          0    33916    asignacion_indicador 
   TABLE DATA           z   COPY public.asignacion_indicador (id_asignacion_indicador, visible, indicador_id_indicador, modelo_id_modelo) FROM stdin;
    public          postgres    false    222   >D                0    33920    asignacion_responsable 
   TABLE DATA           {   COPY public.asignacion_responsable (id_asignacion, id_modelo, visible, usuarioadmin_id, usuarioresponsable_id) FROM stdin;
    public          postgres    false    224   E                0    33924    criterio 
   TABLE DATA           M   COPY public.criterio (id_criterio, descripcion, nombre, visible) FROM stdin;
    public          postgres    false    226   E                0    33930    cualitativa 
   TABLE DATA           M   COPY public.cualitativa (id_cualitativa, escala, valor, visible) FROM stdin;
    public          postgres    false    228   UJ                0    33934    cuantitativa 
   TABLE DATA           Z   COPY public.cuantitativa (id_cuantitativa, abreviatura, descripcion, visible) FROM stdin;
    public          postgres    false    230   �J      	          0    33940    detalle_evaluacion 
   TABLE DATA           �   COPY public.detalle_evaluacion (id_detalle_evaluacion, estado, fecha, id_modelo, observacion, visible, evidencia_id_evidencia, usuario_id) FROM stdin;
    public          postgres    false    232   5O                0    33946    encabezado_evaluar 
   TABLE DATA           x   COPY public.encabezado_evaluar (id_encabezado_evaluar, visible, formula_id_formula, indicador_id_indicador) FROM stdin;
    public          postgres    false    234   R                0    33950    evaluar_cualitativa 
   TABLE DATA           �   COPY public.evaluar_cualitativa (id_evaluar_cualitativa, visible, id_cualitativa, id_indicador, cualitativa_id_cualitativa, indicador_id_indicador) FROM stdin;
    public          postgres    false    236   �R                0    33954    evaluar_cuantitativa 
   TABLE DATA           �   COPY public.evaluar_cuantitativa (id_evaluar_cuantitativa, valor, visible, cuantitativa_id_cuantitativa, encabezado_evaluar_id_encabezado_evaluar) FROM stdin;
    public          postgres    false    238   �T                0    33958 	   evidencia 
   TABLE DATA           �   COPY public.evidencia (id_evidencia, descripcion, enlace, estado, nombre, visible, indicador_id_indicador, valor_obtenido, porc_utilidad_obtenido) FROM stdin;
    public          postgres    false    240   �U                0    33964    formula 
   TABLE DATA           L   COPY public.formula (id_formula, descripcion, formula, visible) FROM stdin;
    public          postgres    false    242   p�                0    33970    historial_asignacion_evidencia 
   TABLE DATA           �   COPY public.historial_asignacion_evidencia (id_haev, fecha, visible, asignacion_evi_id_asignacion_evidencia, usuario_asignador_id) FROM stdin;
    public          postgres    false    244   !�                0    33974 	   indicador 
   TABLE DATA           �   COPY public.indicador (id_indicador, descripcion, estandar, nombre, peso, porc_obtenido, porc_utilida_obtenida, tipo, valor_obtenido, visible, subcriterio_id_subcriterio) FROM stdin;
    public          postgres    false    246   ��                0    33980    modelo 
   TABLE DATA           r   COPY public.modelo (id_modelo, fecha_fin, fecha_final_act, fecha_inicio, nombre, visible, usuario_id) FROM stdin;
    public          postgres    false    248   �                0    33984    notificacion 
   TABLE DATA           a   COPY public.notificacion (id, fecha, idactividad, mensaje, rol, url, usuario, visto) FROM stdin;
    public          postgres    false    250   =�                0    33991    observacion 
   TABLE DATA           z   COPY public.observacion (id_observacion, observacion, visible, usuario_id, actividad_id_asignacion_evidencia) FROM stdin;
    public          postgres    false    252   ��                0    33997    persona 
   TABLE DATA           �   COPY public.persona (id_persona, cedula, celular, correo, direccion, primer_apellido, primer_nombre, segundo_apellido, segundo_nombre, visible) FROM stdin;
    public          postgres    false    254   ��      !          0    34003    ponderacion 
   TABLE DATA           �   COPY public.ponderacion (id_ponderacion, fecha, peso, porc_obtenido, porc_utilida_obtenida, valor_obtenido, visible, indicador_id_indicador, modelo_id_modelo, contador) FROM stdin;
    public          postgres    false    256   ��      #          0    34007    reporte 
   TABLE DATA           W   COPY public.reporte (id_reporte, enlace, fecha, visible, modelo_id_modelo) FROM stdin;
    public          postgres    false    258   �      %          0    34011    roles 
   TABLE DATA           1   COPY public.roles (rolid, rolnombre) FROM stdin;
    public          postgres    false    260   #�      &          0    34014    seguimiento_usuario 
   TABLE DATA           ]   COPY public.seguimiento_usuario (id_seguimiento, descripcion, fecha, usuario_id) FROM stdin;
    public          postgres    false    261   j�      (          0    34020    subcriterio 
   TABLE DATA           `   COPY public.subcriterio (id_subcriterio, descripcion, nombre, visible, id_criterio) FROM stdin;
    public          postgres    false    263   ��      *          0    34026 
   usuariorol 
   TABLE DATA           R   COPY public.usuariorol (usuariorolid, rol_rolid, usuario_id, visible) FROM stdin;
    public          postgres    false    265   �      ,          0    34030    usuarios 
   TABLE DATA           `   COPY public.usuarios (id, enabled, password, username, visible, persona_id_persona) FROM stdin;
    public          postgres    false    267   ��      O           0    0    actividad_id_actividad_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.actividad_id_actividad_seq', 10, true);
          public          postgres    false    215            P           0    0    archivo_id_archivo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.archivo_id_archivo_seq', 24, true);
          public          postgres    false    217            Q           0    0 "   asignacion_admin_id_asignacion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.asignacion_admin_id_asignacion_seq', 52, true);
          public          postgres    false    219            R           0    0 0   asignacion_evidencia_id_asignacion_evidencia_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.asignacion_evidencia_id_asignacion_evidencia_seq', 55, true);
          public          postgres    false    221            S           0    0 0   asignacion_indicador_id_asignacion_indicador_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.asignacion_indicador_id_asignacion_indicador_seq', 224, true);
          public          postgres    false    223            T           0    0 (   asignacion_responsable_id_asignacion_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.asignacion_responsable_id_asignacion_seq', 17, true);
          public          postgres    false    225            U           0    0    criterio_id_criterio_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.criterio_id_criterio_seq', 9, true);
          public          postgres    false    227            V           0    0    cualitativa_id_cualitativa_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.cualitativa_id_cualitativa_seq', 4, true);
          public          postgres    false    229            W           0    0     cuantitativa_id_cuantitativa_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.cuantitativa_id_cuantitativa_seq', 31, true);
          public          postgres    false    231            X           0    0 ,   detalle_evaluacion_id_detalle_evaluacion_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.detalle_evaluacion_id_detalle_evaluacion_seq', 30, true);
          public          postgres    false    233            Y           0    0 ,   encabezado_evaluar_id_encabezado_evaluar_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.encabezado_evaluar_id_encabezado_evaluar_seq', 17, true);
          public          postgres    false    235            Z           0    0 .   evaluar_cualitativa_id_evaluar_cualitativa_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.evaluar_cualitativa_id_evaluar_cualitativa_seq', 145, true);
          public          postgres    false    237            [           0    0 0   evaluar_cuantitativa_id_evaluar_cuantitativa_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.evaluar_cuantitativa_id_evaluar_cuantitativa_seq', 52, true);
          public          postgres    false    239            \           0    0    evidencia_id_evidencia_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.evidencia_id_evidencia_seq', 224, true);
          public          postgres    false    241            ]           0    0    formula_id_formula_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.formula_id_formula_seq', 17, true);
          public          postgres    false    243            ^           0    0 *   historial_asignacion_evidencia_id_haev_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.historial_asignacion_evidencia_id_haev_seq', 33, true);
          public          postgres    false    245            _           0    0    indicador_id_indicador_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.indicador_id_indicador_seq', 46, true);
          public          postgres    false    247            `           0    0    modelo_id_modelo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.modelo_id_modelo_seq', 11, true);
          public          postgres    false    249            a           0    0    notificacion_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notificacion_id_seq', 600, true);
          public          postgres    false    251            b           0    0    observacion_id_observacion_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.observacion_id_observacion_seq', 10, true);
          public          postgres    false    253            c           0    0    persona_id_persona_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.persona_id_persona_seq', 33, true);
          public          postgres    false    255            d           0    0    ponderacion_id_ponderacion_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.ponderacion_id_ponderacion_seq', 339, true);
          public          postgres    false    257            e           0    0    reporte_id_reporte_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.reporte_id_reporte_seq', 1, false);
          public          postgres    false    259            f           0    0 &   seguimiento_usuario_id_seguimiento_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.seguimiento_usuario_id_seguimiento_seq', 23, true);
          public          postgres    false    262            g           0    0    subcriterio_id_subcriterio_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.subcriterio_id_subcriterio_seq', 20, true);
          public          postgres    false    264            h           0    0    usuariorol_usuariorolid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.usuariorol_usuariorolid_seq', 56, true);
          public          postgres    false    266            i           0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 37, true);
          public          postgres    false    268                       2606    34064    actividad actividad_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.actividad
    ADD CONSTRAINT actividad_pkey PRIMARY KEY (id_actividad);
 B   ALTER TABLE ONLY public.actividad DROP CONSTRAINT actividad_pkey;
       public            postgres    false    214            
           2606    34066    archivo archivo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT archivo_pkey PRIMARY KEY (id_archivo);
 >   ALTER TABLE ONLY public.archivo DROP CONSTRAINT archivo_pkey;
       public            postgres    false    216                       2606    34068 &   asignacion_admin asignacion_admin_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.asignacion_admin
    ADD CONSTRAINT asignacion_admin_pkey PRIMARY KEY (id_asignacion);
 P   ALTER TABLE ONLY public.asignacion_admin DROP CONSTRAINT asignacion_admin_pkey;
       public            postgres    false    218                       2606    34070 .   asignacion_evidencia asignacion_evidencia_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_evidencia
    ADD CONSTRAINT asignacion_evidencia_pkey PRIMARY KEY (id_asignacion_evidencia);
 X   ALTER TABLE ONLY public.asignacion_evidencia DROP CONSTRAINT asignacion_evidencia_pkey;
       public            postgres    false    220                       2606    34072 .   asignacion_indicador asignacion_indicador_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_indicador
    ADD CONSTRAINT asignacion_indicador_pkey PRIMARY KEY (id_asignacion_indicador);
 X   ALTER TABLE ONLY public.asignacion_indicador DROP CONSTRAINT asignacion_indicador_pkey;
       public            postgres    false    222                       2606    34074 2   asignacion_responsable asignacion_responsable_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.asignacion_responsable
    ADD CONSTRAINT asignacion_responsable_pkey PRIMARY KEY (id_asignacion);
 \   ALTER TABLE ONLY public.asignacion_responsable DROP CONSTRAINT asignacion_responsable_pkey;
       public            postgres    false    224                       2606    34076    criterio criterio_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.criterio
    ADD CONSTRAINT criterio_pkey PRIMARY KEY (id_criterio);
 @   ALTER TABLE ONLY public.criterio DROP CONSTRAINT criterio_pkey;
       public            postgres    false    226                       2606    34078    cualitativa cualitativa_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.cualitativa
    ADD CONSTRAINT cualitativa_pkey PRIMARY KEY (id_cualitativa);
 F   ALTER TABLE ONLY public.cualitativa DROP CONSTRAINT cualitativa_pkey;
       public            postgres    false    228                       2606    34080    cuantitativa cuantitativa_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.cuantitativa
    ADD CONSTRAINT cuantitativa_pkey PRIMARY KEY (id_cuantitativa);
 H   ALTER TABLE ONLY public.cuantitativa DROP CONSTRAINT cuantitativa_pkey;
       public            postgres    false    230                       2606    34082 *   detalle_evaluacion detalle_evaluacion_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.detalle_evaluacion
    ADD CONSTRAINT detalle_evaluacion_pkey PRIMARY KEY (id_detalle_evaluacion);
 T   ALTER TABLE ONLY public.detalle_evaluacion DROP CONSTRAINT detalle_evaluacion_pkey;
       public            postgres    false    232                       2606    34084 *   encabezado_evaluar encabezado_evaluar_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.encabezado_evaluar
    ADD CONSTRAINT encabezado_evaluar_pkey PRIMARY KEY (id_encabezado_evaluar);
 T   ALTER TABLE ONLY public.encabezado_evaluar DROP CONSTRAINT encabezado_evaluar_pkey;
       public            postgres    false    234                        2606    34086 ,   evaluar_cualitativa evaluar_cualitativa_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.evaluar_cualitativa
    ADD CONSTRAINT evaluar_cualitativa_pkey PRIMARY KEY (id_evaluar_cualitativa);
 V   ALTER TABLE ONLY public.evaluar_cualitativa DROP CONSTRAINT evaluar_cualitativa_pkey;
       public            postgres    false    236            "           2606    34088 .   evaluar_cuantitativa evaluar_cuantitativa_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.evaluar_cuantitativa
    ADD CONSTRAINT evaluar_cuantitativa_pkey PRIMARY KEY (id_evaluar_cuantitativa);
 X   ALTER TABLE ONLY public.evaluar_cuantitativa DROP CONSTRAINT evaluar_cuantitativa_pkey;
       public            postgres    false    238            $           2606    34090    evidencia evidencia_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.evidencia
    ADD CONSTRAINT evidencia_pkey PRIMARY KEY (id_evidencia);
 B   ALTER TABLE ONLY public.evidencia DROP CONSTRAINT evidencia_pkey;
       public            postgres    false    240            &           2606    34092    formula formula_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.formula
    ADD CONSTRAINT formula_pkey PRIMARY KEY (id_formula);
 >   ALTER TABLE ONLY public.formula DROP CONSTRAINT formula_pkey;
       public            postgres    false    242            (           2606    34094 B   historial_asignacion_evidencia historial_asignacion_evidencia_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.historial_asignacion_evidencia
    ADD CONSTRAINT historial_asignacion_evidencia_pkey PRIMARY KEY (id_haev);
 l   ALTER TABLE ONLY public.historial_asignacion_evidencia DROP CONSTRAINT historial_asignacion_evidencia_pkey;
       public            postgres    false    244            *           2606    34096    indicador indicador_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.indicador
    ADD CONSTRAINT indicador_pkey PRIMARY KEY (id_indicador);
 B   ALTER TABLE ONLY public.indicador DROP CONSTRAINT indicador_pkey;
       public            postgres    false    246            ,           2606    34098    modelo modelo_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id_modelo);
 <   ALTER TABLE ONLY public.modelo DROP CONSTRAINT modelo_pkey;
       public            postgres    false    248            .           2606    34100    notificacion notificacion_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.notificacion DROP CONSTRAINT notificacion_pkey;
       public            postgres    false    250            0           2606    34102    observacion observacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.observacion
    ADD CONSTRAINT observacion_pkey PRIMARY KEY (id_observacion);
 F   ALTER TABLE ONLY public.observacion DROP CONSTRAINT observacion_pkey;
       public            postgres    false    252            2           2606    34104    persona persona_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    254            6           2606    34106    ponderacion ponderacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ponderacion
    ADD CONSTRAINT ponderacion_pkey PRIMARY KEY (id_ponderacion);
 F   ALTER TABLE ONLY public.ponderacion DROP CONSTRAINT ponderacion_pkey;
       public            postgres    false    256            8           2606    34108    reporte reporte_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (id_reporte);
 >   ALTER TABLE ONLY public.reporte DROP CONSTRAINT reporte_pkey;
       public            postgres    false    258            :           2606    34110    roles roles_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (rolid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    260            <           2606    34112 ,   seguimiento_usuario seguimiento_usuario_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.seguimiento_usuario
    ADD CONSTRAINT seguimiento_usuario_pkey PRIMARY KEY (id_seguimiento);
 V   ALTER TABLE ONLY public.seguimiento_usuario DROP CONSTRAINT seguimiento_usuario_pkey;
       public            postgres    false    261            >           2606    34114    subcriterio subcriterio_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.subcriterio
    ADD CONSTRAINT subcriterio_pkey PRIMARY KEY (id_subcriterio);
 F   ALTER TABLE ONLY public.subcriterio DROP CONSTRAINT subcriterio_pkey;
       public            postgres    false    263            4           2606    34116 #   persona ukcm8asjmty9arx6nqo43mfl0i6 
   CONSTRAINT     `   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT ukcm8asjmty9arx6nqo43mfl0i6 UNIQUE (cedula);
 M   ALTER TABLE ONLY public.persona DROP CONSTRAINT ukcm8asjmty9arx6nqo43mfl0i6;
       public            postgres    false    254                       2606    34118 ,   asignacion_admin ukibrwx0f9aenp1hyvvwwrkhkha 
   CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_admin
    ADD CONSTRAINT ukibrwx0f9aenp1hyvvwwrkhkha UNIQUE (usuario_id, criterio_id_criterio);
 V   ALTER TABLE ONLY public.asignacion_admin DROP CONSTRAINT ukibrwx0f9aenp1hyvvwwrkhkha;
       public            postgres    false    218    218            @           2606    34120    usuariorol usuariorol_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.usuariorol
    ADD CONSTRAINT usuariorol_pkey PRIMARY KEY (usuariorolid);
 D   ALTER TABLE ONLY public.usuariorol DROP CONSTRAINT usuariorol_pkey;
       public            postgres    false    265            B           2606    34122    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    267            N           2606    34123 1   asignacion_responsable fk1nijbyg14klqrjgjfu66w7u0    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_responsable
    ADD CONSTRAINT fk1nijbyg14klqrjgjfu66w7u0 FOREIGN KEY (usuarioresponsable_id) REFERENCES public.usuarios(id);
 [   ALTER TABLE ONLY public.asignacion_responsable DROP CONSTRAINT fk1nijbyg14klqrjgjfu66w7u0;
       public          postgres    false    267    224    3394            R           2606    34128 .   encabezado_evaluar fk1tbe3tswra2b59apmnnv1yiic    FK CONSTRAINT     �   ALTER TABLE ONLY public.encabezado_evaluar
    ADD CONSTRAINT fk1tbe3tswra2b59apmnnv1yiic FOREIGN KEY (formula_id_formula) REFERENCES public.formula(id_formula);
 X   ALTER TABLE ONLY public.encabezado_evaluar DROP CONSTRAINT fk1tbe3tswra2b59apmnnv1yiic;
       public          postgres    false    3366    234    242            O           2606    34133 2   asignacion_responsable fk2tfbbk5opeqpuj2dc2niwmdra    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_responsable
    ADD CONSTRAINT fk2tfbbk5opeqpuj2dc2niwmdra FOREIGN KEY (usuarioadmin_id) REFERENCES public.usuarios(id);
 \   ALTER TABLE ONLY public.asignacion_responsable DROP CONSTRAINT fk2tfbbk5opeqpuj2dc2niwmdra;
       public          postgres    false    3394    224    267            E           2606    34138 #   archivo fk4f7cqs31llnwrdj6d72r0rus2    FK CONSTRAINT     �   ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT fk4f7cqs31llnwrdj6d72r0rus2 FOREIGN KEY (id_asignacion_evidencia) REFERENCES public.asignacion_evidencia(id_asignacion_evidencia);
 M   ALTER TABLE ONLY public.archivo DROP CONSTRAINT fk4f7cqs31llnwrdj6d72r0rus2;
       public          postgres    false    3344    216    220            X           2606    34143 0   evaluar_cuantitativa fk5ldgiq7r9592dxeg2o0yrig1o    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluar_cuantitativa
    ADD CONSTRAINT fk5ldgiq7r9592dxeg2o0yrig1o FOREIGN KEY (encabezado_evaluar_id_encabezado_evaluar) REFERENCES public.encabezado_evaluar(id_encabezado_evaluar);
 Z   ALTER TABLE ONLY public.evaluar_cuantitativa DROP CONSTRAINT fk5ldgiq7r9592dxeg2o0yrig1o;
       public          postgres    false    238    234    3358            _           2606    34148 '   observacion fk5rs9gdk62sjiwvprw5v308fvb    FK CONSTRAINT     �   ALTER TABLE ONLY public.observacion
    ADD CONSTRAINT fk5rs9gdk62sjiwvprw5v308fvb FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Q   ALTER TABLE ONLY public.observacion DROP CONSTRAINT fk5rs9gdk62sjiwvprw5v308fvb;
       public          postgres    false    3394    252    267            C           2606    34163 %   actividad fk8b4e0dknoqnala1pq3r83mp9u    FK CONSTRAINT     �   ALTER TABLE ONLY public.actividad
    ADD CONSTRAINT fk8b4e0dknoqnala1pq3r83mp9u FOREIGN KEY (id_evidencia) REFERENCES public.evidencia(id_evidencia);
 O   ALTER TABLE ONLY public.actividad DROP CONSTRAINT fk8b4e0dknoqnala1pq3r83mp9u;
       public          postgres    false    3364    240    214            f           2606    34168 &   usuariorol fk93omfx2hj2asw60aghij55eu2    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuariorol
    ADD CONSTRAINT fk93omfx2hj2asw60aghij55eu2 FOREIGN KEY (rol_rolid) REFERENCES public.roles(rolid);
 P   ALTER TABLE ONLY public.usuariorol DROP CONSTRAINT fk93omfx2hj2asw60aghij55eu2;
       public          postgres    false    260    3386    265            G           2606    34173 ,   asignacion_admin fk9i6ddwukhylrc90i5irsmvpvs    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_admin
    ADD CONSTRAINT fk9i6ddwukhylrc90i5irsmvpvs FOREIGN KEY (criterio_id_criterio) REFERENCES public.criterio(id_criterio);
 V   ALTER TABLE ONLY public.asignacion_admin DROP CONSTRAINT fk9i6ddwukhylrc90i5irsmvpvs;
       public          postgres    false    218    226    3350            [           2606    34178 :   historial_asignacion_evidencia fk9vbvdp0rwj451c3h4lscs2ftd    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_asignacion_evidencia
    ADD CONSTRAINT fk9vbvdp0rwj451c3h4lscs2ftd FOREIGN KEY (asignacion_evi_id_asignacion_evidencia) REFERENCES public.asignacion_evidencia(id_asignacion_evidencia);
 d   ALTER TABLE ONLY public.historial_asignacion_evidencia DROP CONSTRAINT fk9vbvdp0rwj451c3h4lscs2ftd;
       public          postgres    false    244    220    3344            c           2606    34183 #   reporte fkavx929e89ubn4p9bs42dt77rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT fkavx929e89ubn4p9bs42dt77rn FOREIGN KEY (modelo_id_modelo) REFERENCES public.modelo(id_modelo);
 M   ALTER TABLE ONLY public.reporte DROP CONSTRAINT fkavx929e89ubn4p9bs42dt77rn;
       public          postgres    false    3372    248    258            P           2606    34188 .   detalle_evaluacion fkb13e7pdsc8072fdvh3wopo12u    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_evaluacion
    ADD CONSTRAINT fkb13e7pdsc8072fdvh3wopo12u FOREIGN KEY (evidencia_id_evidencia) REFERENCES public.evidencia(id_evidencia);
 X   ALTER TABLE ONLY public.detalle_evaluacion DROP CONSTRAINT fkb13e7pdsc8072fdvh3wopo12u;
       public          postgres    false    240    232    3364            H           2606    34193 ,   asignacion_admin fkbjoerxqw2kcpm9aknpobfnmun    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_admin
    ADD CONSTRAINT fkbjoerxqw2kcpm9aknpobfnmun FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 V   ALTER TABLE ONLY public.asignacion_admin DROP CONSTRAINT fkbjoerxqw2kcpm9aknpobfnmun;
       public          postgres    false    218    3394    267            F           2606    34198 #   archivo fkby7mylqckox95g0yd6e04rptg    FK CONSTRAINT     �   ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT fkby7mylqckox95g0yd6e04rptg FOREIGN KEY (id_actividad) REFERENCES public.actividad(id_actividad);
 M   ALTER TABLE ONLY public.archivo DROP CONSTRAINT fkby7mylqckox95g0yd6e04rptg;
       public          postgres    false    216    214    3336            \           2606    34203 :   historial_asignacion_evidencia fkc3pbt1afh350xiygp6c12xpon    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_asignacion_evidencia
    ADD CONSTRAINT fkc3pbt1afh350xiygp6c12xpon FOREIGN KEY (usuario_asignador_id) REFERENCES public.usuarios(id);
 d   ALTER TABLE ONLY public.historial_asignacion_evidencia DROP CONSTRAINT fkc3pbt1afh350xiygp6c12xpon;
       public          postgres    false    3394    267    244            D           2606    34208 %   actividad fkc4ash1cpuvnayfpkksu6p21lk    FK CONSTRAINT     �   ALTER TABLE ONLY public.actividad
    ADD CONSTRAINT fkc4ash1cpuvnayfpkksu6p21lk FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 O   ALTER TABLE ONLY public.actividad DROP CONSTRAINT fkc4ash1cpuvnayfpkksu6p21lk;
       public          postgres    false    3394    214    267            `           2606    34213 '   observacion fkd4j1nbyf71xwuuufkobo8608f    FK CONSTRAINT     �   ALTER TABLE ONLY public.observacion
    ADD CONSTRAINT fkd4j1nbyf71xwuuufkobo8608f FOREIGN KEY (actividad_id_asignacion_evidencia) REFERENCES public.asignacion_evidencia(id_asignacion_evidencia);
 Q   ALTER TABLE ONLY public.observacion DROP CONSTRAINT fkd4j1nbyf71xwuuufkobo8608f;
       public          postgres    false    252    220    3344            Q           2606    34218 .   detalle_evaluacion fkda3djq3byuqu5x2654yfyqj16    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_evaluacion
    ADD CONSTRAINT fkda3djq3byuqu5x2654yfyqj16 FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 X   ALTER TABLE ONLY public.detalle_evaluacion DROP CONSTRAINT fkda3djq3byuqu5x2654yfyqj16;
       public          postgres    false    3394    232    267            L           2606    34223 0   asignacion_indicador fkdks7lj3plden60xbksr71cc6l    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_indicador
    ADD CONSTRAINT fkdks7lj3plden60xbksr71cc6l FOREIGN KEY (indicador_id_indicador) REFERENCES public.indicador(id_indicador);
 Z   ALTER TABLE ONLY public.asignacion_indicador DROP CONSTRAINT fkdks7lj3plden60xbksr71cc6l;
       public          postgres    false    222    246    3370            T           2606    34228 /   evaluar_cualitativa fke0qtqgwa2xhap156nnl60s56j    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluar_cualitativa
    ADD CONSTRAINT fke0qtqgwa2xhap156nnl60s56j FOREIGN KEY (cualitativa_id_cualitativa) REFERENCES public.cualitativa(id_cualitativa);
 Y   ALTER TABLE ONLY public.evaluar_cualitativa DROP CONSTRAINT fke0qtqgwa2xhap156nnl60s56j;
       public          postgres    false    228    236    3352            J           2606    34233 0   asignacion_evidencia fkf0l7sjf6pueyivficlviuf4q9    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_evidencia
    ADD CONSTRAINT fkf0l7sjf6pueyivficlviuf4q9 FOREIGN KEY (evidencia_id_evidencia) REFERENCES public.evidencia(id_evidencia);
 Z   ALTER TABLE ONLY public.asignacion_evidencia DROP CONSTRAINT fkf0l7sjf6pueyivficlviuf4q9;
       public          postgres    false    240    220    3364            g           2606    34238 &   usuariorol fkfa4kgvbxpaqn2h3qaajrhx0fr    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuariorol
    ADD CONSTRAINT fkfa4kgvbxpaqn2h3qaajrhx0fr FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 P   ALTER TABLE ONLY public.usuariorol DROP CONSTRAINT fkfa4kgvbxpaqn2h3qaajrhx0fr;
       public          postgres    false    267    3394    265            S           2606    34243 .   encabezado_evaluar fkfmph77nlc2qj9yyc7xdjc3qfw    FK CONSTRAINT     �   ALTER TABLE ONLY public.encabezado_evaluar
    ADD CONSTRAINT fkfmph77nlc2qj9yyc7xdjc3qfw FOREIGN KEY (indicador_id_indicador) REFERENCES public.indicador(id_indicador);
 X   ALTER TABLE ONLY public.encabezado_evaluar DROP CONSTRAINT fkfmph77nlc2qj9yyc7xdjc3qfw;
       public          postgres    false    246    234    3370            U           2606    34253 /   evaluar_cualitativa fkh461dgypxi10luxlewr6wfppp    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluar_cualitativa
    ADD CONSTRAINT fkh461dgypxi10luxlewr6wfppp FOREIGN KEY (indicador_id_indicador) REFERENCES public.indicador(id_indicador);
 Y   ALTER TABLE ONLY public.evaluar_cualitativa DROP CONSTRAINT fkh461dgypxi10luxlewr6wfppp;
       public          postgres    false    246    236    3370            Y           2606    34258 0   evaluar_cuantitativa fkjm6mta8w5eoq1bpaiy5mffid5    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluar_cuantitativa
    ADD CONSTRAINT fkjm6mta8w5eoq1bpaiy5mffid5 FOREIGN KEY (cuantitativa_id_cuantitativa) REFERENCES public.cuantitativa(id_cuantitativa);
 Z   ALTER TABLE ONLY public.evaluar_cuantitativa DROP CONSTRAINT fkjm6mta8w5eoq1bpaiy5mffid5;
       public          postgres    false    3354    230    238            M           2606    34263 0   asignacion_indicador fkky8ux2vbvf9wpxy81k5vjmbgu    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_indicador
    ADD CONSTRAINT fkky8ux2vbvf9wpxy81k5vjmbgu FOREIGN KEY (modelo_id_modelo) REFERENCES public.modelo(id_modelo);
 Z   ALTER TABLE ONLY public.asignacion_indicador DROP CONSTRAINT fkky8ux2vbvf9wpxy81k5vjmbgu;
       public          postgres    false    222    248    3372            Z           2606    34268 %   evidencia fklmjj8r673bdib02gh74ekwhbe    FK CONSTRAINT     �   ALTER TABLE ONLY public.evidencia
    ADD CONSTRAINT fklmjj8r673bdib02gh74ekwhbe FOREIGN KEY (indicador_id_indicador) REFERENCES public.indicador(id_indicador);
 O   ALTER TABLE ONLY public.evidencia DROP CONSTRAINT fklmjj8r673bdib02gh74ekwhbe;
       public          postgres    false    240    3370    246            I           2606    34273 ,   asignacion_admin fkmpadn25gn3hvsuiu5rntjxo9o    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_admin
    ADD CONSTRAINT fkmpadn25gn3hvsuiu5rntjxo9o FOREIGN KEY (id_modelo) REFERENCES public.modelo(id_modelo);
 V   ALTER TABLE ONLY public.asignacion_admin DROP CONSTRAINT fkmpadn25gn3hvsuiu5rntjxo9o;
       public          postgres    false    218    248    3372            ]           2606    34278 %   indicador fkner6vcrafmvve69v7mxcw0xmx    FK CONSTRAINT     �   ALTER TABLE ONLY public.indicador
    ADD CONSTRAINT fkner6vcrafmvve69v7mxcw0xmx FOREIGN KEY (subcriterio_id_subcriterio) REFERENCES public.subcriterio(id_subcriterio);
 O   ALTER TABLE ONLY public.indicador DROP CONSTRAINT fkner6vcrafmvve69v7mxcw0xmx;
       public          postgres    false    246    263    3390            ^           2606    34283 "   modelo fkpv4lluo4s48wu7kxdycfsoasb    FK CONSTRAINT     �   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT fkpv4lluo4s48wu7kxdycfsoasb FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 L   ALTER TABLE ONLY public.modelo DROP CONSTRAINT fkpv4lluo4s48wu7kxdycfsoasb;
       public          postgres    false    3394    248    267            h           2606    34288 $   usuarios fkq1l7b7bice5uysvjoo457towq    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fkq1l7b7bice5uysvjoo457towq FOREIGN KEY (persona_id_persona) REFERENCES public.persona(id_persona);
 N   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT fkq1l7b7bice5uysvjoo457towq;
       public          postgres    false    3378    267    254            e           2606    34293 '   subcriterio fkqfonct3pookifdedmp6ejtgq9    FK CONSTRAINT     �   ALTER TABLE ONLY public.subcriterio
    ADD CONSTRAINT fkqfonct3pookifdedmp6ejtgq9 FOREIGN KEY (id_criterio) REFERENCES public.criterio(id_criterio);
 Q   ALTER TABLE ONLY public.subcriterio DROP CONSTRAINT fkqfonct3pookifdedmp6ejtgq9;
       public          postgres    false    3350    263    226            V           2606    34298 /   evaluar_cualitativa fkqk2jb7k4jrdy67agnjt993slq    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluar_cualitativa
    ADD CONSTRAINT fkqk2jb7k4jrdy67agnjt993slq FOREIGN KEY (id_cualitativa) REFERENCES public.cualitativa(id_cualitativa);
 Y   ALTER TABLE ONLY public.evaluar_cualitativa DROP CONSTRAINT fkqk2jb7k4jrdy67agnjt993slq;
       public          postgres    false    3352    228    236            a           2606    34303 '   ponderacion fkr3pagb02mlidv21hbrcm1oov8    FK CONSTRAINT     �   ALTER TABLE ONLY public.ponderacion
    ADD CONSTRAINT fkr3pagb02mlidv21hbrcm1oov8 FOREIGN KEY (indicador_id_indicador) REFERENCES public.indicador(id_indicador);
 Q   ALTER TABLE ONLY public.ponderacion DROP CONSTRAINT fkr3pagb02mlidv21hbrcm1oov8;
       public          postgres    false    256    3370    246            d           2606    34308 /   seguimiento_usuario fks3t0lb6i87wo6epcsj7334i91    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguimiento_usuario
    ADD CONSTRAINT fks3t0lb6i87wo6epcsj7334i91 FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Y   ALTER TABLE ONLY public.seguimiento_usuario DROP CONSTRAINT fks3t0lb6i87wo6epcsj7334i91;
       public          postgres    false    3394    267    261            b           2606    34313 '   ponderacion fkswh44v6tp7ca1kp50pvipikfb    FK CONSTRAINT     �   ALTER TABLE ONLY public.ponderacion
    ADD CONSTRAINT fkswh44v6tp7ca1kp50pvipikfb FOREIGN KEY (modelo_id_modelo) REFERENCES public.modelo(id_modelo);
 Q   ALTER TABLE ONLY public.ponderacion DROP CONSTRAINT fkswh44v6tp7ca1kp50pvipikfb;
       public          postgres    false    248    3372    256            K           2606    34318 0   asignacion_evidencia fkt1o88qbyy76v5eg22unv964fs    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_evidencia
    ADD CONSTRAINT fkt1o88qbyy76v5eg22unv964fs FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Z   ALTER TABLE ONLY public.asignacion_evidencia DROP CONSTRAINT fkt1o88qbyy76v5eg22unv964fs;
       public          postgres    false    3394    267    220            W           2606    34323 /   evaluar_cualitativa fkta8n4ixf6ncj299120496tkqm    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluar_cualitativa
    ADD CONSTRAINT fkta8n4ixf6ncj299120496tkqm FOREIGN KEY (id_indicador) REFERENCES public.indicador(id_indicador);
 Y   ALTER TABLE ONLY public.evaluar_cualitativa DROP CONSTRAINT fkta8n4ixf6ncj299120496tkqm;
       public          postgres    false    236    3370    246            �   �  x�}SK��0;��R%���awPUvr߀+�l�����$�*	a�s�(1Ɖ;J2g,ENbd���B5jW7�z�<���S� I;��H1�T"%���"M����F���5�ɓ��&Iɜɓ�W����i96u{�>�0�+�����2q�'��#��}'T�.�c2�Mmz����u���uqu�<���&�q#�H��O��ųjšjq%���Bz�ϓ״R���s �a_�DI�����\�� ����>� q{��ɑ��SW�~��t(�]0A��KG�ۧ(�v���[�m�h�@!��Ky,�$���̀�u(Au/US��j�/a2*���:�f7b�$��E��n^7�E}2",��Z�!��q���u�:�1���C���,���NЙ�7v+g����~�cM�m47Z�H����(�Bt|��"����d�����oUc�+��wF�&�����<~S�"/[I��Ó���ʓ��A���_���p{L�      �   �  x��V�r�8>����V����y�S���${��-aPƶI��y�}�}�m��x2/Uk(K�n���d���.�nnR�t'��8�sCe��{q���+c��_<��ѧ~�l�r8J5qɗ9�{aJS�Ӕ'4�V2�(�\S`)d\e$+�Ԭ��RHf�Y�\Kt)����V�O
M5�)s@z��R��Ә�)���	���P�f�%�0�meY��F	��X�aM`Hr���(�!�5�h�4�Z���#����H���F�ɨ��Vr�����y����Y��V�L�f���k]2��;��2�L��	9�Gx{�&�!��o�U8��r�Ǭ_�@�p�5�h�!��4���ߒ��5���Y�X��`w��%w~�Ь7������,�d\C�ɞbiTb3	��_�|3�W���\k�e�0�\�w0�^���҄z�9M�����ENM'O�W�n�ӓ��g&$������ڸt�֫����!�n��o|�L;Ҽ�#/�l,J`Q<��ؓ��4˺ʩ��M���\�K*�Y�ݍ�Z���*h��X��kYt��_R�3Qw/M���u98��]I���Gg}F��H��<N�\�r�};\��ؐ7����:�B��3�p��B�l��%.`[���Ƕ�Y��@�5��xUg�*�-%ͰE�h@�X}�/p|������q:���䕛�ux�T����}j |���U�Z5�WZ���b�sHx<�BJz�3U�ػ5����-�G�wL�u��E4��+����j��;c��am���V�w <)��b�=�#F������ff��c������~���O�D���}ϩr4����������m�6@���
蒢����'��@Tdj�'<6_S���q|{n�7�֙�����+�S�      �   �   x�-�ɑD!C������s��D��W�'��d$#ڷe��^x�)l��7S�vaWݳ4�^�(��e�\�D�9�?<�61�M�=`|/�e/��8��hB�Yp^�"�d��"�%�`��/�ER)�ͣf�f��6DI�`�t޹$hpɐGӪ��A�=��"$��MFp�"�m��Xd���׌"C�~�!��p>�T�����.Rc      �   M  x����m�0��5Ul���J�`����|H��U"0��o~?i�# ~">	� |������{;rD��)w�����3ؐq�};H�ph7N��{:�'�p��!�tZ�z�έ���zɏܤJ#T��[�/��a���O�'��F�4z����(bkp�58�ޟ��Ur��)c�C���T�o�S��Ң�禍F�4hK�$Ճ�vn0����-�-p��$߂�t�=K��D�\�q2���<F�z�������$W`�faOaĕ�*=F�dgkM�'��P�]��Ӝ�H��g�L+����6�K�����y�qR��:��^o���N�C�4�l�s�8��e����m{�\<z�%�F��V�򎓓Xx�櫖��օ�
����w���H���U��4��hi�J������]�F'����(o
�4�}�]th�����9�t�l��v�I�ES�1�pnW6c�S$�f�Y�W�}:��qǌ7�j���Y}�k��sK���/�p��k/�u2�f�c����_t�ٔ�1��>��1Qu��1u�a�q�T1��]6<8MJn,�ҭ$+mO����x�v�R,      �   �   x�-�A!��c*찻�/}F���1�
�l^�뾀��4ޅ�q��-\Ƨ�,܍9u��x�%IO��ק��I��̴�})=�OIq��E�r��Y�Ye�f���f��m��i�7�]�Ź�v��_s{��7@mq��W킼���G{�N��=�k��Y�\�{��e/��N�?���3����T'         d   x�M��� ��b"|Ah"�N�_![�f,��B㡏������l$�~0�50�8<�-Kg`��a�\�9o`9�oT�mQ'�{��\Cf���q�0%�         �  x�uU�n�6]+_�e�q��1�t�����kv�E��E�P�ʇQ�7�Yf1�"����z.%{�L �,������*D%W+�FB!���k'�v�	_}�1y	�HVg��:.�\)��1h�!E5^�Ϋ n�� j%���>8~4x�z�U���F��5�(ȤZ8�Z��Y2#1�R]i��l��| ��В����F��+���+�5:�ͫ=��	�3)�Sh�z2�n�d�ah����J&��M�%�G-�!;@Cb����3@J�`����d�q�	[��NY�s�S�8�S��`�a
�Մ�rc:�|Ƹ�/�דrs����ޭ'E���(���~7tp^��S�|.xN�W��~-j�t�t�&�V^�މk���#l<��Q?�%�峔����֞��:al��o[�=�ؓ����vQI�մ\N�<��ń����Q9�}���6�$l�G%Cٓ����IZ~��ѿu���ӊ�M: �����1H�F�F�2�^�2�  (3����n���c+y�K�M6h�U�Zk/���2�qc�=���PO�ّg����L����;8�ӿ�ľa� -�`�aV>���"�6앇�xk�
���L���K�jVn&��j�X�R̗��}���PL��/XA| #��� ��GǢ�(�('1�H/)��{l*�\�(}N���dN��l����'	���x����/E��j�����|9�[cNWK����j:/g��{[ -4�%!2��b��O)n*���?��/���o({�j���yb^�a JC�:�q��'U����X T�N��C�dr�:���^��O��2W���Zbm��<_��@9�ɰY��C:q�Sȅ�X����7�(ydj{nsL	����)8gVa-�U�8&��XB-w��i�G��yq��I+F8��8!��L�w|3s��*�fg��Pǟ
e�P9E$�����L��r���5�qq�^]��պ܀��E�H5@���?�kw��s��Jg���z�o���A��1� rR�g6��%�� X���a�7-�p@�/��s&I��K��Wz)���
�ZC1*��߄��wO�4K1ģ~�fo�:Ib���q�e��p^v՗��?g.~3� `�*�:I���r'�����d9��������\�N%�6bv���̮��z~[��+q�n�}|uu�/�}M         K   x�3�v�vst����4�,�2�tu��E�1�3�s�;�cH��L8]\�<�=]�B\9�1z\\\ ��         u  x��V�n�8=+_�cA�iztg��06BN{S�îD�i��79��C��\�c���ˉ�-�S���8����d��2����rVJ�A5�6�����B7�5zV�F��H�8P;;W�u��/A	��TFHk��N}	�ьDB����g���N�R�������I>�䱅�P���#�JB���cO��8?;�_�=˦W��\Um��}��CiI*�o���lE�̵$�j���
+�L�.�2��,���Sٽ�Ϝsݣ��tŔze"{�7m��eP�S�]}����HM�'���K�%�D��#w,�~�#8��� =F�Ȧ�<���g%���t�J�9��rRKm_�0V���|#h��\_��d��9X�`��Їg���`j-�ҋ�-�����3Q��Ǡ@'R�|c�Xz]���<�W1�T�V\p�#�-:�Ւ�@��6	m{��9(�W���w�Z���V�N�ʲ�ř �٤�	�]I.��d��~��=E�Ԩ^tS�CO�8'*m��y��x	{���L�k���MtӤ�4Ƽ���f���!���`b�����1��m�8ƢŶ��o����-qK%sA<S���Ā3�3�5����57%	
�J,9�x��l2nw/�{����� ���:��G�������`�����pp�����8�m�Av��KU�^3\L{�� =j�U1��}����u�G1X��N�O`�z+^��Ⱦ�J;S��v��x��	*�2��'ܷ���P�gn��W���q�������n��z����۲T>Z#o���4�,��W����E]П~��t�
���`���Jy�?�0&��y���=�C ���K�I,DH
���
��&M|�c�5�M���AF��r�N�C��.4^�����?�J��3������s�QFK�w�%^�!�N5��$�)�����T�9fѼ��&��j���Ev;�3[�;᷏Y�ǧ�M�o��.�L��ɐt0�1oG�o��s�K���������ȻDʌ�nc��p�!]�ҷ�F�f;1[zI1�?101*V`$�
���z����5PD�g��@1�B�aטg�?6��\�8�O仲E�R�����eSɬ�u|tt�\�)�      	   �  x��T�n�0='_��&Q�e�Rdho�0��][m=�Vg'Yׯ)'��t�d6��H>�Qj���D�����k�U)TefJ;����RJΔ�����zvw���,�ԢT%����U�__M��CO���s���66���0��+͡�e��k�q�]��!Ա���(�&�סI9�]�%粬b�e
9��KQ��TVA��n�=�KP�W�,��o�~/�9���|�q3lX���ax�Ox�x� s(с�J�R�oh4E��.����H����Q��ʣ�����!��<�����۔�xA��c%��-[����Ƹ��ؙ�+=�@����j�Ǝ�7�0D g�52�0�L����Y4�<���d�f�q�����K#�ͦ��Ģ�idő�0*��k�V�c�?�9�j�~D^�YYf�VlWm�V4��>Ǝ�X��X�Gx\�q��yn(i$[Қlި��Y�:� �7��7�i	��7ǢT5�S�2��+)t�������.����@y���k-
�;���B:�i�1sT�i3y�/�e�r/	����� ����*���vu��c4/�ʈX�kg���Q�q�L����D�p.�ٯHϤ��N;�l�Bg�eo�42�Iqo0��g"Ɲe o;�}Q�|[,i�$ ��ܻ�� ԅc��,)u�z]
o�o��9�Y�E+����m;H�!��P�������R����Q����Z0��� ���         f   x���1�jr��IK��.#�_��B�Ax�\C�;��bE
jv���9��\x�<��F^�Ԛ�oJ��������@�KM"�EͶU���KԄ�j~?$�Mlg         �  x�]��q�0D��b2�W� e����5�Y&�#	� !�����������^�%;4^򳳿���A��K�!�@��7����������)��l$V��J���8I�,ֱ)9m\!_E�"[�S��uT&Dk?�w�8��=��,�C��[�,�3%�f8�d?����f0��\�ry�%�v�C��q�P�t+�+��Z�5\����`�u\�����7dG�z��������Y�܏��q�:��"�3��ߡ�"������"�}���E����7�/�i�P=���;6_�1��c�����~
˙臔?�ә^����0�aVê�]�U�T�V�U�WC��h�����1�)�E��6u�FsD��Ћ��mctFV��d\���PZ+,����½0��6��.B�p�'^֋>)�d�&����O�>���O��}��O;"�QF�βa�I&�蒊IYײn��'��m�Y�����<�Ŋ>o<�]ʌWjqnq�������?Y�e           x�E��q1�Ϩ����G/9���?����ie@6G����-�$��hZ�S̚�<�?m5�6览Oq�jc��i� ��)��qDB��1x��ϖ�]�H7�dA�Pfz��kp4�j��xz���<?���u���ry�����\��}Ȝe��-:`�է���d�ЌQ�TsH
����'Y��DK�3�����<���kI����-���wh9$� �g�[�6sǁYa���R�2�v�W`ڀ��4�JTGME��6i�r���:ݚ�+:k�����b�            x��}˒�V���X��2�b�kz���}Ѷ+$�7�7��)
� D��ߘ/�R/&��-���<�(�eK1��%�ɓ�'ߙg2��e��U�<�3].u�d�H]?�i^�?�>�K�LTRV�i���B���2_�i���L�D�˪�3��׺Y�q�-�:���,�yQM�e�,����eV%)C���'+xq�e�z	Ь �hg���.j|3/�y������=���FԢ�S����ݛ7��={>�����p���������29;����xO��u����	'��k]�f�}V;���nG��a;I��e~�������м�l���XM�m��2/�_T��% k�h��S�Rm�j�4-�9U�D���n�>��Ld7ד�U=�����jQWS|��0� ���6K�4�V�;��B��B#� g��z��{�TH��`>�ϮG/+��r<E�G�.�8�J��^����<�z��}N�>¯?�Vs\��9��Wi;�O�_���&$ܷ��<Dl�!o�%�3��������^�^?䙆�(��Dԩ����-�?��U*K¿k]( P�r�$9��{�}|���o�n�q�$�s	t���@:���������UW�Zg�d��We��/���] �&k�%�>��u��v[�@S����i�4�f��Z$mS�#Zh�&�PP+����ୈ��l�>�,4�	M"ξ�!/���C=A���.���,��mt�v�������{U���U2�?�hmӪ�?q�a������M��|�C�Q,�	;��0d˓�~ydk��
QE8KDEr�*
��5��_�i�"���G$��W�u�'�V��=uU"�������������1�4X3�Tԅø�T�� 0�FwH�פk�_fyJ˿r���W���*Y�� �
ğ(is��
�fQ�zG��s���җ�ݖj��W��s�y�ezg	�h�VZ������e����[=C����?�~����7�b��u�,��$�׿* �[0IQݝ�}x�����ψ87������<O^�h�e�,7�V���vB�h�&*H2$�M�
L���jA���!�d�C[�B�H�>C)^�`��G`�y�����gEp�B�Ҝ��Jd�&7�t�y7|���`��%	[*�����i����!����g\��e�����	��M��y����������7��*����3����~ �����qrblGV��@b�"b�Nn��o�*z�eO̰�Zޤmï��*�]2@�^�����U�}��}�����㎀�*6L��*b6?`y��^�:dÍ\�����V(�@��B �A����r�%!��a�H���C�t�$�5�S-/?jΉJ�biЯ���%�P�7K�1�s�X?��X��'T�h{�<�qU`;T��h��O�b�k�;�Juc9�3�#2�� #'�-l1a��$6<QNpGd����҂�������qJ���y2��!p_�������\��J�㲪%L���K�@*^d����0��C�[�# $t��w�ы� ��O �t�8[��04���ISMkv?���ߏ�j�Q�3fV�dqh��>a|_�C6�SU��0a�d��7�Dx-�>a6�돕�ٕu�|��H{��]l��}:���vN1�������2ʃɇ�p�}�^����e�3��`���S�>
,���9��l���~�$�q��Y�2�H֟�S�?6LeLZc+Y�>�R!�В�����5*a�m���vǵ���qR���9�E� ��YȬ`I(B�>��ȴTx�M*���x2Ø��ZH= 
��'e��Mי��圈8�1�%/o��$`�{�OGY;_T�+�������|�*�?7�s�C\b���/oG߫%Q�u庙U���&2}#��!HZ�`ό���s��1(�5��L�XV@Q�	�D���(��<��b�g�ˏ�11�įI.D�$��H�i��f��J#�0֟K���Z&ѷ�m^�^'�.�3_���Y��x���&��#2,�5��aE��H}�Y�	�UҀ����yb3�
[����������^%F<�6�#��n�ǡ�[�xV�<���>8���/|k���<��5���`�IbL�P�F~�[	7&#�L[<"=qv�j���Z V�w��Qqh:�ll�� ]]ֽ8�5.G?��XZ!�o�������v��!O�g����8��<'瀟�H[ �>�����X�kZx��o�n�ŕ�S��*�$��P�h�����i[�k��/u��D�D��Ŷ�g��[ƭq�$2 ��C�����*f���S>[ (},me3���;�g�f_،��M~~�PV��P+��7�	t�������/%�s�-��@kL��D5ԢZ��Q&�HBT�0�"�͋��B`{�3�A���j�x��@�1�P1��������,jU���%o��GM��i�POgj����
���ǿU��ٱ�ث���-9Ki]�O��v����D}P%��
ы`֪B������c�;$��&AD���P:PΫ&��x�UH%��V�*L��88����܃:����Z��YL&�Ƨ��G��R�������*���͒���?�y�kg����Ά9��E�`�����a�s��E�:���賬|y1z���X<�gPVp�tAŉ�Y�Ĳ�$����m�� �>�	s$��]P�9Xu����͞�^�B��Bx�(��*��lb����aV6�B��" ל�Ƌ�/���j��;27��aMZш�ʖ�ط��Q��m��r���Ƞtm�D"V��,/ᜒVӟ���'�������e����w-�>�A�}%p��j��~�1qF�\8j%��0{��d��S4�����l��)cw��4�Ib��̄�kS�A��J�)�eJ��b<�!0�KV��\�l���r%�#����'H[�u��Kc���,�����+���	)8;�l�[����+o=����y�y��2���aq�]�٫��ĉoY���:�''�`�&�h�L�"/�#�1��I>_��sWĠ%�Rv��Qf���+R�� P7��e�?��MQ�.:�q-b���BB����W�H"@
X����.��> x3k��/ԟP��KK g��M��%[ҝ�:��Y����[�d��eZOc��NFo8����P����I� y��Sqk�����āW������x�O����UX��ʂ
k�"#�:Ś6��.�_Rp�+�+M˪��d��*��H�����ʄ���+��nfXJ�s� �L��0i5m��&Ԝ�*��RY��!<�ʉ�D�U����m�0 >B�����E!'��	�<�08���&��׬c�t��m�@|�c�[ߠ1��4�9ކ����$���K�M�=eds>���X���K�ǰ�	^�D�����z�k�k4�6\;m���i�Q���d^��q�b,�uU�a�����7Jm-FT�p��C^"����! ��v����EU3�8��I�[����O���B��`��q\f��q�:���pE�KA+Q¬O�T}��'t�V��hOEj7v�}h�KM_���9u�9�!Y �\z.O�2�>���t~��0vأ����#n����1�k8��Z՜L�Mv���E��B.�=6���׬��'b�I���?̛⮰�*o�h���b��>/�J4E:�ޠ2�u�3��ϩ�/�Ik�ZÑ��f��SV�sm�7�b�e�S��"�����|��T��p��8e��S�� � ��?Kj̢"U�8� �䪼�sv��	��d6�"��5&fK��HW%%@�����"�&�⊧>��@�W`�3B%>��*�W2����|&�o?�����`���Sz�Ȇ+�䕍�٠(��XE3 ���R짙�R�{7	�zi�`�nr��G5$�l��|T\α��`�����Aƥ��Ơ��P����\��NO=�M�f$���힪`Ji#���i>-�
\#u��X�O�t���`@�y�qU��byl:��`ͱ���U]R�̂e�MN(�j��/+�    T���Ub�󍚡RG#[\�Ȝm�*�0��V���Z���b��R�������"5O�T��̤NL��s��Ao�M��{�����iBc�ߒןR�zh�L������JԉD�Ʀ�3���A�a����$����A�X
]�|�)I�x=�+���ts[u�Z���]��[�$��%�*�xP��nT�?S�ÃU��F����^he�4�O.{k��*�jJ���N��e?�ٚU��@�'<j��\h^�QMg�w"�Q̓�vP{H2��V�եP�fQ�z�㩚O�ބ���:�?J��Q��秆m6�]ʐ�*������P�+�*��>��K�ЅM̠$�v݄�S�jd�R ���X���]�K)��Y��d��Å'H $k.	سm����
z �\8��>�Zك`�%��Dǰzh��tSF�v7��W��hrWR��m�� I�/ן8y�xVG'.9��iH7^�B u�YG�DЀ.���*I�)�7Dn�0�����f�� G9Ad� ��F=Is�E��c��梔��9���.i"E=���_bI��9�~,W&���H� �D��YQ�[���Y$�e��ѹ���<��vS�}�Оbn$KN�{P����F����p�Tm����u�iu�+�l����z)k�Q^訢H"+�u��)58��9�<�	�W݂��������Vy���I�@��T@��<����zrz�����]ß�n"��Q���N�[oac|h�0��a�Gb������-����9��ұ7aau�; ���)��#�{� ��5��o��o�Ʃ��j��wZ�+�a�����w�F��������H��ތw��lc߶�����u�@x.Y_HǱnX�� �k�ZR)�]QŽ���C���Z�ؠ��!���rlES��G��z+@9p����7,��xˊ��x3�LcU*�xcc�`2��b�TUPI���^fዦ�8��(K`��%H��`�Ⱦ�M���|/V�݁$�6�
25%�')�6��1�&2���76f`�s^�0�3�(��dt�oN扦bzgX2*�x��Zg�'�l��G������Q��c�Տ���;���ѣ���8��xҰSz��O�^�xv(󹅯<1G�I��l*���r�ơ���1� 9&�)NR�ү�O���t�;Ih��롳��;vS�9�^d��=�t� ��䦿���� �kB�9i�Ƨ�����O�!^���/��bl�>?���a$������Fȏߑ=���&,�i���Kן�:�lϔ0&�h)]�3��7nHm�@#��qߙ���Π�VQc�[�8�7���#�K���0Q�3�ׯ�v�Ų�K�'���ks�p�Ga�&
Sl�jV�*��H�����"�)�c�3�l�g��A�fP(��T1L�O�v��\�E�&کGt�������,ӓ+QPT�)�y2'�p�6�;*��l�],�ϲ��>�h��{�x��FK��[����py�FF��t�j�њ)TnϬ%���
=M)t�М��p�T���S��Ɏ s�n�E/?�u�e]�3��������5,,�iq��A)�����b��^�rC�ySBi�MMI��&�\��>2�5�AL��e�S� &�x[�prμ�R�d����`[�f;��c���hG&��쒂�rc7���i��ol��1�8_c�rT���ݤH�7�޿�1}���������k�z�O:Ţz3�'/�R�+t� ���x����[�βD�z�>�e$aP����Ҋ[*3[�̾�0� �8J��ψ��1���l�����5�l�X�S�2���AiO��ѿ����1V2]nl+\��jM1�g���p �p��+8E�
H:��K�\D�̣���I\�)�A)˓�h�߃ҁ�f:!{�m�X]z��X��8�n7-����`R$�%�T��w�Gu�ޞ'w��%�^�>�E[qYxf���0�-7
I�1�ݫ��6�'�f4�Iʭ��nP����y�.�>m����5׊�zB���6�Ljx�W;��B����*Ɏy�ĤC��W�2���F@m���G��i�M���ҘI����w%*ЅW.)u��p�$D�B�UD��r�����Z��-} ��HQ������q��Yj|o�M�aD,-{���_t�����Op�-Q6L��L����J�xF<��Z�0L�^[(.�"�m# ���؅�<��M<gls��^��k�I��^ z/��b��9 �ͫ("�6X��V7����d��}ۘ�b��W��y^/�`E�Z�%��%�+R��z��� D�U��E�� �0�ա�v&q�O�6�x]�]��<���%�#�m\?2�ln����e�nk���!=�}�����0WT*��'4�!�4��~c&��gs���S���u�7wx�2[�Ķ!P��S����E���7�R�������6n�n�q�	��L���jޭe��8
)Y��Ǜ����*; �+�r��.z�?1�d�m_�E_��o����t������9dy��u�ׅ-=�M;�x�q���^��H'n�i��ʶ��X�6��5�id?[J���8	eDP���.����mMl�Qq�+>�=�mSgۆ���8E��g��ZٙOY��f�#��DF�7fg82��	����&��b�3��5ze��P��s����4Af~2�-�Rz�����1O�sw*������d�'1���|	���
�=����\߃��rm��Yp �x&�:ifn�[%;M�-y�CC��.�d�<��xم���鞖���vS/��(��o5)
]*_�>
��Ƕ�z[�����<�ї���$^vf������/�&��pEd�{���M����}3�C���^b���^���Żظk�z�(~��T]P.�9�^G���`�hL�<��Yf4N���w���`�md���Ta�ZI?�HU�{a��B ���%"�ƞ�;�Yw�A�F�Q:MJi4T�M�<�쥖nD�2H �9L��zG�o�lrC�z��z��.��得]K}Åt��my�\�x�c���]��
~'��
P0�[рe���b[ �u�=;16����5qIP_��֧��C�::4�#U_�dy�Ƥ4銟�b��_�Gp�_��b�*�ط�������܌�?����1��u���,%�檴z��+��-}�rW�Ow�JҔu�X���wW��2�,��3�.ȗdڙ�Q�mN�̄�������˙��e;���~�(��ި���o����5N�2]m�c�%�V�O��en�ᾒ��I>�f��aSd,LW���sֿ��@�nQw�IOnTg�Z�m�xٰ����V�i��� :��7*ÊV��Q�zu��>��g�����%9�HI�G�����i��z�ߞn�"{��ƷP���7��� ����qBS��"w=�{c^�!�����E�|��Ch���jT����-�qo���P�<�^�xs�n�����*B4-��
�L�H2�@�Ў�wl���7q���V�vw[m��Љ�G�����c;τ����A2�x��p"��݃��={�O����`�I�?���4>�>;y]�L�k�d�Xl��RM>,�}����[�
x樂�������]۲w}ꭋ�{~�^qVi��@h�q8�/�#�� ����5s��3��hQ��ՑQd���ƴhWJ���~fWp�ĩ#����HX�ȇ��S�Z&�a�tR��Ɠ ���f��W��R���AW�{�1��?��	���#C,{V��0
/�D9Uy�2 �&Fb��9��p ��f���u97��Ef� ~�h;�1��Lմ�q[�rV��S�������>���2��55��ſuv
o">��4i򇀖E�\oq�9��{�
�����wTn�3�N	P�^}J��r8'oV���3nhk�X_A�q��4�j�z�ߊ�v��ZYn���\-96����Z��F�R~���xr[�w%ᦂ���n�=U��9+ͤ��6�j�?N�I� �
  �R2�$`k_����B��#�|%2/e��u����ɀa�Y4�#N���U����$av��f2z��.堇�si�Aޑ��ߜw���h�ӳ���s�L9&g����qvS�k�>��� :D�;H/Fo���lm��]�e�=&}ThW��늆f�1F&2����c��r�
��y�pc�]�Z��X�gh��'?j�۠��N�L�[��cSo���%6|���q�z���^�M��$E_��:,=������s%szx��Tע��{6������=��p��]��p᫷��{�����>R=�[��jXi�s�Ճ΄�^���ڱ�?��X޶�	ʐ���0jB���6����㪄 ����j.����� �;X���_����k:��w�������.rͧ�5]���2��n=%�&��^�z�~����1�?�����pR��a��*����vg���j��pm2��߸���f���B�T�c���v�#5���+Q�nU<�n:�7���q;�ڔ��������h��Ap�2=��A3�۹y��	����&�YT-H� �p���W���dr��y:��ys�_�촒�'ïB��6��ɹuѤz4�MՈo�:��{�ynś�>�ARЭx+�FE�>ŸQ�J�i�K����ͦZ-����{���ng�췋-=�fVe�v�v�0���p��EMOA����n�{��v.U�<�1�hR�_��Ayd����u�k��W��"ޛj�kk��MV���v�N����F4Y_S�����oA��V����>��fz�RD�G��wt���4�6��^��eK;�Y���E�y�=�8N�����#&�����ջ{��ml�s�8�ڛˇ*	��ٝ`&��P�Xӡ=w��4?G�jC"��/�o8�_іd��=�1\��	{x0��z�\ݚc�G6� �;7�H>����`Py)��m�|�E�'�[�AP<�^��X\��m�#%��qO2j0�)��ͅ[�-4�Q 㴾�����@�{J%�j_�b���-f�g���dM��E���}l��ȼ�*��w1mc��D�$���l۱��d5+׿5�m��[�l4��
�;L�^~���
��F���F}l��A�����L�����ui�b���2��A?٩޶��Az�@��1D<��0�R�X�|�x��IP�c"��`�)}�?9�`:���ns6?5�q�P}��Ip>��f4�]�"_V�\Ci��EX��Fv�T���Fs�����僻f�[��-9����̅��� /#O�5�J�~X��% �cka��S� 2�\�3Y���� pb�tcEg�y*��&�q�%8(��64��ɛv���cz����1+�̽�C�|�=&D�����{�h�K}V}����9�������o_$o~�����?�|���=?5���S�\�ُ��p��f[7�Z�#�FW�p�ɀΫ��;
?^��X1��a��$�h�#e�.hO��ߞ��I'��'�.���^x�N�$`:���"�p��	 c�0�Q݅�3���p�}������H)��ټv_/���T�(���ڢ���OO��j?b�rE' m�5�����ݺ�I��-}�l��m��{8q݌L�O�:�����+B*t����V�ۛ�
H�4u%<Ş�|�������7sd��ͫ�?�|���S$&q5l,Y��m�~�+ۘ(����;�ʤ�t��&F� e��� �1�˵\�m���T�R+yc\u��� b��l�n��W\F�3�1��@���d����CVK�hd���ڶ�V�M��~���n�?V�/a��ی����9ۯތ9�ߚ1�#.��s������35�(�a��PÉ�L(`l*H�WF��~x�vC3�wa=_��ݟ�?.
vB]�B�ƣ4hx�Θ��=�'�^�l�����<+��C�e�@H`�{�w� ��A�r��
��FEa_ǉ����5���.��Ľ8̵�X��|(F��ڊ����_���8�S�,NWQL��uS�.�+���&a0�aw�`o'�sHC��'�Gy��0ŉ�<��.��SR�@8m� d�i;���%^�iXt�m�F��
�1p��p8;b����e&��57���9�}E�yc�Ʌ��N{��YN��Z� %i�
HL�H�b>�K�B8=M\^�b��J�|:����@�6N�*'Tр�b��&	$�P�3&*��vKM!	[�eP��D�R�%�%�+'��d&Q�Jse��c�mU��~a�K��z��o�*̀�T=�� ����+�3D��8�jw�8�1*X7��?�x�1�/�Px�=�(g���y��Em��>��a~R�} 2�t8��/p�鶌Ҍ�4���NSm��S۵�L�y}����s�h�b�7�*�A�>���^�Y�|��'�7���"�̔���(�$K���R-���>���o�qg�!*!E�Ÿ�ؼ�a��b���ˇ6���lc��V�q�Gj�ST����v��͙�nm��O��D��KI�C�A�:+W�cWt	?[��csbБ!U'�%�w�`T�0�-Ѻ�-����7���yb(�x'��xST��G`���H|��&%��p8!�:��F7�E�b�+C �$b˻C�u��y�G2|C���c�EW}pP�j�H�$M�.���'H��5�D="Qo����M������� �f2���_����c\         �  x�]Q�r� >���8c	�J�#���iD����I��,�����b]����Ĳ���,!b�'�m����R��Y�/
F��������PeL�L�͂��5
�j���$Ϊ�o`�&�(܁����ߖ읇y@�`Aj'��!q��6Jr-��Ţ��<�d�{B6L?Z�"%��qg�3��B�%�ź�R���ט"���,t��'$�Zm���Ū�ؒ�WH5�+V6b/�٫F=���lR���G�R=vC�c�G���pt�5�'�F�:<O��>���\������t����?�~|��Sz3���p����4;���X���\}�d;U�S1�Kv�^�p�{��í�[���O���k���h,��(�󒲺Q��,�6��&�~�/��7�#=�_��o��C<D����u�e� e7��         �  x�u��m#1��Qn �z��� el��bD� �5>#�����?X?Db钢亮���K����>3:�%���N�T!� ����Ә7h���唕,4|�0�~��%��AkD�:A�&���Bp�)��E�4U�A���s߂F���R��w�BYH�z�5y�v=T3&�]��ӭ2��T�X���[�SX!���FR��X�7���1 �!֏��V�u3�B/��7���E�V\��B� �{�dD�є]�C���9Uk�N�?�;����X�C�]T��\a�MT�#Y�6�'ĉ��µ�k���ĺ>�5�7#m��Ԩ�����*	1~#��UnF�5t���V&+eP����
5,�8-���N�:�Mq`6��qE����Jo��            x��\�rI����(S�Ec	>DQNG	�4�  *�7�IT%�R�0�`4e͘m�11�!S��y��O�K��G�)��n�D�ȼ�sϽ��Yg{QF�	�̳w&��n��xF��l��������"*�"��(�A�	_�ۘ~�}M��zq�{�,��y�ٜ>	Ҥ�IV_Ѝ1����fk2|��WDv�M�"3+�!�{������V���j��{���=�o���*���dn�xW�E��l���o&�h~0��b�����,��ï�śm�����\F�ޖY㖤���(�Lb6��y��͂�jn?�>E�$��'܎��F�(��xR$����V������Qg��h>�3�z>{3Z�gS��w.�Ùw9�/f���~�����l�MǗ�E��Ѣs�?:>�ῠ4	^g����עs�=��8���'${H�4�6$7��"H��ۃqJ�\�c;�;Ygx2^��m͚EJ_�|�>�����B8��GW7����w���n�F�$�����l�c�Om�E�xlS��$��*b/(m&�؂��m�m�X��#v�7xROufB�NUN�-�M���^�ɲ4��p;�E_b9w�^�BոlFa�	�Ϸa��ɔ��4p|?Xg�쪰A�ƻ�k�aޓo��-�Ȣ�vI��}�u�e\�[&n_�2R�A7o/+/�6�Ҭ�9;꼙ͯTSd���۹9{LAd�dw�Ӄ*�e�n��_U�_�]"�Cn�[ȯ���>���ڐ�r｡�"�#S@81j��|�(2�?��.%�ǥ��&-R�]��㓰�!ζ�UA�yQ�?�,��\����t8�z���������/;�b.���|ei���|؄�(�z��N��om�%�.�_��:�ط��"ǭ�:��������5B�����nH�ި6������\V�s��-�����f���!�w�䦶�I%5������~����Jl�s�!8�G�Đ�`�$�`�9.cr�F�\!��x��&*���HZY���&%���9�y�ܖzϮG�sZ�4J�5�4�!_�$�ϏM��>(@����0Yxd�ѓ��c�J9�6�P�q������E��Dmoii�^i���%o�(�l�|8�Ÿ3a��k�8t���$GB�2W��4:Z,o(;�r����˛�����w..���[�B������<(�ɡD��|�ȋP@f7%�^1�6��=�LH!�p�=ǝ�i��0��m������:z�܂Й`�A\rlv�b��T-���I�d��tq����7ѵ�Ӟ�_^pv>�П�u���I���	P�J�kJ�XA"���"W�˼k��7~T��8��/�/]}�X��"���p�_(��eѭ�l"�p.���"���l%��o.�k�<�F�����Y�J�%>���xҕ�ޗ���{����s��6&k1�+D������
ic9�q2��&@��@GId6D��.��sMq3;�w��l/��Aܠ�r���h��^JP��.wi�hŅ$J�k�\Tર�+�mabʛ�K�Ɗ��]�|�-��(�^$&C���b{^a�Մ89��h�l�',6dU�7d5�(�m�4�%�C*�@!��G�J�f�>'}��d4�!�~�9�$�G�8I�0BqP~V�����u*Y������6HIIp�HFӣ-�bD<� )d��Lˇ�d�9O�^�ClX`ar�e^��SQx�`n
�1!�ۗ�"!54"Z���T2)�@�Qǟ�����?��Y�g��>�9�O��s"�#Y',�
�|lɓ
���K/-m{���] ��z�P��U1��" iXZ���� �֌=��Z�v|c���m�hX���±=@ ��?�s	4b\��|B�PM�����ٱ�����K��SN[Tnʘ��uZ�q�_XN9�dz� ͗�8��9RZE�f�~ 11^YD\�~a���g��bԔS���&����s)��Oc��0Vh04���k��uQ��� ���=)�9=l9Z�=!��5��.�\�~lJ$�-�>�������bz�������N�
��o&5�9�ϻ''Їi���0	m����0��a8�tcT=
C��,8e���C�K������VB;�s�W�˛��%��5�-����h�ϑ�&3o1[PE�z�d���r�ܦG�X���H@$m�U���R��&|�D��lv�[�$��0l �}4
k�����Њȟ�ld��"K(�@���e�H1��}�̌��R]Q�)���Iv� �����ї&�1G�
m� �"�rȤ�t��5�i����۪��R��ğ�ߌ�b ���r��[*:�f�K���Gۓ��t_<��-`�^�nī�$c�^�����)PP�f�&�B)��&\�����>����s��3?:6Q`��v+$�!bP�F	��}AwϨ#C�w��C�������z�ڋs�[��|t����Y��N���v�.E@��tq�Ϲv!)�=iI�����qg�� ����P9�p���H�%<��QR�k[ڰd3���bΈ��;X�Z\Z�	��U�J;#��&�%��ɫ���:R�1�7sIBjA!�OLZ���~"e!���\FD����.��Hq�M "����dƨ������g5��M�ha�=X'%�rE�!N�5�'prQ?��'O�|�ҕk�|KX�VA���&p���t�<O���f�\����h҈b߰�A��V� }�cI����n��$4��ZB&r��e���}�ݣ�.�b��]��|�c1OA*Z'�x
�)��D!_��o�-�M��@;��>�Mr�!PE���Q\�?#�D/
�P�{3��/�K���Z�زe�̭K*�����B#��2+��
~�6�7T���辊,ao���#��:�)��l������G]��f�ɏ��!�_�����5���=��F�^�'TZ���Gs��{��<�����JY��/G�_�8k�� ��g,�)�C9�.|�X� ���X��K�c2�>2j$�����^Wf(}�I2���R��J�9ޒ\&ˉΔ�q�e��R�N+ڊ?7=��M&��jVu�n�f��:����L�;�2�>��2��b����y\��l��^�f��Wt�S�]��^B_��J`T"1j�p֙$v��!M�h$� l".35�5����V	�F�w����R9琪��X���|�%�|��}���݅�z�Y1�]]OFWG��ʎO�解}*��L��3٫�79w�9�z��Yq��R��1p�{\DDVC��U�$���'d�^��AS�T��d�:lR�[2�J�N�>�:�Q��W�q�~�X�Q��f��~U�+�:]��C|>	�����ɻ]�ow�xK�I_�X�r�}�<9���*�k�'L$����xVQ��B0������l5ވ�e$��
v��cA�.���9�%���V������O�ZequmNĹ"��Q��z�t�$�ۑ�7V�cjf��~P��&�5Y�V�C��
��ͮ��L���L�[�����{�:`7IS#��E����l���(�H}3-��J�.&p�xUq�X&��ZQN�W,^�;J(�-���]/ɸ
$VD��N� _a�E�<
Ӣ�خ��`��K�M�g%��<5M#B��NFx�-6#�D�" p-Ӷ��GߛP��f�D�Z�E��#H�+���A7�j����;�μwc�va��k�2�����jp�h����*�T��!�R\�IZ�v/�/J�*u?CQ��,Bh9gghIA��L�8]q��J
�
���2
��`�*5�-���z����+�ݲ�W	U&XP���p��$�/�_��y_'`	��I�Et�q�����<dҪ�t	�k�dҠ'�O9y-�#�٧T�4�}��NQ���D"�uǣ��=�j��b"ksa��l$�J��>��@r���w�ʨLZ�RLXg"WT��|���v_cnkITǒxH����q��<���c���2[[\�X�s#U�^�!,+[m
��ՎM�Z�F'���M��"i]�Q�Q�E�Op�T��p���}i��2����AFԆ%4��W   ��Пd�TX�U�}��{_n�z�dh�N��&�[��Ο���	Uy��������0]�uC�`�p�/��D� [�`]{��,��E�B�ތT����|���f��^{�Á�1oO9A�˖���+�Oϝ|c��M�@<8�n(�Pσk�t���z�a	(.9�C�r���ݷ���{��+7FhsFp\�(��b���rn�N&����W0�G":�D"�!<�\��\�z$�yG%��w���x����E��@7$�s�k�	�q��N�7��X1���
�go�_�g"2(˾^���I��0�z�==�u���H��F���NJ�}��@3
 ��s�����O���(4<�Z���$<�28�I�R�k<ZP�{K�ᅶ�ѴaJ�C��,\���FdV�G8��j����Pv�0Db;;,����iG,��� ����c�7Ǝj����ɠ{��f+�2�offB��8w�SіZ�l�k*J�\R���aT���껔3+�
߄)��Rk4�S-J�,G�=��������C0l����1�b��$�{!T�����
�4:֊Gno�+�r��:�ܠܚ�֨x)�]`��qU����S''�/z^RC{gz��}�&_�LQ��r]2�����y<�\�	��jT�fʽ��Ra#t�$`��&.ÞfR)��C'?�]�����/����Ɯ�����\z��͵/����5�]�|'��Eg(���t��y�hWO�
�H�]u�8^q`mT�5)�W2��dd�rҩ0��w���m&$����V���%uiZ�;�̞4&��͂+mM���Z�d���e��6t}0v�J�U��|8��/fU_�U�>>vzzyHOgݓ��jJIZ^P��P{�T���2 �M���k���s�v�G\�U�(w�O��6�XD!��1B;����)��Q��!h�\P��̰����.)��ՖR�X����R=L�m5Ǎ��Zk#<z��Z�޳��r�\A��IJ�loh�˒r����ӈUEJ�����VS_:4ZG���8��lt��US���v_�]�����h�P�$�L�4EE�m�&�I�\ڽ>���>�B��ARȐ�0�R����W��5#�6X�4e���簎���+J����G'D<@ķQc.�}�����Z�!����Q�wv�F68=hd���GF4�X%����Ф���9=^g9�d�M��{I\�qX����l�W�R�7z�$W�p�+��ҙ�	ť=H�'�A��v�����������b��b)���wF�R8~�	�;����PX��s}�@0t�P�1�(���-v{��>^�~N�gѣ��=l�?V=��"C�ƴ�ԑk�{1�ofsH�� cbY��'��b�5-ˠL+g�2���qm���wzB�J_�U7�P��]��II�'w/#jR%6y�m���=��W"��Q�{�${h����Vx�-ʑ�p�N�����-��\��!�y�4�T���x:�i1ɾ���t*�0�N��/��^ݧ1���a�k\c�ix7cz��\�i�)�a�գ��(�nz��(��gt:��T8��� ����t�A��V���k��Ek��L���\���oz��f ؚ��y����S�$��K�x��P�꺖�k&+���)Q��h	Ų{�L���5F78l�2'#�� 8�Qa����s �	M�z���p&�g�%z�ik���;���^�>�c�r4G-��99�P�=�现h>�ٻZ>=�v$�����v-/lr�ʐ6�껴\��eW��4��Xj�wm�V\���8��}ͪP�z���o�����m���U����YX\nn�h,�TH�����y������#'���ܟx󑔧߬���g�Em����sR/l�y�
��zk���?v~8}��y�=}�x��]���lz3z7��H��.���ΐ���Qo�����IB2�tk�s
l�J���VT�}��!��A���2��Zճt�y�Epd,�/��� ��_��n2�$Bx�b����e��v��f4�����j\E�1)j%8/@�3ޢ����z�v�5�v����G0�����W���y�u�9C�t�7�%D�p�k��{���BF0G49ԃ0�T�F����I��3yp��u��(����s�)�f�A�v3_-)����M�7�L���h "�����̮�2~B�6�6z0n�d_O�j�
�`�d��4�)��(��l�1Y��Z���\
��V�R ̘k�	pԁ�ܻ�&g��-O�t��Iϻ<)`�A��D4��uB��9R��!�IaO���,+D�����&j�kg��D��,8q+��ۇ�d�d��:�N�����|?9^���rʪ���VuFg{W������U�s�O�)N�o��!Jnc��.k�6�<H�c*�zj�5饋�N�U��N�ސ쳐�QGP7gqt�ٶ����!��X팏�.��k���#��:������'�[�QP:�4j��Y�X�t,�A+�u�TUAc�s#�m���PF�@�^�m7FX�pcn�9�QO��|p=��)2�����>�H�a+����35��9D!���H��d�"lv��`%3 �z��������0�i�I�7V]2����"�{��q�����~�����rB
�;. dk1^,GW�
#������?����������9����i��wf���z��+O�q���:�df�=��%��%��mG6�	��]�F:]c�j���>�a�E�c�`�������ǩ��½�M�>[��$9��{����w�������-�f׳�Rz����O�w����v�O�i�         ?   x�34�4202�54�50U00�#��������%��1P (���wq��W0�,������� r�V            x��}�r�F��Z~
,��e��?�h���Бt�cw��n ҡ�"Ԡx��o0�YL�x�7zw�z��, d�A�� 
��,�@eUV����(��򿡖A�g=n��;����Ex'q�&����|r7Ƒ1���d�F���%�'�����g�8�������x2F�l<���s�ĘFs�a�#�qp�AqtΣ8�����f������g���p>�'ɫ>|��'����^|m�g�.���g�]�|5�O?�]};_<|�n�d1@��W��x� �O	��ߎ��`:���x�>���B�{�{�2=�o�����-�x2ZL�8��1�o�'A�1��er�ùif�O�����~#x���bf��x2��;�[����=��q��~{��'ǰ�m8J�6;\�"|�}���|ty5�E��%6~�x�І�ā����~%k��#��83����������X"����!�֔�b�勏���5��B��(xxp{�/���W�G��E�����z�;Ax�!ܞ噞�n�Q|��@�|�Y v�p�����7\y=~.���,bR��WN'��l�	)�#��m������F�{ǹv奅[ �L�#� ��RO�3� j�D�� 6>9M���(	��i0�����}{�m�t��H@Q��v�ڠX��/�)X�S�K�Mf��KJu� ?��1~��InH���~�_��σ:��Я������l�����g]����#�i3��Q�o/��.�H�|q3A���3�@\1�����?�5�k�~2�)����q~Wϱ��'�t}���� �L��x��ѩ�63Q:���Z�+��-7,7�ri;̫yU�0�庫�JQ! ��M�o���#�d%(�&aEŐ�F�M�o��Jh���,i}����nmn�-����Y�g�&�ߗ���J�K#��<JL�ŰXZzmʣ��Υ��a�1s*�]t�x�M�:5�}�I�����g�6v`i��5یf���/���_�WR�H�v��&�\�{�l�n5w���fE��DM=ni�����T�M�} ވ2��sWqt�A&��I�H�y�����W��י�j	���I�ۯۀ�*W;�Ҹ^\<��B�ݣ��8ޑÎ�?�0�g���?:����>�D������P#���"��lj1*l�_\�o���NO�a������~�� ���6���!nY͕pZ\��c�d��ZI������9�cs�plU����B(hQ�t8H`J�>^^�������Z�r���x~G0�WF\���oM0ſ�^)sg�Ǽ��U��s�'d;BܪN�΂vsb��,�}��ռw�F��I�J^���{`��jqK�Q��.?���p`V.fc�7�%�wue/�J�O���N��n�Eg��ZR��%��T �Ч���H���� �����������4 #_���^5��>�`�����+X:B�����{0�@t�6d
T*��(�(� 'J�\����ɧˡ�q�ә����Eh�Gca����|M�YAQ��&OU�aI����e����vu�5oCPe���PvTm�S�� �79���l��������+�΂�� v��h�S��$�:��I��<R��tv-1k*���DݥH���ľ���Fe�&�J
��%>�E�7���Lv��'��;Usۊ���=����r����?���.z	=��m{�+%pQ�����.�!��
N�J$��G���[�+�Ȫ&�lr��q�"�ȯ����*�-V]ͬ���'�|���<��/�KFX��W�e+b�l˼�H���W���;TbU�����Yn�0�u5��q���hJ~����~��t_�b_U��X��"3�#��$���k72'��ak�,�'�jz!�`��x�bT���$	��,�x�
�=�E1
����q2�O�`8/Ɵ��Y4�4�>6�/�'�'�i���/�����B
���OF���tތ�_�nC�/� D�ӄ7i�79n)�Ildݦ���.�.�3wS�M�DH4ܔ�RI|�d.$&�Ƣ�#(�a�!u��t,�Od������������O?�p�������7Q����Ls��N����_���Hх媕.J3�*.�G��X��ߙн�R����R�ђ+!#��Π�zEq�i �i��H:oOFTD;��q0�Q����;^zҎbm���޾�W%<��*�0���%�j��z�{��O!ğ��p�HF��`%<.7q�&T����d��ڒ_�p{f6C"s
�=��7�E�!6�t*`�����oS�����a��`��F%ۇ?#m# 6z�[̞��N@|��)<?I2-�9�l��#i�s�S�d��kK�2
�K+S"�f2������>�/ �lf{!2 �ѓ��au��M�.UM��,�W3���ɻ�{�����Q:R�z8y�ń�,S��,S�2+3����A���A�Yc-m.��w��ř�[� �n'�pl�~څ����KA �g���sO��>����U؇w�Px�ʕ)2_���~��藳�yz�I�WS��N�N;��~�6å�ip}�Q������J��4k�����w�+z j09_�;2`����R��*[Ŵ,��І��Y��
\��k�d��L�-�N�q�b��l�,�{���"Yi}d����}���������&g��^���fυ>�eD�%E3�?��F_�F����M�` �OG@,SPB\�>��^���"�_���X�t)Ks��VGȐjGCu��jb5� ����7�`nA��4����h��ӕ��ٕB�%�6p8MM����,���9�uuޘ���db�	���K���N��>���$�~N�&�凮�[?�.��QB�#]�/�p1L
:DP���C�\�.�|��7�2Si�G �I��ܐ�إ�b*lc��G��ƹ��<)N�B r��7������1�� 
n4I.�t?~4�$�S�\�]�6�śvwo,��]�R�,4Ȅ�҉��9\�d*� �0��C2�Ae,c�nO�S����B�:ʻ)������}���S���!"/������ݎᛷp�Ô=V���2�d�vQ<���v����u����D���v6�2[ae��ˊ#��"uR�0jJ+Q�����F��x������*wI�%�f�2=�l�""�L4�6�TZ�Ӓ��ŏy!#�$B��&���h��b��9�^�ү?	��6!(�<�<��:�El-~k�ER%8��c�R�R���9v����z5�0g�jl.q�}�v���V��E�4��+�����n#~\�TbH�� ��$��ӅJ*�ڔM�(�d�o�tw�ei���y�U��ӾS!���jS�Y���oӈ���i�!����l�S����j{�E�3󸺝�~W���\-��۹cU�X�F�Qҹc�펥y�p.��&�Fy;����d���c8b���D��nGPak���硼	R>��pp}���F���rNU��Z��a9��p��ص�K��V"��p��5x����'��OW���l1�]����ny9���8�-�3�":yuu�������`�J,����5F�H>OK��<��W��-���jr_�|��������_�'g����x�+�,E�
q��1^�Q�$��z8N�w�:=�a�0ϡ�ELQ�'���"�Oߊ�a���,���!P���;�*��t1I�BN�_B�NH��O3D�:�T(|-�7\<����af�����`��4� ������ϥ�}XBPx�7.PCuf��8;�d����0N���C?���t]��;�gß~��+�X<D���x&X�Th�sħ��QbbA�A������́4qL3$m�?,S�4�C��쓅�1 0Xj9	�&O����Ix~y��xu��`x:��Ds���.ww�w��2^ ��b���jJ�Pa�Y9�F���(u�����Mv���.�ќ���5�X���	��
�r�    c�ic����<�&�}�H����D����2p*��T�E9oI��o.��p+o��=�j��n�0���f����}^��w�w��B6��uaG��x����PU&�+�P�Z�t���Z�:ض+ئ���Y��YK�|:N�8�5����p�W�VAI�s|L{6�6�$q>ׯ0��.<m<�@)����7}�S�t��s�:�_��19&���u�V�(WS�W�Ͷ4�3�Z�f�pWs��k/œ�a��l֤����)GGG\\.�FЦw���Ý/���v!�g��~� �Ͻ�b�NM����b�����u��:�Wƙ,�\��zԔf���r���9$1�9�^��X��K��%��AD�k�]�u>�l�( �c��G	�A��0K���=L%D��_	D����Ǔ�h1O+?���+s��Ks#��!N�x�S���-��XyV��R�T0M%�@ y��H2���oU���FKs��'�x���o<���~;��x,��ij��F��(� �k��f�i�V���l�$�!�}!����7ط7��@�x�(�l\�t_�o�fߜҾU8q�*F�*����;���Mv�w��Y�tJ2H��o6�YA�����j)=.+���7����E�Ƴ�5�w����'Ak2���P�Oc��W���
���CkC�Ʊ���ʀ�N߬Bz*a���|�說��!�+�9��N41���o]L����/&�^��yK��,#�;I�m�d6zC\��.D�Ĵ�i�;x�S�U�S�L��&�������s�A8X����$\E�j�O<��Nq��e{����d6b��4���小��*�({/����Ex�c"X��
k�5JI~����G�"�F��������(C�?�1�<^ Ӷ{� (B2w��+�R�v��N��y��9�b�3�h%��J�t�b�H
ۺ
�
Z����BZp"5@������p�γ��ړJMO貵�pE3�&��n��EZ+�:��	/�t8�L˭�qY���g��gȦ=]sPt3�� �7�t»޻3�����/����ɏ�_�q ���V��� +����!��z�C8��s}�Yö7k�=ˮƤ#{~�G5d�ȩ��`+�;jS~_4E��e+��mi(���R���o�Y��+�)U�������U�=�y���-�)��8�1�7��qIs�D��/MQ�YBk��Ҍ�)�l�4�M0�1�DtM�&s�&s�nϳPS;l��f~Ň��H��rT�r?Ƀ"��v��{*�*v�Dc\�º�����݊���@�s)v.Ž����t�NY����,�[a9��@�b.�a�In��L���/����ۀfK�]Tb�As՜��ס�v����۰�13颉^z����LI�~88=��q�??lT������;������L'�c�o���{|78\���������X�:�K"�I��z��R앋��y.R������7��8%���>%L4����|�׃����?>ex������4uQ�ra!�r ɁE��p���k����j����q�lTR�Q�Nـo<)m��0���"M�˓�>G>�8�m<)w�b�Xgg�wP���g��AfΚ�����y}�v2��ة��W��F�$�V�u�뮣l$��6Hx�mC+�h��"`�'3g�SK��2-���p�XI��,X������-B��dH�ޓ��
����NT�N��c��������7����MNUc�C�
���jEB^�:\Єۚ�Y]���	�+��I���Z��=�߰֠ns��^�F�w��^o��żlw�f[�hv���j�����!l���R�-�Vy&JrE�=��iFq�A�W^��<{2~��h��H͋R*Ɵ��YX��k���=NԣX��g�>�y��Juhs��=� �ԑM˩���!1r��ژts����mn1	�}�����	�b�k!��jʺ��L���݄�׍�W��dz0���YW8o�4S0�⚙�otj5��r
�|�<�Q��~ɸ� �����L+�B���{e֬{h���<�d<ǅ������pU�$e~�>�{�1�$� ���p� 5yҽ� �sڃ����\Y2K���Q_����3�/��F(�u tme8���p�!��D��7����%8��r0����5U�rdi��`�Z'ݤ�Rnժ��^l��Z�R��/Xc�C��'���y�se��^�H�m��3<ӷʩlͭ~�Ue@�[&��~������)R���k
���)�c�8M�+ǧ�U���s��eu������(��JRZ��hm�������.�T?�䨶nL�*FGCI����8*70[��?6�r�W�a��8�(�o�K�x�	���9`�R�.���l9ĶF�X5r��|�ƞ�<)<	�VT;���lS���U[��t��S��\�UێD�mS�������w"uױ��oW%�U� O�jfOVʹ&���&>[�6�U���+��n�떨�B�x5�Q��
\ #(ܝ�ah%d3I�����˭����7BX9�Q:�6C�-]I�-{���Z筗2�dJ|E�Zss�<[A�gZ�^�].S�ˤ�e��l�p����Ҭ��k`\_M�[pپ�?=1��In�Fd+��V���	W���ܪ���죢Ya�����s�
]{mL��U�
))K��gc1KH��ֵ�f����׺��� �u��YLM�ߺ~�R�ݞ�'l)$�� t}��;���D1t�����R#3B�E���q`'|�������-J�`��ڵA�cC�#��Q����^+�H�u�8��c]��;������{LUo|O.ڼfК���eW�>�=�M��.��}%�x*~t�5�#0#0�rm��)�n�~�A��+Њd�����'�J �㕶Du�&���~�=��e,_��� �"�ï��ҝ�渦� HRS*��0�
C�~��{�7�_��oɀ)�e��"�p��7Q,����,�AD�n�Q��/�R��P�%�s��P�ê�Ï����U�tS��?�+A�Tɋ��!���,#��Yʖ]��Z�;jF�:��[Cv�ٞ����1���оQZ��H kj�/�DCD��t��]��"ї�17me�l�1�����a\�/N~�j\�]�iẍ���]�ֻ�h\���y�ń�-���ِ�ِ(*;��b�Q5t!�qmH�fLm���mT�5c�)3T�~]��jdLH�u�׭	����֩��IӍ��/�R�ڟ�4��\X��c�h[ھD_�vuھLr�� ���O�ڏ@h��:\��T�}]��r5P��;��G6��te��i�6mJW���u�cS�c����߬�Z���x�
�9c&��R��f�V�F8#B��Z�mYT�p�j��u�]A�6+0&�{�2mZ΍���qE���.T��$h;���0��f��LmGR�")�Gm�Q���j�'��H����s�&�HLR��"&'V/\���l a>�0`����� X~8+�r����=�?˜��R%��T`�)����V�@�����0��f�������A�R��2�Ԧj�O����#���(���_��?��ӟO~<[�D�ZX��蕧zovG��I��k�(�� e�rN�U�W������q}y~v��u�vQ�I��m���&tn��N� �~���Tr#����Ҵ<���|,m��-N�$�
t>PEL�[�b��y������d��\�9��[-Q\ͩ�\J�&�V�N��:��� #��/������!��ǫ�_�Ӂq����������ڵ
l�k;��Zxi�����ײ7L+n���W��9h�����^O���QԪ �\c�m��j�H4.�r�s�Bx�.���$MT �a�=���Py����~�h�n'qx��JB�1�ī�h�|��'~�JTҳ}�%u=�]ρ�.W�t k6P�2�4G�2��#���U_0��m޳�8�������q��r�j`��_�q�8^���q��7��4U�M�J���$�������W�fW2-�]�T�ʶW[�\Rtm�����'5l�[�&�~ż�%e׃���5�jYt��?g�I]@�    ڶ�'���ɤR��}�-�o5~�<�f�5���[��*��oi��uU�8jR�֕�q�jHi_��O5v���8Uk�x�6
��Ƴ�Ah�3U_�wGg���6oaZC��4�[]��R}�³�
����|��St��}�۶������rQ�>�UqKc����؂~U����(�]T�*n��הCw����H4ƥ��nׯ�5�׮8Z��K�D��*'U�u����8����A7��4�}�i9�5������!�.����=����H������qS��fi����-�|s��g������_NY��[=�Z�ܲ�/y����Ѣ�a^9ń6���.�V�J�I6�&�4!�â��B�,�o��<���X�:�be��Z(q�d�@m	q�D�g�˚�릨Əj���V4Z�&n4����)u��ftMcL�Z9��&t|��m#�V����RS��hiEN��"�o�L�{-n��kp�ݍ���JW@��E+<����fgFT%4rZ��3:+ۥ6�� ��Y�><TV���;n0�~�y��c��O�֧���i1�y=�M_��ɝ��Z9�+�c$V.����q	Ϲ���(T��!`¼��zL��3���O� ���%�ox����g����{�������
����S{�Z�)E�vJ�SU!ը���Y4����Z�Y^7�qz���b���̴�U~���9ک���������m���LYcב�xa,�z��n����_�4���	�5�$�.�����&ޜyE��	�rCr���B˥��;���\�ʠ��s����P�su�TC�߅2�\ޏf?�ޥ��5����>d�r���5��qjzeYږ��\�a��D�i��oз��T�ExG����&\V$���x����Z�7��Stb��L�n�.��qD_�g����X͡�!J����V�V��R�]�j���5ۢ���y�}ՠ�V��6��D�"A(`6�7=�A7ķvWWX<�T�r��6�'�@�I��䵃M]�"����m�!:T��*��Ǹ^�ھ�,=�­ب��Abўˤ��`�O%/"�LI��mbj=�g��������F{�,k���ȋ�'�6 �;���:�p�.b�,����>G���p ��� xJ�X5��{̙���Cp��������/��Gc���JhŌ;.ϸKb=�M�ۈ�+��QV��')0f�=��a9����(	�����2�y�M����1	� �/fI�W�4�x�8�U��3]�q꾞?Je��un�H��S�cm0������qy�V�z*P�n�_�r�l�g����,�gQ�<%��(�e3�Ons���JWƥ�E���|G�e�kҠ&�bm�qR����i8z��c&�Jɽ�ea�dRrS��5�PQXl�+Z���<���N���a�`V1�uZ�����i~�y���i8��J� �>a@w�8Y��l�Z�<�'S.5�\��ir2������:�o��j&!�g���ߐ���lS/��f�9��f��l"�Պ�RKO8�1��%4������D�my�A���l� �l��<���U�h�r��T�J�V�tL���������I�y��L��ԧ%�3����Tz������6©�@Ŕ;E�ɛ��O��볓�18?�����ӏ���������`:����a⦊��lQKxe�a{�I��4����d�+rlk�����ad���StB��ܱ���x"D�(�E9����� �S;�m��J�� �<T�����烋�i�~�3�\�i�5T$&5�����޺Bg�2s4J�|�R�n�})e6�o��Z���V��N�4E�Te���囦�uM�kuպ[�p�{K�ݩI���ץ�KTn`�h ׆�����1�S6��:�������n$'WH+֘I����[r���%g�U��7*=�,<�.�c�	��]6��u;�f��c鏁�������Ϣ���a�^�?�N����'���<��Z��U|����Y �@fк)ZX��YQ�Y1�.�<����Kl��+MF�QL8s�
��}X�:�VӈZ�#�nS��K�Κ��;u005��<8��}�mi�Q������n~=u���k@�a��S�^hy��l��1�/j��αt`�ä&�9VU-�&/��f��J��4����mh��v�Z���q�w�&����d�TRg�v�C�t�i�����2�.]���?���4����8�*_��w8董��Y�J4�&ٖ�a5{��{�4��������?^?����a�?�:0S�����2��1�Uoo}��3�Y���ҽD���]c�f6�FE��&�2�Z���{U���ùe���)$D7����E�X�大J=Sq�4��4z�j(�4s��� �N�uJ�)rǖ�U�\l���n��R� /��6�TZSY�J>�ܩ�� �N$6�o����7��D"1m��4����۷R�Ҽ��*'8xݖ�H��`�"�d�V��*� �g;�gc�h�#�Fٌ�(�D�n�-���H�-���M��Y�^#��)�Hi��-_M�Svh�Ӊba�M�z���l��$�a�����[��d�����o��$ռ�4��,�I��7V��Ô}�6SO���G��aW"��;���)�BT��q�3�Y�f�q�=��+�f���jf�9�+�'u��xi"�%юkO�f�G!f����II�̀�8J��⋦AJ�w�/NF\���A2`A�=#hһ��YUg;}%A��X��"ny�jǺͺ\�������Y&�$����7��o3��D�j"�� >]�h6�c�)��<��D�i$c���ܰ�L؍X9���:������ ������b�T]=�2~S�=
���XG�N2K�6���J�ʾק�5��}$�`>5
���^ų��cvl��܈�a����|h�v���Y40�P�/j�4 ��$����S��0~�5��x�h*aS5��"�5ED'�	ܢ�����J������*�LvUH�U�ם���26G�Q�ʚMt%��`E�1J�ǂR3	��~�n``���i�'� ��e�8\��<���m�͖��#=k2h��d�}T�r)Y�u�XS�
��xQ�#|�d�x%ؖF�]��^F�KXp��BdEB�7\>�Ö��/���)#��A/%e��t7=Ӥh�2�i<)�D��Ɠ�M��|O�F�2��7kL��%A! 	@��Ӹ��LԪ��&{�S��!z�Ɠ8L@η�(��t��N��Ez��2Z�i#O�̋9��a�+��~5
������@b�0�^�]Tg4S�� �(}U�^��!�k�ܲ\�u�@L)ZH��gE���A�J�H���I��J%:��T�"��qM;��t���M[��\cdxe��;Co���ǫc-�v{�[��
"��Rt̋�B�<8'�I���(,�#����O��� 
��^&Y�Si6��/@+��+���H#�l�\�f �i���Ak��Yg@�g��R{�\�]��]�4����y�וֹ^��]��I��3(l�ݣ�I��������\���r)qL����z��^T�,���x���#@S�6|��BࡸvS���p��2��zgaЈ��~8�Rc0Գ�	F	ǋQZW���2�v����V[}Ҝ�N�~����Ɔ	��.��6|׿0��'?~-w�.��Z#����z�߳���L�'�.����Og��}��`<�����_��g?�OΞ�ua��tp�/��/�|xq�K�	��b�?�7@��(��({���B|!����:\�\�g+ގ�r��r��%�3Ƀֲ_�N �C��>��^Y��Iǫ��2'���-�Qh�p���;�̴��g�|�Ga|-8"�>'[/��W���g)�k|{E�@��Ֆm�n[ko�M4uh^ǭ�p벓e�����ݶ��������g=�\�D{E�O�)?�jk�.���#W]�W?U��r�C���ת�:@<��w����[1����i�d����t2f:.�oҭ�z��_�5_ܠV^��G��䳒���1��u��>A�6[��WW���X�3/���<)�/{|#7?)�m� �  �]xl;J��ѣ���mW�V��%�\k{�w���u}5#��Us�oKCC>t�]�����!*G����^~��U�{�Q��Q�mU�NT�3�0lQ��-'Z��jW������P5v!/��V5;�D�>݊����lq�pu�ݭmG�E�J���5�>�]mH���`!�j0����a��TC�����Q��)�]�xkd�p	�[B�,��%Wc (:䴿	��Ί8R��M���վ�®v3�,�Ɠ����j_�O��[ض�S#9�p�w�
�;���L1)��i���Ȍ)�At&ig�6v�h����8�]�0iW੡'St��awq���S�L����������'r �.���[���&"��	��5>_��W��b����L��J>��wXc��ZA�p�v�-CE��S!��#��b������P���[|���$5V�RjI�����3�s��X����lr{56��?�dD�/D�\p^��wE��u.�6����@I�&iȽ���TRfu����r,����� ����f@����S@_c%��P:��_�'����=����F��qa�;�e'�JP�q��@��^��y��cd��M�β�,��T�ڵw����4���[��E�L�4V1/{[���ט�]w���Ɛ��R�:u-%����4�nu`����)��	u��q�2�p�$t����m 1���.�u�rJ�T��&1V�U��4����"i���3�������l�g�yM�H��(�G(� E,%G���2 j��X���^EF�Zx"�jy�P��Dhl�D�i�Lj�(�a�B�4&z�ס�"_�[_c8eѴϦY[�8�}�m����zN4�u�H�%ԙ+Ե�P�+��Ikt�B���p�9�mIJvM]7h�]��"��d]�ֻ޵�4������         �   x�e�1�0���>�O�p����'��&���R�ޟ(�b��?��=��$P�GXf�C�䔄��u�LU�PZ���= )�BA�j��V��^�
E	�0�؅6o�������ϟL�<CK�?����\�}�9�         �  x��V�R�F]7_�/p��n�1M�pZS�fӱ��-"�I0�,�M�X�m��1�JM�U���=�y���빑�<�����sC�O��lv���GC�_���k���|�ˇQ�`����,3Q3��3\L�?���BJ��
w�L�I�v'>�`��8	�R��K�k)ؤ�ǻ��<�����Q����].��f�j��)D�;c�;ZdB�?%;�r<�b��ɉ`S1�*S�MH��{^j!�$��ef���O 2Ռ p���UNd����g<
��{�N�z��B�L�^AS���<�D�h��%�THY��\��F�/��Yߏ�~��<	�$`�~�-��Ƭ��h��E��A�l"r��U�#��1jv&u		�[� My�Rp�n���ժ3��h7�H��a����Y�3�Y��g��DQ3q�ǹ��6Aj�F�yJR/������"��6�1
��ټ�uM���\�ũ��ì�Z�^�ID��^�F���0��q�N�/|�gpRj-5���Y�FOTNŜjUg�<;,~��5��{<e_��ڌ����DhqZ�Nv����|��y!ؙ�rN]���ǐ�h��Q@��� ��lٵįf��C�x0S��KQ����XI�:��T(2����(9I���?��UFQ��fm��hѯ�u;t�Y�+��l̲g���0�'�e|�O���AG|m��S���Le�Jl��>~B�����y�.v�0Z�w�q�`�RfhV�E��f�F�%�\$���7��Z����_�8/����fj�x<�������W�?��[Zb^�Μ�:� px��4����5�u��y����}���ɇ�G�?M��ҷ���F �C�t��L{׮�W�!�z�՚�WP;���A�S�y�����|�
BC�/�I�f�@���*d�Q{�%�ի ��$�	$�1��ݛ����ѽY����$H#H�2�q�rY�Bc^i����f�$Z������bU�ofݭ�h�Cw�A�*�Ȫ�ܒ�V"�+Q���Ԓ�$-��@j1���r/�v%H|t�do��y����>�
q%X�e=���S˵���Ԫ��iE.J�(�mp�l�S���
�)U��S��2Ѧ8L�%T؊LYV����y�7�a��ڀ�~����0��7��(p�����Q�_JR�LF=�1�ja�UO������ֆ����(�V=���X��c�`�&�|�E��m �fB�8����5��7��5:�z��&�̮�SqA1o\=��F;K�i��+'c?�\q�Zq��\��}3���U����v&/�!�� �'0�I�9�}�\��ŧ@*h]x����RW��r.�����)�����#؁{w��aC�\�{�`h*GB1�5m���9�R�l�L�
r��C�n�����ar���-6�;a�a��~
��Y^�e�nԋ��ݰVHM!Xv���Qd�'�� 6�yX,=f
?��\Q31v������"�LL��?�9(LSN���2:99�&�S~      !   n  x���m��@�wY4ߘ����2����DŻR16t�s鏒J�I�Oʏ������_�>�c���������Y�&���N��|��5"��b�M�t{�h�EW�E�y��_d�e~�K��ȶx����	唸��/ewB)U��r.J-U��!,<1:���s-Z�j����B>!�h�bB[^���m�<}4㣼o���7D��f�zy�5�4#����6��4Ԍ���
�4Ւ��5�nt�� *j�� ����}|�j�j_s��@�}�,�u5vY�ʺ*�P�U���������ri���ʣ+]uu�}�p QY��	K[ݳ��Pi�{��g���ْ�����2+������g�87Zj�q��cE:����g�Q�Pa��Eő��G�Q�PQ��m�4>4�/	,�zI�D�d/� s�X#R��$��I��]�vA5�`�e��]��~H}|K x�b8��jqL��R+&��T�I  U�-���� �`��(����0���!M  ��5��M�	��lA��(�`՘M (UfJE�	����VWqA��(�`=e^˳$��5��<K~A{����l�	�Y�ڳwM (�%�:T�i���(���*Jf��~R��W�X'ZzI �j/� [�X#���$��I��-�}	�����p�5�9�W�ɖd�k��	���/7�!�PC���ԑ�C`*���*2=�v.��g���oYoYkEY�p5��,�6�4���f˶-�����8��U�#(u����a��lA��8��UV�I7���ڊ�֓��g�FP�%?��=[^�z��0����a�ٻ��Z��8ٮ΂0UaF0**
#X�aCM�?�ڄz�>���}\`�������6B����8ّ���O8$��)	�8op�O���:�X�ۇADݜ�5s"�7Ԋlz���Z�h���N�I������>nh��{S��'5hUOj�j%�ԠUP4����hR�Ue��Y�f�d_�NG5�����{L]��96��M*P3�t�	�L�`'�n��
���Oh���*
b2�ME� �=c��(ump��ϳU:s�J[<�x/mv���Ӂ���{*�/��^��+�~�h����gM��6B�Bn��ao2�C�]>����5c����:�x$b���O�� GȺ_�ˮ�Z��TV)�@��J�U�����j�~���j"�hτ5��#�hG�:��ZeEQ���6��I�Z�EQ�5j`ԜF��ˉX������/Y|�ʊ"Ve�hUWQ��z��������2?B�՚D�#���cs4y�5����۩���1ꏵ,k��ُZ��mR�Y���?Ru��      #      x������ � �      %   7   x�3�tt����2�p�p�9�\�����|\�L8CC��<]]�b���� F��      &   Y  x���;j�@�z�����׾ڜ!]a�$V�l�Uΐ�eV&��U�c��螗�x��a�_����1�a7<�o��2��~,u�ϧ�y\�_���@��C0T*3pd�==�M'+8��?XBU���<w��n����eKS��Ҫ����V��]�Qj(�$fG�Ӗ&볕���.U"Ŧ1<��|���±2��)F����SElI����s��i�x��_�q���k�(��զ��X7p�NAcr,cۉPU��걷��F(��Iɺ�����X@$���p�d�Bjӎ�B?Hi������.W��f{9<�Vy�lq ��ĝ܄�C������7��	3      (   
  x��X=�����_1��2�Ү>�2,��p�%YWUw��!8����1 KT�8p9��M\����K�O�K��g@�JW.�$���~��N� �Z�ER�"�B�����6.�X)W�,�H�U˕.��R�����,�B�꽤qiR�2�ʁ�c��I�
�Wf�̓kL'��*dY߯qG�ި�_��\��se�(���2)+���0�,�P)�7�(t��0:oG(�V)q#y�A�(�e�ʅ�v(2+cw��2�l`��@;����7l����n4Q*��e,��9HQ�Rl����2�):��#F�
�%+�"��	bި����U��7���"�ð��D�,FA�����x��I�ԋ0YY0�lV����HV��.�*o�?�6A87@^�qB���[��Ib�֟�-n������{��u1{O�7�<��;jU5y@ &Ƣ��*v\��8�v���s�i�iʛ��&���%	���F�V����:��p4����}��pr1��l~5\\�}q^�!x~�{�5�w��!�T���%��l���E&O��+�)x�`� ;�rrS�w1��3�(4�T!+���\�a!ö�i�ܪ"N���Gdj��n�G�����L!����k�(Æ����c�l�	˧��ްBN%��P.��T��p+��!].�b(��7��0)��$m����Ƚ �j���];?!��a�(��h*Q���!��؞B>��1s8��͎���m}o+4l6��^߉�z��-�Z�iG]��Ĺ�d����ג�AZh�0��A�!߱����5t旇U�i�p�pd'�EЫn��9JR�8T~?@�*Wn��%T�� 5����@Z�R*��7.�&�QN'Ađ�Dd�љ�QD���!*,CԄ���n�?�Y���L�.aʊ�ep��&Y���y��5����,�HRž���[��iAt�Ku��6=���ְ��Kt�DWX�	���U	�5
c��f�Mu3Q��PW\�0dTY��Y�W�@�V1�CT�������k� JR��^q�(l�.��� �����H��.M]�,�T*f Z�D* �"�m�b�Y"
�x/o�0O^�k9�5h�IЛ _Q@D	ΨXi�����5b�v���������gS6��ܴ����u}Ge�q�W��m"��$���8gkW��O���F��F�4�_�V�[#N��Ae	(�OƦ�	�J�X�!��[����G�X�ua����aMq-�I���'�XƜ�Y�Wp��2#�SJ��VTph�8���*/bD�8E�rl`�2����θ�of��ϼ@f���Rs	&��I*L.s&�(!�	!SJk���7��%q�����|0�GB�X�c&�6�a�5:}�:E�����.����= @F4ʸ$�׷$3�R�U��0E��U�hs�֠�,O-հ�� ܠ-,��j���e���%�w��ZM~��L�_N���_da��-5U�l@OtnUH�r�H\R��du�1���n�o��h�-��0"| +T��ԕ�~��Y��E탟�j����͆�·Ƨr�	(��) a���&�'�|��g\����To�����'�s6�Hͺ)���+�C�C�;!M�6d���B�<7��m&7]ɘ}f����iK''޷� �rv���9*�>���������'�Il=�����E��ْO=t�h��7�y�*�v4�Tt��!��w�2.m�,���w��Y[ �.����+S.%�t\�3�(_$����IM���v^���;���t4�8�|:/Ɗź�O�R�0ߒ���ͫ��##CG���Df��m�������8��}�:��ʦ{�g��-
��U	�o�cD��Y4Ⱥ��lvD	�t��{$ �ɮ�D40/�v�H/o���lP�Nݘ ��J�7��u?���ڪ[�x���?l��qb�Aw�7�?��lmO��\�#�l�P�?���<t&�L���D�����pB� ����So,�X��Y�C�Z~��%���b9�3�Yh)o����ˇ=���?��ϝ�Ư�
�|f�&ȏrIl�Ś�{egO9t��]oE_8�u���\o���۶����x���lS��,�hU�}��G�>]���R�2Tz��L;vM�I����!�$��n*:�7v|�S��<Gd��Pե���ز%m��xD}q����Qī���&ӷV_m�y����zϾ�����
j�[���F�6�wyv���f~�X�c0�j\���m8^��{|�;y��=r�r���3�V�MY����d�
ӈ	��%�w0PȲ
��p:�*@-����B���U_�Y�4��i�܄f7�Zǖ�L,������d�����-�a']��S} 9�`2}�y�m8�;�_�����1놉�M�`Sݯ��w��{����h*�d1��(�d�5��L�o��o|��Qbt������M�bzQ���F�N�%��?Ɲ�N^z��觋K]\���!��2��=�q�O�C�#��>M��"���N���ə7�
�����p.�yH���G��d��w�.��A���Y�t      *   �   x�=���@߻��i���S��G8B�ϒ���.[�z=�z�_�\��d!,�)<�������!�G�1Lk���bΝ��yJ�x���ℑdڐ��c
1��6���(��"���ac��gd��1�FŜ��ƌ�5�p+����l���,Z��|���_Z9�      ,   |  x�M�ɲ���Ǜ�8c��h�� "���ĝ��t"�������/Ve���y����?@�����$ ض�4d[^�v�%�k��4��V����Ǳ��,�*Q��4	(�f��?�(~wnl[fsF�(P798�6f^󶗭3C� ���Ѵ� �B��BB���z?- ��6�tw��=�4��f�\v�8����\������ʣH ��(�?���F����AӍ=ۦ��Nx���7�~X]��M!�[��=쌊W 4ð�h�� �#���k�7t�J��M۔P���I�"k{��t:��Z�����#!d(��d 0��{�$/V�|���ؒ	�j�IDI��S����,c»�U�O?���b��zo$Kz�P�u��1���z�N��x�
�7�%�uI�����+�^qU�
�0�% e��l��c0�����E�N��i�=z�P)J��"����'lc?̪ge�g�A�_����A���{g� �eJ+�g�$n��rr�bRC��9��O'�yj�n?܏/�Y�$?a�+:xu$���H}5���U�F����m[�yi;Ob�k1z'��L>��B��,����|����|� 0�@rո;�'<�5I^���s���G�5�C^t\�-aD$�<��Hc�+;Gٻe#�82�L�|걜N:�`�-���zs�tgJ(O;Y����[Ip��8%r~�m��Tp��Kl�v�ۜ����a��r&�'�&��������р$�J�z�k�qgF�����ܐ>���ᅌË�K6��^��;��)N����n�R�fו�d����ָn����G��ܣ��G�h{�2�v��7?�xu�[H|f�y����3��4�vo����Qɣ<�Vv>���4qa�o�Y-�Y�?zj���p��k�gY�e~�}�g���6��ժu��
�~��Z|bc�A��ߔ�R�%7��i��G�Ep�-:�ߖ�y�S)8�A�Qn�R�i��&��t�	N0kϒH��!r�ri��ɰ�}mvr�s�m�S�^n&]M�q�{�*
U����<Z�a�*�^�HqUdr���/==�E�H�h��;yq�g�SAq�vhQ⹼	!x���L���?D�I��!�}#E�=�a7�
ZnA2�s�%�]f�J�R�Ë���R3{{���S��4C�#2�WO�*2A��Z�s<��Ҧ��+8�_e�)��6{>.}<�[I���("�2+�ƾ�L�:�Z�h��R&wI��A�בF�;;��m3�4
�J���Qp�Ϻ&�����]�D���a-��wP�>��s͕��8S��4���@�E�]UW3�
�|&�I��V� �>����
���n��9��$��e�b�R���NȲ�r5R�)T����CAr�
�0����C�l�-W����IX%����挀8�|���{/���9�h9��]�z	�Wi?���.>-�y$�������}
�����B�P�����[6��	���/�K+~j��:9����x���=�ʽsU�cj}��{v�_����8������5�����
�Ql꣤���#�����h�v�����F�R�Ѩ��C���'b!�ؗǝ��H8*�S66��cr�{��6B�sES)N42��͓x�τ�y�Y'�����k���     