<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateShortUrlRequest;
use App\Models\ShortUrl;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ShortUrlController extends Controller
{
    public function index()
    {
        $user = auth()->user();

        if ($user->hasRole('SuperAdmin')) {
            // SuperAdmin can see all URLs from all companies
            $shortUrls = ShortUrl::with(['user', 'company'])->latest()->paginate(15);
        } elseif ($user->hasRole('Admin')) {
            // Admin can see all URLs in their company
            $shortUrls = ShortUrl::with('user')
                ->where('company_id', $user->company_id)
                ->latest()
                ->paginate(15);
        } elseif ($user->hasRole('Member')) {
            // Member can only see their own URLs
            $shortUrls = ShortUrl::where('user_id', $user->id)
                ->latest()
                ->paginate(15);
        } else {
            abort(403);
        }

        return view('short-urls.index', ['shortUrls' => $shortUrls]);
    }

    public function create()
    {
        $user = auth()->user();

        if ($user->hasRole('SuperAdmin')) {
            abort(403, 'SuperAdmin cannot create short URLs');
        }

        return view('short-urls.create');
    }

    public function store(CreateShortUrlRequest $request)
    {
        $user = auth()->user();

        if ($user->hasRole('SuperAdmin')) {
            abort(403, 'SuperAdmin cannot create short URLs');
        }

        $validated = $request->validated();

        do {
            $shortCode = Str::random(6);
        } while (ShortUrl::where('short_code', $shortCode)->exists());

        $shortUrl = ShortUrl::create([
            'short_code' => $shortCode,
            'original_url' => $validated['original_url'],
            'user_id' => $user->id,
            'company_id' => $user->company_id,
        ]);

        return redirect()->route('short-urls.index')
            ->with('success', 'Short URL created successfully!');
    }

    public function redirect($shortCode)
    {
        $shortUrl = ShortUrl::where('short_code', $shortCode)->firstOrFail();

        $shortUrl->increment('clicks');

        return redirect($shortUrl->original_url);
    }
}
