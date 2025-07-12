-- 1. Кол-во сообщений от каждого пользователя
SELECT u.nickname, COUNT(m.id) AS message_count
FROM users u
LEFT JOIN messages m ON m.sender_id = u.id
GROUP BY u.nickname
ORDER BY message_count DESC;

-- 2. Последнее сообщение в каждом чате
SELECT DISTINCT ON (m.chat_id)
       c.name AS chat_name,
       u.nickname AS sender,
       m.content,
       m.sent_at
FROM messages m
JOIN chats c ON m.chat_id = c.id
JOIN users u ON m.sender_id = u.id
ORDER BY m.chat_id, m.sent_at DESC;

-- 3. Самый активный чат
SELECT c.name, COUNT(m.id) AS message_count
FROM chats c
JOIN messages m ON c.id = m.chat_id
GROUP BY c.name
ORDER BY message_count DESC
LIMIT 1;

-- 4. Кто состоит в каких чатах
SELECT u.nickname,
       STRING_AGG(c.name, ', ') AS chats
FROM chat_members cm
JOIN users u ON cm.user_id = u.id
JOIN chats c ON cm.chat_id = c.id
GROUP BY u.nickname;

-- 5. Сообщения по дням
SELECT DATE(sent_at) AS day, COUNT(*) AS total_messages
FROM messages
GROUP BY day
ORDER BY day;

-- 6. Первое сообщение в каждом чате
SELECT chat_name, sender, content, sent_at
FROM (
  SELECT c.name AS chat_name, u.nickname AS sender, m.content, m.sent_at,
         ROW_NUMBER() OVER (PARTITION BY m.chat_id ORDER BY m.sent_at ASC) AS rn
  FROM messages m
  JOIN chats c ON m.chat_id = c.id
  JOIN users u ON m.sender_id = u.id
) sub
WHERE rn = 1;

-- 7. Пользователи без сообщений
SELECT u.nickname
FROM users u
LEFT JOIN messages m ON m.sender_id = u.id
WHERE m.id IS NULL;