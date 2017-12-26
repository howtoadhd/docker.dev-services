<?php
$cfg['Servers'][1]['auth_type']       = 'config';
$cfg['Servers'][1]['host']            = 'localhost';
$cfg['Servers'][1]['user']            = getenv( 'MYSQL_USER' );
$cfg['Servers'][1]['password']        = getenv( 'MYSQL_PASSWORD' );
$cfg['Servers'][1]['connect_type']    = 'tcp';
$cfg['Servers'][1]['compress']        = false;
$cfg['Servers'][1]['AllowNoPassword'] = false;

$cfg['ShowAll'] = true;
$cfg['MaxRows'] = 50;
