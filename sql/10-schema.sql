
CREATE TABLE country (
  country_code char(2) PRIMARY KEY NOT NULL,
  country_name text NOT NULL
);

CREATE TABLE institution (
  institution_uuid uuid PRIMARY KEY NOT NULL,
  institution_name text NOT NULL,
  institution_country_code char(2) NOT NULL REFERENCES country(country_code)
);

CREATE TABLE ip_range (
  ip_range_value cidr PRIMARY KEY NOT NULL,
  institution_uuid uuid NOT NULL REFERENCES institution(institution_uuid)
);

CREATE TABLE contact (
  contact_name text PRIMARY KEY NOT NULL,
  contact_email_address text NULL,
  contact_notes text NULL,
  institution_uuid uuid NOT NULL REFERENCES institution(institution_uuid)
);

CREATE TABLE institution_relation (
  ir_parent_id uuid NOT NULL REFERENCES institution(institution_uuid),
  ir_child_id uuid NOT NULL REFERENCES institution(institution_uuid),
  PRIMARY KEY (ir_parent_id, ir_child_id),
  CONSTRAINT no_self_referencing CHECK (ir_parent_id <> ir_child_id)
);

