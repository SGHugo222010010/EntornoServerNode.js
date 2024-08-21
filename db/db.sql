DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles(
   id BIGSERIAL PRIMARY KEY,
   name VARCHAR(180) NOT NULL UNIQUE,
   image TEXT NULL,
   route TEXT NULL,
   created_at TIMESTAMP(0) NOT NULL,
   updated_at TIMESTAMP(0) NOT NULL
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
    id BIGSERIAL PRIMARY KEY, 
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	phone VARCHAR(80) NOT NULL UNIQUE,
	image TEXT NULL,
	password VARCHAR(255) NOT NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

INSERT INTO users(
    email,
    name,
    lastname,
    phone,
    password,
    created_at,
    updated_at
)
VALUES(
    'al222010010@gmail.com',
    'Hugo',
    'Sánchez',
    '7222546330',
    '1234',
    '2024-07-07',
    '2024-07-07'
);

DROP TABLE IF EXISTS user_has_roles CASCADE;
CREATE TABLE user_has_roles(
    id_user BIGSERIAL NOT NULL,
    id_rol BIGSERIAL NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
    FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(id_user, id_rol)
);

INSERT INTO roles(
	name,
	route,
	image,
	created_at,
	updated_at
)
VALUES(
	'CLIENTE',
	'client/home',
	'https://w7.pngwing.com/pngs/458/959/png-transparent-computer-icons-management-marketing-client-icon-text-logo-psychology.png',
	'2024-07-20',
	'2024-07-20'
);

INSERT INTO roles(
	name,
	route,
	image,
	created_at,
	updated_at
)
VALUES(
	'RESTAURANTE',
	'restaurant/home',
	'https://previews.123rf.com/images/djvstock/djvstock1805/djvstock180509460/101819712-tamales-mexicanos-sobre-fondo-blanco-ilustraci%C3%B3n-vectorial.jpg',
	'2024-07-20',
	'2024-07-20'
);

INSERT INTO roles(
	name,
	route,
	image,
	created_at,
	updated_at
)
VALUES(
	'REPARTIDOR',
	'delivery/home',
	'https://m.media-amazon.com/images/I/71R65N9DkKL._AC_SX425_.jpg',
	'2024-07-20',
	'2024-07-20'
);