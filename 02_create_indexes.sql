-- Валидация IP-адресов 
 ALTER TABLE nasa_logs ADD COLUMN is_valid_ip INTEGER DEFAULT 0; 
UPDATE nasa_logs SET is_valid_ip = 1  
WHERE ip LIKE '%.%.%.%'  
AND ip NOT GLOB '*[a-zA-Z]*' 
AND ip != '' 
AND LENGTH(ip) >= 7; 
-- Создание индекса idx_valid_ip
CREATE INDEX idx_valid_ip ON nasa_logs(is_valid_ip);

-- Создание индекса idx_ip
CREATE INDEX idx_ip ON nasa_logs(ip); 

-- Создание индекса idx_log_date
CREATE INDEX idx_log_date ON 
nasa_logs(log_date); 

-- Создание индекса idx_status
CREATE INDEX idx_status ON 
nasa_logs(status);