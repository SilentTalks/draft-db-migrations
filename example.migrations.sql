CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    avatar VARCHAR (255) NOT NULL,
    username VARCHAR (50) UNIQUE NOT NULL,
    phrases VARCHAR (255) NOT NULL
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
    user_id BIGINT NOT NULL,
    text TEXT NOT NULL,

    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT fk_chat_id FOREIGN KEY (chat_id) REFERENCES chats (id)
);

INSERT INTO users (id, username, phrases, avatar)
VALUES
    (1, 'test1', 'test1', 'https://avatars.githubusercontent.com/u/152148618?s=200&v=4'),
    (2, 'test2', 'test2', 'https://avatars.githubusercontent.com/u/152148618?s=200&v=4'),
    (3, 'test3', 'test3', 'https://avatars.githubusercontent.com/u/152148618?s=200&v=4'),
    (4, 'test4', 'test4', 'https://avatars.githubusercontent.com/u/152148618?s=200&v=4'),
    (5, 'test5', 'test5', 'https://avatars.githubusercontent.com/u/152148618?s=200&v=4');

INSERT INTO chats (id, one_user_id, two_user_id)
VALUES
    (1, 1, 2),
    (2, 1, 3),
    (3, 2, 3),
    (4, 2, 4),
    (5, 3, 4),
    (6, 4, 5);

INSERT INTO chat_messages (chat_id, user_id, text)
VALUES
    (1, 1, 'Hello, how are you?'),
    (1, 2, 'Fine, thank you!'),
    (1, 1, 'What are you doing?'),
    (1, 2, 'At work.'),
    (1, 2, 'And you?'),
    (1, 1, 'Also at work. We have bad weather today.'),
    (1, 1, 'Yes, it''s been raining for the second day.'),
    (1, 2, 'Do you think it will be better tomorrow?'),
    (1, 1, 'I hope so.'),
    (1, 2, 'Shall we meet on the weekend?'),
    (1, 1, 'Good idea.'),
    (1, 1, 'Where shall we go?'),
    (1, 2, 'Maybe to the cinema?'),
    (1, 1, 'Why not.'),
    (1, 2, 'Alright, agreed!'),

    (2, 1, 'Hello, how are you?'),
    (2, 3, 'Fine, thank you!'),
    (2, 1, 'What are you doing?'),
    (2, 3, 'At work.'),
    (2, 3, 'And you?'),
    (2, 1, 'Also at work. We have bad weather today.'),
    (2, 1, 'Yes, it''s been raining for the second day.'),
    (2, 3, 'Do you think it will be better tomorrow?'),
    (2, 1, 'I hope so.'),
    (2, 3, 'Shall we meet on the weekend?'),
    (2, 1, 'Good idea.'),
    (2, 1, 'Where shall we go?'),
    (2, 3, 'Maybe to the cinema?'),
    (2, 1, 'Why not.'),
    (2, 3, 'Alright, agreed!'),

    (3, 2, 'Hello, how are you?'),
    (3, 3, 'Fine, thank you!'),
    (3, 2, 'What are you doing?'),
    (3, 3, 'At work.'),
    (3, 3, 'And you?'),
    (3, 2, 'Also at work. We have bad weather today.'),
    (3, 2, 'Yes, it''s been raining for the second day.'),
    (3, 3, 'Do you think it will be better tomorrow?'),
    (3, 2, 'I hope so.'),
    (3, 3, 'Shall we meet on the weekend?'),
    (3, 2, 'Good idea.'),
    (3, 2, 'Where shall we go?'),
    (3, 3, 'Maybe to the cinema?'),
    (3, 2, 'Why not.'),
    (3, 3, 'Alright, agreed!'),

    (4, 2, 'Hello, how are you?'),
    (4, 4, 'Fine, thank you!'),
    (4, 2, 'What are you doing?'),
    (4, 4, 'At work.'),
    (4, 4, 'And you?'),
    (4, 2, 'Also at work. We have bad weather today.'),
    (4, 2, 'Yes, it''s been raining for the second day.'),
    (4, 4, 'Do you think it will be better tomorrow?'),
    (4, 2, 'I hope so.'),
    (4, 4, 'Shall we meet on the weekend?'),
    (4, 2, 'Good idea.'),
    (4, 2, 'Where shall we go?'),
    (4, 4, 'Maybe to the cinema?'),
    (4, 2, 'Why not.'),
    (4, 4, 'Alright, agreed!'),

    (5, 3, 'Hello, how are you?'),
    (5, 4, 'Fine, thank you!'),
    (5, 3, 'What are you doing?'),
    (5, 4, 'At work.'),
    (5, 4, 'And you?'),
    (5, 3, 'Also at work. We have bad weather today.'),
    (5, 3, 'Yes, it''s been raining for the second day.'),
    (5, 4, 'Do you think it will be better tomorrow?'),
    (5, 3, 'I hope so.'),
    (5, 4, 'Shall we meet on the weekend?'),
    (5, 3, 'Good idea.'),
    (5, 3, 'Where shall we go?'),
    (5, 4, 'Maybe to the cinema?'),
    (5, 3, 'Why not.'),
    (5, 4, 'Alright, agreed!'),

    (6, 5, 'Hello, how are you?'),
    (6, 4, 'Fine, thank you!'),
    (6, 5, 'What are you doing?'),
    (6, 4, 'At work.'),
    (6, 4, 'And you?'),
    (6, 5, 'Also at work. We have bad weather today.'),
    (6, 5, 'Yes, it''s been raining for the second day.'),
    (6, 4, 'Do you think it will be better tomorrow?'),
    (6, 5, 'I hope so.'),
    (6, 4, 'Shall we meet on the weekend?'),
    (6, 5, 'Good idea.'),
    (6, 5, 'Where shall we go?'),
    (6, 4, 'Maybe to the cinema?'),
    (6, 5, 'Why not.'),
    (6, 4, 'Alright, agreed!');
