-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-02-06 13:30:18 KST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE BODEGA 
    ( 
     Cantidad_Producto             NUMBER (1000)  NOT NULL , 
     Nombre_Producto               VARCHAR2 (50)  NOT NULL , 
     PRODUCTO_ID_Producto          VARCHAR2 (5)  NOT NULL , 
     PRODUCTO_SUCURSAL_ID_Sucursal VARCHAR2 (5)  NOT NULL 
    ) 
;

CREATE TABLE BOLETA 
    ( 
     ID_Boleta                  VARCHAR2 (10)  NOT NULL , 
     Num_Boleta                 NUMBER (5)  NOT NULL , 
     CLIENTE_ID_Cliente         VARCHAR2 (10)  NOT NULL , 
     DETALLE_BOLETA_ID_Sucursal VARCHAR2 (5)  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX BOLETA__IDX ON BOLETA 
    ( 
     DETALLE_BOLETA_ID_Sucursal ASC 
    ) 
;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_PK PRIMARY KEY ( ID_Boleta ) ;

CREATE TABLE CLIENTE 
    ( 
     ID_Cliente              VARCHAR2 (10)  NOT NULL , 
     Primer_Nombre           VARCHAR2 (15)  NOT NULL , 
     Apellido_Paterno        VARCHAR2 (15)  NOT NULL , 
     COMUNA_ID_Comuna        VARCHAR2 (5)  NOT NULL , 
     COMUNA_REGION_ID_Region VARCHAR2 (10)  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( ID_Cliente ) ;

CREATE TABLE COMUNA 
    ( 
     ID_Comuna        VARCHAR2 (5)  NOT NULL , 
     Nombre_Comuna    VARCHAR2 (50)  NOT NULL , 
     REGION_ID_Region VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( ID_Comuna, REGION_ID_Region ) ;

CREATE TABLE DETALLE_BOLETA 
    ( 
     ID_Sucursal        VARCHAR2 (5)  NOT NULL , 
     Fecha_Emision      DATE  NOT NULL , 
     Cantidad_Productos NUMBER (1000)  NOT NULL , 
     Nombre_Producto    VARCHAR2 (20)  NOT NULL , 
     Valor_Unitario     NUMBER  NOT NULL , 
     BOLETA_ID_Boleta   VARCHAR2 (10)  NOT NULL , 
     BOLETA_ID_Boleta2  VARCHAR2 (10)  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX DETALLE_BOLETA__IDX ON DETALLE_BOLETA 
    ( 
     BOLETA_ID_Boleta ASC 
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_PK PRIMARY KEY ( ID_Sucursal ) ;

CREATE TABLE EMAIL 
    ( 
     Email_1                VARCHAR2 (30)  NOT NULL , 
     Email_2                VARCHAR2 (30)  NOT NULL , 
     PROVEEDOR_PROVEEDOR_ID NUMBER  NOT NULL 
    ) 
;

CREATE TABLE MARCA 
    ( 
     ID_Marca     VARCHAR2 (5)  NOT NULL , 
     Nombre_Marca VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE MARCA 
    ADD CONSTRAINT MARCA_PK PRIMARY KEY ( ID_Marca ) ;

CREATE TABLE MODELO 
    ( 
     ID_Modelo                     VARCHAR2 (10)  NOT NULL , 
     Nombre_Modelo                 VARCHAR2 (20)  NOT NULL , 
     Descripcion_Modelo            VARCHAR2 (50) , 
     PRODUCTO_ID_Producto          VARCHAR2 (10)  NOT NULL , 
     MARCA_ID_Marca                VARCHAR2 (10)  NOT NULL , 
     PRODUCTO_SUCURSAL_ID_Sucursal VARCHAR2 (10)  NOT NULL 
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_PK PRIMARY KEY ( ID_Modelo ) ;

CREATE TABLE PERSONA_NATURAL 
    ( 
     PROVEEDOR_PROVEEDOR_ID NUMBER  NOT NULL , 
     Primer_Nombre          VARCHAR2 (20)  NOT NULL , 
     Apellido_Paterno       VARCHAR2 (20)  NOT NULL , 
     Rut                    VARCHAR2 (9)  NOT NULL , 
     Digito_Verificador     CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE PERSONA_NATURAL 
    ADD CONSTRAINT PERSONA_NATURAL_PK PRIMARY KEY ( PROVEEDOR_PROVEEDOR_ID ) ;

ALTER TABLE PERSONA_NATURAL 
    ADD CONSTRAINT PERSONA_NATURAL_Rut_UN UNIQUE ( Rut ) ;

CREATE TABLE PRODUCTO 
    ( 
     ID_Producto            VARCHAR2 (5)  NOT NULL , 
     Nombre_Producto        VARCHAR2 (20)  NOT NULL , 
     Categoria_Producto     VARCHAR2 (20)  NOT NULL , 
     Descripcion_Producto   VARCHAR2 (50) , 
     Marca_Producto         VARCHAR2 (20)  NOT NULL , 
     Valor_Producto         NUMBER  NOT NULL , 
     Fecha_Vencimiento      DATE  NOT NULL , 
     CLIENTE_ID_Cliente     VARCHAR2 (10)  NOT NULL , 
     SUCURSAL_ID_Sucursal   VARCHAR2 (5)  NOT NULL , 
     Cantidad               NUMBER (1000)  NOT NULL , 
     PROVEEDOR_PROVEEDOR_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( ID_Producto, SUCURSAL_ID_Sucursal ) ;

CREATE TABLE PROVEEDOR 
    ( 
     PROVEEDOR_ID            NUMBER  NOT NULL , 
     Calle_Direccion         VARCHAR2 (50)  NOT NULL , 
     Codigo_Postal           VARCHAR2 (10)  NOT NULL , 
     Tipo_Proveedor          VARCHAR2 (20)  NOT NULL , 
     COMUNA_ID_Comuna        VARCHAR2 (5)  NOT NULL , 
     COMUNA_REGION_ID_Region VARCHAR2 (10)  NOT NULL 
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( PROVEEDOR_ID ) ;

CREATE TABLE RAZON_SOCIAL 
    ( 
     PROVEEDOR_PROVEEDOR_ID NUMBER  NOT NULL , 
     Razon_Social           VARCHAR2 (10)  NOT NULL , 
     Rut_Empresa            VARCHAR2 (11)  NOT NULL , 
     Website                VARCHAR2 (40) 
    ) 
;

ALTER TABLE RAZON_SOCIAL 
    ADD CONSTRAINT RAZON_SOCIAL_PK PRIMARY KEY ( PROVEEDOR_PROVEEDOR_ID ) ;

ALTER TABLE RAZON_SOCIAL 
    ADD CONSTRAINT RAZON_SOCIAL_Rut_Empresa_UN UNIQUE ( Rut_Empresa ) ;

CREATE TABLE REGION 
    ( 
     ID_Region     VARCHAR2 (20)  NOT NULL , 
     Nombre_Region VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_PK PRIMARY KEY ( ID_Region ) ;

CREATE TABLE SUCURSAL 
    ( 
     ID_Sucursal             VARCHAR2 (5)  NOT NULL , 
     Cod_Sucursal            VARCHAR2 (10)  NOT NULL , 
     Nombre_Sucursal         VARCHAR2 (50)  NOT NULL , 
     COMUNA_ID_Comuna        VARCHAR2 (5)  NOT NULL , 
     COMUNA_REGION_ID_Region VARCHAR2 (10)  NOT NULL 
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( ID_Sucursal ) ;

CREATE TABLE TELEFONO 
    ( 
     Telefono_1             NUMBER (10)  NOT NULL , 
     Telefono_2             NUMBER (10)  NOT NULL , 
     PROVEEDOR_PROVEEDOR_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE BODEGA 
    ADD CONSTRAINT BODEGA_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_ID_Producto,
     PRODUCTO_SUCURSAL_ID_Sucursal
    ) 
    REFERENCES PRODUCTO 
    ( 
     ID_Producto,
     SUCURSAL_ID_Sucursal
    ) 
;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_ID_Cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     ID_Cliente
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_ID_Comuna,
     COMUNA_REGION_ID_Region
    ) 
    REFERENCES COMUNA 
    ( 
     ID_Comuna,
     REGION_ID_Region
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_REGION_FK FOREIGN KEY 
    ( 
     REGION_ID_Region
    ) 
    REFERENCES REGION 
    ( 
     ID_Region
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_BOLETA_FK FOREIGN KEY 
    ( 
     BOLETA_ID_Boleta2
    ) 
    REFERENCES BOLETA 
    ( 
     ID_Boleta
    ) 
;

ALTER TABLE EMAIL 
    ADD CONSTRAINT EMAIL_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_PROVEEDOR_ID
    ) 
    REFERENCES PROVEEDOR 
    ( 
     PROVEEDOR_ID
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_MARCA_FK FOREIGN KEY 
    ( 
     MARCA_ID_Marca
    ) 
    REFERENCES MARCA 
    ( 
     ID_Marca
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_ID_Producto,
     PRODUCTO_SUCURSAL_ID_Sucursal
    ) 
    REFERENCES PRODUCTO 
    ( 
     ID_Producto,
     SUCURSAL_ID_Sucursal
    ) 
;

ALTER TABLE PERSONA_NATURAL 
    ADD CONSTRAINT PERSONA_NATURAL_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_PROVEEDOR_ID
    ) 
    REFERENCES PROVEEDOR 
    ( 
     PROVEEDOR_ID
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_ID_Cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     ID_Cliente
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_PROVEEDOR_ID
    ) 
    REFERENCES PROVEEDOR 
    ( 
     PROVEEDOR_ID
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_SUCURSAL_FK FOREIGN KEY 
    ( 
     SUCURSAL_ID_Sucursal
    ) 
    REFERENCES SUCURSAL 
    ( 
     ID_Sucursal
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_ID_Comuna,
     COMUNA_REGION_ID_Region
    ) 
    REFERENCES COMUNA 
    ( 
     ID_Comuna,
     REGION_ID_Region
    ) 
;

ALTER TABLE RAZON_SOCIAL 
    ADD CONSTRAINT RAZON_SOCIAL_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_PROVEEDOR_ID
    ) 
    REFERENCES PROVEEDOR 
    ( 
     PROVEEDOR_ID
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_ID_Comuna,
     COMUNA_REGION_ID_Region
    ) 
    REFERENCES COMUNA 
    ( 
     ID_Comuna,
     REGION_ID_Region
    ) 
;

ALTER TABLE TELEFONO 
    ADD CONSTRAINT TELEFONO_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_PROVEEDOR_ID
    ) 
    REFERENCES PROVEEDOR 
    ( 
     PROVEEDOR_ID
    ) 
;

CREATE OR REPLACE TRIGGER FKNTM_DETALLE_BOLETA 
BEFORE UPDATE OF BOLETA_ID_Boleta2 
ON DETALLE_BOLETA 
BEGIN 
  raise_application_error(-20225,'Non Transferable FK constraint  on table DETALLE_BOLETA is violated'); 
END; 
/

CREATE OR REPLACE TRIGGER FKNTM_MODELO 
BEFORE UPDATE OF MARCA_ID_Marca 
ON MODELO 
BEGIN 
  raise_application_error(-20225,'Non Transferable FK constraint  on table MODELO is violated'); 
END; 
/

--  ERROR: No Discriminator Column found in Arc Arc_3 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc Arc_3 - constraint trigger for Arc cannot be generated

CREATE SEQUENCE PROVEEDOR_PROVEEDOR_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER PROVEEDOR_PROVEEDOR_ID_TRG 
BEFORE INSERT ON PROVEEDOR 
FOR EACH ROW 
WHEN (NEW.PROVEEDOR_ID IS NULL) 
BEGIN 
    :NEW.PROVEEDOR_ID := PROVEEDOR_PROVEEDOR_ID_SEQ.NEXTVAL; 
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             2
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           3
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
