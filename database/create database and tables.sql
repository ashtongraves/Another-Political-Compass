CREATE DATABASE `apc_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `apc_dev`;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `answers` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `text` text NOT NULL,
  `x_value` int NOT NULL,
  `y_value` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answer_id`),
  FOREIGN KEY (`question_id`) REFERENCES `questions`(`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` char(32) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users_answers` (
  `user_answer_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `answer_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_answer_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
  FOREIGN KEY (`answer_id`) REFERENCES `answers`(`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;