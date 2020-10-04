/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     26/09/2020 0:39:59                           */
/* Created by:     Luis Garcia                           */
/*==============================================================*/


/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table TB_DETALLE_FACTURA  (
   ID_DETALLE           int                             not null,
   ID_FACTURA           INT,
   ID_PRODUCTO          INT,
   CANTIDAD             INT,
   PRECIO               NUMBER(10,2),
   constraint PK_DETALLE_FACTURA2 primary key (ID_DETALLE)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table TB_FACTURA  (
   ID_FACTURA           INT                             not null,
   COD_PERSONA          VARCHAR2(10 BYTE),
   FECHA                DATE,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table TB_PRODUCTO  (
   ID_PRODUCTO          int                             not null,
   NOMBRE               VARCHAR(50 BYTE),
   PRECIO               NUMBER(10,2),
   STOK                 INT,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__REFERENCE_FACTURA2 foreign key (ID_FACTURA)
      references TB_FACTURA (ID_FACTURA);

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__REFERENCE_PRODUCT3 foreign key (ID_PRODUCTO)
      references TB_PRODUCTO (ID_PRODUCTO);

