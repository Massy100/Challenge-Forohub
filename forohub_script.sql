-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema forohub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema forohub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `forohub` DEFAULT CHARACTER SET utf8 ;
USE `forohub` ;

-- -----------------------------------------------------
-- Table `forohub`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forohub`.`Usuario` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `correoElectronico` VARCHAR(45) NULL,
  `contrasena` VARCHAR(45) NULL,
  `perfiles` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forohub`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forohub`.`Curso` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forohub`.`Topico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forohub`.`Topico` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `mensaje` VARCHAR(45) NULL,
  `fechaCreacion` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `autor` VARCHAR(45) NULL,
  `curso` VARCHAR(45) NULL,
  `respuestas` VARCHAR(45) NULL,
  `Usuario_id` INT NOT NULL,
  `Curso_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Topico_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Topico_Curso1_idx` (`Curso_id` ASC) VISIBLE,
  CONSTRAINT `fk_Topico_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `forohub`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Topico_Curso1`
    FOREIGN KEY (`Curso_id`)
    REFERENCES `forohub`.`Curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forohub`.`Respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forohub`.`Respuesta` (
  `id` INT NOT NULL,
  `mensaje` VARCHAR(45) NULL,
  `topico` VARCHAR(45) NULL,
  `fechaCreacion` VARCHAR(45) NULL,
  `autor` VARCHAR(45) NULL,
  `solucion` VARCHAR(45) NULL,
  `Usuario_id` INT NOT NULL,
  `Topico_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Respuesta_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Respuesta_Topico1_idx` (`Topico_id` ASC) VISIBLE,
  CONSTRAINT `fk_Respuesta_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `forohub`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Respuesta_Topico1`
    FOREIGN KEY (`Topico_id`)
    REFERENCES `forohub`.`Topico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forohub`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forohub`.`Perfil` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forohub`.`Perfil_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forohub`.`Perfil_Usuario` (
  `Perfil_id` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  PRIMARY KEY (`Perfil_id`, `Usuario_id`),
  INDEX `fk_Perfil_has_Usuario_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Perfil_has_Usuario_Perfil_idx` (`Perfil_id` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_has_Usuario_Perfil`
    FOREIGN KEY (`Perfil_id`)
    REFERENCES `forohub`.`Perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `forohub`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
