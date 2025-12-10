<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\InvitationController;
use App\Http\Controllers\ShortUrlController;
use Illuminate\Support\Facades\Route;

// Public routes
Route::get('/', function () {
    return redirect()->route('login');
});

// Auth routes
Route::middleware('guest')->group(function () {
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AuthController::class, 'login']);
    Route::get('/invitation/{token}/accept', [InvitationController::class, 'showAcceptForm'])
        ->name('invitation.accept');
    Route::post('/invitation/{token}/accept', [InvitationController::class, 'accept']);
});

Route::middleware('auth')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Invitation routes
    Route::get('/invite', [InvitationController::class, 'showInviteForm'])->name('invite.form');
    Route::post('/invite', [InvitationController::class, 'invite'])->name('invite.send');
    Route::get('/invitations/pending', [InvitationController::class, 'pendingInvitations'])
        ->name('invitations.pending');

    // Short URL routes
    Route::resource('short-urls', ShortUrlController::class)->except(['show', 'edit', 'update', 'destroy']);
});

Route::get('/{shortCode}', [ShortUrlController::class, 'redirect'])
    ->where('shortCode', '[a-zA-Z0-9]{6}')
    ->name('short-url.redirect');
