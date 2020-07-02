--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 12.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- Name: Competency; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."Competency" (
    id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL
);


ALTER TABLE public."Competency" OWNER TO harshit;

--
-- Name: Transcriber; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."Transcriber" (
    email text NOT NULL,
    "firstName" text NOT NULL,
    id text NOT NULL,
    "lastName" text NOT NULL
);


ALTER TABLE public."Transcriber" OWNER TO harshit;

--
-- Name: TranscriberCompetency; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."TranscriberCompetency" (
    "competencyId" text NOT NULL,
    id text NOT NULL,
    level integer NOT NULL,
    "transcriberId" text NOT NULL
);


ALTER TABLE public."TranscriberCompetency" OWNER TO harshit;

--
-- Name: _Migration; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."_Migration" (
    revision integer NOT NULL,
    name text NOT NULL,
    datamodel text NOT NULL,
    status text NOT NULL,
    applied integer NOT NULL,
    rolled_back integer NOT NULL,
    datamodel_steps text NOT NULL,
    database_migration text NOT NULL,
    errors text NOT NULL,
    started_at timestamp(3) without time zone NOT NULL,
    finished_at timestamp(3) without time zone
);


ALTER TABLE public."_Migration" OWNER TO harshit;

--
-- Name: _Migration_revision_seq; Type: SEQUENCE; Schema: public; Owner: harshit
--

CREATE SEQUENCE public."_Migration_revision_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."_Migration_revision_seq" OWNER TO harshit;

--
-- Name: _Migration_revision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harshit
--

ALTER SEQUENCE public."_Migration_revision_seq" OWNED BY public."_Migration".revision;


--
-- Name: _Migration revision; Type: DEFAULT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."_Migration" ALTER COLUMN revision SET DEFAULT nextval('public."_Migration_revision_seq"'::regclass);


--
-- Data for Name: Competency; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."Competency" (id, name, type) FROM stdin;
one_comp	Comp 1 	COMP_ONE
\.


--
-- Data for Name: Transcriber; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."Transcriber" (email, "firstName", id, "lastName") FROM stdin;
test1@test.com	Tester 1	one	Tester 1
test2@test.com	Tester 2 	two	Tester 2
\.


--
-- Data for Name: TranscriberCompetency; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."TranscriberCompetency" ("competencyId", id, level, "transcriberId") FROM stdin;
one_comp	one_link	1	one
\.


--
-- Data for Name: _Migration; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."_Migration" (revision, name, datamodel, status, applied, rolled_back, datamodel_steps, database_migration, errors, started_at, finished_at) FROM stdin;
1	20200703013952-init	datasource db {\n  provider = "postgresql"\n  url      = "***"\n}\n\nmodel Transcriber {\n  id           String                  @id @default(cuid())\n  email        String                  @unique\n  firstName    String\n  lastName     String\n  competencies TranscriberCompetency[]\n}\n\nmodel TranscriberCompetency {\n  id            String      @id @default(cuid())\n  transcriber   Transcriber @relation(fields: [transcriberId], references: [id])\n  transcriberId String\n  competency    Competency  @relation(fields: [competencyId], references: [id])\n  competencyId  String\n  level         Int\n\n  @@unique([transcriberId, competencyId])\n}\n\nmodel Competency {\n  id                      String                  @id @default(cuid())\n  type                    String\n  name                    String                  @unique\n  transcriberCompetencies TranscriberCompetency[]\n}	MigrationSuccess	7	0	[{"tag":"CreateSource","source":"db"},{"tag":"CreateArgument","location":{"tag":"Source","source":"db"},"argument":"provider","value":"\\"postgresql\\""},{"tag":"CreateArgument","location":{"tag":"Source","source":"db"},"argument":"url","value":"\\"***\\""},{"tag":"CreateModel","model":"Transcriber"},{"tag":"CreateField","model":"Transcriber","field":"id","type":"String","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Transcriber","field":"id"},"directive":"id"}},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Transcriber","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Transcriber","field":"id"},"directive":"default"},"argument":"","value":"cuid()"},{"tag":"CreateField","model":"Transcriber","field":"email","type":"String","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Transcriber","field":"email"},"directive":"unique"}},{"tag":"CreateField","model":"Transcriber","field":"firstName","type":"String","arity":"Required"},{"tag":"CreateField","model":"Transcriber","field":"lastName","type":"String","arity":"Required"},{"tag":"CreateField","model":"Transcriber","field":"competencies","type":"TranscriberCompetency","arity":"List"},{"tag":"CreateModel","model":"TranscriberCompetency"},{"tag":"CreateField","model":"TranscriberCompetency","field":"id","type":"String","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"TranscriberCompetency","field":"id"},"directive":"id"}},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"TranscriberCompetency","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"TranscriberCompetency","field":"id"},"directive":"default"},"argument":"","value":"cuid()"},{"tag":"CreateField","model":"TranscriberCompetency","field":"transcriber","type":"Transcriber","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"TranscriberCompetency","field":"transcriber"},"directive":"relation"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"TranscriberCompetency","field":"transcriber"},"directive":"relation"},"argument":"fields","value":"[transcriberId]"},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"TranscriberCompetency","field":"transcriber"},"directive":"relation"},"argument":"references","value":"[id]"},{"tag":"CreateField","model":"TranscriberCompetency","field":"transcriberId","type":"String","arity":"Required"},{"tag":"CreateField","model":"TranscriberCompetency","field":"competency","type":"Competency","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"TranscriberCompetency","field":"competency"},"directive":"relation"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"TranscriberCompetency","field":"competency"},"directive":"relation"},"argument":"fields","value":"[competencyId]"},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"TranscriberCompetency","field":"competency"},"directive":"relation"},"argument":"references","value":"[id]"},{"tag":"CreateField","model":"TranscriberCompetency","field":"competencyId","type":"String","arity":"Required"},{"tag":"CreateField","model":"TranscriberCompetency","field":"level","type":"Int","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Model","model":"TranscriberCompetency","arguments":[{"name":"","value":"[transcriberId, competencyId]"}]},"directive":"unique"}},{"tag":"CreateModel","model":"Competency"},{"tag":"CreateField","model":"Competency","field":"id","type":"String","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Competency","field":"id"},"directive":"id"}},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Competency","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Competency","field":"id"},"directive":"default"},"argument":"","value":"cuid()"},{"tag":"CreateField","model":"Competency","field":"type","type":"String","arity":"Required"},{"tag":"CreateField","model":"Competency","field":"name","type":"String","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Competency","field":"name"},"directive":"unique"}},{"tag":"CreateField","model":"Competency","field":"transcriberCompetencies","type":"TranscriberCompetency","arity":"List"}]	{"before":{"tables":[{"name":"_Migration","columns":[{"name":"applied","tpe":{"dataType":"integer","fullDataType":"int4","characterMaximumLength":null,"family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"database_migration","tpe":{"dataType":"text","fullDataType":"text","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"datamodel","tpe":{"dataType":"text","fullDataType":"text","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"datamodel_steps","tpe":{"dataType":"text","fullDataType":"text","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"errors","tpe":{"dataType":"text","fullDataType":"text","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"finished_at","tpe":{"dataType":"timestamp without time zone","fullDataType":"timestamp","characterMaximumLength":null,"family":"dateTime","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"name","tpe":{"dataType":"text","fullDataType":"text","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"revision","tpe":{"dataType":"integer","fullDataType":"int4","characterMaximumLength":null,"family":"int","arity":"required"},"default":{"SEQUENCE":"nextval('\\"_Migration_revision_seq\\"'::regclass)"},"autoIncrement":true},{"name":"rolled_back","tpe":{"dataType":"integer","fullDataType":"int4","characterMaximumLength":null,"family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"started_at","tpe":{"dataType":"timestamp without time zone","fullDataType":"timestamp","characterMaximumLength":null,"family":"dateTime","arity":"required"},"default":null,"autoIncrement":false},{"name":"status","tpe":{"dataType":"text","fullDataType":"text","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["revision"],"sequence":{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1},"constraintName":"_Migration_pkey"},"foreignKeys":[]}],"enums":[],"sequences":[{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1}]},"after":{"tables":[{"name":"Transcriber","columns":[{"name":"email","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"firstName","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"lastName","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"Transcriber.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[]},{"name":"TranscriberCompetency","columns":[{"name":"competencyId","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"level","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"transcriberId","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"TranscriberCompetency.transcriberId_competencyId","columns":["transcriberId","competencyId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[{"constraintName":null,"columns":["transcriberId"],"referencedTable":"Transcriber","referencedColumns":["id"],"onDeleteAction":"cascade"},{"constraintName":null,"columns":["competencyId"],"referencedTable":"Competency","referencedColumns":["id"],"onDeleteAction":"cascade"}]},{"name":"Competency","columns":[{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"name","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"type","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"Competency.name","columns":["name"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[]}],"enums":[],"sequences":[]},"original_steps":[{"CreateTable":{"table":{"name":"Transcriber","columns":[{"name":"email","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"firstName","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"lastName","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"Transcriber.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"TranscriberCompetency","columns":[{"name":"competencyId","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"level","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"transcriberId","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"TranscriberCompetency.transcriberId_competencyId","columns":["transcriberId","competencyId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[{"constraintName":null,"columns":["transcriberId"],"referencedTable":"Transcriber","referencedColumns":["id"],"onDeleteAction":"cascade"},{"constraintName":null,"columns":["competencyId"],"referencedTable":"Competency","referencedColumns":["id"],"onDeleteAction":"cascade"}]}}},{"CreateTable":{"table":{"name":"Competency","columns":[{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"name","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"type","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"Competency.name","columns":["name"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[]}}},{"CreateIndex":{"table":"Transcriber","index":{"name":"Transcriber.email","columns":["email"],"tpe":"unique"}}},{"CreateIndex":{"table":"TranscriberCompetency","index":{"name":"TranscriberCompetency.transcriberId_competencyId","columns":["transcriberId","competencyId"],"tpe":"unique"}}},{"CreateIndex":{"table":"Competency","index":{"name":"Competency.name","columns":["name"],"tpe":"unique"}}},{"AddForeignKey":{"table":"TranscriberCompetency","foreign_key":{"constraintName":null,"columns":["transcriberId"],"referencedTable":"Transcriber","referencedColumns":["id"],"onDeleteAction":"cascade"}}},{"AddForeignKey":{"table":"TranscriberCompetency","foreign_key":{"constraintName":null,"columns":["competencyId"],"referencedTable":"Competency","referencedColumns":["id"],"onDeleteAction":"cascade"}}}],"corrected_steps":[{"CreateTable":{"table":{"name":"Transcriber","columns":[{"name":"email","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"firstName","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"lastName","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"Transcriber.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"TranscriberCompetency","columns":[{"name":"competencyId","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"level","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"transcriberId","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"TranscriberCompetency.transcriberId_competencyId","columns":["transcriberId","competencyId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[{"constraintName":null,"columns":["transcriberId"],"referencedTable":"Transcriber","referencedColumns":["id"],"onDeleteAction":"cascade"},{"constraintName":null,"columns":["competencyId"],"referencedTable":"Competency","referencedColumns":["id"],"onDeleteAction":"cascade"}]}}},{"CreateTable":{"table":{"name":"Competency","columns":[{"name":"id","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"name","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"type","tpe":{"dataType":"","fullDataType":"","characterMaximumLength":null,"family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[{"name":"Competency.name","columns":["name"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null,"constraintName":null},"foreignKeys":[]}}},{"CreateIndex":{"table":"Transcriber","index":{"name":"Transcriber.email","columns":["email"],"tpe":"unique"}}},{"CreateIndex":{"table":"TranscriberCompetency","index":{"name":"TranscriberCompetency.transcriberId_competencyId","columns":["transcriberId","competencyId"],"tpe":"unique"}}},{"CreateIndex":{"table":"Competency","index":{"name":"Competency.name","columns":["name"],"tpe":"unique"}}},{"AddForeignKey":{"table":"TranscriberCompetency","foreign_key":{"constraintName":null,"columns":["transcriberId"],"referencedTable":"Transcriber","referencedColumns":["id"],"onDeleteAction":"cascade"}}},{"AddForeignKey":{"table":"TranscriberCompetency","foreign_key":{"constraintName":null,"columns":["competencyId"],"referencedTable":"Competency","referencedColumns":["id"],"onDeleteAction":"cascade"}}}],"rollback":[{"DropTable":{"name":"Transcriber"}},{"DropTable":{"name":"TranscriberCompetency"}},{"DropTable":{"name":"Competency"}}]}	[]	2020-07-02 20:09:58.455	2020-07-02 20:09:58.477
\.


--
-- Name: _Migration_revision_seq; Type: SEQUENCE SET; Schema: public; Owner: harshit
--

SELECT pg_catalog.setval('public."_Migration_revision_seq"', 1, true);


--
-- Name: Competency Competency_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Competency"
    ADD CONSTRAINT "Competency_pkey" PRIMARY KEY (id);


--
-- Name: TranscriberCompetency TranscriberCompetency_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."TranscriberCompetency"
    ADD CONSTRAINT "TranscriberCompetency_pkey" PRIMARY KEY (id);


--
-- Name: Transcriber Transcriber_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Transcriber"
    ADD CONSTRAINT "Transcriber_pkey" PRIMARY KEY (id);


--
-- Name: _Migration _Migration_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."_Migration"
    ADD CONSTRAINT "_Migration_pkey" PRIMARY KEY (revision);


--
-- Name: Competency.name; Type: INDEX; Schema: public; Owner: harshit
--

CREATE UNIQUE INDEX "Competency.name" ON public."Competency" USING btree (name);


--
-- Name: Transcriber.email; Type: INDEX; Schema: public; Owner: harshit
--

CREATE UNIQUE INDEX "Transcriber.email" ON public."Transcriber" USING btree (email);


--
-- Name: TranscriberCompetency.transcriberId_competencyId; Type: INDEX; Schema: public; Owner: harshit
--

CREATE UNIQUE INDEX "TranscriberCompetency.transcriberId_competencyId" ON public."TranscriberCompetency" USING btree ("transcriberId", "competencyId");


--
-- Name: TranscriberCompetency TranscriberCompetency_competencyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."TranscriberCompetency"
    ADD CONSTRAINT "TranscriberCompetency_competencyId_fkey" FOREIGN KEY ("competencyId") REFERENCES public."Competency"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TranscriberCompetency TranscriberCompetency_transcriberId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."TranscriberCompetency"
    ADD CONSTRAINT "TranscriberCompetency_transcriberId_fkey" FOREIGN KEY ("transcriberId") REFERENCES public."Transcriber"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

