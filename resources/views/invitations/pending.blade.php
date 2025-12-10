@extends('layouts.app')

@section('title', 'Pending Invitations')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Pending Invitations</h4>
                    <a href="{{ route('invite.form') }}" class="btn btn-primary">Send New Invitation</a>
                </div>
                <div class="card-body">
                    @if($invitations->isEmpty())
                        <p class="text-muted">No pending invitations.</p>
                    @else
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Role</th>
                                    @if(auth()->user()->hasRole('SuperAdmin'))
                                        <th>Company</th>
                                    @endif
                                    <th>Invited By</th>
                                    <th>Sent At</th>
                                    <th>Invitation Link</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($invitations as $invitation)
                                    <tr>
                                        <td>{{ $invitation->email }}</td>
                                        <td><span class="badge bg-info">{{ $invitation->role }}</span></td>
                                        @if(auth()->user()->hasRole('SuperAdmin'))
                                            <td>{{ $invitation->company->name }}</td>
                                        @endif
                                        <td>{{ $invitation->inviter->name }}</td>
                                        <td>{{ $invitation->created_at->diffForHumans() }}</td>
                                        <td>
                                            <input type="text" class="form-control form-control-sm"
                                                   value="{{ route('invitation.accept', $invitation->token) }}"
                                                   readonly>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
