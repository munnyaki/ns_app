-- MySQL dump 10.13  Distrib 5.7.29, for osx10.14 (x86_64)
--
-- Host: localhost    Database: neighbor_support_app
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3erw1a3t0r78st8ty27x6v3g1` (`question_id`),
  KEY `FK5bp3d5loftq2vjn683ephn75a` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'これでいけるかなぁ？','2020-08-31 09:52:26','2020-08-31 11:17:57',8,9),(2,'さぁどうだ','2020-08-31 11:30:03','2020-08-31 11:30:03',8,7),(3,'さぁこれでどうだ！！！','2020-10-13 11:29:07','2020-10-13 11:29:34',21,7),(4,'こうやってみてはいかが？','2020-10-19 09:31:53','2020-10-19 09:36:04',21,7),(5,'太りすぎやあんたもう少し痩せたほうがええんちゃうん？\r\n','2020-10-19 10:41:00','2020-10-19 10:43:31',23,15),(6,'こうやってみてもいいんじゃない？\r\n','2020-10-20 09:10:52','2020-10-20 09:10:52',9,7),(7,'これでいけるかな','2020-10-22 09:24:23','2020-10-22 09:24:23',26,7),(8,'さぁこれでいかが\r\n','2020-10-22 09:44:33','2020-10-22 09:44:33',24,7),(9,'テスト５に対する提案です。\r\n','2020-10-22 09:49:01','2020-10-22 10:03:59',30,7),(10,'テスト２に対する提案です','2020-10-22 09:49:21','2020-10-22 09:49:21',25,7),(11,'テスト５に対する提案２です。','2020-10-22 10:20:53','2020-10-22 10:20:53',30,7),(12,'テスト５に対する提案３です。','2020-10-22 10:22:11','2020-10-22 10:22:11',30,7),(13,'テスト４に対する提案です。','2020-10-22 10:27:40','2020-10-22 10:27:49',29,8),(14,'テスト１に対する提案です。','2020-10-22 10:45:07','2020-10-22 10:45:07',31,18),(15,'テスト１に対する提案です','2020-10-22 12:05:36','2020-10-22 12:06:00',32,20);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `question_content` varchar(255) NOT NULL,
  `question_title` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjoo8hp6d3gfwctr68dl2iaemj` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (7,'2020-08-29 16:45:03','あ','あ','2020-08-29 16:45:03',7),(8,'2020-08-31 09:47:12','どうしたら良いでしょうか。','喧嘩になってしまいます。','2020-08-31 09:47:12',9),(9,'2020-09-07 12:05:35','どうしたらいいでしょうか','わかりません','2020-09-07 12:05:35',8),(10,'2020-09-07 12:06:32','どうしたらいいでしょうか','何回やってもできません','2020-09-07 12:06:32',7),(11,'2020-09-22 17:32:33','二人の男は無罪となり、釈放されました。女性は嘘をついたことを認めました。男たちは自分がしたことを自慢していました。エミットの母親は、南部訪問による残忍な結果を皆に見せるために、棺を開いたまま葬儀を行うことを主張しました。  彼は子供です。これが人種差別です。','これはどうすれば良いのでしょうか','2020-09-22 17:32:33',7),(12,'2020-10-13 09:18:04','いつも部下の些細な行動に腹を立ててしまい態度に現れてしまいます。どうしたら良いでしょうか。','感情をコントロールすることができません。','2020-10-13 09:18:04',7),(13,'2020-10-13 09:29:40','これでいかがでしょう？\r\n','さぁ今度はどうだろうか','2020-10-13 09:29:40',7),(14,'2020-10-13 09:32:22','さぁやってみやがれ','これだったらいいところに飛ぶかねぇ？','2020-10-13 09:32:22',7),(15,'2020-10-13 09:34:19','さぁやってみやがれ','これだったらいいところに飛ぶかねぇ？','2020-10-13 09:34:19',7),(16,'2020-10-13 09:35:44','これでどうだ','さてさていかがなもんか','2020-10-13 09:35:44',8),(17,'2020-10-13 09:42:06','やってみろ花','さぁどうだ','2020-10-13 09:42:06',8),(18,'2020-10-13 09:51:35','いかがでしょうか','さぁこれで飛ぶかな？','2020-10-13 09:51:35',7),(19,'2020-10-13 09:56:03','どうだぁ','さぁ飛ぶかなぁ？','2020-10-13 09:56:03',8),(20,'2020-10-13 10:15:31','さぁどうだ！！！','さぁこれで飛ぶかな！？！','2020-10-19 10:20:41',7),(21,'2020-10-13 10:21:12','どうなんでしょうかねぇ','できるかどうか試してるだけ','2020-10-13 10:21:48',8),(22,'2020-10-19 09:35:22','こういうことについてなのですが','この部分はどうしたら良いのでしょうか','2020-10-19 09:35:40',7),(23,'2020-10-19 10:15:24','テスト１の内容です。','テスト１','2020-10-19 10:15:24',7),(24,'2020-10-20 11:45:33','テスト２の文章内容です。','テスト２ですがいけますかね','2020-10-20 11:45:33',8),(25,'2020-10-20 11:48:02','テスト２の文章です\r\n','テスト２','2020-10-20 11:48:02',8),(26,'2020-10-20 12:11:16','テスト２の内容です','テスト２','2020-10-20 12:11:16',7),(27,'2020-10-20 12:15:55','テスト２の内容です','テスト２','2020-10-20 12:15:55',7),(28,'2020-10-20 12:21:06','テスト２の内容です','テスト２','2020-10-20 12:21:06',7),(29,'2020-10-22 05:41:35','テスト４の内容です','テスト４','2020-10-22 05:41:35',7),(30,'2020-10-22 08:55:24','テスト５の内容です。','テスト５','2020-10-22 10:04:10',7),(31,'2020-10-22 10:42:42','テスト１の内容です。','前田涼平のテスト１','2020-10-22 10:44:43',18),(32,'2020-10-22 12:04:35','テスト１の内容です。','野中仁のテスト１','2020-10-22 12:05:11',20);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,60,'2020-08-29 16:38:22','floatプロパティを使えば、要素を横並びにすることができます。よく使うプロパティの１つなので、ぜひこの記事でCSS floatプロパティの基礎をマスターしておきましょう！  具体的なコードと見やすい図でわかりやすく解説しているので、HTML/CSS初心者にもやさしい内容です。ぜひ最後までご覧ください。','小原修二','F65FC9A31A825493E60D6BBB6F77F67B36C0515C2348F60D265848EC2A4C60FD','2020-10-22 10:50:12'),(8,23,'2020-08-31 09:41:42','よろしくお願いします。','小原花','727C7DFADC8A4999C0366BB7054EEE46486CE80FC9F8E39D7EE2EFCB394BEA64','2020-10-22 12:03:09'),(9,24,'2020-08-31 09:45:58','よろしくお願いします。','小原会菜','727C7DFADC8A4999C0366BB7054EEE46486CE80FC9F8E39D7EE2EFCB394BEA64','2020-08-31 09:45:58'),(10,53,'2020-09-01 15:17:32','よろしくお願いします。',' 小原優子','727C7DFADC8A4999C0366BB7054EEE46486CE80FC9F8E39D7EE2EFCB394BEA64','2020-09-01 15:17:32'),(11,22,'2020-10-13 10:27:20','Javaでは、デフォルトでオブジェクトのすべてのフィールドをシリアライズの対象としますが、一時的な変数であるなどの理由で、例外的にシリアライズしたくない場合もあります。そのようなケースでは、フィールドにtransient修飾子を','櫻井ゆうき','34516776F3965434B1401EAC313A71B4448970F6CBC48CF315097A465B094C81','2020-10-13 10:27:20'),(12,NULL,'2020-10-19 09:37:07','よろしくお願いします。','西尾','0FF331451C0B883705DDFE364F444D113CB1F8DB40BB94C22506A4E447F50EFA','2020-10-19 09:37:07'),(13,22,'2020-10-19 10:25:06','久しぶりに顔出しました','本田雄一','A9A070897EFB764A01274C33BA98E7CE5F42B07A68D1110612822346E2C06F9E','2020-10-19 10:25:06'),(14,55,'2020-10-19 10:34:23','本田雄一の母です。','本田ゆかり','A9A070897EFB764A01274C33BA98E7CE5F42B07A68D1110612822346E2C06F9E','2020-10-19 10:34:23'),(15,85,'2020-10-19 10:37:20','小原修二の母です。','小原時子','727C7DFADC8A4999C0366BB7054EEE46486CE80FC9F8E39D7EE2EFCB394BEA64','2020-10-19 10:37:20'),(16,70,'2020-10-20 10:05:44','小原優子の母です','帆足かつこ','13BA8E20F7AB3DC874E75E265598F6A296CCB597408A979C3074763191289023','2020-10-20 10:05:44'),(17,68,'2020-10-22 08:58:14','帆足かつこの夫です。','帆足のりとし','13BA8E20F7AB3DC874E75E265598F6A296CCB597408A979C3074763191289023','2020-10-22 08:58:34'),(18,25,'2020-10-22 10:40:40','西谷小学校出身のプログラマーです。','前田涼平','F578EC69524B54938B4268C063D4B1DA6108FE85629D45FDEC6092EDB1497D59','2020-10-22 10:46:35'),(19,22,'2020-10-22 11:56:31','小原花の姉です','小原花子','727C7DFADC8A4999C0366BB7054EEE46486CE80FC9F8E39D7EE2EFCB394BEA64','2020-10-22 11:56:31'),(20,22,'2020-10-22 12:04:08','白山西小学校卒業してます','野中仁','CEBD2D779194ECAF9762C46E3F7DF1A281CC14BDC80C04C391AC48A518D274F5','2020-10-22 12:04:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23  9:04:05
