INSTALLING
==========
"Installing" this program is simple: just copy the `watchtower` directory
onto the desired location on your system, `cd` into it, and run
`./watchtower`. Ie:

```bash
cd ~/watchtower/
bundle install
./watchtower --help
```

That should get you started.

DEPENDENCES
-----------
`Watchtower` has the following dependencies:

* ruby (1.8 or later)
* rubygems

It also depends on the following Rubygems:
* fastercsv
* optimist
* iconv

DOCKER
======

It is also possible to use watchtower with docker:

Build:
------

```
docker build -t watchtower .
```

Usage:
------

```
docker run -v $PWD/source_code:/app/data -it watchtower -o html -s /app/data/
```
