-- Class Services Mapping
create table APP.WR_DELETE_HISTORY(
  OID  integer not null,
  OBJECT_ID varchar(200) not null,
  CLASS_ID varchar(32) not null,
  DELETED_AT timestamp not null,
  primary key (OID));


