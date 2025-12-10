@extends('layouts.app')

@section('title', 'Accept Invitation')

@section('content')
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>Accept Invitation</h4>
                </div>
                <div class="card-body">
                    <div class="alert alert-info">
                        You've been invited to join
                        @if($invitation->company)
                            <strong>{{ $invitation->company->name }}</strong>
                        @else
                            a new company
                        @endif
                        as a <strong>{{ $invitation->role }}</strong>.
                    </div>

                    <form method="POST" action="{{ route('invitation.accept', $invitation->token) }}">
                        @csrf

                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                   id="name" name="name" value="{{ old('name') }}" required>
                            @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control"
                                   id="email" value="{{ $invitation->email }}" disabled>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control @error('password') is-invalid @enderror"
                                   id="password" name="password" required>
                            @error('password')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="password_confirmation" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control"
                                   id="password_confirmation" name="password_confirmation" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Accept Invitation</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
