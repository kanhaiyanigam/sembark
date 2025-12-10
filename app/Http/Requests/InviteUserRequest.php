<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class InviteUserRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() &&
            (auth()->user()->hasRole('SuperAdmin') || auth()->user()->hasRole('Admin'));
    }

    public function rules(): array
    {
        $user = auth()->user();

        if ($user->hasRole('SuperAdmin')) {
            return [
                'email' => 'required|email|unique:users,email',
                'company_name' => 'required|string|max:255',
            ];
        }

        return [
            'email' => 'required|email|unique:users,email',
            'role' => 'required|in:Admin,Member',
        ];
    }
}
