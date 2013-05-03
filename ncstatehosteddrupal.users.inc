<?php

/**
 * Generates a stdClass for admin users
 */
function create_new_admin_user($name, $pass, $email) {
  $account = new stdClass();
  $account->is_new = true;

  $userdata = array(
    'name' => $name,
    'pass' => $pass,
    'mail' => $email,
    'init' => $email,
    'status' => 1,
  );
  $newuser = user_save($account, $userdata);

  // Adding user to the admin role
  $admin_role_id = db_result(db_query("SELECT rid FROM {role} WHERE name = 'administrator'"));
  db_query("INSERT INTO {users_roles} (uid, rid) VALUES (%d, %d)", $newuser->uid, $admin_role_id);

  watchdog('create_new_admin', 'Created new user with uid: ' . $newuser->uid);
  return;
}

