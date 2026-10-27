-- 1: the last 20 messages in a given channel, newest at the top.
-- Returns: time, user, text.

SELECT m.sent_at AS time,
       u.username AS "user",
       m.body     AS text
FROM messages m
JOIN users u    ON u.id = m.user_id
JOIN channels c ON c.id = m.channel_id
WHERE c.name = 'general'
ORDER BY m.sent_at DESC, m.id DESC
LIMIT 20;

-- 2: how many messages each user has written, including users with 0.
-- Returns: user, message_count.

SELECT u.username AS "user",
       COUNT(m.id) AS message_count
FROM users u
LEFT JOIN messages m ON m.user_id = u.id
GROUP BY u.id, u.username
ORDER BY message_count DESC, u.username;
