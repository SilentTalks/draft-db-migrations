CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR (50) UNIQUE NOT NULL,
    avatar VARCHAR (255) NOT NULL
);

CREATE TABLE chats (
    id BIGSERIAL PRIMARY KEY,
    one_user_id BIGINT NOT NULL,
    two_user_id BIGINT NOT NULL,

    CONSTRAINT unique_user_ids UNIQUE (one_user_id, two_user_id),
    CONSTRAINT fk_one_user_id FOREIGN KEY (one_user_id) REFERENCES users (id),
    CONSTRAINT fk_two_user_id FOREIGN KEY (two_user_id) REFERENCES users (id)
);

CREATE TABLE chat_messages (
    id BIGSERIAL PRIMARY KEY,
    chat_id BIGINT NOT NULL,
    text TEXT NOT NULL,

    CONSTRAINT fk_chat_id FOREIGN KEY (chat_id) REFERENCES chats (id)
);
