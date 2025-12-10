@extends('layouts.app')

@section('title', 'Short URLs')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Short URLs</h4>
                    @if(auth()->user()->hasRole('Admin') || auth()->user()->hasRole('Member'))
                        <a href="{{ route('short-urls.create') }}" class="btn btn-primary">Create New</a>
                    @endif
                </div>
                <div class="card-body">
                    @if($shortUrls->isEmpty())
                        <p class="text-muted">No short URLs found.</p>
                    @else
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Short URL</th>
                                    <th>Original URL</th>
                                    @if(auth()->user()->hasRole('SuperAdmin'))
                                        <th>Company</th>
                                    @endif
                                    @if(auth()->user()->hasRole('SuperAdmin') || auth()->user()->hasRole('Admin'))
                                        <th>Created By</th>
                                    @endif
                                    <th>Clicks</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($shortUrls as $url)
                                    <tr>
                                        <td>
                                            <a href="{{ $url->short_url }}" target="_blank">
                                                {{ $url->short_code }}
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{ $url->original_url }}" target="_blank" class="text-truncate d-inline-block" style="max-width: 300px;">
                                                {{ $url->original_url }}
                                            </a>
                                        </td>
                                        @if(auth()->user()->hasRole('SuperAdmin'))
                                            <td>{{ $url->company->name }}</td>
                                        @endif
                                        @if(auth()->user()->hasRole('SuperAdmin') || auth()->user()->hasRole('Admin'))
                                            <td>{{ $url->user->name }}</td>
                                        @endif
                                        <td><span class="badge bg-primary">{{ $url->clicks }}</span></td>
                                        <td>{{ $url->created_at->diffForHumans() }}</td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>

                        <div class="mt-3">
                            {{ $shortUrls->links('pagination::bootstrap-5') }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
