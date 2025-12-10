<?php $__env->startSection('title', 'Dashboard'); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-md-12">
            <h1>Dashboard</h1>
            <p class="lead">Welcome, <?php echo e($user->name); ?>!</p>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Your Role</h5>
                    <p class="card-text display-6"><?php echo e($user->getRoleNames()->first()); ?></p>
                </div>
            </div>
        </div>

        <?php if($user->company): ?>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Company</h5>
                        <p class="card-text display-6"><?php echo e($user->company->name); ?></p>
                    </div>
                </div>
            </div>
        <?php endif; ?>

        <?php if($user->hasRole('Admin') || $user->hasRole('Member')): ?>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Your Short URLs</h5>
                        <p class="card-text display-6"><?php echo e($user->shortUrls->count()); ?></p>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>Quick Actions</h5>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <?php if($user->hasRole('Admin') || $user->hasRole('Member')): ?>
                            <a href="<?php echo e(route('short-urls.create')); ?>" class="list-group-item list-group-item-action">
                                Create New Short URL
                            </a>
                        <?php endif; ?>

                        <a href="<?php echo e(route('short-urls.index')); ?>" class="list-group-item list-group-item-action">
                            View Short URLs
                        </a>

                        <?php if($user->hasRole('SuperAdmin') || $user->hasRole('Admin')): ?>
                            <a href="<?php echo e(route('invite.form')); ?>" class="list-group-item list-group-item-action">
                                Invite New User
                            </a>
                            <a href="<?php echo e(route('invitations.pending')); ?>" class="list-group-item list-group-item-action">
                                View Pending Invitations
                            </a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\laragon\www\sembark\resources\views/dashboard.blade.php ENDPATH**/ ?>