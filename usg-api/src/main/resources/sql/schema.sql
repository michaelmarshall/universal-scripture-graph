create table nodes (
  id bigserial primary key,
  type varchar(64) not null,
  props jsonb
);

create table relationships (
  id bigserial primary key,
  from_id bigint not null,
  to_id bigint not null
);