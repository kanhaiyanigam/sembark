<?php

namespace Database\Seeders;

use App\Models\Company;
use App\Models\Invitation;
use App\Models\ShortUrl;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DummyDataSeeder extends Seeder
{
    public function run(): void
    {
        // Create Companies
        $companies = [
            ['name' => 'Tech Solutions Inc', 'slug' => 'tech-solutions-inc'],
            ['name' => 'Digital Marketing Pro', 'slug' => 'digital-marketing-pro'],
            ['name' => 'E-Commerce World', 'slug' => 'e-commerce-world'],
            ['name' => 'Startup Hub', 'slug' => 'startup-hub'],
            ['name' => 'Creative Agency', 'slug' => 'creative-agency'],
        ];

        foreach ($companies as $companyData) {
            $company = Company::create($companyData);

            // Create 1 Admin for each company
            $admin = User::create([
                'name' => fake()->name(),
                'email' => strtolower(str_replace(' ', '', $companyData['name'])) . '.admin@example.com',
                'email_verified_at' => now(),
                'password' => Hash::make('password'),
                'company_id' => $company->id,
            ]);
            $admin->assignRole('Admin');

            // Create 2-4 Members for each company
            $memberCount = rand(2, 4);
            for ($i = 1; $i <= $memberCount; $i++) {
                $member = User::create([
                    'name' => fake()->name(),
                    'email' => strtolower(str_replace(' ', '', $companyData['name'])) . ".member{$i}@example.com",
                    'email_verified_at' => now(),
                    'password' => Hash::make('password'),
                    'company_id' => $company->id,
                ]);
                $member->assignRole('Member');

                // Create 3-8 short URLs for each member
                $urlCount = rand(3, 8);
                for ($j = 0; $j < $urlCount; $j++) {
                    ShortUrl::create([
                        'short_code' => $this->generateUniqueShortCode(),
                        'original_url' => fake()->url(),
                        'user_id' => $member->id,
                        'company_id' => $company->id,
                        'clicks' => rand(0, 500),
                    ]);
                }
            }

            // Create 5-10 short URLs for the admin
            $adminUrlCount = rand(5, 10);
            for ($k = 0; $k < $adminUrlCount; $k++) {
                ShortUrl::create([
                    'short_code' => $this->generateUniqueShortCode(),
                    'original_url' => fake()->url(),
                    'user_id' => $admin->id,
                    'company_id' => $company->id,
                    'clicks' => rand(0, 1000),
                ]);
            }

            // Create 1-3 pending invitations for each company
            $invitationCount = rand(1, 3);
            for ($m = 0; $m < $invitationCount; $m++) {
                $role = rand(0, 1) ? 'Admin' : 'Member';
                Invitation::create([
                    'email' => fake()->unique()->safeEmail(),
                    'token' => Str::random(32),
                    'role' => $role,
                    'company_id' => $company->id,
                    'invited_by' => $admin->id,
                ]);
            }
        }

        // Create some accepted invitations (historical data)
        $superAdmin = User::where('email', 'superadmin@example.com')->first();
        $allCompanies = Company::all();

        foreach ($allCompanies->take(3) as $company) {
            Invitation::create([
                'email' => $company->users()->whereHas('roles', function ($q) {
                    $q->where('name', 'Admin');
                })->first()->email,
                'token' => Str::random(32),
                'role' => 'Admin',
                'company_id' => $company->id,
                'invited_by' => $superAdmin->id,
                'accepted_at' => now()->subDays(rand(1, 30)),
            ]);
        }

        $this->command->info('Dummy data created successfully!');
        $this->command->info('');
        $this->command->info('=== Login Credentials ===');
        $this->command->info('SuperAdmin: superadmin@example.com / password');
        $this->command->info('');
        $this->command->info('Company Admins (password for all: password):');

        foreach (Company::all() as $company) {
            $adminEmail = $company->users()->whereHas('roles', function ($q) {
                $q->where('name', 'Admin');
            })->first()->email;
            $this->command->info("- {$company->name}: {$adminEmail}");
        }

        $this->command->info('');
        $this->command->info('Company Members (password for all: password):');

        foreach (Company::all()->take(2) as $company) {
            $members = $company->users()->whereHas('roles', function ($q) {
                $q->where('name', 'Member');
            })->take(2)->get();

            foreach ($members as $member) {
                $this->command->info("- {$company->name}: {$member->email}");
            }
        }
    }

    private function generateUniqueShortCode(): string
    {
        do {
            $shortCode = Str::random(6);
        } while (ShortUrl::where('short_code', $shortCode)->exists());

        return $shortCode;
    }
}
