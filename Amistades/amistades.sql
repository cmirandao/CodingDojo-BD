-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema esquema_amistades
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `esquema_amistades` ;

-- -----------------------------------------------------
-- Schema esquema_amistades
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_amistades` ;
USE `esquema_amistades` ;

-- -----------------------------------------------------
-- Table `esquema_amistades`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_amistades`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_amistades`.`amistades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_amistades`.`amistades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `amigo_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`, `usuario_id`, `amigo_id`),
  INDEX `fk_usuarios_has_usuarios_usuarios1_idx` (`amigo_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_usuarios_usuarios_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_usuarios_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `esquema_amistades`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_usuarios_usuarios1`
    FOREIGN KEY (`amigo_id`)
    REFERENCES `esquema_amistades`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
