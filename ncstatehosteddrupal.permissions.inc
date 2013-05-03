<?php

/**
 * Permissions for Site Moderator users
 */
function get_moderator_permissions() {
  return array(
    'access administration menu',
    'administer menu',
    'administer blocks',
    'access content',
    'administer nodes',
    'revert revisions',
    'view revisions',
    'create url aliases',
    'access administration pages',
    'access content',
    'access site-wide contact form',
    'Configure all blocks',
  	'Configure all role settings',
    'Configure all page settings',
    'Configure all specific settings',
  	'Configure all user settings',
    'Create blocks',
    'Disable all blocks',
    'Enable all blocks',
    'Move all blocks',
    'View all blocks',
    'administer site-wide contact form',
    'create images',
    'delete any images',
    'delete own images',
    'edit any images',
    'edit own images',
    'view original images',
    'attach images',
    'upload files',
    'view uploaded files',
    'edit meta tags',
    'skip CAPTCHA',
    'assign moderator role',
    'administer taxonomy',
  	'administer views',
  	'access all webform results',
  	'administer users',
  	'configure ncstate_official theme',
    'administer themes',
  );
}

/**
 * Permissions for Anonymous Users
 */
function get_anonymous_permissions() {
  return array(
    'access content',
    'search content',
    'view uploaded files',
  	'access all views',
  	'access site-wide contact form',
  	'view field_photo_gallery_images',
  );
}

/**
 * Permissions for Authenticated Users
 */
function get_authenticated_permissions() {
  return array(
    'access content',
    'search content',
    'view uploaded files',
  	'access all views',
  	'access site-wide contact form',
  	'view field_photo_gallery_images',
  );
}

