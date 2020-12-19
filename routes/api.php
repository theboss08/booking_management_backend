<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DestinationController;
use App\Http\Controllers\CheckController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\UserController;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


// Route for getting destinations list.
Route::get('/destination', [DestinationController::class, 'index']);


// Route for getting availability the id is of the format => destcode + check_in + check_out + guest_count
Route::get('/availability/{id}', [CheckController::class, 'index']);

// Wrapped in sanctum middleware for authentication
Route::group(['middleware' => 'auth:sanctum'], function(){
    // Route for getting all bookings of a particular user
    Route::get('/bookings', [BookingController::class, 'show']);

    // Route for getting a specific booking
    Route::get('/bookings/{id}', [BookingController::class, 'view']);

    // Route for creating booking.
    Route::post('/bookings', [BookingController::class, 'store']);

    // Route for updation and partial cancellation
    Route::put('/bookings/{id}', [BookingController::class, 'update']);

    // Route for cancellation
    Route::delete('/bookings/{id}', [BookingController::class, 'destroy']);
});


// For logging in
Route::post('/login', [UserController::class, 'index']);

// For creating account
Route::post('/register', [UserController::class, 'store']);