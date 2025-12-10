<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolePermissionSeeder extends Seeder
{
    public function run(): void
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Create permissions
        $permissions = [
            'invite-admin',
            'invite-member',
            'create-short-url',
            'view-all-urls',
            'view-company-urls',
            'view-own-urls',
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }

        // Create roles and assign permissions
        $superAdmin = Role::create(['name' => 'SuperAdmin']);
        $superAdmin->givePermissionTo(['invite-admin', 'view-all-urls']);

        $admin = Role::create(['name' => 'Admin']);
        $admin->givePermissionTo(['invite-admin', 'invite-member', 'create-short-url', 'view-company-urls']);

        $member = Role::create(['name' => 'Member']);
        $member->givePermissionTo(['create-short-url', 'view-own-urls']);

        $sales = Role::create(['name' => 'Sales']);
        $manager = Role::create(['name' => 'Manager']);

        // Create SuperAdmin user using raw SQL
        DB::statement("
            INSERT INTO users (name, email, email_verified_at, password, created_at, updated_at)
            VALUES (?, ?, ?, ?, ?, ?)
        ", [
            'Super Admin',
            'superadmin@example.com',
            now(),
            Hash::make('password'),
            now(),
            now()
        ]);

        $superAdminUser = DB::table('users')->where('email', 'superadmin@example.com')->first();

        DB::table('model_has_roles')->insert([
            'role_id' => $superAdmin->id,
            'model_type' => 'App\\Models\\User',
            'model_id' => $superAdminUser->id,
        ]);
    }
}
