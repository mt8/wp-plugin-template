<?php
/**
 * PHPUnit bootstrap file
 *
 */
$_tests_dir = getenv( 'WP_TESTS_DIR' );
require_once $_tests_dir . '/includes/functions.php';

tests_add_filter( 'muplugins_loaded', function() {
	require dirname( dirname( __DIR__ ) ) . '/plugin.php';
} );

require $_tests_dir . '/includes/bootstrap.php';
require_once dirname( dirname( __DIR__ ) ) . '/vendor/yoast/phpunit-polyfills/phpunitpolyfills-autoload.php';
