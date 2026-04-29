<?php

declare(strict_types=1);

// Configuracion general de la aplicacion.
// Cambia estos valores para adaptar nombre, entorno, URL base y usuario inicial.
return [
    'name' => 'Akela',
    'environment' => 'development',
    // Si debug es true, se muestran errores detallados en pantalla.
    'debug' => true,
    // base_url se deja vacio para detectar automaticamente la carpeta de ejecucion.
    'base_url' => '',
    // false genera rutas tipo /index.php/dashboard; true espera URLs limpias.
    'pretty_urls' => true,
    'timezone' => 'Europe/Madrid',
    // Usuario administrador que se crea automaticamente si la tabla users esta vacia.
    'initial_admin' => [
        'name' => 'Administrador',
        'email' => 'admin@akela.local',
        'password' => 'admin123',
    ],
];
