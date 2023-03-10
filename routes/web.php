<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [App\Http\Controllers\Auth\LoginController::class, 'login'])->name('login');
Route::get('/login', [App\Http\Controllers\Auth\LoginController::class, 'login'])->name('home_login');
Route::get('/admin', [App\Http\Controllers\Auth\LoginController::class, 'login'])->name('admin');
Route::post('/adminpost', [App\Http\Controllers\Auth\LoginController::class, 'admin'])->name('admin_post');



Route::group(['middleware' => ['auth']], function () { 

    Route::get('/home', [App\Http\Controllers\DashboardController::class, 'dashboard'])->name('home');
    Route::get('/dashboard', [App\Http\Controllers\DashboardController::class, 'dashboard'])->name('dashboard');
    Route::get('/admin_info', [App\Http\Controllers\DashboardController::class, 'admin_info'])->name('admin_info');
    Route::post('/admin_info_post', [App\Http\Controllers\DashboardController::class, 'admin_info_post'])->name('admin_info_post');    
    Route::post('/logout', [App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout');
    Route::resource('guides',App\Http\Controllers\GuideController::class);
    Route::get('/terms/conditions', [App\Http\Controllers\TermAndConditionController::class, 'index'])->name('terms_conditions');
    Route::post('/terms-conditions', [App\Http\Controllers\TermAndConditionController::class, 'termandcontionpost'])->name('terms_conditions_post');

});
