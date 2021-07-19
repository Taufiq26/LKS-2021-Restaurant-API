<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->options(
    '/{any:.*}', 
    [
        'middleware' => ['CorsMiddleware'], 
        function (){ 
            return response(['status' => 'success']); 
        }
    ]
);

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['middleware' => 'CorsMiddleware'], function($router){
    $router->post('/login', 'EmployeeController@login');
    $router->post('/register', 'EmployeeController@register');

    $router->group(['middleware' => 'CustomAuth'], function($router){
        $router->get('/menu', 'MenuController@getMenu');
        $router->post('/menu', 'MenuController@storeMenu');
        $router->put('/menu/{id}', 'MenuController@updateMenu');
    });
});
