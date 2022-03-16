-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: us-cdbr-east-04.cleardb.com    Database: heroku_76678b9d0e835fb
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5,'Pasindu','Lakshan','dkp9912@gmail.com','Pasindu123'),(25,'mayumi','malsha','admin02@gmail.com','admin02pass'),(55,'Anjalee','Bimalsha','anjaleebima@gmail.com','Anjallee123'),(75,'Lahiru','Gayashan','Gayashan99@gmail.com','Gaya123'),(95,'Luhan','Kim','admin07@gmail.com','admin07Pass');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celebrity`
--

DROP TABLE IF EXISTS `celebrity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celebrity` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `height` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `profession` varchar(32) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celebrity`
--

LOCK TABLES `celebrity` WRITE;
/*!40000 ALTER TABLE `celebrity` DISABLE KEYS */;
INSERT INTO `celebrity` VALUES (95,'Peter','Jackson','1961-10-31','New Zealand',169,'Sir Peter Robert Jackson ONZ KNZM (born 31 October 1961) is a New Zealand film director, screenwriter, and film producer. He is best known as the director, writer, and producer of the Lord of the Rings trilogy (2001?03) and the Hobbit trilogy .','Peter Jackson was born as an only child in a small coast-side town in New Zealand in 1961. When a friend of his parents bought him a super 8 movie camera (because she saw how much he enjoyed taking photos), the then eight-year-old Peter instantly grabbed the thing to start recording his own movies, which he made with his friends.','Director','img1633752941689.jpg'),(105,'J.R.R. ','Tolkien','1892-01-03','United Kingdom',174,'John Ronald Reuel Tolkien CBE FRSL was an English writer, poet, philologist, and academic, best known as the author of the high fantasy works The Hobbit and The Lord of the Rings. ','English writer, scholar and philologist, Tolkien s father was a bank manager in South Africa. Shortly before his father died (1896) his mother took him and his younger brother to his father s native village of Sarehole, near Birmingham, England. ','Writer','img1633753870408.jpg'),(115,'Fran','Walsh','1959-01-10','New Zealand',165,'Dame Frances Rosemary Walsh DNZM is a New Zealand screenwriter, film producer, and lyricist. The partner of filmmaker Peter Jackson, Walsh has contributed to all of his films since 1989:','Fran Walsh was born on January 10, 1959 in Wellington, New Zealand. She is known for her work on The Lord of the Rings: The Fellowship of the Ring (2001), The Lord of the Rings: The Return of the King (2003) and The Lord of the Rings: The Two Towers (2002). She has been married to Peter Jackson since 1987. They have two children. ','Writer','img1633754176973.jpg'),(125,'Daniel','Radcliffe','1989-07-23','United Kingdom',165,'Daniel began performing in small school productions as a young boy. Soon enough, he landed a role in David Copperfield (1999), as the young David Copperfield.','Daniel Jacob Radcliffe was born on July 23, 1989 in Fulham, London, England, to casting agent Marcia Gresham and literary agent Alan Radcliffe. His father is from a Northern Irish Protestant background, while his mother was born in South Africa, to a Jewish family.','Actor','img1633763118542.jpg'),(135,'Rupert','Grint','1988-08-24','United Kingdom',173,'Beginning in 2002, Grint began to work outside of the Harry Potter franchise, playing a co-leading role in Thunderpants. He has had starring roles in Driving Lessons, a dramedy released in 2006, and Cherrybomb, a drama film of limited release in 2010.','Rupert Alexander Lloyd Grint was born in Harlow, Essex, England, the elder son of Joanne (Parsons) and Nigel Grint, who dealt in memorabilia. The first of 5 children, Rupert has one brother and 3 sisters. His brother James was born when Rupert was a year old, Georgina and Samantha were born in 1993 and 1996 respectively, and last, but not least, Charlotte, who was born in 1999.','Actor','img1633763513017.jpg'),(145,'Joanne','Rowling','1965-07-31','United Kingdom',155,'Joanne Rowling  better known by her pen name J. K. Rowling, is a British author, philanthropist, film producer, television producer, and screenwriter','Joanne Rowling 31 July 1965 (age 56) Yate, Gloucestershire, England. She is best known for writing the Harry Potter fantasy series','Writer','img1633764160825.jpg'),(155,'Chris','Columbus','1958-10-10','America',170,'Chris Joseph Columbus studied film at Tisch School of the Arts where he developed an interest in filmmaking. After writing screenplays for several teen comedies in the mid-1980s, he made his directorial debut with a teen adventure, Adventures in Babysitting (1987).','Chris Columbus was born on September 10, 1958 (age 63)\r\nSpangler, Pennsylvania, U.S.','Director','img1633764514330.jpg'),(165,'David','Heyman','1961-07-26','United Kingdom',165,'David Jonathan Heyman is an English film producer and the founder of Heyday Films. In 1999, he secured the film rights to the Harry Potter film series and went on to produce all eight installments, as well as the subsequent spin-offs','David Jonathan Heyman 26 July 1961 (age 60) London, England.  He is the son of John Heyman, producer of the films The Go-Between and Jesus, and Norma Heyman , an actress','Director','img1633764817157.jpg'),(175,'Elijah','Wood','1981-01-28','New Zealand',160,'Elijah Wood is an American actor and producer. He is best known for his portrayal of Frodo Baggins in the Lord of the Rings film trilogy (2001?2003) and The Hobbit: An Unexpected Journey (2012).','Wood was born in Cedar Rapids, Iowa, on January 28, 1981, the second of three children born to Debbie and Warren Wood, who operated a delicatessen together.','Actor','img1633765938388.jpg'),(185,'Ian','McKellen','1939-05-25','United Kingdom',149,'Sir Ian Murray McKellen is an English actor. His career spans six decades, having performed in genres ranging from Shakespearean and modern theatre to popular fantasy and science fiction.','McKellen was born on 25 May 1939 in Burnley, Lancashire, the son of Margery Lois and Denis Murray McKellen. He was their second child, with a sister, Jean, five years his senior.','Actor','img1633766290263.jpg'),(205,'Cate','Blanchett','1969-05-14','Australia',169,'Catherine Elise Blanchett is an Australian actress, producer, and theatre director. Regarded as one of the best actresses of her generation, she is noted for her versatile roles in blockbusters, independent films, and stage work in various theatre productions.','Catherine Elise Blanchett was born on 14 May 1969 in Melbourne, Victoria, Australia.  Her Australian mother, June Gamble,[9] worked as a property developer and teacher, and her American father, Robert DeWitt Blanchett Jr., a Texas native, was a United States Navy Chief Petty Officer.','Actor','img1633766876408.jpg'),(215,'Rick ','Porras','1969-05-07','America',155,'Rick Porras is an American producer, notably co-producing The Lord of the Rings film trilogy. He had a cameo appearance with Peter Jackson and other crew members in the special extended edition of The Return of the King as a Corsair pirate.','Rick Porras was born on May 7, 1969 in United States. He grew up in the San Francisco Bay Area and attended Stanford University, graduating in 1988 with a degree in history.','Director','img1633773534056.jpg'),(225,'Emma','Watson','1990-04-15','France',165,'Emma Charlotte Duerre Watson is an English actress and activist. She has gained recognition for her roles in both blockbusters and independent films, as well as her womens rights work.','Emma Charlotte Duerre Watson[4] was born on 15 April 1990 in Paris, to English lawyers Chris Watson and Jacqueline Luesby. Watson lived in Maisons Laffitte near Paris until age five. Her parents divorced when she was young, and Watson moved to England to live with her mother in Oxfordshire while spending weekends at her near her father in London.','Actor','img1633774298127.jpg'),(235,'Emilia','Clarke','1986-10-23','United Kingdom',157,'Emilia Isobel Euphemia Rose Clarke is an English actress. Her television debut was a guest appearance in the BBC One medical soap opera Doctors in 2009. The following year, she was named as one of the UK Stars of Tomorrow by Screen International magazine for her role in the TV film Triassic Attack (2010). Clarke had her breakthrough role as Daenerys Targaryen in the HBO epic fantasy television series Game of Thrones (2011?2019).','British actress Emilia Clarke was born on October 23, 1986 in London and grew up in Oxfordshire, England. Her father was a theatre sound engineer and her mother is a businesswoman. Her father was working on a theatre production of Show Boat and her mother took her along to the performance. From 2000 to 2005, she attended St. Edwards School of Oxford, where she appeared in two school plays. She went on to study acting at the prestigious Drama Centre London, where she took part in 10 plays.','Actor','img1633792528983.jpg'),(245,'Kit','Harington','1986-12-26','United Kingdom',173,'Christopher Catesby Harington is an English actor. He studied at the Royal Central School of Speech & Drama and made his professional acting debut with the lead role of Albert Narracott in the critically acclaimed West End play War Horse at the National Theatre.','Kit Harington was born on 26 December, 1986 as Christopher Catesby Harington in Acton, London, to Deborah Jane , a former playwright, and David Richard Harington, a businessman. His mother named him after 16th century British playwright and poet Christopher Marlowe, whose first name was shortened to Kit, a name Harington prefers.','Actor','img1633792901077.jpg'),(255,'Kit','Harington','1986-12-26','United Kingdom',173,'Christopher Catesby Harington is an English actor. He studied at the Royal Central School of Speech & Drama and made his professional acting debut with the lead role of Albert Narracott in the critically acclaimed West End play War Horse at the National Theatre.','Kit Harington was born on 26 December, 1986 as Christopher Catesby Harington in Acton, London, to Deborah Jane , a former playwright, and David Richard Harington, a businessman. His mother named him after 16th century British playwright and poet Christopher Marlowe, whose first name was shortened to Kit, a name Harington prefers.','Actor','img1633792909763.jpg'),(265,'Jason','Momoa','1979-07-01','America',193,'Joseph Jason Namakaeha Momoa is an American actor and producer. He made his acting debut as Jason Ioane on the syndicated action drama series Baywatch: Hawaii (1999?2001), which was followed by him portraying Ronon Dex on the Syfy science fiction series Stargate Atlantis (2005?2009), Khal Drogo in the first two seasons of the HBO fantasy drama series Game of Thrones (2011?2012),','Joseph Jason Namakaeha Momoa was born on August 1, 1979, in Honolulu, Hawaii. He is the son of Coni , a photographer, and Joseph Momoa, a painter. His father is of Native Hawaiian and Samoan descent; and his mother, who is from Iowa, is of German, Irish, and Native American ancestry','Actor','img1633793244601.jpg'),(275,'Tom','Hiddleston','1981-02-09','United Kingdom',187,'Thomas William Hiddleston is an English actor. He is the recipient of various accolades, including a Golden Globe Award and a Laurence Olivier Award, in addition to nominations for a Tony Award, a British Academy Film Award, and two Primetime Emmy Awards.','Thomas William Hiddleston was born in Westminster, London, to English-born Diana Patricia (Servaes) and Scottish-born James Norman Hiddleston. His mother is a former stage manager, and his father, a scientist, was the managing director of a pharmaceutical company.','Actor','img1633793550685.jpg'),(285,'Owen','Wilson','1968-11-18','America',180,'Owen Cunningham Wilson is an American actor, comedian, producer, and screenwriter. He has had a long association with filmmaker Wes Anderson with whom he shared writing and acting credits for Bottle Rocket (1996), Rushmore (1998), and The Royal Tenenbaums (2001), the last of which earned him a nomination for the Academy Award and BAFTA Award for Best Screenplay.','Self-proclaimed troublemaker Owen Cunningham Wilson was born in Dallas, to Irish-American parents originally from Massachusetts. He grew up in Texas with his mother, Laura (Cunningham), a photographer; his father, Robert Andrew Wilson, an ad exec; and his brothers, Andrew Wilson (the eldest) and Luke Wilson (the youngest).','Actor','img1633793774354.jpg'),(295,'Sophia','Di Martino','1983-11-15','United Kingdom',170,'Sophia Di Martino is an English actress. She gained international recognition for portraying Sylvie in the Marvel Cinematic Universe (MCU) television series Loki.','Sophia Di Martino was born on November 15, 1983 in Nottingham, Nottinghamshire, England. Di Martino obtained an A Level in performing arts before attending the University of Salford and signing with an agent. She graduated with a BA with honours in media and performance.','Actor','img1633794075904.jpg'),(305,'Benedict','Cumberbatch','1976-07-09','United Kingdom',183,'Benedict Timothy Carlton Cumberbatch is an English actor. Known for his performances on the stage and screen, he has received various accolades throughout his career, including a Primetime Emmy Award, a British Academy Television Award, and a Laurence Olivier Award. Cumberbatch won the Primetime Emmy Award for Outstanding Lead Actor in a Miniseries or Movie for Sherlock.','Benedict Timothy Carlton Cumberbatch was born and raised in London, England. His parents, Wanda Ventham and Timothy Carlton , are both actors. He is a grandson of submarine commander Henry Carlton Cumberbatch, and a great-grandson of diplomat Henry Arnold Cumberbatch CMG.','Actor','img1633794389236.jpg'),(315,'Martin','Freeman','1971-09-08','United Kingdom',170,'Martin John Christopher Freeman is an English actor. Among other accolades, he has won an Emmy Award, a BAFTA Award and a Screen Actors Guild Award, and has been nominated for a Golden Globe Award. His most notable roles are that of Tim Canterbury in the mockumentary series The Office (2001?2003), Dr. John Watson in the British crime drama series Sherlock (2010?2017)','Martin John Christopher Freeman was born on 8 September 1971 in Aldershot, Hampshire, the youngest of five children. His parents, Philomena and naval officer Geoffrey Freeman, separated when he was a child. His father died of a heart attack when Freeman was 10 years old. ','Actor','img1633794747165.jpg'),(325,'Louise','Brealey','1979-03-27','United Kingdom',160,'Louise Brealey also credited as Loo Brealey, is an English actress, writer and journalist. She played Molly Hooper in Sherlock, Cass in Back, Scottish professor Jude McDermid in Clique, Gillian Chamberlain in A Discovery of Witches and Donna Harman in Death in Paradise.','Louise was born on March 27, 1979 in Northampton, Northamptonshire, England, UK. She attended Kimbolton School, proceeding to read History at Cambridge. She then trained at the Lee Strasberg Institute in New York City and with clown teacher Philippe Gaulier.\r\n','Actor','img1633795124994.jpg'),(335,'Millie','Brown','2004-02-19','Spain',163,'Millie Bobby Brown is a British actress, model and producer. Brown began her acting career by playing guest roles on television. She achieved worldwide fame for her role as Eleven in the first season of the Netflix science fiction horror drama series Stranger Things (2016?present), which has been renewed for four seasons.','Millie was born in Marbella, Andalusia, Spain, the third of four children of English parents, Kelly and Robert Brown. The family moved to Bournemouth, Dorset, when Brown was around four years old, and then to Orlando, Florida, four years later.','Actor','img1633795402830.jpg'),(345,'Joe','Keery','1992-04-24','America',180,'Joseph David Keery is an American actor and musician. He is best known for playing Steve Harrington in the American science-fiction horror streaming television series Stranger Things. He is a contributing musician for the American psychedelic rock band Post Animal.','Keery was born in Newburyport, Massachusetts, to parents David and Nina Keery, an architect and Professor of English, respectively. He is the second of five children and grew up with sisters Caroline, Lizzy, Kate, and Emma. Keery was raised in Newburyport and attended River Valley Charter School, a local Montessori elementary and middle school, and Newburyport High School.','Actor','img1633795636971.jpg'),(355,'Finn','Wolfhard','2002-12-23','Canada',179,'Finn Wolfhard is a Canadian actor, musician, screenwriter, and director. His acting roles include Mike Wheeler in the Netflix series Stranger Things (2016?present), for which he has won Screen Actors Guild Award for Outstanding Performance by an Ensemble in a Drama Series out of three nominations.','Wolfhard was born in Vancouver, British Columbia, Canada, to a family of French, German, and Jewish descent. He attended Catholic school. His father, Eric Wolfhard, is a researcher on aboriginal land claims. He has an older brother, actor Nick Wolfhard.','Actor','img1633795854530.jpg'),(365,'Cillian','Murphy','1976-05-25','Ireland',172,'Cillian Murphy is an Irish actor. He started his performing career as the lead singer, guitarist, and songwriter of a rock band named The Sons of Mr. Green Genes. Murphy turned down a record deal in the late 1990s and began acting on stage and in short and independent films','Striking Irish actor Cillian Murphy was born in Douglas, the oldest child of Brendan Murphy, who works for the Irish Department of Education, and a mother who is a teacher of French. He has three younger siblings.','Actor','img1633796148332.jpg'),(375,'Helen','McCrory','1968-08-17','United Kingdom',163,'Helen Elizabeth McCrory was an English actress. She made her stage debut in The Importance of Being Earnest in 1990. Other stage roles include playing Lady Macbeth in Macbeth at Shakespeares Globe, Olivia in Twelfth Night and Rosalind in As You Like It in the West End.','McCrory was born on 17 August 1968 in Paddington, London. Her mother, Ann, is a Welsh physiotherapist, and her father, Iain McCrory, is a diplomat from Glasgow; they were married in 1974. She was the eldest of three children.','Actor','img1633796904927.jpg'),(385,'Louise','Hofmann','1997-06-03','German',170,'Louis Hofmann is a German actor. He first gained attention as the lead in the 2011 German film Tom Sawyer and won the Bodil Award for Best Supporting Actor for his role as a teenage German prisoner of war in the 2015 Danish film Land of Mine. He is also known for playing Jonas in the 2017 German Netflix Original series Dark.','Louis Hofmann was born on June 3, 1997 in the Bensberg district of Bergisch Gladbach and grew up in Cologne. His first experience in front of the camera was for Servicezeit, an evening magazine programme on WDR Fernsehen television network.','Actor','img1633797411178.jpg'),(395,'Lisa','Vicari','1997-02-11','German',175,'Lisa Vicari is a German actress. She is known for portraying Martha Nielsen in the Netflix series Dark and the lead role of Isi in the Netflix original film Isi and Ossi.','Vicari was born in Munich in 1997, into a family of doctors. At the age of ten, she took an improvisational theatre course and shortly thereafter appeared in her first short film, Tunnelblicke. In 2010, she acted in the childrens film Hanni and Nanni. ','Actor','img1633797702964.jpg'),(405,'Oliver','Masucci','1968-12-06','German',186,'Oliver Masucci is a German actor. He is best known for the role of Adolf Hitler in the 2015 film adaptation of the satirical novel Er Ist Wieder Da, and the role of Ulrich Nielsen in the Netflix series Dark.','He was born in Stuttgart, but raised in Bonn. His father is Italian, his mother German. The family ran several restaurants in Bonn. He has three children.','Actor','img1633797976086.jpg');
/*!40000 ALTER TABLE `celebrity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (5,'Comedy'),(15,'Action'),(25,'Adventure'),(35,'Drama'),(45,'Fantasy'),(65,'Mystery'),(75,'Romance'),(85,'Sci-Fi'),(95,'Thriller'),(115,'Horror'),(125,'Animation');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `runtime` varchar(30) DEFAULT NULL,
  `description` varchar(512) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `download_link` varchar(500) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `views` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `trailer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (195,'The Lord of the Rings: The Fellowship of the Ring','2001-12-19','2h 58min','A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.','img1633776011336.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=V75dMMIW2B4'),(205,'Lord Of The Rings: The Two Towers','2002-12-18','2h 59min','While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Saurons new ally, Saruman, and his hordes of Isengard.','img1633776307129.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=LbfMDwc4azU'),(215,'The Lord of the Rings: The Return of the King','2003-12-01','3h 21min','Gandalf and Aragorn lead the World of Men against Saurons army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.','img1633776496994.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=r5X-hFf6Bwo'),(225,'Harry Potter and the Philosophers Stone','2001-11-14','2h 32min','An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.','img1633776859608.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=PbdM1db3JbY'),(235,'Harry Potter & The Chamber Of Secrets','2002-11-03','2h 41min','An ancient prophecy seems to be coming true when a mysterious presence begins stalking the corridors of a school of magic and leaving its victims paralyzed.','img1633777062122.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=1bq0qff4iF8'),(245,'Harry Potter and The Prisoner of Azkaban','2004-05-31','2h 22min','Harry Potter, Ron and Hermione return to Hogwarts School of Witchcraft and Wizardry for their third year of study, where they delve into the mystery surrounding an escaped prisoner who poses a dangerous threat to the young wizard.','img1633777269141.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=lAxgztbYDbs'),(255,'Harry Potter And The Goblet Of Fire','2005-11-18','2h 37min','Harry Potter finds himself competing in a hazardous tournament between rival schools of magic, but he is distracted by recurring nightmares.','img1633777481548.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=3EGojp4Hh6I'),(265,'Harry Potter and the Order of the Phoenix','2007-06-11','2h 37min','With their warning about Lord Voldemorts return scoffed at, Harry and Dumbledore are targeted by the Wizard authorities as an authoritarian bureaucrat slowly seizes power at Hogwarts.','img1633777695963.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=y6ZW7KXaXYk'),(275,'Harry Potter and the Half-Blood Prince','2007-06-15','2h 33min','As Harry Potter begins his sixth year at Hogwarts, he discovers an old book marked as the property of the Half-Blood Prince and begins to learn more about Lord Voldemorts dark past.','img1633777831773.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=tAiy66Xrsz4'),(285,'Harry Potter & The Deathly Hallows Pt 1','2010-11-19','2h 26min','As Harry, Ron, and Hermione race against time and evil to destroy the Horcruxes, they uncover the existence of the three most powerful objects in the wizarding world: the Deathly Hallows.','img1633777998291.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=MxqsmsA8y5k'),(295,'Harry Potter & The Deathly Hallows Pt 2','2011-07-15','2h 10min','Harry, Ron, and Hermione search for Voldemorts remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.','img1633778292683.jpg','#',5,'2021-10-09',5657,3444,'United States','https://www.youtube.com/watch?v=5NYt1qirBWg'),(315,'John Wick','2014-01-01','1h 41min','An ex-hit-man comes out of retirement to track down the gangsters that killed his dog and took everything from him.','img1634083105886.jpg','#',5,'2021-10-11',0,0,'United States','#');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_cast` (
  `mid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `celebrity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cast`
--

LOCK TABLES `movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
INSERT INTO `movie_cast` VALUES (195,135,'Legolas'),(195,175,'Frodo'),(195,185,'Gandalf'),(195,205,'Galadriel'),(205,175,'Frodo'),(205,185,'Gandalf'),(205,205,'Galadriel'),(215,175,'Frodo'),(215,185,'Gandalf'),(215,205,'Galadriel'),(225,125,'Harry Potter'),(225,135,'Ron Weasley'),(225,225,'Hermione Granger'),(235,125,'Harry Potter'),(235,135,'Ron Weasley'),(235,225,'Hermione Granger'),(245,125,'Harry Potter'),(245,135,'Ron Weasley'),(245,225,'Hermione Granger'),(255,125,'Harry Potter'),(255,135,'Ron Weasley'),(255,225,'Hermione Granger'),(265,125,'Harry Potter'),(265,135,'Ron Weasley'),(265,225,'Hermione Granger'),(275,125,'Harry Potter'),(275,135,'Ron Weasley'),(275,225,'Hermione Granger'),(285,125,'Harry Potter'),(285,135,'Ron Weasley'),(285,225,'Hermione Granger'),(295,125,'Harry Potter'),(295,135,'Ron Weasley'),(295,225,'Hermione Granger'),(315,125,'John Wick'),(315,135,'Viggo Tarasov');
/*!40000 ALTER TABLE `movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_director`
--

DROP TABLE IF EXISTS `movie_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_director` (
  `mid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`mid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `movie_director_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `movie_director_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `celebrity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director`
--

LOCK TABLES `movie_director` WRITE;
/*!40000 ALTER TABLE `movie_director` DISABLE KEYS */;
INSERT INTO `movie_director` VALUES (195,95),(205,95),(215,95),(315,95),(225,155),(235,155),(245,155),(255,155),(265,155),(275,155),(285,155),(295,155);
/*!40000 ALTER TABLE `movie_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genre` (
  `mid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`mid`,`gid`),
  KEY `gid` (`gid`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `genre` (`gid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (195,15),(205,15),(215,15),(315,15),(195,25),(205,25),(215,25),(225,25),(235,25),(245,25),(255,25),(265,25),(275,25),(285,25),(295,25),(205,35),(215,35),(225,45),(235,45),(245,45),(255,45),(265,45),(275,45),(285,45),(295,45),(315,95);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_image`
--

DROP TABLE IF EXISTS `movie_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_image` (
  `mid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`,`image`),
  CONSTRAINT `movie_image_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_image`
--

LOCK TABLES `movie_image` WRITE;
/*!40000 ALTER TABLE `movie_image` DISABLE KEYS */;
INSERT INTO `movie_image` VALUES (195,'img1633776011344.jpg'),(205,'img1633776307131.jpg'),(215,'img1633776497037.jpg'),(225,'img1633776859610.jpg'),(235,'img1633777062125.jpg'),(245,'img1633777269190.jpg'),(255,'img1633777481550.jpg'),(265,'img1633777695965.jpg'),(275,'img1633777831794.jpg'),(275,'img1633777831797.jpg'),(285,'img1633777998293.jpg'),(295,'img1633778292809.jpg'),(315,'img1633935533947.jpg');
/*!40000 ALTER TABLE `movie_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_rating`
--

DROP TABLE IF EXISTS `movie_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_rating` (
  `mid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`mid`,`rating`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `movie_rating_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `movie_rating_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_rating`
--

LOCK TABLES `movie_rating` WRITE;
/*!40000 ALTER TABLE `movie_rating` DISABLE KEYS */;
INSERT INTO `movie_rating` VALUES (195,8,15),(205,8,15),(215,8,15),(225,8,15),(235,7,15),(245,9,15),(195,7,25),(205,7,25),(215,9,25),(225,9,25),(235,7,25),(255,9,25),(295,5,25),(195,9,35),(205,9,35),(215,9,35),(225,10,35),(235,9,35),(255,7,35),(265,8,35),(275,7,35),(285,8,35),(315,9,35),(195,8,45),(205,8,45),(215,8,45),(225,8,45),(235,8,45),(275,10,45),(295,10,45),(315,10,45),(195,10,55),(205,10,55),(215,9,55),(225,10,55),(235,10,55),(285,10,55);
/*!40000 ALTER TABLE `movie_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_review`
--

DROP TABLE IF EXISTS `movie_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_review` (
  `mid` int(11) NOT NULL,
  `review` varchar(1024) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`mid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `movie_review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `movie_review_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_review`
--

LOCK TABLES `movie_review` WRITE;
/*!40000 ALTER TABLE `movie_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_writer`
--

DROP TABLE IF EXISTS `movie_writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_writer` (
  `mid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`mid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `movie_writer_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `movie_writer_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `celebrity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_writer`
--

LOCK TABLES `movie_writer` WRITE;
/*!40000 ALTER TABLE `movie_writer` DISABLE KEYS */;
INSERT INTO `movie_writer` VALUES (195,105),(205,105),(215,105),(195,115),(205,115),(215,115),(315,115),(225,145),(235,145),(245,145),(255,145),(265,145),(275,145),(285,145),(295,145);
/*!40000 ALTER TABLE `movie_writer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow`
--

DROP TABLE IF EXISTS `tvshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `runtime` varchar(100) DEFAULT NULL,
  `description` varchar(1024) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `views` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `trailer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `tvshow_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow`
--

LOCK TABLES `tvshow` WRITE;
/*!40000 ALTER TABLE `tvshow` DISABLE KEYS */;
INSERT INTO `tvshow` VALUES (115,'Game of Thrones','2011-04-17','57min','Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.','img1633846565665.jpg',5,'2021-10-10',3435,'United Kingdom','https://www.youtube.com/watch?v=KYKpcWuZDYs'),(125,'Loki','2021-06-09','40min','The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of Avengers: Endgame.','img1633847016570.jpg',5,'2021-10-10',3435,'United States','https://www.youtube.com/watch?v=nW948Va-l10'),(135,'Sherlock','2011-06-05','1h 28min','A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London.','img1633847338114.jpg',5,'2021-10-10',3435,'United Kingdom','https://www.youtube.com/watch?v=Nj7ZSUkTTVI'),(145,'Stranger Things','2016-07-15','51min','When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.','img1633848262998.jpg',5,'2021-10-10',3435,'United States','https://www.youtube.com/watch?v=b9EkMc79ZSU'),(155,'Peaky Blinders','2014-09-30','1h','A gangster family epic set in 1900s England, centering on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.','img1633849052552.jpg',5,'2021-10-10',3435,'United Kingdom','https://www.youtube.com/watch?v=oVzVdvGIC7U'),(165,'Dark','2017-12-01','1h','A family saga with a supernatural twist, set in a German town, where the disappearance of two young children exposes the relationships among four families.','img1633849459256.jpg',5,'2021-10-10',3435,'Germany','https://www.youtube.com/watch?v=rrwycJ08PSA');
/*!40000 ALTER TABLE `tvshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_cast`
--

DROP TABLE IF EXISTS `tvshow_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_cast` (
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`tid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `tvshow_cast_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_cast_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `celebrity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_cast`
--

LOCK TABLES `tvshow_cast` WRITE;
/*!40000 ALTER TABLE `tvshow_cast` DISABLE KEYS */;
INSERT INTO `tvshow_cast` VALUES (115,235,'Daenerys Targaryen'),(115,245,'Jon Snow'),(125,275,'Loki'),(125,285,'Mobius'),(125,295,'Sylvie'),(135,305,'Sherlock Holmes'),(135,315,'Dr. John Watson'),(145,335,'Eleven'),(145,345,'Steve Harrington'),(145,355,'Mike Wheeler'),(155,295,'Ada Shelby'),(155,365,'Thomas Shelby'),(155,375,'Aunt Polly'),(165,385,'Jonas Kahnwald'),(165,395,'Martha Nielsen'),(165,405,'Ulrich Nielsen');
/*!40000 ALTER TABLE `tvshow_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_director`
--

DROP TABLE IF EXISTS `tvshow_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_director` (
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `tvshow_director_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_director_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `celebrity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_director`
--

LOCK TABLES `tvshow_director` WRITE;
/*!40000 ALTER TABLE `tvshow_director` DISABLE KEYS */;
INSERT INTO `tvshow_director` VALUES (155,95),(165,95),(115,155),(135,155),(145,155),(125,165);
/*!40000 ALTER TABLE `tvshow_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_episode`
--

DROP TABLE IF EXISTS `tvshow_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_episode` (
  `episodeID` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `season_number` int(11) NOT NULL,
  `episode_number` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `download_link` varchar(500) DEFAULT NULL,
  `downloads` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`episodeID`),
  KEY `tid` (`tid`),
  CONSTRAINT `tvshow_episode_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_episode`
--

LOCK TABLES `tvshow_episode` WRITE;
/*!40000 ALTER TABLE `tvshow_episode` DISABLE KEYS */;
INSERT INTO `tvshow_episode` VALUES (655,115,1,1,'Winter Is Coming','2011-04-17','#',0,0),(665,115,1,2,'The Kingsroad','2011-04-24','#',0,0),(675,125,1,1,'Glorious Purpose','2021-06-09','#',0,0),(685,125,1,2,'The Variant','2021-06-09','#',0,0),(695,125,1,3,'Lamentis','2021-06-09','#',0,0),(705,135,1,1,'Unaired Pilot','2011-06-05','#',0,0),(715,135,1,2,'A Study in Pink','2011-10-24','#',0,0),(725,145,1,1,'Chapter One: The Vanishing of Will Byers','2016-07-15','#',0,0),(735,145,1,2,'Chapter Two: The Weirdo on Maple Street','2016-07-15','#',0,0),(745,145,1,3,'Chapter Three: Holly, Jolly','2016-07-15','#',0,0),(755,155,1,1,'Episode #1.1','2014-09-30','#',0,0),(765,155,1,2,'Episode #1.2','2014-09-30','#',0,0),(775,155,1,3,'Episode #1.3','2014-09-30','#',0,0),(785,165,1,1,'Secrets','2017-12-01','#',0,0),(795,165,1,2,'Lies','2017-12-01','#',0,0),(805,165,1,3,'Past and Present','2017-12-01','#',0,0);
/*!40000 ALTER TABLE `tvshow_episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_episode_rating`
--

DROP TABLE IF EXISTS `tvshow_episode_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_episode_rating` (
  `tid` int(11) NOT NULL,
  `episodeID` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`episodeID`,`userid`),
  KEY `episodeID` (`episodeID`),
  KEY `userid` (`userid`),
  CONSTRAINT `tvshow_episode_rating_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_episode_rating_ibfk_2` FOREIGN KEY (`episodeID`) REFERENCES `tvshow_episode` (`episodeID`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_episode_rating_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_episode_rating`
--

LOCK TABLES `tvshow_episode_rating` WRITE;
/*!40000 ALTER TABLE `tvshow_episode_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshow_episode_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_episode_review`
--

DROP TABLE IF EXISTS `tvshow_episode_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_episode_review` (
  `tid` int(11) NOT NULL,
  `episodeID` int(11) NOT NULL,
  `review` varchar(1024) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`episodeID`,`userid`),
  KEY `episodeID` (`episodeID`),
  KEY `userid` (`userid`),
  CONSTRAINT `tvshow_episode_review_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_episode_review_ibfk_2` FOREIGN KEY (`episodeID`) REFERENCES `tvshow_episode` (`episodeID`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_episode_review_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_episode_review`
--

LOCK TABLES `tvshow_episode_review` WRITE;
/*!40000 ALTER TABLE `tvshow_episode_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshow_episode_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_genre`
--

DROP TABLE IF EXISTS `tvshow_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_genre` (
  `tid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`gid`),
  KEY `gid` (`gid`),
  CONSTRAINT `tvshow_genre_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_genre_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `genre` (`gid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_genre`
--

LOCK TABLES `tvshow_genre` WRITE;
/*!40000 ALTER TABLE `tvshow_genre` DISABLE KEYS */;
INSERT INTO `tvshow_genre` VALUES (115,15),(125,15),(155,15),(115,25),(125,25),(115,35),(135,35),(145,35),(155,35),(165,35),(125,45),(145,45),(135,65),(165,65),(165,85),(145,115);
/*!40000 ALTER TABLE `tvshow_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_image`
--

DROP TABLE IF EXISTS `tvshow_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_image` (
  `tid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`tid`,`image`),
  CONSTRAINT `tvshow_image_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_image`
--

LOCK TABLES `tvshow_image` WRITE;
/*!40000 ALTER TABLE `tvshow_image` DISABLE KEYS */;
INSERT INTO `tvshow_image` VALUES (115,'img1633846565668.jpg'),(115,'img1633846565669.jpg'),(125,'img1633847016573.jpg'),(125,'img1633847016574.jpg'),(135,'img1633847338116.jpg'),(135,'img1633847338117.jpg'),(145,'img1633848263007.jpg'),(145,'img1633848263034.jpg'),(155,'img1633849052555.jpg'),(155,'img1633849052556.jpg'),(165,'img1633849459267.jpg'),(165,'img1633849459268.jpg');
/*!40000 ALTER TABLE `tvshow_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_rating`
--

DROP TABLE IF EXISTS `tvshow_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_rating` (
  `tid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `tvshow_rating_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_rating_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_rating`
--

LOCK TABLES `tvshow_rating` WRITE;
/*!40000 ALTER TABLE `tvshow_rating` DISABLE KEYS */;
INSERT INTO `tvshow_rating` VALUES (115,8,15),(115,9,25),(115,9,35),(115,8,45),(115,9,55),(125,7,15),(125,9,25),(125,10,35),(125,7,45),(125,8,55),(135,9,15),(135,9,25),(135,10,35),(135,7,45),(135,8,55),(145,9,15),(145,9,25),(145,8,35),(145,8,45),(145,8,55),(155,9,15),(155,9,25),(155,8,35),(155,9,45),(155,9,55),(165,9,15),(165,9,25),(165,8,35),(165,10,45),(165,10,55);
/*!40000 ALTER TABLE `tvshow_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_review`
--

DROP TABLE IF EXISTS `tvshow_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_review` (
  `tid` int(11) NOT NULL,
  `review` varchar(1024) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `tvshow_review_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_review_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_review`
--

LOCK TABLES `tvshow_review` WRITE;
/*!40000 ALTER TABLE `tvshow_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshow_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_writer`
--

DROP TABLE IF EXISTS `tvshow_writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_writer` (
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `tvshow_writer_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tvshow` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_writer_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `celebrity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_writer`
--

LOCK TABLES `tvshow_writer` WRITE;
/*!40000 ALTER TABLE `tvshow_writer` DISABLE KEYS */;
INSERT INTO `tvshow_writer` VALUES (145,115),(155,115),(165,115),(115,145),(125,145),(135,145);
/*!40000 ALTER TABLE `tvshow_writer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `joined_date` date DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (15,'Pasinduu','Lakshan','ex@moviedb.com','pass2','2021-10-07'),(25,'Anjalee','Bimalsha','ex@anjalee.com','pass','2021-10-07'),(35,'Lahiru','Gayashan','ex@lahiru.com','pass','2021-10-09'),(45,'Thushara','Thgiwanka','ex@thushara.com','pass','2021-10-09'),(55,'Kalanaa','Sithum','ex@kalana.com','pass','2021-10-09'),(95,'KYline','xpeder','LYLINE22@gmail.com','1234','2021-10-12'),(105,'gayashan','gaya','lahiru75@gmail.com','','2021-10-12');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13  6:17:34
