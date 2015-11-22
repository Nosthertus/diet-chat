-- MySQL Script generated by MySQL Workbench
-- 11/21/15 22:44:57
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema diet_chat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema diet_chat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diet_chat` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `diet_chat` ;

-- -----------------------------------------------------
-- Table `diet_chat`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_lastname` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_data_birth` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`post` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pos_content` TEXT NOT NULL,
  `post_create` DATETIME NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `diet_chat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`tag` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`project` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) NOT NULL,
  `project_description` VARCHAR(90) NOT NULL,
  `project_create` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`post_has_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`post_has_tag` (
  `post_id` INT UNSIGNED NOT NULL,
  `tag_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`post_id`, `tag_id`),
  INDEX `fk_post_has_tag_tag1_idx` (`tag_id` ASC),
  INDEX `fk_post_has_tag_post_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_tag_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `diet_chat`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `diet_chat`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`user_has_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`user_has_project` (
  `user_id` INT UNSIGNED NOT NULL,
  `project_id` INT UNSIGNED NOT NULL,
  `data_time` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `project_id`),
  INDEX `fk_user_has_project_project1_idx` (`project_id` ASC),
  INDEX `fk_user_has_project_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_project_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `diet_chat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_project_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `diet_chat`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`project_has_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`project_has_post` (
  `project_id` INT UNSIGNED NOT NULL,
  `post_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`project_id`, `post_id`),
  INDEX `fk_project_has_post_post1_idx` (`post_id` ASC),
  INDEX `fk_project_has_post_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_project_has_post_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `diet_chat`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_post_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `diet_chat`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`score` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `score_number` ENUM('1', '2', '3') NOT NULL,
  `post_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_score_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_score_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `diet_chat`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_chat`.`project_has_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diet_chat`.`project_has_tag` (
  `project_id` INT UNSIGNED NOT NULL,
  `tag_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`project_id`, `tag_id`),
  INDEX `fk_project_has_tag_tag1_idx` (`tag_id` ASC),
  INDEX `fk_project_has_tag_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_project_has_tag_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `diet_chat`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `diet_chat`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
