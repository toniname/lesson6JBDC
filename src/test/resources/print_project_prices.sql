-- Вивести список проєктів та їх вартості
SELECT
    p.NAME AS PROJECT_NAME,
    SUM(w.SALARY) * DATEDIFF('MONTH', p.START_DATE, p.FINISH_DATE) AS PRICE
FROM
    project p
        JOIN
    project_worker pw ON p.ID = pw.PROJECT_ID
        JOIN
    worker w ON pw.WORKER_ID = w.ID
GROUP BY
    p.ID, p.NAME, p.START_DATE, p.FINISH_DATE
ORDER BY
    PRICE DESC;