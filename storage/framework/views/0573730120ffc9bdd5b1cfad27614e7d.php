<?php $__env->startSection('title', 'Create Short URL'); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4>Create Short URL</h4>
                </div>
                <div class="card-body">
                    <form method="POST" action="<?php echo e(route('short-urls.store')); ?>">
                        <?php echo csrf_field(); ?>

                        <div class="mb-3">
                            <label for="original_url" class="form-label">Original URL</label>
                            <input type="url" class="form-control <?php $__errorArgs = ['original_url'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                   id="original_url" name="original_url" value="<?php echo e(old('original_url')); ?>"
                                   placeholder="https://example.com/very-long-url" required>
                            <?php $__errorArgs = ['original_url'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <div class="invalid-feedback"><?php echo e($message); ?></div>
                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            <div class="form-text">Enter the full URL you want to shorten (must include http:// or https://)</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Create Short URL</button>
                        <a href="<?php echo e(route('short-urls.index')); ?>" class="btn btn-secondary">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH F:\laragon\www\kandemo\resources\views/short-urls/create.blade.php ENDPATH**/ ?>