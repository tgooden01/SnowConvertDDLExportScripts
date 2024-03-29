--DROP TABLE adventureworks2012_person.stateprovince;
CREATE TABLE IF NOT EXISTS adventureworks2012_person.stateprovince
(
	stateprovinceid INTEGER NOT NULL DEFAULT "identity"(144351, 0, '1,1'::text) ENCODE az64
	,stateprovincecode VARCHAR(9) NOT NULL  ENCODE zstd
	,countryregioncode VARCHAR(9) NOT NULL  ENCODE zstd
	,isonlystateprovinceflag BOOLEAN NOT NULL DEFAULT 1 ENCODE zstd
	,name VARCHAR(150) NOT NULL  ENCODE zstd
	,territoryid INTEGER NOT NULL  ENCODE az64
	,rowguid VARCHAR(36) NOT NULL  ENCODE zstd
	,modifieddate TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT ('now'::text)::timestamp without time zone ENCODE az64
	,PRIMARY KEY (stateprovinceid)
)
DISTSTYLE KEY
 DISTKEY (stateprovinceid)
;
