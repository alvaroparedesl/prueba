-- 1
SELECT count(DISTINCT a.rut) 
FROM pos_trx_cliente AS a
LEFT JOIN pos_trx AS b ON a.id_trx=b.id_trx
WHERE b.tipo_transaccion=15;


-- 2
WITH c AS(
    SELECT a.tienda
           ,year(a.fecha_transaccion) AS año
           ,sum(b.monto_pago) AS ventas
    FROM pos_trx AS a
    LEFT JOIN pos_trx_pago AS b ON a.id_trx=b.id_trx
    GROUP BY a.tienda, a.fecha_transaccion
)
SELECT tienda, año, ventas 
FROM c 
ORDER BY ventas, año DESC;


-- 3
WITH c AS(
    SELECT a.tienda
           ,year(a.fecha_transaccion) AS año
           ,avg(b.monto_pago) AS ventas
    FROM pos_trx AS a
    LEFT JOIN pos_trx_pago AS b ON a.id_trx=b.id_trx
    GROUP BY a.tienda, a.fecha_transaccion
)
SELECT tienda, año, ventas 
FROM c 
ORDER BY ventas, año DESC;


--4
SELECT TOP 1 medio_de_pago, count(medio_de_pago)
FROM pos_trx_pago
GROUP BY medio_de_pago
ORDER BY count(medio_de_pago) DESC