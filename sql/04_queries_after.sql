-- Эксперимент №1. После создания индекса idx_ip 
SELECT * FROM nasa_logs  
WHERE ip = '199.72.81.55'; 
-- Result: 122 строк возвращено за 117 мс.
-- Ускорение в ~22.3 раза

-- Эксперимент №2. После создания индекса idx_log_date  
SELECT COUNT(*) FROM nasa_logs  
WHERE log_date BETWEEN '1995-Jul-15' AND 
'1995-Jul-31'; 
-- Result: 1 строк возвращено за 177 мс.
-- Ускорение в ~9.3 раза. 

-- Эксперимент №3. После создания индекса idx_status 
SELECT ip, status, COUNT(*) as cnt 
FROM nasa_logs  
WHERE status = 404 
GROUP BY ip 
ORDER BY cnt DESC 
LIMIT 50; 
-- Result: 50 строк возвращено за 136 мс.
-- Ускорение в ~11.8 раза. 
