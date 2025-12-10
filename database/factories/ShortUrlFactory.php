<?php

namespace Database\Factories;

use App\Models\Company;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ShortUrlFactory extends Factory
{
    public function definition(): array
    {
        return [
            'short_code' => Str::random(6),
            'original_url' => fake()->url(),
            'user_id' => User::factory(),
            'company_id' => Company::factory(),
            'clicks' => 0,
        ];
    }
}
