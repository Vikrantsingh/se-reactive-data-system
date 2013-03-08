SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `action` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `action` (
  `actionID` INT NOT NULL ,
  `action_name` VARCHAR(400) NOT NULL ,
  `action_type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`actionID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `actionID_UNIQUE` ON `action` (`actionID` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `action_name_UNIQUE` ON `action` (`action_name` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `action_type_UNIQUE` ON `action` (`action_type` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DB_action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_action` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `DB_action` (
  `DB_actionID` INT NOT NULL ,
  `DB_name` VARCHAR(100) NOT NULL ,
  `DB_query` VARCHAR(500) NOT NULL ,
  `actionID` VARCHAR(45) NULL ,
  PRIMARY KEY (`DB_actionID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `DB_actionID_UNIQUE` ON `DB_action` (`DB_actionID` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `DB_name_UNIQUE` ON `DB_action` (`DB_name` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `DB_query_UNIQUE` ON `DB_action` (`DB_query` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Function_action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Function_action` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Function_action` (
  `Function_actionID` INT NOT NULL ,
  `package` VARCHAR(200) NOT NULL ,
  `class_name` VARCHAR(200) NOT NULL ,
  `function_name` VARCHAR(100) NOT NULL ,
  `actionID` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Function_actionID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Function_actionID_UNIQUE` ON `Function_action` (`Function_actionID` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `package_UNIQUE` ON `Function_action` (`package` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `class_name_UNIQUE` ON `Function_action` (`class_name` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `function_name_UNIQUE` ON `Function_action` (`function_name` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `actionID_UNIQUE` ON `Function_action` (`actionID` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `func_parameters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `func_parameters` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `func_parameters` (
  `func_parametersID` INT NOT NULL ,
  `data_type` VARCHAR(45) NOT NULL ,
  `order` INT NOT NULL ,
  `type` INT NOT NULL ,
  `Function_actionID` INT NOT NULL ,
  PRIMARY KEY (`func_parametersID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `order_UNIQUE` ON `func_parameters` (`order` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Function_actionID_UNIQUE` ON `func_parameters` (`Function_actionID` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `static_func`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `static_func` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `static_func` (
  `static_funcID` INT NOT NULL ,
  `Value` VARCHAR(100) NOT NULL ,
  `func_parametersID` INT NOT NULL ,
  PRIMARY KEY (`static_funcID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `static_funcID_UNIQUE` ON `static_func` (`static_funcID` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dynamic_func`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dynamic_func` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `dynamic_func` (
  `dynamic_funcID` INT NOT NULL ,
  `query` VARCHAR(300) NOT NULL ,
  `func_parametersID` INT NOT NULL ,
  PRIMARY KEY (`dynamic_funcID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `dynamic_funcID_UNIQUE` ON `dynamic_func` (`dynamic_funcID` ASC) ;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
