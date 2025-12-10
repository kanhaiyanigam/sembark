<?php $__env->startSection('title', 'Short URLs'); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Short URLs</h4>
                    <?php if(auth()->user()->hasRole('Admin') || auth()->user()->hasRole('Member')): ?>
                        <a href="<?php echo e(route('short-urls.create')); ?>" class="btn btn-primary">Create New</a>
                    <?php endif; ?>
                </div>
                <div class="card-body">
                    <?php if($shortUrls->isEmpty()): ?>
                        <p class="text-muted">No short URLs found.</p>
                    <?php else: ?>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Short URL</th>
                                    <th>Original URL</th>
                                    <?php if(auth()->user()->hasRole('SuperAdmin')): ?>
                                        <th>Company</th>
                                    <?php endif; ?>
                                    <?php if(auth()->user()->hasRole('SuperAdmin') || auth()->user()->hasRole('Admin')): ?>
                                        <th>Created By</th>
                                    <?php endif; ?>
                                    <th>Clicks</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $__currentLoopData = $shortUrls; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $url): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td>
                                            <a href="<?php echo e($url->short_url); ?>" target="_blank">
                                                <?php echo e($url->short_code); ?>

                                            </a>
                                        </td>
                                        <td>
                                            <a href="<?php echo e($url->original_url); ?>" target="_blank" class="text-truncate d-inline-block" style="max-width: 300px;">
                                                <?php echo e($url->original_url); ?>

                                            </a>
                                        </td>
                                        <?php if(auth()->user()->hasRole('SuperAdmin')): ?>
                                            <td><?php echo e($url->company->name); ?></td>
                                        <?php endif; ?>
                                        <?php if(auth()->user()->hasRole('SuperAdmin') || auth()->user()->hasRole('Admin')): ?>
                                            <td><?php echo e($url->user->name); ?></td>
                                        <?php endif; ?>
                                        <td><span class="badge bg-primary"><?php echo e($url->clicks); ?></span></td>
                                        <td><?php echo e($url->created_at->diffForHumans()); ?></td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                            </table>
                        </div>

                        <div class="mt-3">
                            <?php echo e($shortUrls->links('pagination::bootstrap-5')); ?>

                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\laragon\www\sembark\resources\views/short-urls/index.blade.php ENDPATH**/ ?>