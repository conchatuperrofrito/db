/**/
/**/
/*ELIMINAR FORANDO BASE DE DATOS*/
USE master ;  
GO  
DROP DATABASE BD_VENTAS;  
GO 

USE master;
GO
ALTER DATABASE BM_VENTAS 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE BM_VENTAS;

/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/

/**/
/**/