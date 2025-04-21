create database Movies
go
use Movies
go
create schema cema
go

create table cema.actor(
	act_Id int primary key,
	act_Fname varchar(20),
	act_Lname varchar(20),
	act_Gender varchar(1)
)

create table cema.Movie(
	mov_Id int primary key,
	mov_title varchar(50),
	mov_year int,
	mov_time int,
	mov_lang varchar(50),
	mov_dt_rel date,
	mov_rel_country varchar(50)
)

create table cema.dirctor(
	dir_Id int primary key,
	dir_Fname varchar(20),
	dir_Lname varchar(20)
)
go
create schema Relations
go

create table Relations.movie_cast(
	act_Id int REFERENCES cema.actor (act_Id),
	mov_Id int REFERENCES cema.Movie (mov_Id),
	role varchar(30),
	primary key (act_Id,mov_Id)
)

create table Relations.movie_direction(
	dir_Id int REFERENCES cema.dirctor(dir_Id),
	mov_Id int REFERENCES cema.Movie(mov_Id),

	primary key(dir_Id,mov_Id)
)

create table cema.reviewer(
	rev_Id int primary key,
	rev_name varchar(30)
)

create table Relations.rating(
	mov_Id int References cema.movie(mov_Id),
	rev_Id int references cema.reviewer(rev_Id),
	rev_stars int,
	num_o_rating int

	primary key(mov_Id,rev_Id)
)

create table cema.genres(
	gen_Id int primary key,
	gen_title varchar(20)
)

create table Relations.movie_genres(
	gen_Id int references cema.genres(gen_Id),
	mov_Id int references cema.movie(mov_Id),

	primary key(gen_Id,mov_Id)
)


