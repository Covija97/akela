<?php

declare(strict_types=1);

// Este archivo es el arranque comun de la aplicacion.
// Se carga antes de atender cualquier pagina para preparar sesiones,

// Creamos o restauramos la sesión
session_start();

// BASE_PATH apunta a la raiz del proyecto. Asi el resto del codigo puede
// incluir archivos con rutas absolutas internas, sin depender del directorio
// desde el que se ejecute PHP.
define('BASE_PATH', dirname(__DIR__));

// Carga los arrays de configuracion principales.
$app = require BASE_PATH . '/config/app.php';
$database = require BASE_PATH . '/config/database.php';

// Ajusta la zona horaria usada por funciones de fecha/hora.
date_default_timezone_set($app['timezone'] ?? 'Europe/Madrid');

// Carga funciones globales de apoyo, conexion PDO y definicion de modulos.
require BASE_PATH . '/app/support/helpers.php';
