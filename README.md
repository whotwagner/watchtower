Watchtower (1.4.9)
===================
Chris Lane  
chris@chris-allen-lane.com  
http://chris-allen-lane.com  
http://twitter.com/#!/chrisallenlane


What it Does
------------
`Watchtower` is a [Static Code Analysis][1] tool designed to assist 
security auditors who are tasked with performing manual code 
reviews. It offers a robust alternative to `grep` for finding 
matches on literal and regex-based strings within a project. It can 
thus be used to locate (for example) dangerous functions calls that 
are made within an application.

`Watchtower` works best when it is targeted against a project on the 
local filesystem, but can also be directed to scan a website at a 
remote URL.


View an Example Report
--------------------
Is this Readme TL;DR? Download [/examples/report.html][2],
and open it in a web-browser. It is an example report that was
generated by `Watchtower`.

Specifically, it's an HTML-formatted report that was run against the [Damn
Vulnerable Web Application][3]. If you spend a few minutes playing with this
report, and you should quickly gain a feel for how `Watchtower` works. (Note
that the report is somewhat large, so I recommend opening it in a fast browser
like Google Chrome.)


Usage
-----
There are essentially two use-cases for `Watchtower`:

### Importing Scan Data into Your Own Application ###
`Watchtower` can be configured (via command-line options) to output as
CSV, XML, or plain text:

```bash
# to output a CSV:
./watchtower -s /app/path/to/scan -o csv > /path/to/report/file.csv

# to output XML:
./watchtower -s /app/path/to/scan -o xml > /path/to/report/file.xml

# to output plain text:
./watchtower -s /app/path/to/scan -o txt
```

The CSV format is useful for importing scan data into a spreadsheet. The
XML format is useful for importing scan data into a custom application. TXT
is less likely to be useful, but it's there if you need it. (Know that you
can colorize plain-text output with the `--colorize` flag if you're
outputting directly to the terminal.)

### Outputting a Sortable HTML Report for Direct Review ###
In my opinion, `Watchtower`'s greatest feature is its ability to 
output an HTML report. Such a report can be a tremendous time-saver 
when scanning for signatures in large numbers of files.

This report is especially useful when auditing while running dual monitors,
such that you can have the report open on one monitor, and your preferred IDE
open on the other.

To generate the HTML report, run:
	
```bash
./watchtower -s /app/path/to/scan -p 'The Project Name' -o html > /path/to/report/file.html
```

### Scanning a Remote Website ###
`Watchtower` can be instructed to scan a remote web site rather than the
local filesystem. To do so, simply pass the `-s` (`--scan`) parameter
a URL rather than a filesystem path:

```bash
./watchtower -s http://www.example.com -p 'example.com' -o html > /path/to/report/file.html
```

When scanning a remote website, `Watchtower` will first mirror the 
website locally using `wget`, and then will perform a standard scan 
on the downloaded page source. However:

- Be prepared to be patient, because it can take a long time to mirror
  a large website
- `Watchtower` will not be able to see as "deeply" into an 
  application scanned remotely, because it will not have access to 
  the application's underlying source (PHP, ASP, etc.)

Thus, scanning locally is strongly preferred to scanning remotely, if
possible.  


Configuration
-------------
`Watchtower` has an extensive configuration file. (A large number of
configuration options have to do with formatting and content for HTML
reporting.) Please read the comments in the config file itself
(`.config.rb`) for more information.

Also, note that it's possible to specify which config file to use when
executing `Watchtower` via the `--config-file` option. This is useful
when you're working on several projects at once: rather than having
to repeatedly change values within the config file, you may simply create
alternate config files (`config-project-one.rb`, etc), and then specify
which to use upon execution.


Signature Specification
-----------------------
Signatures live in `<watchtower root>/signatures/` (by default), and are
organized by file-type, and then by group:

```ruby
$signatures[:filetype][:group]
```

As in:

```ruby
$signatures[:php][:dangerous_functions] = [
	Signature.new({:literal => 'base64_decode('}),
	Signature.new({:literal => 'eval('}),
	Signature.new({:literal => 'exec('}),
]
```

Signature groupings will be respected when laying out an HTML report,
so creating thoughtful groupings can make reports more navigable.

### Creating New Signatures ###
If you're interested in creating a signature for a new file-type, do the
following:

1. Open the `config.rb` file in your preferred editor, and scroll to the
bottom of the file.
2. Locate the `$configs[:ftype_ext]` hash. This hash maps 
programming languages (like 'php') to the real-world file extensions 
(like 'php', 'php5', 'phtml', etc) that are associated with that 
programming language. See if a hash exists for your preferred 
language, and create one if not.
3. Create a new signatures file for that file-type. (I'd recommend that
you simply copy, paste, and modify an existing signatures file.)
4. Slightly higher up in `config.rb`, list your signatures file in
`$configs[:signatures]`.

### Signature Types ###
Signatures can be specified in two ways:

1. As a literal string
2. As a regular expression

To create a signature that matches a literal string, use the following
structure:

```ruby
$signatures[:php][:dangerous_functions] = [
	Signature.new({:literal => 'base64_decode('}),
	Signature.new({:literal => 'eval('}),
	Signature.new({:literal => 'exec('}),
]
```

To create a signature that matches a regular expression, do the following:

```ruby
$signatures[:php][:hashes] = [
	Signature.new({:name => 'MD5',  :regex => '[0-9a-f]{32}'}),
	Signature.new({:name => 'SHA1', :regex => '[0-9a-f]{40}'}),
]
```

Frequently Asked Questions
--------------------------
**Isn't the HTML report format kind of unusable? What's the point of
marking items "good" or "bad" or whatever when all of that work is going
to be lost when I close my browser?**  

Your work _won't_ be lost! `Watchtower` uses some clever HTML 5 to 
save your work automatically as you make changes to the report.

**When I generate the same report multiple times, the order in which 
each signature appears often changes. Why?**  

This is happening because you're running Ruby 1.8. In Ruby 1.8, 
hashes were definitionally un-ordered, and thus the ordering of the 
signatures file is not guaranteed to be respected.

I currently don't plan to fix this, because this issue does not 
exist in Ruby 1.9.

**When I scan a remote website, there seems to be a lot of 
duplicated content in the report.**  

This can happen on websites where each page is accessible at more 
than one URL. (This is common on blogs, for example, where each 
page may be accessible individually, on a category page, in an 
archive, etc.)

Currently there is no good workaround to this problem (other than to 
scan locally, if possible), but I plan to take a crack at fixing 
this in the future.


Contributing
------------
I'm very interested in compiling signatures for popular 3rd-party 
frameworks. (For an example, look at `/signatures/wordpress.rb`, 
which is WordPress-specific.) If you have expertise in a popular 
framework (Joomla, Drupal, etc), and would like to contribute some 
signature files, please let me know. 

Likewise, if you have expertise in a language (web or otherwise) 
that is not represented among the signatures, I invite you to share 
your expertise.

If you are looking to support this project financially, I encourage 
you to consider giving a few dollars to the EFF instead. Or, better 
yet, [become a member][4]!

<a href='https://www.eff.org/join'>
![Join EFF!](https://www.eff.org/sites/default/files/EFF-Banner.jpg 'Join EFF!')
</a>


Contact Me
----------
Questions, concerns, bug reports, and feature requests may be directed to
chris@chris-allen-lane.com. If you're able to express your thoughts in
140 characters or fewer ("It's great!", "It sucks!") you can also contact
me on [twitter][5].


License
-------
This product is licensed under the [GPL 3][6], and comes with absolutely
no warranty, expressed or implied. See the LICENSE file for more information.


[1]: http://en.wikipedia.org/wiki/Static_program_analysis
[2]: https://raw.github.com/chrisallenlane/watchtower/master/examples/report.html
[3]: http://www.dvwa.co.uk/
[4]: https://www.eff.org/join
[5]: http://twitter.com/#!/chrisallenlane
[6]: http://www.gnu.org/copyleft/gpl.html
