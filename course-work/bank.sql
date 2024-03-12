CREATE TABLE "roles"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "descriptions" TEXT NOT NULL
);
ALTER TABLE
    "roles" ADD PRIMARY KEY("id");
CREATE TABLE "priority2permissions"(
    "priority_id" BIGINT NOT NULL,
    "permission_id" BIGINT NOT NULL
);
CREATE INDEX "priority2permissions_priority_id_index" ON
    "priority2permissions"("priority_id");
CREATE INDEX "priority2permissions_permission_id_index" ON
    "priority2permissions"("permission_id");
CREATE TABLE "permissions"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "permissions" ADD PRIMARY KEY("id");
CREATE TABLE "priorities"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "descriptions" TEXT NOT NULL
);
ALTER TABLE
    "priorities" ADD PRIMARY KEY("id");
CREATE TABLE "permissions2role"(
    "permission_id" BIGINT NOT NULL,
    "role_id" BIGINT NOT NULL
);
CREATE INDEX "permissions2role_permission_id_index" ON
    "permissions2role"("permission_id");
CREATE INDEX "permissions2role_role_id_index" ON
    "permissions2role"("role_id");
CREATE TABLE "employeers"(
    "id" BIGINT NOT NULL,
    "first_name" TEXT NOT NULL,
    "surname" BIGINT NOT NULL,
    "father_name" BIGINT NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "gender" BOOLEAN NOT NULL,
    "citizenship" TEXT NOT NULL,
    "passport_series" TEXT NOT NULL,
    "passport_number" TEXT NOT NULL,
    "date_of_issue" DATE NOT NULL,
    "place_of_issue" TEXT NOT NULL,
    "residential_address" TEXT NOT NULL,
    "role_id" BIGINT NOT NULL
);
ALTER TABLE
    "employeers" ADD PRIMARY KEY("id");
CREATE INDEX "employeers_role_id_index" ON
    "employeers"("role_id");
CREATE TABLE "clients"(
    "id" BIGINT NOT NULL,
    "priority_id" BIGINT NOT NULL,
    "name" BIGINT NOT NULL,
    "surname" BIGINT NOT NULL,
    "father_name" DATE NOT NULL,
    "date_of_birth" BOOLEAN NOT NULL,
    "gender" TEXT NOT NULL,
    "citizenship" TEXT NOT NULL,
    "passport_series" TEXT NOT NULL,
    "passport_number" DATE NOT NULL,
    "date_of_issue" TEXT NOT NULL,
    "place_of_issue" TEXT NOT NULL,
    "residential_address" BIGINT NOT NULL
);
ALTER TABLE
    "clients" ADD PRIMARY KEY("id");
CREATE INDEX "clients_priority_id_index" ON
    "clients"("priority_id");
CREATE TABLE "rules"(
    "id" BIGINT NOT NULL,
    "commission" DOUBLE PRECISION NOT NULL,
    "term" BIGINT NOT NULL,
    "active" BOOLEAN NOT NULL
);
ALTER TABLE
    "rules" ADD PRIMARY KEY("id");
CREATE TABLE "types"(
    "id" BIGINT NOT NULL,
    "name" TEXT NULL,
    "description" TEXT NULL,
    "active" BOOLEAN NOT NULL
);
ALTER TABLE
    "types" ADD PRIMARY KEY("id");
CREATE TABLE "clients2services"(
    "client_id" BIGINT NOT NULL,
    "service_id" BIGINT NOT NULL
);
CREATE INDEX "clients2services_client_id_index" ON
    "clients2services"("client_id");
CREATE INDEX "clients2services_service_id_index" ON
    "clients2services"("service_id");
CREATE TABLE "services"(
    "id" BIGINT NOT NULL,
    "name" TEXT NULL,
    "description" TEXT NULL,
    "type_id" BIGINT NOT NULL,
    "rule_id" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITH
        TIME zone NULL,
        "updated_by" BIGINT NULL,
        "updated_at" TIMESTAMP(0)
    WITH
        TIME zone NULL DEFAULT CURRENT_TIME,
        "deleted_by" BIGINT NOT NULL,
        "deleted_at" BIGINT NOT NULL,
        "column_11" BIGINT NOT NULL,
        "created_by" BIGINT NOT NULL
);
ALTER TABLE
    "services" ADD PRIMARY KEY("id");
CREATE INDEX "services_type_id_index" ON
    "services"("type_id");
CREATE INDEX "services_rule_id_index" ON
    "services"("rule_id");
CREATE INDEX "services_updated_by_index" ON
    "services"("updated_by");
CREATE INDEX "services_created_by_index" ON
    "services"("created_by");
ALTER TABLE
    "permissions2role" ADD CONSTRAINT "permissions2role_role_id_foreign" FOREIGN KEY("role_id") REFERENCES "roles"("id");
ALTER TABLE
    "services" ADD CONSTRAINT "services_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "employeers"("id");
ALTER TABLE
    "employeers" ADD CONSTRAINT "employeers_role_id_foreign" FOREIGN KEY("role_id") REFERENCES "roles"("id");
ALTER TABLE
    "priority2permissions" ADD CONSTRAINT "priority2permissions_priority_id_foreign" FOREIGN KEY("priority_id") REFERENCES "priorities"("id");
ALTER TABLE
    "clients2services" ADD CONSTRAINT "clients2services_service_id_foreign" FOREIGN KEY("service_id") REFERENCES "services"("id");
ALTER TABLE
    "clients2services" ADD CONSTRAINT "clients2services_client_id_foreign" FOREIGN KEY("client_id") REFERENCES "clients"("id");
ALTER TABLE
    "services" ADD CONSTRAINT "services_updated_by_foreign" FOREIGN KEY("updated_by") REFERENCES "employeers"("id");
ALTER TABLE
    "services" ADD CONSTRAINT "services_rule_id_foreign" FOREIGN KEY("rule_id") REFERENCES "rules"("id");
ALTER TABLE
    "services" ADD CONSTRAINT "services_type_id_foreign" FOREIGN KEY("type_id") REFERENCES "types"("id");
ALTER TABLE
    "clients" ADD CONSTRAINT "clients_priority_id_foreign" FOREIGN KEY("priority_id") REFERENCES "priorities"("id");
ALTER TABLE
    "priority2permissions" ADD CONSTRAINT "priority2permissions_permission_id_foreign" FOREIGN KEY("permission_id") REFERENCES "permissions"("id");
ALTER TABLE
    "permissions2role" ADD CONSTRAINT "permissions2role_permission_id_foreign" FOREIGN KEY("permission_id") REFERENCES "permissions"("id");