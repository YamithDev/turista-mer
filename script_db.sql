-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema turista_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `turista_db` ;

-- -----------------------------------------------------
-- Schema turista_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `turista_db` DEFAULT CHARACTER SET utf8 ;
USE `turista_db` ;

-- -----------------------------------------------------
-- Table `turista_db`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`users` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`users` (
  `id_user` VARCHAR(36) NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(200) NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id_user`),
  INDEX `created_at` (`created_at` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`rol` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`rol` (
  `id_rol` VARCHAR(36) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`path_tour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`path_tour` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`path_tour` (
  `id_path` VARCHAR(36) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id_path`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`service` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`service` (
  `id_service` VARCHAR(36) NOT NULL,
  `name_service` VARCHAR(45) NULL,
  `price` DECIMAL(10,2) NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id_service`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`shopping_cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`shopping_cart` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`shopping_cart` (
  `id_shopping` VARCHAR(36) NOT NULL,
  `id_user` VARCHAR(36) NULL,
  `cantidad` INT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id_shopping`),
  INDEX `fk_iduser_has_user_idx` (`id_user` ASC) ,
  INDEX `created_at` (`created_at` ASC) ,
  CONSTRAINT `fk_iduser_has_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `turista_db`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`payment_method`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`payment_method` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`payment_method` (
  `id_payment` VARCHAR(36) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_payment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`orders` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`orders` (
  `id_order` VARCHAR(36) NOT NULL,
  `id_payment_method` VARCHAR(36) NULL,
  `total` DECIMAL(10,2) NULL,
  `users_id_user` VARCHAR(36) NOT NULL,
  `shopping_cart_id_shopping` VARCHAR(36) NOT NULL,
  `status` VARCHAR(45)  DEFAULT "Pending",
  PRIMARY KEY (`id_order`, `users_id_user`, `shopping_cart_id_shopping`),
  INDEX `fk_payment_method_idx` (`id_payment_method` ASC) ,
  INDEX `fk_orders_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_orders_shopping_cart1_idx` (`shopping_cart_id_shopping` ASC) ,
  CONSTRAINT `fk_payment_method`
    FOREIGN KEY (`id_payment_method`)
    REFERENCES `turista_db`.`payment_method` (`id_payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `turista_db`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id_shopping`)
    REFERENCES `turista_db`.`shopping_cart` (`id_shopping`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`menu` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`menu` (
  `id_menu` VARCHAR(36) NOT NULL,
  `id_rol` VARCHAR(36) NULL,
  `name_menu` VARCHAR(45) NULL,
  PRIMARY KEY (`id_menu`),
  INDEX `fk_id_rol_has_rol_idx` (`id_rol` ASC) ,
  CONSTRAINT `fk_id_rol_has_rol`
    FOREIGN KEY (`id_rol`)
    REFERENCES `turista_db`.`rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`detail_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`detail_order` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`detail_order` (
  `id_detail` VARCHAR(36) NOT NULL,
  `id_order` VARCHAR(36) NULL,
  `cantidad` INT NULL,
  `precio` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_detail`),
  INDEX `fk_id_order_has_order_idx` (`id_order` ASC) ,
  CONSTRAINT `fk_id_order_has_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `turista_db`.`orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`path_tour_has_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`path_tour_has_service` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`path_tour_has_service` (
  `path_tour_id_path` VARCHAR(36) NOT NULL,
  `service_id_service` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`path_tour_id_path`, `service_id_service`),
  INDEX `fk_path_tour_has_service_service1_idx` (`service_id_service` ASC) ,
  INDEX `fk_path_tour_has_service_path_tour1_idx` (`path_tour_id_path` ASC) ,
  CONSTRAINT `fk_path_tour_has_service_path_tour1`
    FOREIGN KEY (`path_tour_id_path`)
    REFERENCES `turista_db`.`path_tour` (`id_path`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_path_tour_has_service_service1`
    FOREIGN KEY (`service_id_service`)
    REFERENCES `turista_db`.`service` (`id_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`bundle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`bundle` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`bundle` (
  `idbundle` VARCHAR(36) NOT NULL,
  `path_tour_id_path` VARCHAR(36) NOT NULL,
  `price` DECIMAL(10,2) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idbundle`, `path_tour_id_path`),
  INDEX `fk_bundle_path_tour1_idx` (`path_tour_id_path` ASC) ,
  CONSTRAINT `fk_bundle_path_tour1`
    FOREIGN KEY (`path_tour_id_path`)
    REFERENCES `turista_db`.`path_tour` (`id_path`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`bundle_has_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`bundle_has_service` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`bundle_has_service` (
  `bundle_idbundle` VARCHAR(36) NOT NULL,
  `service_id_service` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`bundle_idbundle`, `service_id_service`),
  INDEX `fk_bundle_has_service_service1_idx` (`service_id_service` ASC) ,
  INDEX `fk_bundle_has_service_bundle1_idx` (`bundle_idbundle` ASC) ,
  CONSTRAINT `fk_bundle_has_service_bundle1`
    FOREIGN KEY (`bundle_idbundle`)
    REFERENCES `turista_db`.`bundle` (`idbundle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bundle_has_service_service1`
    FOREIGN KEY (`service_id_service`)
    REFERENCES `turista_db`.`service` (`id_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`users_has_rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`users_has_rol` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`users_has_rol` (
  `users_id_user` VARCHAR(36) NOT NULL,
  `rol_id_rol` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`users_id_user`, `rol_id_rol`),
  INDEX `fk_users_has_rol_rol1_idx` (`rol_id_rol` ASC) ,
  INDEX `fk_users_has_rol_users1_idx` (`users_id_user` ASC) ,
  CONSTRAINT `fk_users_has_rol_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `turista_db`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_rol_rol1`
    FOREIGN KEY (`rol_id_rol`)
    REFERENCES `turista_db`.`rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turista_db`.`shopping_cart_has_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `turista_db`.`shopping_cart_has_service` ;

CREATE TABLE IF NOT EXISTS `turista_db`.`shopping_cart_has_service` (
  `shopping_cart_id_shopping` VARCHAR(36) NOT NULL,
  `service_id_service` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`shopping_cart_id_shopping`, `service_id_service`),
  INDEX `fk_shopping_cart_has_service_service1_idx` (`service_id_service` ASC),
  INDEX `fk_shopping_cart_has_service_shopping_cart1_idx` (`shopping_cart_id_shopping` ASC) ,
  CONSTRAINT `fk_shopping_cart_has_service_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id_shopping`)
    REFERENCES `turista_db`.`shopping_cart` (`id_shopping`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_cart_has_service_service1`
    FOREIGN KEY (`service_id_service`)
    REFERENCES `turista_db`.`service` (`id_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
