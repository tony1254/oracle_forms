/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     01/10/2020 21:36:17                          */
/* Created by:     Luis Antonio Garcia Aguirre                  */
/*==============================================================*/


alter table TBL_LIBROS
   drop constraint FK_TBL_LIBR_REFERENCE_TBL_AUTO;

alter table TBL_LIBROS
   drop constraint FK_TBL_LIBR_REFERENCE_TBL_CATE;

alter table TBL_LIBROS
   drop constraint FK_TBL_LIBR_REFERENCE_TBL_EDIT;

alter table TBL_PRESTAMOS
   drop constraint FK_TBL_PRES_REFERENCE_TBL_USUA;

alter table TBL_PRESTAMO_DETALLES
   drop constraint FK_TBL_PRES_REFERENCE_TBL_PRES;

alter table TBL_PRESTAMO_DETALLES
   drop constraint FK_TBL_PRES_REFERENCE_TBL_LIBR;

alter table TBL_SUCURSAL_DETALLE
   drop constraint FK_TBL_SUCU_REFERENCE_TBL_SUCU;

alter table TBL_SUCURSAL_DETALLE
   drop constraint FK_TBL_SUCU_REFERENCE_TBL_LIBR;

drop table TBL_AUTORES cascade constraints;

drop table TBL_CATEGORIAS cascade constraints;

drop table TBL_EDITORIALES cascade constraints;

drop table TBL_LIBROS cascade constraints;

drop table TBL_PRESTAMOS cascade constraints;

drop table TBL_PRESTAMO_DETALLES cascade constraints;

drop table TBL_SUCURSALES cascade constraints;

drop table TBL_SUCURSAL_DETALLE cascade constraints;

drop table TBL_USUARIOS cascade constraints;

/*==============================================================*/
/* Table: TBL_AUTORES                                           */
/*==============================================================*/
create table TBL_AUTORES  (
   ID                   INT                             not null,
   NOMBRE               VARCHAR(100),
   constraint PK_TBL_AUTORES primary key (ID)
);

/*==============================================================*/
/* Table: TBL_CATEGORIAS                                        */
/*==============================================================*/
create table TBL_CATEGORIAS  (
   ID                   INT                             not null,
   NOMBRE               VARCHAR(100),
   constraint PK_TBL_CATEGORIAS primary key (ID)
);

/*==============================================================*/
/* Table: TBL_EDITORIALES                                       */
/*==============================================================*/
create table TBL_EDITORIALES  (
   ID                   INT                             not null,
   NOMBRE               VARCHAR(100),
   constraint PK_TBL_EDITORIALES primary key (ID)
);

/*==============================================================*/
/* Table: TBL_LIBROS                                            */
/*==============================================================*/
create table TBL_LIBROS  (
   ID                   INT                             not null,
   TITULO               VARCHAR(100),
   AUTOR_ID             INT,
   CATEGORIA_ID         INT,
   EDITORIAL_ID         INT,
   VALOR                FLOAT,
   constraint PK_TBL_LIBROS primary key (ID)
);

/*==============================================================*/
/* Table: TBL_PRESTAMOS                                         */
/*==============================================================*/
create table TBL_PRESTAMOS  (
   ID                   INT                             not null,
   FECHA_ENTIDAD        DATE,
   FECHA_SALIDA         DATE,
   USAURIO_ID           INT,
   constraint PK_TBL_PRESTAMOS primary key (ID)
);

/*==============================================================*/
/* Table: TBL_PRESTAMO_DETALLES                                 */
/*==============================================================*/
create table TBL_PRESTAMO_DETALLES  (
   ID                   INT                             not null,
   PRESTAMO_ID          INT,
   LIBRO_ID             INT,
   PRECIO               FLOAT,
   CANTIDAD             INT,
   constraint PK_TBL_PRESTAMO_DETALLES primary key (ID)
);

/*==============================================================*/
/* Table: TBL_SUCURSALES                                        */
/*==============================================================*/
create table TBL_SUCURSALES  (
   ID                   INT                             not null,
   NOMBRE               VARCHAR(100),
   constraint PK_TBL_SUCURSALES primary key (ID)
);

/*==============================================================*/
/* Table: TBL_SUCURSAL_DETALLE                                  */
/*==============================================================*/
create table TBL_SUCURSAL_DETALLE  (
   ID                   INT                             not null,
   SUCURSAL_ID          INT,
   LIBRO_ID             INT,
   CANTIDAD             INT,
   FECHA_CREACION       DATE,
   FECHA_MODIFICACION   DATE,
   constraint PK_TBL_SUCURSAL_DETALLE primary key (ID)
);

/*==============================================================*/
/* Table: TBL_USUARIOS                                          */
/*==============================================================*/
create table TBL_USUARIOS  (
   ID                   INT                             not null,
   NOMBRE               VARCHAR2(100),
   TELEFONO             VARCHAR(100),
   DIRECCION            VARCHAR(100),
   constraint PK_TBL_USUARIOS primary key (ID)
);

alter table TBL_LIBROS
   add constraint FK_TBL_LIBR_REFERENCE_TBL_AUTO foreign key (AUTOR_ID)
      references TBL_AUTORES (ID);

alter table TBL_LIBROS
   add constraint FK_TBL_LIBR_REFERENCE_TBL_CATE foreign key (CATEGORIA_ID)
      references TBL_CATEGORIAS (ID);

alter table TBL_LIBROS
   add constraint FK_TBL_LIBR_REFERENCE_TBL_EDIT foreign key (EDITORIAL_ID)
      references TBL_EDITORIALES (ID);

alter table TBL_PRESTAMOS
   add constraint FK_TBL_PRES_REFERENCE_TBL_USUA foreign key (USAURIO_ID)
      references TBL_USUARIOS (ID);

alter table TBL_PRESTAMO_DETALLES
   add constraint FK_TBL_PRES_REFERENCE_TBL_PRES foreign key (PRESTAMO_ID)
      references TBL_PRESTAMOS (ID);

alter table TBL_PRESTAMO_DETALLES
   add constraint FK_TBL_PRES_REFERENCE_TBL_LIBR foreign key (LIBRO_ID)
      references TBL_LIBROS (ID);

alter table TBL_SUCURSAL_DETALLE
   add constraint FK_TBL_SUCU_REFERENCE_TBL_SUCU foreign key (SUCURSAL_ID)
      references TBL_SUCURSALES (ID);

alter table TBL_SUCURSAL_DETALLE
   add constraint FK_TBL_SUCU_REFERENCE_TBL_LIBR foreign key (LIBRO_ID)
      references TBL_LIBROS (ID);

