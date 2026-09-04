
-- creating a database
create database RaceDay;

--using a database
use RaceDay;

--created a table user
create table users(
user_id int primary key identity(1,1),
full_name varchar(50),
email varchar(30),
password char (12),
role varchar(15)
);

--created a table events
create table events(
event_id int primary key identity(1,1),
event_type varchar(30),
location varchar(50),
event_description varchar(80),
event_update varchar (120),
event_date date,
user_id int,
foreign key (user_id) references users(user_id)
);

--created a table routes
create table routes(
route_id int primary key identity(1,1),
route_name varchar(50),
route_description varchar(120),
distance varchar(20),
event_id int,
foreign key (event_id) references events(event_id)
);
--created the table categories
create table categories(
category_id int primary key identity(1,1),
category_name varchar(30),
max_participants int,
distance varchar(20),
entry_fee char(5),
event_id int,
foreign key (event_id) references events (event_id)
);

--created table results
create table results(
result_id int primary key identity(1,1),
finish_time char(5),
finish_position char(5)
);

--created enrolment table
create table enrolement(
enrolement_id int primary key identity(1,1),
race_date date,
race_number int,
user_id int,
result_id int,
category_id int,
foreign key (user_id) references users (user_id),
foreign key (result_id) references results (result_id),
foreign key (category_id) references categories (category_id)
);

select * from enrolement;

--inserted values 
insert into users
values
('jayden adams','ja@raceday.com','ja1234567890','organizer'),
('peter cullen','pc@raceday.com','pc24680','organizer'),
('tim curry','tc@gmail.com','tc13579','participant'),
('dolly parton' ,'dp@gmail.com','dp12345','participant');

--inserted values
insert into events(event_type, location, event_description, event_update, event_date, user_id)
values
('marathon','soweto','orlando to protea glen','n/a','12-05-2026',1),
('park run','joburg','around the fields','n/a','01-09-2026',2),
('community walk','hillbrow','hilbrow to basevall','n/a','04-24-2026',1);

--inserted values
insert into categories(category_name,max_participants,distance,entry_fee)
values
('running',150,'7km','R80'),
('walking',120,'5km','R20'),
('jogging',300,'10km','R70');

insert into enrolement(race_date, race_number)
values
('12-04-2026',01);
