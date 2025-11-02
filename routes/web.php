<?php

/** @var \Laravel\Lumen\Routing\Router $router */

$router->get('/', function () use ($router) {
    return response()->json([
        'app' => 'Cart Service',
        'version' => $router->app->version(),
        'status' => 'running'
    ]);
});

$router->group(['prefix' => 'cart'], function () use ($router){
    $router->get('/', 'CartController@index');
    $router->get('/{id}', 'CartController@show');
    $router->post('/', 'CartController@store');
    $router->put('/{id}', 'CartController@update');
    $router->delete('/{id}', 'CartController@destroy');
});
