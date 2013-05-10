api = 2
core = 7.x
projects[drupal][version] = 7.22

; ************************
; CORE
; ************************

core = 7.x
api = 2
projects[drupal][version] = 7.22

; ************************
; CONTRIB MODULES
; ************************

projects[advanced_help][subdir] = contrib
projects[advanced_help][version] = 1.0

projects[auto_nodetitle][subdir] = contrib
projects[auto_nodetitle][version] = 1.0

projects[block_access][subdir] = contrib
projects[block_access][version] = 1.0

projects[calendar][subdir] = contrib
projects[calendar][version] = 3.4

projects[cck][subdir] = contrib
projects[cck][version] = 2.x-dev

projects[content_access][subdir] = contrib
projects[content_access][version] = 1.2-beta2

projects[css_injector][subdir] = contrib
projects[css_injector][version] = 1.8

projects[ctools][subdir] = contrib
projects[ctools][version] = 1.3

projects[date][subdir] = contrib
projects[date][version] = 2.6

projects[demo][subdir] = contrib
projects[demo][version] = 1.0

projects[disable_messages][subdir] = contrib
projects[disable_messages][version] = 1.1

projects[email][subdir] = contrib
projects[email][version] = 1.2

projects[entity][subdir] = contrib
projects[entity][version] = 1.1

projects[features][subdir] = contrib
projects[features][version] = 2.0-beta2

projects[feeds][subdir] = contrib
projects[feeds][version] = 2.0-alpha8

projects[field_group][subdir] = contrib
projects[field_group][version] = 1.1

projects[fivestar][subdir] = contrib
projects[fivestar][version] = 2.0-alpha2

projects[gcal_events][subdir] = contrib
projects[gcal_events][version] = 1.x-dev

projects[globalredirect][subdir] = contrib
projects[globalredirect][version] = 1.5

projects[google_analytics][subdir] = contrib
projects[google_analytics][version] = 1.3

projects[imagecache_profiles][subdir] = contrib
projects[imagecache_profiles][version] = 1.0

projects[imce_mkdir][subdir] = contrib
projects[imce_mkdir][version] = 1.0

projects[imce_wysiwyg][subdir] = contrib
projects[imce_wysiwyg][version] = 1.0

projects[imce][subdir] = contrib
projects[imce][version] = 1.7

projects[jquery_update][subdir] = contrib
projects[jquery_update][version] = 2.3

projects[js_injector][subdir] = contrib
projects[js_injector][version] = 2.0

projects[libraries][subdir] = contrib
projects[libraries][version] = 2.1

projects[link][subdir] = contrib
projects[link][version] = 1.1

projects[linkit][subdir] = contrib
projects[linkit][version] = 2.6

projects[linkit_picker][subdir] = contrib
projects[linkit_picker][version] = 1.0

projects[masquerade][subdir] = contrib
projects[masquerade][version] = 1.0-rc5

projects[menu_block][subdir] = contrib
projects[menu_block][version] = 2.3

projects[menu_breadcrumb][subdir] = contrib
projects[menu_breadcrumb][version] = 1.3

projects[metatag][subdir] = contrib
projects[metatag][version] = 1.0-beta7

projects[nodeaccess][subdir] = contrib
projects[nodeaccess][version] = 1.x-dev

projects[nodereference_url][subdir] = contrib
projects[nodereference_url][version] = 1.12

projects[pathauto][subdir] = contrib
projects[pathauto][version] = 1.2

projects[phone][subdir] = contrib
projects[phone][version] = 1.x-dev

projects[readonlymode][subdir] = contrib
projects[readonlymode][version] = 1.1

projects[recaptcha][subdir] = contrib
projects[recaptcha][version] = 1.9

projects[references][subdir] = contrib
projects[references][version] = 2.1

projects[role_delegation][subdir] = contrib
projects[role_delegation][version] = 1.1

projects[scheduler][subdir] = contrib
projects[scheduler][version] = 1.1

projects[shadowbox][subdir] = contrib
projects[shadowbox][version] = 3.0-rc2

projects[strongarm][subdir] = contrib
projects[strongarm][version] = 2.0

projects[system_perm][subdir] = contrib
projects[system_perm][version] = 1.0

projects[token][subdir] = contrib
projects[token][version] = 1.5

projects[views_accordion][subdir] = contrib
projects[views_accordion][version] = 1.0-rc2

projects[views_php][subdir] = contrib
projects[views_php][version] = 1.x-dev

projects[views_data_export][subdir] = contrib
projects[views_data_export][version] = 3.0-beta6

projects[views_datasource][subdir] = contrib
projects[views_datasource][version] = 1.x-dev

projects[views_slideshow][subdir] = contrib
projects[views_slideshow][version] = 3.0

projects[views][subdir] = contrib
projects[views][version] = 3.7

projects[votingapi][subdir] = contrib
projects[votingapi][version] = 2.11

projects[webform_validation][subdir] = contrib
projects[webform_validation][version] = 1.2

projects[webform][subdir] = contrib
projects[webform][version] = 3.18

projects[wysiwyg][subdir] = contrib
projects[wysiwyg][version] = 2.2


; ************************
; LIBRARIES
; ************************

libraries[tinymce][download][type] = "get"
libraries[tinymce][download][url] = "http://drupal.ncsu.edu/resources/libraries/tinymce/tinymce_3.4.7.zip"
libraries[tinymce][directory_name] = "tinymce"

libraries[simplepie][download][type] = "file"
libraries[simplepie][download][url] = "http://drupal.ncsu.edu/resources/libraries/simplepie/simplepie-1.3.1.zip"

; ************************
; NC STATE MODULES & THEMES
; ************************

projects[ncstate_official][subdir] = ncstate
projects[ncstate_official][type] = theme
projects[ncstate_official][download][type] = git
projects[ncstate_official][download][branch] = master
projects[ncstate_official][download][url] = "git://github.com/ncsuwebdev/Drupal7-Theme-NC-State-Official.git"

projects[wraplogin][subdir] = ncstate
projects[wraplogin][version] = 1.2
projects[wraplogin][location] = http://drupal.ncsu.edu/features/fserver

projects[ncstatebrandingbar][subdir] = ncstate
projects[ncstatebrandingbar][version] = 1.5
projects[ncstatebrandingbar][location] = http://drupal.ncsu.edu/features/fserver

projects[ncsuphplibrary][subdir] = ncstate
projects[ncsuphplibrary][version] = 1.0-2
projects[ncsuphplibrary][location] = http://drupal.ncsu.edu/features/fserver

projects[ncsuroles][subdir] = ncstate
projects[ncsuroles][version] = 1.2
projects[ncsuroles][location] = http://drupal.ncsu.edu/features/fserver

; ************************
; NC STATE FEATURES
; ************************



