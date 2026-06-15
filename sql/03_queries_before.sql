-- Эксперимент №1. Поиск записей по IP-адресу:
SELECT * FROM nasa_logs  
WHERE ip = '199.72.81.55'; 
-- Result: 122 строк возвращено за 2611 мс 

-- Эксперимент №2. Поиск по диапазону дат:  
SELECT COUNT(*) FROM nasa_logs  
WHERE log_date BETWEEN '1995-Jul-15' AND 
'1995-Jul-31'; 
-- Result: 1 строк возвращено за 1642 мс.

-- Эксперимент №3. Топ-50 IP с фильтром по статусу:
SELECT ip, status, COUNT(*) as cnt 
FROM nasa_logs  
WHERE status = 404 
GROUP BY ip 
ORDER BY cnt DESC 
LIMIT 50; 
-- Result: 50 строк возвращено за 1607 мс
