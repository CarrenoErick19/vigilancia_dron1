
/* PRIMERA CONSULTA (Historico de contratos que ha realizado el dron: cantidad, horas de vuelo realizadas)*/

SELECT RELACION_DRON_CONTRATO.SERIAL_DRON, COUNT(RELACION_DRON_CONTRATO.ID_CONTRATO) as Cant_Contratos,
SUM(CONTRATO.HV_CONTRATO) as Horas_Vuelo
from RELACION_DRON_CONTRATO
INNER JOIN CONTRATO ON CONTRATO.ID_CONTRATO = RELACION_DRON_CONTRATO.ID_CONTRATO
group by SERIAL_DRON
order by Horas_Vuelo desc


/* SEGUNDA CONSULTA (Historico de atención de incidencias: año de labor, nombre del tecnico, las incidencias que realizó en el año)*/

SELECT
	EXTRACT(year from MANTENIMIENTO.FECHA_MANTENIMIENTO) as year_labor, 
	COUNT(MANTENIMIENTO.FECHA_MANTENIMIENTO) as Cant_Incidencias, TECNICO.NOM_TECNICO as Nombre_Tecnico
	from MANTENIMIENTO
	INNER JOIN TECNICO ON TECNICO.ID_TECNICO = MANTENIMIENTO.ID_TECNICO
	group by year_labor, TECNICO.NOM_TECNICO


/* TERCERA CONSULTA (Historico de contrataciones a la empresa: cantidad, año, dinero generado por contrato)*/

SELECT 
	COUNT (CONTRATO.ID_CLIENTE) as Cantidad_contratos,
	EXTRACT(year from CLIENTE.INICIOCTR_CLIENTE) as Año_contrato, SUM (CLIENTE.PAGO_CLIENTE) as Dinero_generado
	from CONTRATO
	INNER JOIN CLIENTE ON CLIENTE.ID_CLIENTE = CONTRATO.ID_CLIENTE
	WHERE CLIENTE.ID_CLIENTE = CONTRATO.ID_CLIENTE
	AND CLIENTE.INICIOCTR_CLIENTE BETWEEN '2010-01-01' AND '2019-12-31'
	group by 
	EXTRACT (YEAR FROM CLIENTE.INICIOCTR_CLIENTE)
	order by count(CONTRATO.ID_CLIENTE) desc;


/* CUARTA CONSULTA (Historico de mantenimientos de cada dron: id del dron, cantidad de mantenimientos realizados al dron, tiempo funcionando en la empresa)*/
SELECT 
	DRON.SERIAL_DRON as Id_dron, COUNT (MANTENIMIENTO.ID_MANTENIMIENTO) as Num_Mantenimientos,
	EXTRACT (year from age(timestamp'now()',date(DRON.ADQUISICION_DRON))) as Años_funcionando,
	EXTRACT (month from age(timestamp'now()',date(DRON.ADQUISICION_DRON))) as Meses_funcionando,
	EXTRACT (day from age(timestamp'now()',date(DRON.ADQUISICION_DRON))) as Dias_funcionando
	from DRON
	INNER JOIN INCIDENCIA ON INCIDENCIA.SERIAL_DRON = DRON.SERIAL_DRON
	INNER JOIN MANTENIMIENTO ON MANTENIMIENTO.ID_MANTENIMIENTO = INCIDENCIA.ID_MANTENIMIENTO
	group by DRON.SERIAL_DRON
	order by Id_dron;








