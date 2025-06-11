create database forum_db;

use forum_db;

create table users(
	id  int primary key auto_increment,
    username varchar (220) not null unique,
    email varchar(220) not null unique,
    password varchar(220) not null,
    profile_picture_url varchar(220),
    created_at  timestamp default current_timestamp 
);

create table posts(
	id  int primary key auto_increment,
    user_id int,
    title varchar(220),
    content text,
    image_uri varchar(2083),
    foreign key (user_id) references users(id),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);

create table comments(
	id int primary key auto_increment,
    post_id int,
    user_id int,
    content text,
    foreign key (post_id) references posts(id),
    foreign key (user_id) references users(id),
    created_at timestamp default current_timestamp
);

create table likes(
	id int primary key auto_increment,
    post_id int unique,
    user_id int unique,
    foreign key (post_id) references posts(id),
    foreign key (user_id) references users(id),
    created_at timestamp default current_timestamp
);
create table favorites (
	id int primary key auto_increment,
    post_id int unique,
    user_id int unique,
    foreign key (post_id) references posts(id),
    foreign key (user_id) references users(id),
    created_at timestamp default current_timestamp
);
