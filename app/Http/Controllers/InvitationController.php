<?php

namespace App\Http\Controllers;

use App\Http\Requests\InviteUserRequest;
use App\Models\Company;
use App\Models\Invitation;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class InvitationController extends Controller
{
    public function showInviteForm()
    {
        $user = auth()->user();

        if ($user->hasRole('SuperAdmin')) {
            return view('invitations.invite-admin');
        }

        if ($user->hasRole('Admin')) {
            return view('invitations.invite-user');
        }

        abort(403);
    }

    public function invite(InviteUserRequest $request)
    {
        $user = auth()->user();
        $validated = $request->validated();

        if ($user->hasRole('SuperAdmin')) {
            // SuperAdmin inviting Admin to new company
            $company = Company::create([
                'name' => $validated['company_name'],
                'slug' => Str::slug($validated['company_name']),
            ]);

            $invitation = Invitation::create([
                'email' => $validated['email'],
                'token' => Str::random(32),
                'role' => 'Admin',
                'company_id' => $company->id,
                'invited_by' => $user->id,
            ]);
        } elseif ($user->hasRole('Admin')) {
            // Admin inviting Admin or Member to their company
            $invitation = Invitation::create([
                'email' => $validated['email'],
                'token' => Str::random(32),
                'role' => $validated['role'],
                'company_id' => $user->company_id,
                'invited_by' => $user->id,
            ]);
        } else {
            abort(403);
        }

        return redirect()->back()->with('success', 'Invitation sent successfully!');
    }

    public function showAcceptForm($token)
    {
        $invitation = Invitation::where('token', $token)
            ->whereNull('accepted_at')
            ->firstOrFail();

        return view('invitations.accept', ['invitation' => $invitation]);
    }

    public function accept(Request $request, $token)
    {
        $invitation = Invitation::where('token', $token)
            ->whereNull('accepted_at')
            ->firstOrFail();

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'password' => 'required|string|min:8|confirmed',
        ]);

        $user = User::create([
            'name' => $validated['name'],
            'email' => $invitation->email,
            'password' => Hash::make($validated['password']),
            'company_id' => $invitation->company_id,
        ]);

        $user->assignRole($invitation->role);

        $invitation->update(['accepted_at' => now()]);

        auth()->login($user);

        return redirect()->route('dashboard')->with('success', 'Account created successfully!');
    }

    public function pendingInvitations()
    {
        $user = auth()->user();

        if ($user->hasRole('SuperAdmin')) {
            $invitations = Invitation::with(['company', 'inviter'])
                ->whereNull('accepted_at')
                ->latest()
                ->get();
        } elseif ($user->hasRole('Admin')) {
            $invitations = Invitation::with('inviter')
                ->where('company_id', $user->company_id)
                ->whereNull('accepted_at')
                ->latest()
                ->get();
        } else {
            abort(403);
        }

        return view('invitations.pending', ['invitations' => $invitations]);
    }
}
