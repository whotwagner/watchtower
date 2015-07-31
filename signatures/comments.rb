# 7.31.2015 - Added "comments" signatures, to run on all file types.  Added swear words to custom signature strings
# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:comments] ||= {}

$signatures[:coments][:developer_notes] = [
	Signature.new({:literal => 'todo'}),
	Signature.new({:literal => 'bug'}),
	Signature.new({:literal => 'fixme'}),
	Signature.new({:literal => 'kludge'}),
	Signature.new({:literal => 'note'}),
	Signature.new({:literal => 'hack'}),
	Signature.new({:literal => 'secur'}),
]

$signatures[:php][:profanity] = [
	Signature.new({:name => 'f***', :regex => '[Ff]uck'}),
	Signature.new({:name => 'sh**', :regex => '[Ss]hit'}),
	Signature.new({:name => 'd*mn', :regex => '[Dd]amn'}),
]

