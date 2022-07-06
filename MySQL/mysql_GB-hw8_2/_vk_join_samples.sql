-- Сложные запросы с использованием JOIN
use vk;
-- Выборка данных по пользователю
SELECT 
	firstname, lastname, email, phone, gender, birthday, hometown
  FROM users
    JOIN profiles ON users.id = profiles.user_id
  WHERE users.id = 1;

-- Выборка новостей самого пользователя
SELECT media.user_id, media.body, media.created_at
  FROM media
    JOIN users ON media.user_id = users.id     
  WHERE media.user_id = 1;
  
-- Сообщения к пользователю
SELECT messages.body, firstname, lastname, messages.created_at
  FROM messages
    JOIN users ON users.id = messages.to_user_id
  where u.id = 1;
  
-- Сообщения от пользователя
SELECT body, firstname, lastname, created_at
  FROM messages
    JOIN users ON users.id = messages.from_user_id
    where u.id = 1;

-- u1 - отправитель, u2 - получатель
select 
	u1.email as 'sender' ,
	u2.email as 'receiver',
	m.*
from users u1
join messages m on u1.id = m.from_user_id 
join users u2 on u2.id = m.to_user_id 
where u1.id = 1;

-- Количество друзей у всех пользователей
SELECT firstname, lastname, COUNT(*) AS total_friends
  FROM users
    JOIN friend_requests ON (users.id = friend_requests.initiator_user_id or users.id = friend_requests.target_user_id)
  where friend_requests.status = 'approved'
  GROUP BY users.id;
 
-- Количество друзей у всех пользователей с сортировкой
SELECT firstname, lastname, COUNT(*) AS total_friends
  FROM users
    JOIN friend_requests ON (users.id = friend_requests.initiator_user_id or users.id = friend_requests.target_user_id)
  where friend_requests.status = 'approved'
  GROUP BY users.id
  ORDER BY total_friends DESC;

-- Выборка новостей друзей пользователя
select 
 media.*
  FROM media
    JOIN friend_requests fr ON media.user_id = fr.target_user_id
    JOIN users ON fr.initiator_user_id = users.id -- кому я отправлял заявку в друзья
  WHERE users.id = 1
  	and fr.status = 'approved'
UNION
select 
 media.*
  FROM media
    JOIN friend_requests fr ON media.user_id = fr.initiator_user_id
    JOIN users ON fr.target_user_id = users.id   -- кто мне отправлял заявку в друзья
  WHERE users.id = 1
  	and fr.status = 'approved'
order by created_at desc;

-- Список медиафайлов пользователя с количеством лайков
SELECT media.filename,
  media_types.name,
  COUNT(*) AS total_likes,
  CONCAT(firstname, ' ', lastname) AS owner
  FROM media
    JOIN media_types ON media.media_type_id = media_types.id
    JOIN likes ON media.id = likes.media_id
    JOIN users ON users.id = media.user_id
  WHERE users.id = 1
  GROUP BY media.id;
  
-- Количество групп у пользователей
SELECT firstname, lastname, COUNT(*) AS total_communities
  FROM users
    JOIN users_communities ON users.id = users_communities.user_id
  GROUP BY users.id
  order by count(*) desc;

-- Среднее количество групп у всех пользователей    
SELECT AVG(total_communities) AS average_communities
  FROM (
    SELECT firstname, lastname, COUNT(*) AS total_communities
      FROM users
        JOIN users_communities ON users.id = users_communities.user_id
      GROUP BY users.id
  ) AS list;
  
-- 3 пользователя с наибольшим количеством лайков за медиафайлы
SELECT 
	firstname, lastname,
	m.filename,
	count(*) as likes_count
  FROM users
    JOIN media ON users.id = media.user_id
    JOIN likes ON media.id = likes.media_id
  GROUP BY users.id
  ORDER BY likes_count DESC
  LIMIT 3;

-- количество пользователей в сообществах
select 
	count(*)
	, c.name
from vk.users_communities uc
join communities c on uc.community_id = c.id
group by c.id
