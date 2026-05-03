 /* GRUPOS */
CREATE TABLE IF NOT EXISTS scoutGroups(
    grp_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    grp_name VARCHAR(127) NOT NULL,
    grp_city VARCHAR(127) NOT NULL,
    grp_create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 /* USUARIOS */
CREATE TABLE IF NOT EXISTS users(
    usr_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usr_name VARCHAR(127) NOT NULL,
    usr_mail VARCHAR(255) UNIQUE NOT NULL,
    usr_password VARCHAR(255) NOT NULL,
    usr_role ENUM('admin','group_admin','user') NOT NULL DEFAULT 'user',
    grp_id  INT UNSIGNED NULL,
    usr_create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (grp_id) REFERENCES scoutGroups (grp_id)
);
 /* RAMAS */
CREATE TABLE IF NOT EXISTS branches(
    brn_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    brn_name VARCHAR(127) NOT NULL UNIQUE,
    brn_color VARCHAR(15) NOT NULL
);
 /* RESPONSABLES */
CREATE TABLE IF NOT EXISTS monitors(
    mnt_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    mnt_name VARCHAR(127) NOT NULL,
    brn_id INT UNSIGNED NULL,
    grp_id INT UNSIGNED NULL,
    FOREIGN KEY (brn_id) REFERENCES branches (brn_id),
    FOREIGN KEY (grp_id) REFERENCES scoutGroups (grp_id)
);
 /* LUGARES DE CAMPAMENTO */
 CREATE TABLE IF NOT EXISTS places(
    plc_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    plc_name VARCHAR(127) UNIQUE NOT NULL,
    plc_address VARCHAR(255),
    plc_region VARCHAR(127),
    plc_capacity INT UNSIGNED,
    plc_access VARCHAR(255),
    plc_water BOOLEAN DEFAULT 0,
    plc_elect BOOLEAN DEFAULT 0,
    plc_desc TEXT,
    plc_contact_name VARCHAR(127),
    plc_contact_phone VARCHAR(20),
    plc_contact_email VARCHAR(127)
);
 /* PROGRAMACIONES */
CREATE TABLE IF NOT EXISTS schedules(
    sch_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sch_start_date DATETIME NOT NULL,
    sch_end_date DATETIME,
    sch_child_num INT UNSIGNED,
    grp_id INT UNSIGNED NOT NULL,
    brn_id INT UNSIGNED NOT NULL,
    plc_id INT UNSIGNED,
    FOREIGN KEY (grp_id) REFERENCES scoutGroups (grp_id),
    FOREIGN KEY (brn_id) REFERENCES branches (brn_id),
    FOREIGN KEY (plc_id) REFERENCES places (plc_id)
);
 /* CATEGORIAS */
 CREATE TABLE IF NOT EXISTS categories(
    cat_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cat_name VARCHAR(127) UNIQUE NOT NULL
);
 /* ACTIVIDADES */
 CREATE TABLE IF NOT EXISTS activities(
    act_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    act_name VARCHAR(127) UNIQUE NOT NULL,
    act_desc TEXT,
    cat_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (cat_id) REFERENCES categories (cat_id)
);
 /* OBJETIVOS */
 CREATE TABLE IF NOT EXISTS objectives (
    obj_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    obj_name VARCHAR(127) UNIQUE NOT NULL,
    obj_desc TEXT
);
 /* MATERIALES */
 CREATE TABLE IF NOT EXISTS materials (
    mat_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    mat_name VARCHAR(127) UNIQUE NOT NULL
);
 /* ACTIVIDADES-OBJETIVOS */
 CREATE TABLE IF NOT EXISTS activities_objectives (
    act_id INT UNSIGNED NOT NULL,
    obj_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (act_id, obj_id),
    FOREIGN KEY (act_id) REFERENCES activities (act_id),
    FOREIGN KEY (obj_id) REFERENCES objectives (obj_id)
);
 /* ACTIVIDADES-MATERIALES */
CREATE TABLE IF NOT EXISTS activities_materials (
    act_id INT UNSIGNED NOT NULL,
    mat_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (act_id, mat_id),
    FOREIGN KEY (act_id) REFERENCES activities (act_id),
    FOREIGN KEY (mat_id) REFERENCES materials (mat_id)
);
 /* PROGRAMACIONES-ACTIVIDADES */
CREATE TABLE IF NOT EXISTS schedules_activities (
    act_id  INT UNSIGNED NOT NULL,
    sch_id  INT UNSIGNED NOT NULL,
    act_sch_datetime DATETIME,
    act_sch_order INT UNSIGNED NOT NULL,
    act_sch_aux_desc TEXT,
    PRIMARY KEY (sch_id, act_sch_order),
    FOREIGN KEY (act_id) REFERENCES activities (act_id),
    FOREIGN KEY (sch_id) REFERENCES schedules (sch_id)
);
CREATE TABLE IF NOT EXISTS schedules_monitors (
    sch_id  INT UNSIGNED NOT NULL,
    mnt_id  INT UNSIGNED NOT NULL,
    PRIMARY KEY (sch_id, mnt_id),
    FOREIGN KEY (sch_id) REFERENCES schedules (sch_id),
    FOREIGN KEY (mnt_id) REFERENCES monitors (mnt_id)
);