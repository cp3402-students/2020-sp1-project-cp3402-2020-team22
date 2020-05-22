USE wordpress;

UPDATE wp_options SET option_value='http://__IP_ADDR__' WHERE option_name IN ('siteurl', 'home');
UPDATE wp_options SET option_value='__SITE_NAME__' WHERE option_name='blogname';
UPDATE wp_options SET option_value='__SITE_DESCRIPTION__' WHERE option_name='blogdescription';

