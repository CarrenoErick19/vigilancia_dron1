/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC              not null,
   CED_CLIENTE          VARCHAR(10)          null,
   NOM_CLIENTE          TEXT                 null,
   TIPO_CLIENTE         TEXT                 null,
   TLF_CLIENTE          VARCHAR(10)          null,
   DIRE_HOGAR           TEXT                 null,
   DESCRI_HOGAR         TEXT                 null,
   INICIOCTR_CLIENTE    DATE                 null,
   FINCTR_CLIENTE       DATE                 null,
   HVUELO_CLIENTE       NUMERIC              null,
   PAGO_CLIENTE         MONEY                null,
   REPORT_CLIENTE       TEXT                 null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   ID_CONTRATO          NUMERIC              not null,
   ID_CLIENTE           NUMERIC              null,
   HV_CONTRATO          NUMERIC              null,
   FPG_CONTRATO         TEXT                 null,
   constraint PK_CONTRATO primary key (ID_CONTRATO)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on CONTRATO (
ID_CONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on CONTRATO (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DRON                                                  */
/*==============================================================*/
create table DRON (
   SERIAL_DRON          NUMERIC              not null,
   FABRICANTE_DRON      CHAR(15)             null,
   HORAS_DRON           INT4                 null,
   ADQUISICION_DRON     DATE                 null,
   GARANTIA             BOOL                 null,
   constraint PK_DRON primary key (SERIAL_DRON)
);

/*==============================================================*/
/* Index: DRON_PK                                               */
/*==============================================================*/
create unique index DRON_PK on DRON (
SERIAL_DRON
);

/*==============================================================*/
/* Table: ENCARGADO                                             */
/*==============================================================*/
create table ENCARGADO (
   ID_ENCARGADO         NUMERIC              not null,
   CED_ENCARGADO        VARCHAR(10)          null,
   NOMBRE_ENCARGADO     TEXT                 null,
   APELL_ENCARGADO      TEXT                 null,
   TLF_ENCARGADO        VARCHAR(10)          null,
   INICIO_JORNADA       TIME                 null,
   FIN_JORNADA          TIME                 null,
   NUM_GRABACIONES      NUMERIC              null,
   constraint PK_ENCARGADO primary key (ID_ENCARGADO)
);

/*==============================================================*/
/* Index: ENCARGADO_PK                                          */
/*==============================================================*/
create unique index ENCARGADO_PK on ENCARGADO (
ID_ENCARGADO
);

/*==============================================================*/
/* Table: INCIDENCIA                                            */
/*==============================================================*/
create table INCIDENCIA (
   ID_INCIDENCIA        NUMERIC              not null,
   SERIAL_DRON          NUMERIC              null,
   ID_MANTENIMIENTO     NUMERIC              not null,
   FECHA_INCIDENCIA_    DATE                 null,
   DESCRIP_INCIDENCIA   TEXT                 null,
   constraint PK_INCIDENCIA primary key (ID_INCIDENCIA)
);

/*==============================================================*/
/* Index: INCIDENCIA_PK                                         */
/*==============================================================*/
create unique index INCIDENCIA_PK on INCIDENCIA (
ID_INCIDENCIA
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on INCIDENCIA (
SERIAL_DRON
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on INCIDENCIA (
ID_MANTENIMIENTO
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   ID_MANTENIMIENTO     NUMERIC              not null,
   ID_TECNICO           NUMERIC              not null,
   FECHA_MANTENIMIENTO  DATE                 null,
   CANT_MANTENIMIENTO   INT4                 null,
   constraint PK_MANTENIMIENTO primary key (ID_MANTENIMIENTO)
);

/*==============================================================*/
/* Index: MANTENIMIENTO_PK                                      */
/*==============================================================*/
create unique index MANTENIMIENTO_PK on MANTENIMIENTO (
ID_MANTENIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on MANTENIMIENTO (
ID_TECNICO
);

/*==============================================================*/
/* Table: RELACION_DRON_CONTRATO                                */
/*==============================================================*/
create table RELACION_DRON_CONTRATO (
   SERIAL_DRON          NUMERIC              not null,
   ID_CONTRATO          NUMERIC              not null,
   constraint PK_RELACION_DRON_CONTRATO primary key (SERIAL_DRON, ID_CONTRATO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_6_PK on RELACION_DRON_CONTRATO (
SERIAL_DRON,
ID_CONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on RELACION_DRON_CONTRATO (
ID_CONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on RELACION_DRON_CONTRATO (
SERIAL_DRON
);

/*==============================================================*/
/* Table: RELACION_DRON_ENCARGADO                               */
/*==============================================================*/
create table RELACION_DRON_ENCARGADO (
   SERIAL_DRON          NUMERIC              not null,
   ID_ENCARGADO         NUMERIC              not null,
   constraint PK_RELACION_DRON_ENCARGADO primary key (SERIAL_DRON, ID_ENCARGADO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_1_PK on RELACION_DRON_ENCARGADO (
SERIAL_DRON,
ID_ENCARGADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on RELACION_DRON_ENCARGADO (
ID_ENCARGADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on RELACION_DRON_ENCARGADO (
SERIAL_DRON
);

/*==============================================================*/
/* Table: TECNICO                                               */
/*==============================================================*/
create table TECNICO (
   ID_TECNICO           NUMERIC              not null,
   CED_TECNICO          VARCHAR(10)          null,
   NOM_TECNICO          TEXT                 null,
   APELL_TECNICO        TEXT                 null,
   SEXO_TECNICO         TEXT                 null,
   TLF_TECNICO          VARCHAR(10)          null,
   CANTMANT_TECNICO     INT4                 null,
   constraint PK_TECNICO primary key (ID_TECNICO)
);

/*==============================================================*/
/* Index: TECNICO_PK                                            */
/*==============================================================*/
create unique index TECNICO_PK on TECNICO (
ID_TECNICO
);

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table INCIDENCIA
   add constraint FK_INCIDENC_RELATIONS_DRON foreign key (SERIAL_DRON)
      references DRON (SERIAL_DRON)
      on delete restrict on update restrict;

alter table INCIDENCIA
   add constraint FK_INCIDENC_RELATIONS_MANTENIM foreign key (ID_MANTENIMIENTO)
      references MANTENIMIENTO (ID_MANTENIMIENTO)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_TECNICO foreign key (ID_TECNICO)
      references TECNICO (ID_TECNICO)
      on delete restrict on update restrict;

alter table RELACION_DRON_CONTRATO
   add constraint FK_RELACION_RELATIONS_DRON foreign key (SERIAL_DRON)
      references DRON (SERIAL_DRON)
      on delete restrict on update restrict;

alter table RELACION_DRON_CONTRATO
   add constraint FK_RELACION_RELATIONS_CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO)
      on delete restrict on update restrict;

alter table RELACION_DRON_ENCARGADO
   add constraint FK_RELACION_RELATIONS_DRON foreign key (SERIAL_DRON)
      references DRON (SERIAL_DRON)
      on delete restrict on update restrict;

alter table RELACION_DRON_ENCARGADO
   add constraint FK_RELACION_RELATIONS_ENCARGAD foreign key (ID_ENCARGADO)
      references ENCARGADO (ID_ENCARGADO)
      on delete restrict on update restrict;







