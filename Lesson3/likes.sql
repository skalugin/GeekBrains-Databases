-- Таблица для реализации лайков для пользователей
DROP TABLE IF EXISTS profiles_likes;
CREATE TABLE likes(
	id SERIAL PRIMARY KEY,
	type ENUM('like', 'unlike', 'happy', 'clap'),
	profile_id BIGINT UNSIGNED NOT NULL,
	liked_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (profile_id) REFERENCES profiles(id),
	FOREIGN KEY (liked_id) REFERENCES profiles(id)
);
-- Таблица для реализации лайков для комментариев
DROP TABLE IF EXISTS comments_likes;
CREATE TABLE comments_likes(
	id SERIAL PRIMARY KEY,
	type ENUM('like', 'unlike', 'happy', 'clap'),
	comment_id BIGINT UNSIGNED NOT NULL,
	liked_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (comment_id) REFERENCES comments(id),
	FOREIGN KEY (liked_id) REFERENCES profiles(id)
);

-- Таблица для реализации лайков для постов
DROP TABLE IF EXISTS posts_likes;
CREATE TABLE posts_likes(
	id SERIAL PRIMARY KEY,
	type ENUM('like', 'unlike', 'happy', 'clap'),
	post_id BIGINT UNSIGNED NOT NULL,
	liked_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (post_id) REFERENCES posts(id),
	FOREIGN KEY (liked_id) REFERENCES profiles(id)
);
