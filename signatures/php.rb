# 6.9.2015 - Updated w/signatures from Bishop Fox PowerGrep templates.
# 7.31.2015 - Added swear words to custom signature strings
# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:php] ||= {}

$signatures[:php][:dangerous_functions] = [
	Signature.new({:literal => 'assert('}),
	Signature.new({:literal => 'create_function('}),
	Signature.new({:literal => 'curl_exec('}),
	Signature.new({:literal => 'curl_init('}),
	Signature.new({:literal => 'eval('}),
	Signature.new({:literal => 'exec('}),
	Signature.new({:literal => 'fclose('}),
	Signature.new({:literal => 'file('}),
	Signature.new({:literal => 'file_get_contents('}),
	Signature.new({:literal => 'fopen('}),
	Signature.new({:literal => 'fread('}),
	Signature.new({:literal => 'fread('}),
	Signature.new({:literal => 'fsockopen('}),
	Signature.new({:literal => 'fpassthru'}),
	Signature.new({:literal => 'gzopen'}),
	Signature.new({:literal => 'gzfile'}),
	Signature.new({:literal => 'gzpassthru'}),
	Signature.new({:literal => 'readgzfile'}),
	Signature.new({:literal => 'copy'}),
	Signature.new({:literal => 'rename'}),
	Signature.new({:literal => 'rmdir'}),
	Signature.new({:literal => 'mkdir'}),
	Signature.new({:literal => 'unlink'}),
	Signature.new({:literal => 'file_put_contents'}),
	Signature.new({:literal => 'parse_ini_file'}),	
	Signature.new({:literal => 'goto'}),
    # omit the parenthesis, because these are also keywords
	Signature.new({:literal => 'include'}),
	Signature.new({:literal => 'virtual'}),
	Signature.new({:literal => 'include_once'}),
	Signature.new({:literal => 'mail('}),
	Signature.new({:literal => 'ob_get_contents('}),
	Signature.new({:literal => 'passthru('}),
	Signature.new({:literal => 'pfsockopen('}),
	Signature.new({:literal => 'popen('}),
	Signature.new({:literal => 'proc_open('}),
	Signature.new({:literal => 'readfile('}),
	Signature.new({:literal => 'readfile('}),
	# omit the parenthesis, because these are also keywords
    Signature.new({:literal => 'require'}),
	Signature.new({:literal => 'require_once'}),
	Signature.new({:literal => 'shell_exec('}),
	Signature.new({:literal => 'system('}),
	Signature.new({:literal => 'unserialize('}),
	Signature.new({:literal => '`'}),
	Signature.new({:literal => 'call_user_func'}),
	Signature.new({:literal => 'call_user_func_array'}),
	Signature.new({:literal => 'call_user_method'}),
	Signature.new({:literal => 'call_user_method_array'}),
]

$signatures[:php][:sockets] = [
	Signature.new({:literal => 'socket_create'}),
	Signature.new({:literal => 'socket_connect'}),
	Signature.new({:literal => 'socket_write'}),
	Signature.new({:literal => 'socket_send'}),
	Signature.new({:literal => 'socket_recv'}),
	Signature.new({:literal => 'fsockopen'}),
]

$signatures[:php][:payload_obfuscators] = [
	Signature.new({:literal => 'base64_decode('}),
	Signature.new({:literal => 'base64_encode('}),
	Signature.new({:literal => 'bzcompress('}),
	Signature.new({:literal => 'bzdecompress('}),
	Signature.new({:literal => 'gzdeflate('}),
	Signature.new({:literal => 'gzdinflate('}),
	Signature.new({:literal => 'gzdencode('}),
	Signature.new({:literal => 'gzuncompress('}),
	Signature.new({:literal => 'zlib_encode('}),
	Signature.new({:literal => 'zlib_decode('}),
	Signature.new({:literal => '\$\$'}),
    # note: This is a somewhat liberal/invalid regex for parsing 
    # base64, but I'd rather catch as much as possible rather than 
    # miss an interesting string simply because it's not valid 
    # base64.
	Signature.new({:name    => 'Base64', :regex => '(?:[A-Za-z0-9+/]{4})*[=]{1-2}'}),
]

$signatures[:php][:form_data] = [
	Signature.new({:literal => '$_GET'}),
	Signature.new({:literal => '$_POST'}),
	Signature.new({:literal => '$_REQUEST'}),
]

$signatures[:php][:globals] = [
	Signature.new({:literal => '$_SESSION'}),
	Signature.new({:literal => '$_SERVER'}),
	Signature.new({:literal => '$_COOKIE'}),
	Signature.new({:literal => '$_FILES'}),
	Signature.new({:literal => '$GLOBALS'}),
	Signature.new({:literal => '$HTTP_GET_VARS'}),
	Signature.new({:literal => '$HTTP_POST_VARS'}),
	Signature.new({:literal => '$HTTP_COOKIE_VARS'}),
	Signature.new({:literal => '$HTTP_POST_FILES'}),
	Signature.new({:literal => '$_SERVER[\'REQUEST_METHOD\']'}),
	Signature.new({:literal => '$_SERVER[\'QUERY_STRING\']'}),
	Signature.new({:literal => '$_SERVER[\'REQUEST_URI\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_ACCEPT\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_ACCEPT_CHARSET\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_ACCEPT_ENCODING\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_ACCEPT_LANGUAGE\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_CONNECTION\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_HOST\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_REFERER\']'}),
	Signature.new({:literal => '$_SERVER[\'HTTP_USER_AGENT\']'}),
	Signature.new({:literal => '$_SERVER[\'PHP_SELF\']'}),

]

$signatures[:php][:redirects] = [
	Signature.new({:literal => 'http_redirect'}),
	Signature.new({:literal => 'header'}),
	Signature.new({:literal => 'HttpMessage::setResponseCode">HttpMessage::setResponseCode'}),
	Signature.new({:literal => 'HttpMessage::setHeaders">HttpMessage::setHeaders'}),

]

$signatures[:php][:sql] = [
	Signature.new({:literal => 'SELECT'}),
	Signature.new({:literal => 'INSERT'}),
	Signature.new({:literal => 'UPDATE'}),
	Signature.new({:literal => 'DELETE'}),
	Signature.new({:literal => 'REPLACE'}),
	Signature.new({:literal => 'DROP'}),
	Signature.new({:literal => 'TRUNCATE'}),
	Signature.new({:literal => 'mysql_query'}),
	Signature.new({:literal => 'mssql_query'}),
	Signature.new({:literal => 'pg_query'}),
	Signature.new({:literal => 'pg_exec'}),
	Signature.new({:literal => 'mysqli->prepare'}),
	Signature.new({:literal => 'stmt->prepare'}),
	Signature.new({:literal => 'stmt->bind_param'}),
	Signature.new({:literal => 'stmt->execute'}),
	Signature.new({:literal => 'odbc_prepare'}),

    # todo: include some signatures here to spot dynamic SQL
]

$signatures[:php][:developer_notes] = [
	Signature.new({:literal => '@todo'}),
	Signature.new({:literal => '@bug'}),
	Signature.new({:literal => '@fixme'}),
	Signature.new({:literal => '@kludge'}),
	Signature.new({:literal => '@note'}),
	Signature.new({:literal => '@hack'}),
]

$signatures[:php][:custom_strings] = [
	Signature.new({:literal => 'username'}),
	Signature.new({:literal => 'password'}),
	Signature.new({:literal => 'host'}),
	Signature.new({:literal => 'database'}),
	Signature.new({:literal => 'phpinfo'}),
	Signature.new({:name => 'Profanity', :regex => '[Ff]uck|[Ss]hit'}),

]

$signatures[:php][:hashes] = [
	Signature.new({:name => 'MD5',  :regex => '[0-9a-f]{32}'}),
	Signature.new({:name => 'SHA1', :regex => '[0-9a-f]{40}'}),
]

$signatures[:php][:crypto] = [
	# crypto related stuff
	Signature.new({:literal => 'mcrypt_'}),
	Signature.new({:literal => 'openssl_'}),
	Signature.new({:literal => 'hash_'}),
	Signature.new({:literal => 'gnupg_'}),
	Signature.new({:literal => 'blenc_'}),
]
