create database onlinestreaming3nf;
use onlinestreaming3nf;

CREATE TABLE user_info
( 
user_id varchar (10),
user_name varchar(20) NOT NULL,
UPassword varchar(10) NOT NULL,
email varchar(20) NOT NULL,
phone_num int,
credit_card long NOT NULL,
primary key (user_id));
drop table user_info;

CREATE TABLE user_profile
(
profile_id varchar (10),
user_id varchar (10),
profile_name varchar (20) UNIQUE,
primary key (profile_id, user_id),
foreign key (user_id) references user_info(user_id));
drop table user_profile;

CREATE TABLE watch_later
(
profile_id varchar (10),
to_watch_list varchar(20),
foreign key (profile_id) references user_profile(profile_id));
drop table watch_later;

CREATE TABLE watch_history
(
profile_id varchar (10),
watch_history_list varchar (30),
foreign key (profile_id) references user_profile(profile_id));
drop table watch_history;

CREATE TABLE Devices_registered
(
device_id varchar(10),
device_name varchar(20),
last_login time(0),
profile_id varchar(10),
primary key (device_id, profile_id),
foreign key (profile_id) references user_profile(profile_id));
drop table Devices_registered;

CREATE TABLE Shows
(
show_id varchar(10),
show_type varchar(10),
genre varchar(10),
show_title varchar(10),
release_year int,
rating varchar(10),
duration varchar(10),
s_desc text,
primary key (show_id));
drop table Shows;

CREATE TABLE reviews
( show_id varchar(10),
profile_id varchar(10),
review text,
 primary key(show_id , profile_id),
foreign key (show_id) references Shows(show_id), 
foreign key (profile_id) references user_profile(profile_id));
drop table reviews;

CREATE TABLE subscription
(
user_id varchar(10) UNIQUE,
sub_ID varchar(10) UNIQUE,
sub_date timestamp,
sub_type varchar(10),
sub_price float,
primary key(user_id, sub_ID),
foreign key(user_id) references user_info(user_id));
drop table subscription;
describe subscription;

CREATE TABLE payment
(user_id varchar(10),
pay_ID varchar(10),
payment_date timestamp,
method_of_payment varchar(20),
price float,
primary key (pay_ID, user_id),
foreign key(user_id) references user_info(user_id),
foreign key(pay_id) references subscription(sub_id));
drop table payment;

CREATE TABLE cast_role_in_show
(cast_id varchar(10),
show_id varchar(10),
role_played varchar(10),
primary key (cast_id, show_id),
foreign key(show_id) references Shows(show_id));
drop table cast_role_in_show;

CREATE TABLE cast_id_name(
cast_id varchar(10),
cast_name varchar(10),
primary key (cast_id),
foreign key(cast_id) references cast_role_in_show(cast_id));
drop table cast_id_name;

ALTER TABLE Shows MODIFY show_title varchar(30);
ALTER TABLE Shows MODIFY show_type varchar(30);
INSERT INTO Shows VALUES('1','Movie', 'Sci-fi', 'Hunger Games', 2012, '7.2', '2h 22m',
'Katniss volunteers to replace her sister in a tournament that ends only when one participant remains');
INSERT INTO Shows VALUES('2','Documentary', 'Music', 'Miss Americana', 2020, '7.4', '1h 26m',
'Pop singer Taylor Swift reveals intimate details of her life while showcasing backstage and onstage concert footage');
INSERT INTO Shows VALUES('3','Documentary', 'Music', 'Burn The Stage: The Movie', 2018, '8.8', '1h 25m',
'Behind the scenes of the 2017 Wings Tour by BTS');
INSERT INTO Shows VALUES('4','Movie', 'Comedy', 'Mean Girls', 2004, '7', '1h 37m',
'Cady joins a new public school and befriends Janis and Damian. They warn her to avoid the Plastics.');
INSERT INTO Shows VALUES('5','Movie', 'Romance', 'Titanic', 1997, '7.8', '3h 15m',
'Seventeen-year-old Rose from an aristocratic family falls in love with Jack Dawson, an artist on the Titanic');
INSERT INTO Shows VALUES('6','Movie', 'Sci-fi', 'Inception', 2010, '8.8', '2h 28m',
'Cobb steals information from his targets by entering their dreams. He is wanted for an alleged murder and his only chance at redemption is to 
perform the impossible, an inception');
INSERT INTO Shows VALUES('7','Short Film', 'Adventure', 'Feast', 2014, '8.2', '6m',
'A dog named Winston enjoys eating junk food from his master. However, when his master switches to healthy food, Winston is unable to enjoy junk food');
INSERT INTO Shows VALUES('8','Concert', 'Music', 'The 1989 World Tour Live', 2015, '9', '2h 11m',
'1989 World Tour by Taylor Swift');
INSERT INTO Shows VALUES('9','Musical', 'Comedy', 'Cats', 2019, '2.7', '1h 50m',
'A tribe of cats must decide yearly which one will ascend to the Heaviside Layer and come back to new life');
INSERT INTO Shows VALUES('10','Musical', 'Comedy', 'Hairspray Live!', 2016, '7', '2h ',
'A teenage dance-loving girl dreams of getting a spot on a popular television show');

ALTER TABLE cast_role_in_show MODIFY role_played varchar(30);
INSERT INTO cast_role_in_show VALUES ('1', '1','Katniss Everdeen');
INSERT INTO cast_role_in_show VALUES ('2', '1','Peeta Mellark');
INSERT INTO cast_role_in_show VALUES ('3', '2','Taylor Swift');
INSERT INTO cast_role_in_show VALUES ('4', '3','Jin');
INSERT INTO cast_role_in_show VALUES ('5', '3','V');
INSERT INTO cast_role_in_show VALUES ('6', '3','Jungkook');
INSERT INTO cast_role_in_show VALUES ('7', '3','Jimin');
INSERT INTO cast_role_in_show VALUES ('8', '3','J-Hope');
INSERT INTO cast_role_in_show VALUES ('9', '3','RM');
INSERT INTO cast_role_in_show VALUES ('10', '3','Suga');
INSERT INTO cast_role_in_show VALUES ('11', '4','Cady Heron');
INSERT INTO cast_role_in_show VALUES ('12', '5','Jack Dawson');
INSERT INTO cast_role_in_show VALUES ('13', '5','Rose Dewitt');
INSERT INTO cast_role_in_show VALUES ('12', '6','Cobb');
INSERT INTO cast_role_in_show VALUES ('3', '8','Taylor Swift');
INSERT INTO cast_role_in_show VALUES ('3', '9','Taylor Swift');
INSERT INTO cast_role_in_show VALUES ('14', '10','Ariana Grande');

ALTER TABLE cast_id_name MODIFY cast_name varchar(30);
INSERT INTO cast_id_name VALUES('1','Jennifer Lawrence');
INSERT INTO cast_id_name VALUES('2','Josh Hutcherson');
INSERT INTO cast_id_name VALUES('3','Taylor Swift');
INSERT INTO cast_id_name VALUES('4','Kim Soekjin');
INSERT INTO cast_id_name VALUES('5','Kim Taehyung');
INSERT INTO cast_id_name VALUES('6','Jeon Jungkook');
INSERT INTO cast_id_name VALUES('7','Park Jimin');
INSERT INTO cast_id_name VALUES('8','Kim Hoseok');
INSERT INTO cast_id_name VALUES('9','Kim Namjoon');
INSERT INTO cast_id_name VALUES('10','Min Yoongi');
INSERT INTO cast_id_name VALUES('11','Lindsay Lohan');
INSERT INTO cast_id_name VALUES('12','Leonardo Dicaprio');
INSERT INTO cast_id_name VALUES('13','Kate Winslet');
INSERT INTO cast_id_name VALUES('14','Ariana Grande');
select * from cast_id_name;

insert into user_info values('u100', 'QCYN2', 'letsdebut', 'iqiyi@gmail.com', 100001, 1234567890);
insert into user_info values('u101', 'SNSD', '9or8or5', 'smgg@gmail.com', 100010, 2345678901);
insert into user_info values('u102', 'REDVELVET', 'notacake', 'smtown@gmail.com', 100011, 3456789012);
insert into user_info values('u103', 'LOONA', 'snsfreedom', 'bbc@gmail.com', 100100, 4567890123);
insert into user_info values('u104', 'BLACKPINK', 'hateyg', 'dungeon@gmail.com', 100101, 5678901234);
insert into user_info values('u105', 'TWICE', 'nationsgg', 'jypgg1@gmail.com', 100110, 6789012345);
insert into user_info values('u106', 'ITZY', 'crownpose', 'jypgg2@gmail.com', 100111, 7890123456);
insert into user_info values('u107', 'EVERGLOW', 'aishaaa', 'yuehua@gmail.com', 101000, 8901234567);
insert into user_info values('u108', 'GOT7', 'nonkrapper', 'jypbg@gmail.com', 101001, 9012345678);
insert into user_info values('u109', 'NCT', 'infinity', 'smbg3@gmail.com', 101010, 0123456789);
insert into user_info values('u110', 'EXO', '12or9', 'smbg2@gmail.com', 101011, 1357924680);
insert into user_info values('u111', 'SHINEE', '2ndgenking', 'smbg1@gmail.com', 101100, 1470235689);
insert into user_info values('u112', 'BTS', 'purplethem', 'bighit@gmail.com', 101101, 1592346780);
insert into user_info values('u113', 'TXT', 'lilbros', 'bighitsub@gmail.com', 101110, 1623457890);
insert into user_info values('u114', 'ATEEZ', 'allrdancer', 'kqe@gmail.com', 101111, 2143658709);

insert into subscription values('u100', 's100', '2020-04-01 10:10:00', 'basic', 499.99);
insert into subscription values('u101', 's101', '2020-04-02 12:00:12', 'standard', 649.50);
insert into subscription values('u102', 's102', '2020-04-03 10:10:00', 'premium', 799.00);
insert into subscription values('u103', 's103', '2020-04-01 11:11:11', 'ultra', 1000.10);
insert into subscription values('u104', 's104', '2020-04-05 09:10:07', 'mobile', 199.00);
insert into subscription values('u105', 's105', '2020-04-06 08:23:44', 'standard', 649.50);
insert into subscription values('u106', 's106', '2020-04-07 10:56:59', 'ultra', 1000.10);
insert into subscription values('u107', 's107', '2020-04-02 10:28:01', 'standard', 649.50);
insert into subscription values('u108', 's108', '2020-04-03 12:00:12', 'basic', 499.99);
insert into subscription values('u109', 's109', '2020-04-04 09:12:33', 'premium', 799.00);
insert into subscription values('u110', 's110', '2020-04-11 07:30:15', 'standard', 649.50);
insert into subscription values('u111', 's111', '2020-04-03 11:01:02', 'basic', 499.99);
insert into subscription values('u112', 's112', '2020-04-13 08:23:44', 'mobile', 199.00);
insert into subscription values('u113', 's113', '2020-04-14 09:09:00', 'premium', 799.00);
insert into subscription values('u114', 's114', '2020-04-11 10:10:10', 'ultra', 1000.10);

insert into payment values('u100', 's100', '2020-04-01 10:05:13', 'visa', 499.99);
insert into payment values('u101', 's101', '2020-04-02 11:58:01', 'mastercard', 649.50);
insert into payment values('u102', 's102', '2020-04-03 10:8:50', 'american express', 799.00);
insert into payment values('u103', 's103', '2020-04-01 11:10:33', 'discover', 1000.10);
insert into payment values('u104', 's104', '2020-04-05 09:08:07', 'mastercard', 199.00);
insert into payment values('u105', 's105', '2020-04-06 08:20:59', 'paypal', 649.50);
insert into payment values('u106', 's106', '2020-04-07 10:50:23', 'visa', 1000.10);
insert into payment values('u107', 's107', '2020-04-02 10:26:45', 'discover', 649.50);
insert into payment values('u108', 's108', '2020-04-03 11:59:09', 'american express', 499.99);
insert into payment values('u109', 's109', '2020-04-04 09:10:31', 'discover', 799.00);
insert into payment values('u110', 's110', '2020-04-11 07:28:28', 'paypal', 649.50);
insert into payment values('u111', 's111', '2020-04-03 10:59:42', 'american express', 499.99);
insert into payment values('u112', 's112', '2020-04-13 08:22:00', 'paypal', 199.00);
insert into payment values('u113', 's113', '2020-04-14 09:07:31', 'mastercard', 799.00);
insert into payment values('u114', 's114', '2020-04-11 10:08:41', 'visa', 1000.10);

INSERT INTO user_profile VALUES('100','u100','Daniel');
INSERT INTO user_profile VALUES('101','u101','Ruth');
INSERT INTO user_profile VALUES('102','u102','Mary');
INSERT INTO user_profile VALUES('103','u103','Joseph');
INSERT INTO user_profile VALUES('104','u104','John');
INSERT INTO user_profile VALUES('105','u105','Sarah');
INSERT INTO user_profile VALUES('106','u106','Peter');
INSERT INTO user_profile VALUES('107','u107','Edwin');
INSERT INTO user_profile VALUES('108','u108','Simon');
INSERT INTO user_profile VALUES('109','u109','Philip');
INSERT INTO user_profile VALUES('110','u110','Jude');
INSERT INTO user_profile VALUES('111','u111','Andrew');
INSERT INTO user_profile VALUES('112','u112','Annah');
INSERT INTO user_profile VALUES('113','u113','Michael');
INSERT INTO user_profile VALUES('114','u114','Xavier');

INSERT INTO watch_later VALUES('100','Titanic');
INSERT INTO watch_later VALUES('101','Burn the stage');
INSERT INTO watch_later VALUES('101','Hunger games');
INSERT INTO watch_later VALUES('102','Mean Girls');
INSERT INTO watch_later VALUES('102','Titanic');
INSERT INTO watch_later VALUES('102','Inception');
INSERT INTO watch_later VALUES('103','Feast');
INSERT INTO watch_later VALUES('107','Mean Girls');
INSERT INTO watch_later VALUES('108','Cats');
INSERT INTO watch_later VALUES('109','Hairspray Live');
INSERT INTO watch_later VALUES('110','Inception');
INSERT INTO watch_later VALUES('111','Burn the stage');
INSERT INTO watch_later VALUES('112','Cats');
INSERT INTO watch_later VALUES('113','Miss Americana');
INSERT INTO watch_later VALUES('114','Hunger games');

INSERT INTO watch_history VALUES('100', 'Burn the stage');
INSERT INTO watch_history VALUES('100','Hunger games');
INSERT INTO watch_history VALUES('102','Cats');
INSERT INTO watch_history VALUES('102','Feast');
INSERT INTO watch_history VALUES('103','Miss Americana');
INSERT INTO watch_history VALUES('103','Inception');
INSERT INTO watch_history VALUES('103','Burn the Stage');
INSERT INTO watch_history VALUES('104','Mean Girls');
INSERT INTO watch_history VALUES('104','Hairspray Live');
INSERT INTO watch_history VALUES('105','Cats');
INSERT INTO watch_history VALUES('110','Titanic');
INSERT INTO watch_history VALUES('111','Hunger games');
INSERT INTO watch_history VALUES('111','Cats');
INSERT INTO watch_history VALUES('111','Miss Americana');
INSERT INTO watch_history VALUES('114','Mean Girls');

INSERT INTO Devices_registered VALUES('D1','IPhone6s','12:00','101');
INSERT INTO Devices_registered VALUES('D2','Android_TV','1:00','101');
INSERT INTO Devices_registered VALUES('D3','LAPTOP JMC','8:00','100');
INSERT INTO Devices_registered VALUES('D4','Samsung_TV','11:00','100');
INSERT INTO Devices_registered VALUES('D5','IPad7','12:50:00','102');
INSERT INTO Devices_registered VALUES('D6','oppo','7:00','103');
INSERT INTO Devices_registered VALUES('D7','Samsung_TAB4','10:30','103');
INSERT INTO Devices_registered VALUES('D8','Philips_TV','12:00','104');
INSERT INTO Devices_registered VALUES('D9','ACER','1:00','105');
INSERT INTO Devices_registered VALUES('D10','HP_Notebook','22:00','106');
INSERT INTO Devices_registered VALUES('D11','IPhoneX','15:00','107');
INSERT INTO Devices_registered VALUES('D12','Samsung_6','18:00','108');
INSERT INTO Devices_registered VALUES('D13','Smart_TV','8:00','109');
INSERT INTO Devices_registered VALUES('D14','SamsungGalaxy_tab4','7:00','110');
INSERT INTO Devices_registered VALUES('D15','MI','6:00','112');

INSERT INTO reviews VALUES('1','100'," As thrilling and smart as it is terrifying. There have been a number of big-gun literary series brought to screen over the past decade. This slays them all ");
INSERT INTO reviews VALUES('1','102',' There are swords, bows and arrows, knives, deadly bees, dense forests, computerized beasts, tree climbing, balls of fire, do or die instincts, a (not-so-happening) romantic plot.');
INSERT INTO reviews VALUES('2','103','Miss Americana" tells the story of a young star of singular self-esteem who must learn to grow up and become a mature pop star of even more awesome self-esteem.');
INSERT INTO reviews VALUES('2','101','This documentary gives fans a close-up glimpse of Taylor Swift’s beliefs');
INSERT INTO reviews VALUES('2','102',"Swift's candid, unpretentious narration, as well as choice footage of her as a child, a teen, and a young woman, make this movie highly accessible for both fans and casual viewers.");
INSERT INTO reviews VALUES('5','100',"This star-making James Cameron epic promises love and laughter in the midst of a perilous journey with a breathtaking finish. ");
INSERT INTO reviews VALUES('5','102',"Cameron was clearly inspired by the challenge of reproducing the event with a physical verisimilitude and impact inconceivable in the numerous previous film and TV versions of the event.");
INSERT INTO reviews VALUES('3','100',"Not because it's BTS, anyone that has seen the struggles of any of your favorite artists to start from the bottom it's very heartwarming. I recommend! Even if you aren't a fan of theirs, this will give you an idea of how much dedication BTS puts in their music.
 ");
INSERT INTO reviews VALUES('3','103',"A touching and REAL look at BTS during The Wings Tour. ");
INSERT INTO reviews VALUES('4','104'," Speaking to anyone who has survived the jungles of high school, Mean Girls has something for everyone. The refreshingly honest appeal of this film is ageless.");
INSERT INTO reviews VALUES('4','114',"January 28, 2020 Mean Girls is a funnier and more insightful movie than your average teen comedy.");
INSERT INTO reviews VALUES('9','105',"A deranged freak-fantasia worth falling into for a couple of hours, if just to say you did. That is to say, it's Cats.");
INSERT INTO reviews VALUES('10','104',"I loved this Movie I loved the cast, the costumes and the musical dance numbers in it I would recommend it to anyone who loves the Hairspray musical and anyone who loves Ariana Grande as much as I do I give it a 10/10 rating because it was so good that I wanted to watch it over and over again");
INSERT INTO reviews VALUES('6','103'," Inception is an intense, complex story, but it's always coherent, imaginative, and entertaining.");
INSERT INTO reviews VALUES('7','102',"While it doesn't advance the monster movie genre into new territory, it has fun exploiting and subverting the genre's conventions and the audience's expectation.");

select * from user_info;
select * from user_profile;
select * from watch_later;
select * from watch_history;
select * from Devices_registered;
select * from Shows;
select * from reviews;
select * from subscription;
select * from payment;
select * from cast_role_in_show;
select * from cast_id_name;

select p1.user_id, u1.user_name
from payment p1, user_info u1
where p1.method_of_payment='visa' and p1.user_id=u1.user_id and exists(
select p2.user_ID
from payment p2, subscription s1
where s1.sub_type='ultra' and p2.pay_ID=s1.sub_ID and s1.user_id=u1.user_id);

SELECT CA.cast_name 
FROM cast_id_name CA
WHERE CA.cast_id IN
 ( SELECT CR.cast_id
 FROM Shows S, cast_role_in_show CR
 WHERE  CR.show_id = S.show_id AND S.show_title = "Mean Girls");

SELECT S.sub_type
FROM subscription S
WHERE S.user_id IN 
( SELECT U.user_id
FROM user_info U, user_profile P
WHERE U.user_id = P.user_id AND P.profile_id = '107');

SELECT S.Show_title
FROM Shows S, cast_id_name C
WHERE S.show_id IN  (SELECT CR.show_id
FROM cast_role_in_show CR
WHERE CR.cast_id = C.cast_id AND C.cast_name = "Leonardo Dicaprio");

SELECT CA.cast_name 
FROM cast_id_name CA
WHERE CA.cast_id IN
 ( SELECT CR.cast_id
 FROM Shows S, cast_role_in_show CR
 WHERE  CR.show_id = S.show_id AND S.show_title in ("Miss Americana","The 1989 World Tour Live"));
 
 SELECT distinct(UP.profile_name), UP.profile_id FROM user_profile UP, devices_registered DR WHERE UP.profile_id in(
 SELECT DR.profile_id from devices_registered DR group by DR.profile_id having count(DR.device_id)>1);

delimiter //
CREATE FUNCTION f3()
returns int
deterministic
begin
declare countt int;
	select count(CA.cast_name) AS cast_members INTO countt
	FROM cast_id_name CA WHERE CA.cast_id IN
    ( SELECT CR.cast_id FROM Shows S, cast_role_in_show CR
    WHERE  CR.show_id = S.show_id and S.show_title= 'Burn The Stage: The Movie');
	return countt;
end ; //
delimiter ;
select f3() AS cast_members;
drop function f3;

delimiter //
create function f1()
returns int 
deterministic
begin
select GROUP_CONCAT(profile_id SEPARATOR ', ') as checking into @args from watch_later where to_watch_list='Burn the stage';
return @args;
end; //
delimiter ;
select @args as user_who_wants_to_watch;
drop function f1;

delimiter //
CREATE FUNCTION subscribers()
returns int
deterministic
begin
declare cnt int;
select count(*) as totall into cnt
from subscription;
return cnt;
end ; //
delimiter ;
select subscribers() AS total;
drop function subscribers;

DELIMITER //
CREATE trigger no_of_devices_check 
AFTER INSERT ON Devices_registered FOR EACH ROW
BEGIN
SELECT IF (((
SELECT count(*) 
FROM Devices_registered 
WHERE profile_id=new.profile_id)>2), 'Sorry, maximum devices(2) for the profile has reached.', 'New device registered!') AS checking INTO @arg;
END; //
DELIMITER ;

INSERT INTO Devices_registered VALUES('D16', 'Samsung Galaxy Note8', '00:00', '100');
SELECT @arg AS checking;

drop trigger no_of_devices_check;

delete from Devices_registered where device_id='D16';
