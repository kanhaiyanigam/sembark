<?php $__env->startSection('title', 'Pending Invitations'); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Pending Invitations</h4>
                    <a href="<?php echo e(route('invite.form')); ?>" class="btn btn-primary">Send New Invitation</a>
                </div>
                <div class="card-body">
                    <?php if($invitations->isEmpty()): ?>
                        <p class="text-muted">No pending invitations.</p>
                    <?php else: ?>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <?php if(auth()->user()->hasRole('SuperAdmin')): ?>
                                        <th>Company</th>
                                    <?php endif; ?>
                                    <th>Invited By</th>
                                    <th>Sent At</th>
                                    <th>Invitation Link</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $__currentLoopData = $invitations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $invitation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($invitation->email); ?></td>
                                        <td><span class="badge bg-info"><?php echo e($invitation->role); ?></span></td>
                                        <?php if(auth()->user()->hasRole('SuperAdmin')): ?>
                                            <td><?php echo e($invitation->company->name); ?></td>
                                        <?php endif; ?>
                                        <td><?php echo e($invitation->inviter->name); ?></td>
                                        <td><?php echo e($invitation->created_at->diffForHumans()); ?></td>
                                        <td>
                                            <input type="text" class="form-control form-control-sm"
                                                   value="<?php echo e(route('invitation.accept', $invitation->token)); ?>"
                                                   readonly>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                            </table>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH F:\laragon\www\kandemo\resources\views/invitations/pending.blade.php ENDPATH**/ ?>