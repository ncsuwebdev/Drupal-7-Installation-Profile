<?php

/**
 * @file
 *
 * An install profile for NC State Drupal sites
 */

include_once('ncstatehosteddrupal.tinymce.inc');
//include_once('ncstatehosteddrupal.permissions.inc');
include_once('ncstatehosteddrupal.users.inc');

/**
 * Returns a description of the profile for the initial installation screen
 *
 * @return
 *  An array with keys 'name' and 'description' describing this profile,
 *  and optional 'language' to override the language selection for
 *  language specific profiles.
 */
function ncstatehosteddrupal_profile_details() {
  return array(
    'name' => 'NC State University Install Profile',
    'description' => 'An install profile for NC State University Drupal Websites',
  );
}


/**
 * Returns an array of modules that should be enabled by default
 *
 * @return
 *  An array of modules to enable.
 */
function ncstatehosteddrupal_profile_modules() {
  $core_modules = array(
    'block',
    'contact',
    'contextual',
    'dashboard',
    'dblog',
    'field',
    'field_sql_storage',
    'field_ui',
    'file',
    'filter',
    'help',
    'image',
    'list',
    'menu',
    'node',
    'number',
    'options',
    'overlay',
    'path',
    'rdf',
    'search',
    'shortcut',
    'system',
    'taxonomy',
    'text',
    'toolbar',
    'tracker',
    'trigger',
    'user',
  );
  $contrib_modules = array(
    'advanced_help',
    'auto_nodetitle',
    'block_access',
    'calendar',
    'cck',
    'content_access',
    'css_injector',
    'ctools',
    'date',
    'email',
    'entity',
    'features',
    'feeds',
    'field_group',
    'filefield',
    'gcal_events',
    'globalredirect',
    'google_analytics',
    'imagecache_profiles',
    'imce_mkdir',
    'imce_wysiwyg',
    'imce',
    'jquery_update',
    'js_injector',
    'libraries',
    'link',
    'linkit',
    'linkit_picker',
    'masquerade',
    'menu_block',
    'menu_breadcrumb',
    'metatag',
    'nodeaccess',
    'nodereference_url',
    'pathauto',
    'phone',
    'recaptcha',
    'references',
    'role_delegation',
    'scheduler',
    'shadowbox',
    'strongarm',
    'system_perm',
    'token',
    'views',
    'webform_validation',
    'webform',
    'wysiwyg',
  );
  $custom_modules = array(
    'ncsuphplibrary',
    'ncsuroles',
    'wraplogin',
  );

  return array_merge($core_modules, $contrib_modules, $custom_modules);
}

/**
 * List tasks that this profile supports
 *
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function ncstatehosteddrupal_profile_task_list() {
  return array(
    'task_configure_theme' => st('Configure Theme'),
    'task_configure_editor' => st('Configure Editor'),
    'task_configure_variables' => st('Configure Variables'),
    'task_configure_users' => st('Configure Admin Users'),
    'task_configure_contact' => st('Configure Contact Form'),
    'task_create_first_node' => st('Create First Node / Set as Home Page'),
    'task_create_standard_menus' => st('Create Standard Menus'),
    'task_create_standard_menu_links' => st('Create Standard Menu Links'),
    'task_configure_blocks' => st('Configure Blocks'),
    'task_configure_gcal_events' => st('Configure GCal Events Module'),
    'task_configure_cleanup' => st('Running cleanup tasks'),
  );
}

/**
 * Perform any final installation tasks for this profile.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */

function ncstatehosteddrupal_profile_tasks(&$task, $url) {

  // Run 'profile' task
  if ($task == 'profile') {
    // Uninstalling the updates notification by default
    module_disable(array('update'));
    $task = 'task_configure_theme';
    watchdog('ncstatehosteddrupal_profile', 'running profile task');
  }

  // Run 'task_configure_theme' task
  if ($task == 'task_configure_theme') {
    configure_theme();
    $task = 'task_configure_editor';
  }

  // Run 'task_configure_editor' task
  if ($task == 'task_configure_editor') {
    configure_editor();
    $task = 'task_configure_variables';
  }

  // Run 'task_configure_editor' task
  if ($task == 'task_configure_variables') {
    configure_variables();
    $task = 'task_configure_users';
  }

  // Run 'task_configure_users' task
  if ($task == 'task_configure_users') {
    configure_users();
    $task = 'task_create_first_node';
  }

  // Run 'task_create_first_node' task
  if ($task == 'task_create_first_node') {
      create_first_node();
    $task = 'task_create_standard_menus';
  }

  // Run 'task_create_standard_menus' task
  if ($task == 'task_create_standard_menus') {
      create_standard_menus();
    $task = 'task_create_standard_menu_links';
  }

  // Run 'task_create_standard_menu_links' task
  if ($task == 'task_create_standard_menu_links') {
      create_standard_menu_links();
    $task = 'task_configure_blocks';
  }

  // Run 'task_configure_blocks' task
  if ($task == 'task_configure_blocks') {
      configure_blocks();
    $task = 'task_configure_cleanup';
  }

    // Run 'task_configure_cleanup' task
    if ($task == 'task_configure_cleanup') {
      drupal_flush_all_caches();
      drupal_cron_run();
      $task = 'profile-finished';
    }

}

function get_theme_name() {
  return 'garland';
}

/**
 * Configure Theme Task
 */
function configure_theme() {

  $system_themes = system_theme_data();
  $theme = get_theme_name();

  if (array_key_exists($theme, $system_themes)) {
    system_initialize_theme_blocks($theme);
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name = ('%s')", $theme);
    variable_set('theme_default', $theme);
  };
  // Disables garland theme
  db_query("UPDATE {system} SET status = 0 WHERE type = 'theme' and name = ('garland')");
  watchdog('ncstatehosteddrupal_profile', 'Configured theme');

}

/**
 * Configure Editor Task
 */
function configure_editor() {

  $enable_modules = array(
    'tinymce_node_picker',
  );

  module_enable($enable_modules);


  $tiny_conf = get_tinymce_conf();

  $result = db_query("INSERT INTO {wysiwyg}
                      (format, editor, settings)
                      VALUES (%d, '%s', '%s')",
                      1, 'tinymce', serialize($tiny_conf));

  $result = db_query("INSERT INTO {wysiwyg}
                      (format, editor, settings)
                      VALUES (%d, '%s', '%s')",
                      2, 'tinymce', serialize($tiny_conf));
  watchdog('ncstatehosteddrupal_profile', 'Configured tinymce');

  $imce_roles_profiles = array(
    3 => array('pid' => 1),
    2 => array('pid' => 2),
    1 => array('pid' => 0),
  );
  variable_set('imce_roles_profiles', $imce_roles_profiles);

  $imce_profiles = array(
    1 => array(
      'name'=> 'User-1',
      'usertab'=> 1,
      'filesize'=> 0,
      'quota'=> 0,
      'tuquota'=> 0,
      'extensions'=> '*',
      'dimensions'=> 0,
      'filenum'=> 0,
      'directories'=> array(
        0 => array(
          'name' => '.',
          'subnav' => 1,
          'browse' => 1,
          'upload' => 1,
          'thumb' => 1,
          'delete' => 1,
          'resize' => 1,
          'mkdir' => 1,
          'rmdir' => 1,
      )),
      'thumbnails' => array(),
      'mkdirnum' => 0
    ),
    2 => array(
      'name'=> 'Global',
      'usertab'=> 1,
      'filesize'=> 0,
      'quota'=> 500,
      'tuquota'=> 500,
      'extensions'=> '*',
      'dimensions'=> 0,
      'filenum'=> 0,
      'directories'=> array(
        0 => array(
          'name' => '.',
          'subnav' => 1,
          'browse' => 1,
          'upload' => 1,
          'thumb' => 1,
          'delete' => 1,
          'resize' => 1,
          'mkdir' => 1,
          'rmdir' => 1,
      )),
      'thumbnails' => array(),
      'mkdirnum' => 0
    ),
  );
  variable_set('imce_profiles', $imce_profiles);
  watchdog('ncstatehosteddrupal_profile', 'Configured imce');

}

/**
 * Configure Variables Task
 */
function configure_variables() {



  //configure clean urls
  variable_set('clean_url', 1);

  // Configuring date formats
  variable_set('date_default_timezone', '-14400');
  variable_set('date_first_day', '0');
  variable_set('date_format_long', 'l, F j, Y - g:ia');
  variable_set('date_format_long_custom', 'l, F j, Y - H:i');
  variable_set('date_format_medium', 'D, m/d/Y - g:ia');
  variable_set('date_format_medium_custom', 'D, m/d/Y - H:i');
  variable_set('date_format_short', 'm/d/Y - g:ia');
  variable_set('date_format_short_custom', 'm/d/Y - H:i');
  watchdog('ncstatehosteddrupal_profile', 'Configured date/time formats');

  // Configures file system
  variable_set('file_directory_temp', '/tmp');
  variable_set('upload_uploadsize_default', 5);
  variable_set('upload_usersize_default', 1024);
  watchdog('ncstatehosteddrupal_profile', 'Configured file system settings');

  // Configures cache settings
  variable_set('page_compression', '0');
  variable_set('block_cache', '1');
  variable_set('cache', '1');
  watchdog('ncstatehosteddrupal_profile', 'Configured cache settings');

  // Configure user registration
  variable_set('user_email_verification', 0);
  variable_set('user_register', 0);
  variable_set('user_mail_status_activated_notify', 0);
  watchdog('ncstatehosteddrupal_profile', 'Configured users');

  // Configure path auto patterns
  variable_set('pathauto_node_pattern', '[title-raw]');
  watchdog('ncstatehosteddrupal_profile', 'Configured path auto settings');

  // Setting 404 page
  variable_set('site_404', 'notfound');
  watchdog('ncstatehosteddrupal_profile', 'Configured 404 page');

  // Create the menu block for secondary navigation
  variable_set('menu_block_ids', array(0 => 1));
  variable_set('menu_block_1_admin_title', 'Primary links (levels 2+)');
  variable_set('menu_block_1_depth', '0');
  variable_set('menu_block_1_expanded', 0);
  variable_set('menu_block_1_follow', 0);
  variable_set('menu_block_1_level', "2");
  variable_set('menu_block_1_parent', "primary-links:0");
  variable_set('menu_block_1_sort', 0);
  variable_set('menu_block_1_title_link', 0);
  watchdog('ncstatehosteddrupal_profile', 'Configured menu blocks');

  // Concigure input formats
  variable_set('allowed_html_1', '<a> <em> <strong> <cite> <code> <ul> <ol> <li> <dl> <dt> <dd> <p> <span> <img> <div> <h3> <h4> <h5> <h6> <br> <blockquote> <table> <tbody> <tr> <th> <td> <sup> <sub>');
  watchdog('ncstatehosteddrupal_profile', 'Configured input formats');

  // Configure shadowbox settings
  variable_set('shadowbox_location', 'profiles/ncstateofficial/libraries/shadowbox');
  watchdog('ncstatehosteddrupal_profile', 'Configured shadowbox library');

  // Configure view settings
  variable_set('views_hide_help_message', "1");
  watchdog('ncstatehosteddrupal_profile', 'Configured views settings');

  // Configure menu_breadcrumb settings
  variable_set('menu_breadcrumb_append_node_url', 0);
  watchdog('ncstatehosteddrupal_profile', 'Configured menu_breadcrumb settings');

  // Configure extlinks settings
  variable_set('extlink_target', '_blank');
  variable_set('extlink_subdomains', 1);
  watchdog('ncstatehosteddrupal_profile', 'Configured extlinks settings');

  // configure nc state brand bar settings
  variable_set('ncstatebrandingbar_select_version', 'red_on_white__centered');
  watchdog('ncstatehosteddrupal_profile', 'Configured nc state brand bar');

}

/**
 * Configure Users Task
 */
function configure_users() {
  $permissions = array(
    'moderator' => get_moderator_permissions(),
    'anonymous user' => get_anonymous_permissions(),
    'authenticated user' => get_authenticated_permissions(),
  );
  foreach ($permissions as $role => $perms) {
    // Add the role and get the role id.
    if ($role != 'anonymous user' && $role != 'authenticated user') {
      db_query("INSERT INTO {role} (name) VALUES ('%s')", $role);
    }
    $rid = db_result(db_query("SELECT rid FROM {role} WHERE name = '%s'", $role));

    // Remove any existing permissions
    db_query('DELETE FROM {permission} WHERE rid = %d', $rid);

    // Add new permissions
    db_query("INSERT INTO {permission} (rid, perm) VALUES (%d, '%s')", $rid, implode(', ', $perms));
  }

  $users = array(
    'njyoung.ncsu.edu' => array(
      'name' => 'njyoung.ncsu.edu',
      'pass' => '762142b0ed2513b3c4106536a0328278',
      'email' => 'njyoung@ncsu.edu'
    ),
    'jmriehle.ncsu.edu' => array(
      'name' => 'jmriehle.ncsu.edu',
      'pass' => '762142b0efdsafdsafsda4106536a0328278',
      'email' => 'jmriehle@ncsu.edu'
    ),
    'vjbuchan.ncsu.edu' => array(
      'name' => 'vjbuchan.ncsu.edu',
      'pass' => '762142b0effdsafdsa4106536a0328278',
      'email' => 'vjbuchan@ncsu.edu'
    ),
  );

  foreach ($users as $user) {
    create_new_admin_user($user['name'], $user['pass'], $user['email']);
  };

  // Creates default users
  watchdog('ncstatehosteddrupal_profile', 'running task_configure_users task');
}

function create_first_node() {

  $node = new StdClass();
  //creating a bare node

  $node->type = 'page';
  //giving it type

  $node->status = 1;
  //give it a published staus

  $node->title = "Welcome";
  //gives title

  $node->body = "This is a brand new website. An Administrator still needs to log in and update some content.";
  //gives body

  node_save($node);
  //save it and give it the rest of the attributes

   variable_set('site_frontpage', 'node/1');

  watchdog('ncstatehosteddrupal_profile', 'Added first node and set as home page');

}

function create_standard_menus() {

  // Building menus
  $menus = array(
    'footer' => array(
      'menu_name' => 'menu-footer-links',
      'title' => 'Footer Links',
      'description' => 'These links will appear in the footer region.'
    ),
    'main' => array(
      'menu_name' => 'menu-main-links',
      'title' => 'Main Menu Links',
      'description' => 'These links will appear in the left main menu region.'
    ),
  );

  foreach ($menus as $menu) {
    drupal_write_record('menu_custom', $menu);
  };

}

function create_standard_menu_links() {

  $links = array(
      'home' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => '<front>',
        'link_title' => 'Home',
        'weight' => -50,
      ),
      'emergency' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => 'http://www.ncsu.edu/emergency-information',
        'link_title' => 'NC State Emergency Info',
        'weight' => -49,
      ),
      'privacy' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => 'http://www.ncsu.edu/privacy',
        'link_title' => 'Privacy Statement',
        'weight' => -48,
      ),
      'copyright' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => 'http://www.ncsu.edu/copyright',
        'link_title' => 'Copyright',
        'weight' => -47,
      ),
      'accessibility' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => 'http://ncsu.edu/it/access/legal/webreg.php',
        'link_title' => 'Accessibility',
        'weight' => -46,
      ),
      'diversity' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => 'http://www.ncsu.edu/oied/',
        'link_title' => 'Diversity',
        'weight' => -45,
      ),
      'university_policies' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => 'http://policies.ncsu.edu/',
        'link_title' => 'University Policies',
        'weight' => -44,
      ),
      'contact' => array(
        'menu_name' => 'menu-footer-links',
        'link_path' => 'contact',
        'link_title' => 'Contact Us',
        'weight' => -43,
      ),
      'front' => array(
        'menu_name' => 'menu-main-links',
        'link_path' => '<front>',
        'link_title' => 'Home',
        'weight' => -50,
      ),
      'feedback' => array(
        'menu_name' => 'menu-main-links',
        'link_path' => 'contact',
        'link_title' => 'Contact Us',
        'weight' => -49,
      ),
  );

  foreach ($links as $link) {
    menu_link_save($link);
  }

}

function configure_blocks() {

  db_query("UPDATE {blocks} SET status = 0 where theme = '%s'", get_theme_name());

  $blocks = array(
      'footer-links' => array(
        'module' => 'menu',
        'delta' => 'menu-footer-links',
        'theme' => get_theme_name(),
        'status' => 1,
        'region' => 'footer_menu',
        'title' => '<none>',
        'weight' => '-9',
      ),
      'menu-main-links' => array(
        'module' => 'menu',
        'delta' => 'menu-main-links',
        'theme' => get_theme_name(),
        'status' => 1,
        'region' => 'left_primary_menu',
        'title' => 'Main Menu',
        'weight' => '-8',
      ),
      'search' => array(
        'module' => 'search',
        'delta' => '0',
        'theme' => get_theme_name(),
        'status' => 1,
        'region' => 'header_search',
        'title' => 'Search',
        'weight' => '-10',
      ),
      'wraplogin_block' => array(
        'module' => 'wraplogin',
        'delta' => '0',
        'theme' => get_theme_name(),
        'status' => 1,
        'region' => 'left_below_menu',
        'title' => '<none>',
        'weight' => '-6',
      ),
    );

  foreach ($blocks as $block) {
    // Inserts the block into the block menu
    drupal_write_record('blocks', $block);

  }
  watchdog('ncstatehosteddrupal_profile', 'Configured blocks');

}