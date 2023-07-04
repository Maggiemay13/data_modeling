-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "medical_center_visit" (
    "visit_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "notes" string   NOT NULL,
    CONSTRAINT "pk_medical_center_visit" PRIMARY KEY (
        "visit_id"
     )
);

CREATE TABLE "doctor" (
    "doctor_id" int   NOT NULL,
    "doctor_name" string   NOT NULL,
    "specality" string   NOT NULL,
    CONSTRAINT "pk_doctor" PRIMARY KEY (
        "doctor_id"
     ),
    CONSTRAINT "uc_doctor_doctor_name" UNIQUE (
        "doctor_name"
    )
);

CREATE TABLE "patient" (
    "patient_id" int   NOT NULL,
    "patient_name" string   NOT NULL,
    "patient_contact_number" string   NOT NULL,
    "insurance" string   NOT NULL,
    "patient_address" string   NOT NULL,
    CONSTRAINT "pk_patient" PRIMARY KEY (
        "patient_id"
     )
);

CREATE TABLE "disease" (
    "disease_id" int   NOT NULL,
    "disease_name" string   NOT NULL,
    "disease_description" string   NOT NULL,
    CONSTRAINT "pk_disease" PRIMARY KEY (
        "disease_id"
     )
);

CREATE TABLE "diagnoses" (
    "diagnoses_id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "notes" string   NOT NULL,
    CONSTRAINT "pk_diagnoses" PRIMARY KEY (
        "diagnoses_id"
     )
);

ALTER TABLE "medical_center_visit" ADD CONSTRAINT "fk_medical_center_visit_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "doctor" ("doctor_id");

ALTER TABLE "medical_center_visit" ADD CONSTRAINT "fk_medical_center_visit_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patient" ("patient_id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "medical_center_visit" ("visit_id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "disease" ("disease_id");

