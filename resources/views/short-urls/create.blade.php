@extends('layouts.app')

@section('title', 'Create Short URL')

@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4>Create Short URL</h4>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('short-urls.store') }}">
                        @csrf

                        <div class="mb-3">
                            <label for="original_url" class="form-label">Original URL</label>
                            <input type="url" class="form-control @error('original_url') is-invalid @enderror"
                                   id="original_url" name="original_url" value="{{ old('original_url') }}"
                                   placeholder="https://example.com/very-long-url" required>
                            @error('original_url')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                            <div class="form-text">Enter the full URL you want to shorten (must include http:// or https://)</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Create Short URL</button>
                        <a href="{{ route('short-urls.index') }}" class="btn btn-secondary">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
