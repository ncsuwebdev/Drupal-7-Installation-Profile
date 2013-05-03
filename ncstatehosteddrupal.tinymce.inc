<?php

/**
 * Generates the configuration for tinymce
 */
function get_tinymce_conf() {
  return array(
    'default' => 1,
    'user_choose' => 0,
    'show_toggle' => 0,
    'theme' => 'advanced',
    'language' => 'en',
    'buttons' => array(
      'default' => array(
        'bold' => 1,
        'italic' => 1,
        'underline' => 1,
        'strikethrough' => 1,
        'justifyleft' => 1,
        'justifycenter' => 1,
        'justifyright' => 1,
        'bullist' => 1,
        'numlist' => 1,
        'outdent' => 1,
        'indent' => 1,
        'undo' => 1,
        'redo' => 1,
        'link' => 1,
        'unlink' => 1,
        'anchor' => 1,
        'image' => 1,
      'forecolor' => 1,
      'backcolor' => 1,
        'sup' => 1,
        'sub' => 1,
        'blockquote' => 1,
        'code' => 1,
      'hr' => 1,
    'removeformat' => 1,
      ),
      'advlink' => array('advlink' => 1),
      'font' => array('formatselect' => 1, 'styleselect' => 1),
      'paste' => array('pastetext' => 1),
      'searchreplace' => array('search' => 1, 'replace' => 1),
      'style' => array('style' => 1),
      'table' => array('tablecontrols' => 1),
      'advlist' => array('advlist' => 1),
      'wordcount' => array('wordcount' => 1),
      'imce' => array('imce' => 1),
      'drupal' => array('nodepicker' => 1),
    ),
    'toolbar_loc' => 'top',
    'toolbar_align' => 'left',
    'path_loc' => 'bottom',
    'resizing' => 1,
    'verify_html' => 1,
    'preformatted' => 1,
    'convert_fonts_to_spans' => 1,
    'remove_linebreaks' => 1,
    'apply_source_formatting' => 1,
    'paste_auto_cleanup_on_paste' => 1,
    'block_formats' => 'p,address,pre,h3,h4,h5,h6,div,blockquote,div',
    'css_setting' => 'none',
    'css_classes' => 'Float Left=floatLeft
Float Right=floatRight
Left No Border=thumbleft
Right No Border=thumbright'
  );
}
