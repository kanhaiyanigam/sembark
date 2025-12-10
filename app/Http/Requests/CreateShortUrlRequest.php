<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateShortUrlRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() &&
            (auth()->user()->hasRole('Admin') || auth()->user()->hasRole('Member'));
    }

    public function rules(): array
    {
        return [
            'original_url' => 'required|url|max:2048',
        ];
    }
}
