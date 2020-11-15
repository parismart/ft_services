<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'toor' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

define('FS_METHOD', 'direct');

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '4x1aS+enQj57?cz2O>:(TY!;FTGm=<75URef1<iK,S;(*0H>Ydt0|Hh{e*4`jvvm');
define('SECURE_AUTH_KEY',  '?7q%b[-JahYnf*`l`JLrN)?B,:3K+5f4*;t*B_sH50MAqC]OPy[YFj4+_aJa[_n~');
define('LOGGED_IN_KEY',    '(s--qrxZ[`Q|WRN=8c)23]/RC8dpQmQ=6&dcPxIg`rw5Fp89%>Fy?[Y,{3{mBRBB');
define('NONCE_KEY',        'v[A5o9|EWyzX3gwZwoi*>wt4XAjy/P<2I%ICntBHh+rBef#,IUz)Ykn,GM22cgp_');
define('AUTH_SALT',        '`|g+|zuMt8Gh;b}W+{#mWR1RU{)]-EH+^}h0D)6Gb0:m-b9FLEW&qU~_W8$/R<72');
define('SECURE_AUTH_SALT', '26iU,W`1:=t|*}WN>%|y54+^4/re4CsOq%Ft9#|7[T^&Lf61/[36ZY~ 5&XW3]KB');
define('LOGGED_IN_SALT',   'R{TM-tni=* N_is+X #e2NLR!>Obj6WTR% c~.b1sC/Uo/K/}%O$mMO5BL%.}j-h');
define('NONCE_SALT',       'p-,c%|pS%=po;Zm|S}gP>RS|N!)Y=!C+:-Y)}&=i>`GF0P{o$icY+kh ZvdxEh%-');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', __DIR__ . '/var/www/wordpress' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
