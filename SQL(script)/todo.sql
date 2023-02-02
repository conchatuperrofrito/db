/*scripts*/
/**/
use datamar_ventas;
use bd_informatica;
/*eliminar base de datos*/
DROP DATABASE bd_ventas;
/*mostrar los triggers de una base de datos*/
SHOW TRIGGERS;
/*unir 2 tablas*/
select * from tabla1 a INNER JOIN tabla2 b on a.id = b.id;
select tabla1.*,tabla2.*  from tabla1,tabla2 where tabla1.id = tabla2.id;
/* contar*/
select count(*)
from talumno;
/* select*/
select *
from tasigna;
/*trigger*/
select * from talumno  
INNER JOIN tnotas nota on talumno.IDALUMNO = nota.IDALUMNO;
/**/
select codalumno, count(DISTINCT semestre) as cantidad_semestres
from talumno ta
inner join tnotas tn on ta.idalumno = tn.idalumno
inner join tsemestre ts on ts.idsemestre = tn.idsemestre
where ta.CodAlumno like '2017%'
group by codalumno;
/*ASIGNATURAS APROBADAS*/
SELECT CODALUMNO,  count(distinct(TAS.NOMASIGNATURA)) AS X3_Asig_Aprobadas
FROM TALUMNO TA INNER JOIN TNOTAS TN ON TA.IDALUMNO=TN.IDALUMNO
INNER JOIN TASIGNATURA TAS ON TN.IDASIGNATURA=TAS.IDASIGNATURA
where notas>10
GROUP BY CODALUMNO;
/*asignatura desaprobada*/
SELECT CODALUMNO,  count(distinct(TAS.NOMASIGNATURA)) AS X4_Asig_desaprobadas
FROM TALUMNO TA INNER JOIN TNOTAS TN ON TA.IDALUMNO=TN.IDALUMNO
INNER JOIN TASIGNATURA TAS ON TN.IDASIGNATURA=TAS.IDASIGNATURA
where notas<10
GROUP BY CODALUMNO;
/**/
select CodAlumno,
case 
	when sum(Creditos)<=22  then 'Menor_a_22'
	when sum(Creditos)<23 and sum(Creditos)<41  then 'Entre_23_y_40_creditos'
	when sum(Creditos)>40  then 'Mayor_a_40'
end as cant_creditos
from TAlumno ta inner join Tnotas tn on ta.IdAlumno=tn.IdAlumno
inner join TAsignatura tasg on tn.IdAsignatura= tasg.IdAsignatura
inner join TSemestre ts on ts.IdSemestre=tn.IdSemestre
where CodAlumno like '2017%'
group by CodAlumno;
/*rendimiento academico*/
SELECT *
FROM TALUMNO TA INNER JOIN TNOTAS TN ON TA.IDALUMNO=TN.IDALUMNO
INNER JOIN tasignatura TAS ON TN.IDASIGNATURA=TAS.IDASIGNATURA

where notas<10
GROUP BY CODALUMNO;
/*notas con betwenn*/
select CODALUMNO,CASE  WHEN(sum(CREDITOS*NOTAS)/SUM(CREDITOS)) BETWEEN 0 AND 10 THEN 'Deficiente' 
                       WHEN(sum(CREDITOS*NOTAS)/SUM(CREDITOS)) BETWEEN 11 AND 12 THEN 'Regular' 
                       ELSE 'Bueno'  END AS X5_RendimientoAcademico
FROM TALUMNO TA INNER JOIN TNOTAS TN ON TA.IDALUMNO=TN.IDALUMNO
INNER JOIN TASIGNATURA TAS ON TN.IDASIGNATURA=TAS.IDASIGNATURA
where CodAlumno like '2017%'
GROUP BY CODALUMNO
/*Valor SI (Si tiene menos de 2 semestres matriculados)
--        NO (Si tiene más de 2 semestres matriculados)
Variable deserción*/



/**/