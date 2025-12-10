# URL Shortener Service

A Laravel-based URL shortening service with multi-company support and role-based access control.

## Features

- Multi-company architecture
- Role-based access control (SuperAdmin, Admin, Member, Sales, Manager)
- User invitations
- URL shortening and redirection
- Comprehensive authorization rules

## Requirements

- PHP >= 8.2
- Composer
- MySQL
- Laravel 12.0

## Installation Steps

### 1. Clone the repository
```bash
git clone <repository-url>
cd url-shortener
```

### 2. Install dependencies
```bash
composer install
```

Publish Spatie config and migrations
```bash
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"
```

### 3. Environment setup
```bash
cp .env.example .env
php artisan key:generate
```

### 4. Configure database

**For SQLite (Recommended for testing):**

Edit `.env`:
```dotenv
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=sembark
DB_USERNAME=root
DB_PASSWORD=
```

### 5. Run migrations and seeders
```bash
php artisan migrate
php artisan db:seed
```

This will create:
- Database tables
- Roles and permissions
- SuperAdmin account (email: superadmin@example.com, password: password)
- **5 Companies with realistic data**
- **1 Admin per company**
- **2-4 Members per company**
- **Multiple short URLs for each user**
- **Pending invitations**

### 6. Start the development server
```bash
php artisan serve
```

Visit: http://localhost:8000

## Default Credentials

**SuperAdmin Account:**
- Email: superadmin@example.com
- Password: password

**Company Admins (Password: password for all):**
- Tech Solutions Inc: techsolutionsinc.admin@example.com
- Digital Marketing Pro: digitalmarketingpro.admin@example.com
- E-Commerce World: e-commerceworld.admin@example.com
- Startup Hub: startuphub.admin@example.com
- Creative Agency: creativeagency.admin@example.com

**Company Members (Password: password for all):**
- Each company has 2-4 members with emails like:
    - techsolutionsinc.member1@example.com
    - techsolutionsinc.member2@example.com
    - (and so on for other companies)

**Note:** After running `php artisan db:seed`, the seeder will display all login credentials in the terminal.

## Testing

Run the feature tests:
```bash
php artisan test
```

Or run specific test file:
```bash
php artisan test --filter ShortUrlTest
```

## Usage Guide

### SuperAdmin

1. Login with SuperAdmin credentials
2. Navigate to "Invite Admin" to create new companies with Admin users
3. View all short URLs across all companies

### Admin

1. Login with invited Admin credentials
2. Invite other Admins or Members to your company
3. Create and manage short URLs
4. View all URLs created in your company

### Member

1. Login with invited Member credentials
2. Create short URLs
3. View only your own created URLs

## Project Structure

```
app/
├── Http/
│   ├── Controllers/
│   │   ├── AuthController.php
│   │   ├── DashboardController.php
│   │   ├── InvitationController.php
│   │   └── ShortUrlController.php
│   └── Requests/
│       ├── CreateShortUrlRequest.php
│       └── InviteUserRequest.php
├── Models/
│   ├── User.php
│   ├── Company.php
│   ├── Invitation.php
│   └── ShortUrl.php
database/
├── migrations/
└── seeders/
resources/
└── views/
routes/
└── web.php
tests/
└── Feature/
└── ShortUrlTest.php
```

## Roles and Permissions

- **SuperAdmin**: Invite Admins to new companies, view all URLs
- **Admin**: Invite users, create URLs, view company URLs
- **Member**: Create URLs, view own URLs
- **Sales**: (Reserved for future use)
- **Manager**: (Reserved for future use)

## Troubleshooting

### Database connection error

Ensure database file exists (SQLite) or database is created (MySQL).

### Permission denied
```bash
chmod -R 775 storage bootstrap/cache
```

### Migration errors
```bash
php artisan migrate:fresh --seed
```

## License

MIT License
