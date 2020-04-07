-- PROGRESSION - 1


-- 1. **Create table city**
create table city
( id number(11),
  name varchar(50) not null,
  primary key(id)
  );


-- 2. **Create table referee**

create table referee
( id number(11),
  name varchar(50) not null,
  primary key(id)
  );


-- 3. **Create table innings**

create table innings
( id number(11),
  name varchar(50) not null,
  primary key(id)
  );


-- 4. **Create table extra_type**

create table extra_type
( id number(11),
  name varchar(50) not null,
  primary key(id)
  );

-- 5. **Create table skill**

create table skill
( id number(11),
  name varchar(50) not null,
  primary key(id)
  );

-- 6. **Create table team**

create table team
( id number(11),
  name varchar(50) not null,
  coach varchar(50) not null,
  home_city number(11) REFERENCES city(id),
  captain number(11) not null,
  primary key(id)
  );

-- 7. **Create table player**

create table player
( id number(11),
  name varchar(50) not null,
  country varchar(50) not null,
  skill_id number(11) REFERENCES skill(id),
  team_id number(11) REFERENCES team(id),
  primary key(id)
  );

-- 8. **Create table venue**

create table venue
( id number(11),
  stadium_name varchar(50) not null,
  city_id number(11) REFERENCES city(id),
  PRIMARY KEY (id)
  );

-- 9. **Create table event**

create table event
(
id number(11),
innings_id number(11) REFERENCES innings(id),
event_no number(11) not null,
raider_id number(11) REFERENCES player(id),
raid_points number(11) not null,
defending_points number(11) not null,
clock_in_seconds number(11) not null,
team_one_score number(11) not null,
team_two_score number(11) not null,
primary key(id)
);



-- 10. **Create table extra_event**

create table extra_event
(
id number(11),
event_id number(11) REFERENCES event(id),
extra_type_id number(11) REFERENCES extra_type(id),
points number(11) not null,
score_team_id number(11) REFERENCES team(id),
primary key(id)
);



-- 11. **Create table outcome**

create table outcome
( id number(11),
  status varchar(100) not null,
  winner_team_id number(11) REFERENCES team(id),
  score number(11),
  player_of_match number(11) REFERENCES player(id),
  PRIMARY KEY (id)
  );

-- 12. **Create table game**

create table game
( id number(11),
game_id date,
team_id_1 number(11) REFERENCES team(id),
team_id_2 number(11) REFERENCES team(id),
venue_id number(11) REFERENCES venue(id),
outcome_id number(11) REFERENCES outcome(id),
referee_id_1 number(11) REFERENCES referee(id),
referee_id_2 number(11) REFERENCES referee(id),
first_innings_id number(11) REFERENCES innings(id),
second_innings_id number(11) REFERENCES innings(id),
primary KEY (id)
);


-- 13. **Drop table city**

Drop table city;



-- 14. **Drop table innings**

Drop table innings;

-- 15. **Drop table skill**

Drop table skill;

-- 16. **Drop table extra_type**

Drop table extra_type;
