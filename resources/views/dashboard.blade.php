@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <h1>Dashboard</h1>
            <p class="lead">Welcome, {{ $user->name }}!</p>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Your Role</h5>
                    <p class="card-text display-6">{{ $user->getRoleNames()->first() }}</p>
                </div>
            </div>
        </div>

        @if($user->company)
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Company</h5>
                        <p class="card-text display-6">{{ $user->company->name }}</p>
                    </div>
                </div>
            </div>
        @endif

        @if($user->hasRole('Admin') || $user->hasRole('Member'))
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Your Short URLs</h5>
                        <p class="card-text display-6">{{ $user->shortUrls->count() }}</p>
                    </div>
                </div>
            </div>
        @endif
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>Quick Actions</h5>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        @if($user->hasRole('Admin') || $user->hasRole('Member'))
                            <a href="{{ route('short-urls.create') }}" class="list-group-item list-group-item-action">
                                Create New Short URL
                            </a>
                        @endif

                        <a href="{{ route('short-urls.index') }}" class="list-group-item list-group-item-action">
                            View Short URLs
                        </a>

                        @if($user->hasRole('SuperAdmin') || $user->hasRole('Admin'))
                            <a href="{{ route('invite.form') }}" class="list-group-item list-group-item-action">
                                Invite New User
                            </a>
                            <a href="{{ route('invitations.pending') }}" class="list-group-item list-group-item-action">
                                View Pending Invitations
                            </a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
