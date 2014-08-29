<?php
/**
 * My own URL Helpers
 *
 * @package		application.helper
 * @subpackage	Helpers
 * @category	Helpers
 * @author		nguyen
 * @link		http://designveloper.com/
 */

// ------------------------------------------------------------------------

/**
 * Asset URL
 *
 * Create asset URL based on basepath to be passed into style & asset in HTML. Segments can be passed via the
 * first parameter either as a string or an array.
 *
 * @access	public
 * @param	string
 * @return	string
 */
if ( ! function_exists('asset_url'))
{
	function asset_url($uri = '')
	{
		$CI =& get_instance();
		return $CI->config->base_url() . 'static/';
	}
}
?>