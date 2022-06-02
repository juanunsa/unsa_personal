-- Device [Device]
create table "APP"."DEVICE" (
   "OID"  integer  not null,
   "DEVICE_ID"  varchar(255),
   "NOTIFICATION_DEVICE_ID"  varchar(255),
   "MODEL"  varchar(255),
   "PLATFORM"  varchar(255),
   "PLATFORM_VERSION"  varchar(255),
   "BROWSER"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER" (
   "USER_ID"  varchar(255)  not null,
   "SECRET_KEY"  varchar(255),
  primary key ("USER_ID")
);


-- Authorized Grant Type [authAgt]
create table "APP"."AUTHORIZED_GRANT_TYPE" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- Application [authApl]
create table "APP"."APPLICATION" (
   "APP_ID"  varchar(255)  not null,
   "REFRESH_TOKEN_VALIDITY"  integer,
   "ACCESS_TOKEN_VALIDITY"  integer,
   "AUTHORITIES"  varchar(255),
   "SECRET"  varchar(255),
   "DESCRIPTION"  varchar(255),
   "NAME"  varchar(255),
   "TYPE"  varchar(255),
  primary key ("APP_ID")
);


-- Approval [authApv]
create table "APP"."APPROVAL" (
   "UPDATED_AT"  timestamp,
   "EXPIRATION_DATE"  timestamp,
   "STATUS"  varchar(255),
   "SCOPE"  varchar(255),
   "OID"  integer  not null,
  primary key ("OID")
);


-- Claim [authClaim]
create table "APP"."CLAIM" (
   "OID"  integer  not null,
   "KEY"  varchar(255),
   "VALUE"  varchar(1000),
  primary key ("OID")
);


-- Code [authCod]
create table "APP"."CODE" (
   "CODE"  varchar(255)  not null,
   "AUTHENTICATION"  varchar(255),
   "CREATION_DATE"  timestamp,
  primary key ("CODE")
);


-- Identity [authIdy]
create table "APP"."IDENTITY" (
   "EXPIRED"  smallint,
   "LOCKED"  smallint,
   "PASSWORD"  varchar(255),
   "USER_ID"  varchar(255)  not null,
   "DISABLED"  smallint,
   "ATTEMPTS_NUMBER"  integer,
   "PASSWORD_EXPIRATION_DATE"  timestamp,
   "EMAIL"  varchar(255),
   "AUTH_ADMIN"  smallint,
   "FIRST_NAME"  varchar(255),
   "LAST_NAME"  varchar(255),
  primary key ("USER_ID")
);


-- Refresh Token [authRft]
create table "APP"."REFRESH_TOKEN" (
   "OID"  integer  not null,
   "TOKEN"  varchar(1000),
   "EXPIRATION_DATE"  timestamp,
  primary key ("OID")
);


-- Authorized Resource [authRsc]
create table "APP"."AUTHORIZED_RESOURCE" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- Scope [authScp]
create table "APP"."SCOPE" (
   "OID"  integer  not null,
   "AUTO_APPROVE"  smallint,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- Facultad [cls10]
create table "APP"."FACULTAD" (
   "OID"  integer  not null,
   "NOMBRE"  varchar(255),
  primary key ("OID")
);


-- Carrera [cls11]
create table "APP"."CARRERA" (
   "OID"  integer  not null,
   "NOMBRE"  varchar(255),
  primary key ("OID")
);


-- materia [cls12]
create table "APP"."MATERIA" (
   "OID"  integer  not null,
   "NOMBRE"  varchar(255),
  primary key ("OID")
);


-- Tribunal [cls13]
create table "APP"."TRIBUNAL" (
   "OID"  integer  not null,
   "TITULAR"  integer,
   "TITULAR2"  integer,
   "TITULAR3"  integer,
   "SUPLENTE1"  integer,
   "SUPLENTE2"  integer,
   "SUPLENTE3"  integer,
   "PEDIDO"  integer,
  primary key ("OID")
);


-- Pedido [cls14]
create table "APP"."PEDIDO" (
   "OID"  integer  not null,
   "CARGO"  varchar(255),
   "MATERIA"  integer,
   "CATEGORIA"  varchar(255),
   "TRIBUNAL"  integer,
  primary key ("OID")
);


-- AuthorizedGrantType_Application [authAgt_Apl]
alter table "APP"."AUTHORIZED_GRANT_TYPE"  add column  "APPLICATION_APP_ID"  varchar(255);
alter table "APP"."AUTHORIZED_GRANT_TYPE"   add constraint FK_AUTHORIZED_GRANT_TYPE_APPLI foreign key ("APPLICATION_APP_ID") references "APP"."APPLICATION" ("APP_ID");


-- Approval_Application [authApv_Apl]
alter table "APP"."APPROVAL"  add column  "APPLICATION_APP_ID"  varchar(255);
alter table "APP"."APPROVAL"   add constraint FK_APPROVAL_APPLICATION foreign key ("APPLICATION_APP_ID") references "APP"."APPLICATION" ("APP_ID");


-- Approval_Identity [authApv_Idy]
alter table "APP"."APPROVAL"  add column  "IDENTITY_USER_ID"  varchar(255);
alter table "APP"."APPROVAL"   add constraint FK_APPROVAL_IDENTITY foreign key ("IDENTITY_USER_ID") references "APP"."IDENTITY" ("USER_ID");


-- Claim_Identity [authClaim_Idy]
create table "APP"."CLAIM_IDENTITY" (
   "CLAIM_OID"  integer not null,
   "IDENTITY_USER_ID"  varchar(255) not null,
  primary key ("CLAIM_OID", "IDENTITY_USER_ID")
);
alter table "APP"."CLAIM_IDENTITY"   add constraint FK_CLAIM_IDENTITY_CLAIM foreign key ("CLAIM_OID") references "APP"."CLAIM" ("OID");
alter table "APP"."CLAIM_IDENTITY"   add constraint FK_CLAIM_IDENTITY_IDENTITY foreign key ("IDENTITY_USER_ID") references "APP"."IDENTITY" ("USER_ID");


-- Device_Application [authDevice_Apl]
alter table "APP"."DEVICE"  add column  "APPLICATION_APP_ID"  varchar(255);
alter table "APP"."DEVICE"   add constraint FK_DEVICE_APPLICATION foreign key ("APPLICATION_APP_ID") references "APP"."APPLICATION" ("APP_ID");


-- Device_Identity [authDevice_Idy]
alter table "APP"."DEVICE"  add column  "IDENTITY_USER_ID"  varchar(255);
alter table "APP"."DEVICE"   add constraint FK_DEVICE_IDENTITY foreign key ("IDENTITY_USER_ID") references "APP"."IDENTITY" ("USER_ID");


-- RefreshToken_Application [authRft_Apl]
alter table "APP"."REFRESH_TOKEN"  add column  "APPLICATION_APP_ID"  varchar(255);
alter table "APP"."REFRESH_TOKEN"   add constraint FK_REFRESH_TOKEN_APPLICATION foreign key ("APPLICATION_APP_ID") references "APP"."APPLICATION" ("APP_ID");


-- RefreshToken_Identity [authRft_Idy]
alter table "APP"."REFRESH_TOKEN"  add column  "IDENTITY_USER_ID"  varchar(255);
alter table "APP"."REFRESH_TOKEN"   add constraint FK_REFRESH_TOKEN_IDENTITY foreign key ("IDENTITY_USER_ID") references "APP"."IDENTITY" ("USER_ID");


-- AuthorizedResource_Application [authRsc_Apl]
alter table "APP"."AUTHORIZED_RESOURCE"  add column  "APPLICATION_APP_ID"  varchar(255);
alter table "APP"."AUTHORIZED_RESOURCE"   add constraint FK_AUTHORIZED_RESOURCE_APPLICA foreign key ("APPLICATION_APP_ID") references "APP"."APPLICATION" ("APP_ID");


-- Scope_Application [authScp_Apl]
alter table "APP"."SCOPE"  add column  "APPLICATION_APP_ID"  varchar(255);
alter table "APP"."SCOPE"   add constraint FK_SCOPE_APPLICATION foreign key ("APPLICATION_APP_ID") references "APP"."APPLICATION" ("APP_ID");


