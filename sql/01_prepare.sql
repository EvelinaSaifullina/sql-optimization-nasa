--  Удаление дубликатов 
CREATE TABLE nasa_logs_dedup AS 
SELECT MIN(id) as id, ip, log_date, log_time, method, url, protocol, 
status, bytes 
FROM nasa_logs 
GROUP BY ip, log_date, log_time, method, url, protocol, status, bytes; 
-- Результат: Осталось 1 886 006 строк (удалено 832 дубликата). 

-- Нормализация URL 
UPDATE nasa_logs SET url_normalized = LOWER(url);
