<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MaterialController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\GradeController;

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

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Route untuk autentikasi
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    // Route untuk user role Admin
    Route::middleware('role:admin')->group(function () {
        // CRUD Materi
        Route::apiResource('materials', MaterialController::class);

        // CRUD Ujian
        Route::apiResource('exams', ExamController::class);
    });

    // Route untuk user role Siswa
    Route::middleware('role:siswa')->group(function () {
        // Akses Materi
        Route::get('materials', [MaterialController::class, 'index']);
        Route::get('materials/{id}', [MaterialController::class, 'show']);

        // Mengikuti Ujian
        Route::get('exams/{id}/questions', [ExamController::class, 'getQuestions']);
        Route::post('exams/{id}/submit', [ExamController::class, 'submit']);

        // Melihat Nilai
        Route::get('grades', [GradeController::class, 'index']);
    });
});
