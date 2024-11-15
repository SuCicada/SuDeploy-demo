<?php


// Dashboard columns. 2 or 3
$config['supervisor_cols'] = 2;

// Refresh Dashboard every x seconds. 0 to disable
$config['refresh'] = 10;

// Enable or disable Alarm Sound
$config['enable_alarm'] = false;

// Show hostname after server name
$config['show_host'] = true;

$config['supervisor_servers'] = array(
	'asus' => array(
		'url' => 'http://xxxxxx',
		'port' => 'xx',
		'username' => 'xx',
		'password' => 'xxx'
	),
    'master' => array(
        'url' => 'http://xxx/RPC2',
        'port' => 'x',
        'username' => 'xxx',
        'password' => 'xxx'
    ),
//	'server02' => array(
//		'url' => 'http://server02.app/RPC2',
//                'port' => '9001'
//	),
//	'server03' => array(
//                'url' => 'http://server03.app/RPC2',
//                'port' => '9001'
//        ),
);

// Set timeout connecting to remote supervisord RPC2 interface
$config['timeout'] = 3;

// Path to Redmine new issue url
$config['redmine_url'] = 'http://redmine.url/path_to_new_issue_url';

// Default Redmine assigne ID
$config['redmine_assigne_id'] = '69';


