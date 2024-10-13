create database MusicBase;
use MusicBase;

create table Artists (
    artist_id int primary key,
    artist_name varchar(100),
    genre varchar(50)
);

create table Songs (
    song_id int primary key,
    song_name varchar(100),
    artist_id int,
    foreign key (artist_id) references Artists(artist_id)
);

create table Users (
    user_id int primary key,
    user_name varchar(100),
    email varchar(100) unique
);

create table Playlists (
    playlist_id int primary key,
    user_id int,
    song_id int,
    foreign key (user_id) references Users(user_id),
    foreign key (song_id) references Songs(song_id)
);

insert into Artists (artist_id, artist_name, genre) values
(1, 'AURORA', 'Folk'),
(2, 'Taylor Swift', 'Pop'),
(3, 'Adele', 'Soul'),
(4, 'Metallica', 'Rock'),
(5, 'The Weeknd', 'Hip-Hop');

insert into Songs (song_id, song_name, artist_id) values
(1, 'Seeds', 1),
(2, 'Love Story', 2),
(3, 'Someone Like You', 3),
(4, 'Enter Sandman', 4),
(5, 'Blinding Lights', 5);

insert into Users (user_id, user_name, email) values
(1, 'Krithik', 'krithikk@example.com'),
(2, 'Vyshnv', 'Vyshnavny@example.com'),
(3, 'Charlie', 'charlie7@example.com');

insert into Playlists (playlist_id, user_id, song_id) values
(1, 1, 1),  
(2, 1, 2),  
(3, 2, 4),  
(4, 3, 5);  

select Users.user_name, Songs.song_name
from Playlists
inner join Users on Playlists.user_id = Users.user_id
inner join Songs on Playlists.song_id = Songs.song_id;

select Songs.song_name, Users.user_name
from Songs
left join Playlists on Songs.song_id = Playlists.song_id
left join Users on Playlists.user_id = Users.user_id;

select Songs.song_name, Artists.artist_name
from Songs
inner join Artists on Songs.artist_id = Artists.artist_id
inner join Playlists on Songs.song_id = Playlists.song_id
where Artists.genre = 'Rock';