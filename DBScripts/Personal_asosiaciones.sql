-- Facultad_Carrera [as6]
alter table "APP"."CARRERA"  add column  "FACULTAD_OID"  integer;
alter table "APP"."CARRERA"   add constraint FK_CARRERA_FACULTAD foreign key ("FACULTAD_OID") references "APP"."FACULTAD" ("OID");


-- Carrera_materia [as7]
alter table "APP"."MATERIA"  add column  "CARRERA_OID"  integer;
alter table "APP"."MATERIA"   add constraint FK_MATERIA_CARRERA foreign key ("CARRERA_OID") references "APP"."CARRERA" ("OID");


-- Tribunal_Pedido [as8]
alter table "APP"."PEDIDO"  add column  "TRIBUNAL_OID"  integer;
alter table "APP"."PEDIDO"   add constraint FK_PEDIDO_TRIBUNAL foreign key ("TRIBUNAL_OID") references "APP"."TRIBUNAL" ("OID");


