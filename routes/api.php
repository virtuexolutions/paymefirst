<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;




/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::get("/test",function(){
//         return "<h1>asdasd</h1>";
// });


Route::any('register', [\App\Http\Controllers\Api\RegisterController::class, 'register']);
Route::get('noauth', [\App\Http\Controllers\Api\RegisterController::class, 'noauth'])->name('noauth');


Route::any('login', [\App\Http\Controllers\Api\RegisterController::class, 'login'])->name('login');
Route::any('verify', [\App\Http\Controllers\Api\RegisterController::class, 'verify']);
Route::post('password/email',  [\App\Http\Controllers\Api\ForgotPasswordController::class,'forget']);
Route::any('password/reset', [\App\Http\Controllers\Api\CodeCheckController::class,'index']);
Route::post('password/code/check', [\App\Http\Controllers\Api\CodeCheckController::class,'code_verify']);
Route::get('guide', [\App\Http\Controllers\Api\CMSController::class, 'guide']);
Route::get('term/conditions', [\App\Http\Controllers\Api\CMSController::class, 'termanscondition']);

Route::group(['middleware' => ['api','auth:api'], 'prefix' => 'auth'], function () {
    Route::post('addcard', [\App\Http\Controllers\UserCardController::class, 'addcard']); 
    Route::post('set_goal', [\App\Http\Controllers\Api\GoalController::class, 'set_goal']); 
    Route::get('user', [\App\Http\Controllers\Api\RegisterController::class, 'user']);
    Route::post('change_password', [\App\Http\Controllers\Api\RegisterController::class, 'change_password']); 
    Route::post('profile', [\App\Http\Controllers\Api\UserController::class, 'profile']);  
	Route::post('cuurent/plan', [\App\Http\Controllers\Api\UserController::class, 'current_plan']);  	
    Route::get('financial/breakdowns/{date}', [\App\Http\Controllers\Api\FinancialController::class, 'financialdata']);
    Route::post('financial/breakdowns/post', [\App\Http\Controllers\Api\FinancialController::class, 'financialpost']);
    Route::get('admin/info', [\App\Http\Controllers\Api\ContactController::class, 'admininfo']);
    Route::post('contact/submit', [\App\Http\Controllers\Api\ContactController::class, 'contact_info']);
    Route::get('logout', [\App\Http\Controllers\Api\RegisterController::class, 'logout']);
});

