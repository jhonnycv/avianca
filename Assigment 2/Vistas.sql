-------------------------------------

/*Vista punto 1*/

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
CREATE OR REPLACE VIEW VISTA_UNO AS
EXPLAIN PLAN FOR
select *
from vuelos v
inner join rutas r
on v.id_ruta = r.id
inner join itinerarios it
on v.id = it.id_vuelo
inner join aviones av
on it.id_avion = av.id
where
v.estado_vuelo ='En vuelo'
and id_aeropuerto_destino in ((select id_aeropuerto_destino 
from vuelos v
inner join rutas r
on v.id_ruta = r.id
where v.estado_vuelo ='Confirmado'))
    and cast(24 *(trunc(TO_DATE(it.fecha_llegada_real)) - ( select to_date(it.fecha_llegada_real)
    from vuelos v
    inner join rutas r
    on v.id_ruta = r.id
    inner join ITINERARIO_TRIPULANTES it
    on v.id = it.id_vuelo where  v.id ='1' ))as int) >= '2';

select * from itinerarios it
'YYYY-MM-DD hh24:mi:ss'

----------------------------------------------------------------
/*Vista punto 4*/

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
CREATE OR REPLACE VIEW VUELO_CONfiRMADO AS
EXPLAIN PLAN FOR 
SELECT
E.id, 
E.TIPO_EMPLEADOS,
E.NOMBRE,
E.APELLIDO,
vu.Estado_Vuelo
from EMPLEADOS E
inner join ITINERARIO_TRIPULANTES IT
on IT.id_Empleado = E.id
inner join vuelos VU
on VU.id = IT.Id_Vuelo
where VU.ESTADO_VUELO = 'Confirmado';
--Ejecucion vista: select * from VUELO_CONFIRMADO

CREATE OR REPLACE VIEW VUELOS_PROGRAMADOS AS
EXPLAIN PLAN FOR 
  SELECT 
    R.id,
    R.Distancia,
    R.Duracion,
    vu.Estado
  FROM VIAJE
    INNER JOIN VUELOS ON  = VUELOPROGRAMADO.Fecha_Salida_Programada
    INNER JOIN CHECK_INS  ON DURAC.Duracion_promedio = FECHA.Fecha_Salida
  WHERE VIAJE.Fecha_Salida > SYSDATE;
--EJecución vista: SELECT * FROM VUELOS_PROGRAMADOS; 


EXPLAIN PLAN FOR SELECT * FROM VUELO_CONfiRMADO;
