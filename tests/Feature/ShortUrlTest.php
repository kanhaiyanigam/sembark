<?php

namespace Tests\Feature;

use App\Models\Company;
use App\Models\ShortUrl;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class ShortUrlTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        // Create roles
        Role::create(['name' => 'SuperAdmin']);
        Role::create(['name' => 'Admin']);
        Role::create(['name' => 'Member']);
    }

    public function test_admin_can_create_short_urls()
    {
        $company = Company::factory()->create();
        $admin = User::factory()->create(['company_id' => $company->id]);
        $admin->assignRole('Admin');

        $response = $this->actingAs($admin)->post(route('short-urls.store'), [
            'original_url' => 'https://example.com/test',
        ]);

        $response->assertRedirect(route('short-urls.index'));
        $this->assertDatabaseHas('short_urls', [
            'original_url' => 'https://example.com/test',
            'user_id' => $admin->id,
            'company_id' => $company->id,
        ]);
    }

    public function test_member_can_create_short_urls()
    {
        $company = Company::factory()->create();
        $member = User::factory()->create(['company_id' => $company->id]);
        $member->assignRole('Member');

        $response = $this->actingAs($member)->post(route('short-urls.store'), [
            'original_url' => 'https://example.com/test',
        ]);

        $response->assertRedirect(route('short-urls.index'));
        $this->assertDatabaseHas('short_urls', [
            'original_url' => 'https://example.com/test',
            'user_id' => $member->id,
        ]);
    }

    public function test_superadmin_cannot_create_short_urls()
    {
        $superAdmin = User::factory()->create();
        $superAdmin->assignRole('SuperAdmin');

        $response = $this->actingAs($superAdmin)->post(route('short-urls.store'), [
            'original_url' => 'https://example.com/test',
        ]);

        $response->assertForbidden();
        $this->assertDatabaseMissing('short_urls', [
            'original_url' => 'https://example.com/test',
        ]);
    }

    public function test_admin_can_only_see_company_urls()
    {
        $company1 = Company::factory()->create();
        $company2 = Company::factory()->create();

        $admin1 = User::factory()->create(['company_id' => $company1->id]);
        $admin1->assignRole('Admin');

        $admin2 = User::factory()->create(['company_id' => $company2->id]);
        $admin2->assignRole('Admin');

        ShortUrl::factory()->create(['user_id' => $admin1->id, 'company_id' => $company1->id, 'short_code' => 'abc123']);
        ShortUrl::factory()->create(['user_id' => $admin2->id, 'company_id' => $company2->id, 'short_code' => 'xyz789']);

        $response = $this->actingAs($admin1)->get(route('short-urls.index'));

        $response->assertStatus(200);
        $response->assertSee('abc123');
        $response->assertDontSee('xyz789');
    }

    public function test_member_can_only_see_own_urls()
    {
        $company = Company::factory()->create();

        $member1 = User::factory()->create(['company_id' => $company->id]);
        $member1->assignRole('Member');

        $member2 = User::factory()->create(['company_id' => $company->id]);
        $member2->assignRole('Member');

        ShortUrl::factory()->create(['user_id' => $member1->id, 'company_id' => $company->id, 'short_code' => 'mem111']);
        ShortUrl::factory()->create(['user_id' => $member2->id, 'company_id' => $company->id, 'short_code' => 'mem222']);

        $response = $this->actingAs($member1)->get(route('short-urls.index'));

        $response->assertStatus(200);
        $response->assertSee('mem111');
        $response->assertDontSee('mem222');
    }

    public function test_short_urls_are_publicly_resolvable_and_redirect()
    {
        $company = Company::factory()->create();
        $user = User::factory()->create(['company_id' => $company->id]);
        $user->assignRole('Admin');

        $shortUrl = ShortUrl::factory()->create([
            'user_id' => $user->id,
            'company_id' => $company->id,
            'short_code' => 'test123',
            'original_url' => 'https://example.com/original',
        ]);

        $response = $this->get('/' . $shortUrl->short_code);

        $response->assertRedirect('https://example.com/original');

        $shortUrl->refresh();
        $this->assertEquals(1, $shortUrl->clicks);
    }
}
