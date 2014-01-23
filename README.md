versione
========

[![Build Status](https://secure.travis-ci.org/robotlolita/versione.png?branch=master)](https://travis-ci.org/robotlolita/versione)
[![NPM version](https://badge.fury.io/js/versione.png)](http://badge.fury.io/js/versione)
[![Dependencies Status](https://david-dm.org/robotlolita/versione.png)](https://david-dm.org/robotlolita/versione)
[![experimental](http://hughsk.github.io/stability-badges/dist/experimental.svg)](http://github.com/hughsk/stability-badges)


Creates new versions of objects with new properties.


## Example

```js
var version = require('versione')

var a = { a: 1 }
var b = versione(a, { a: 2, b: 1 })
var c = versione(b, { a: 3, c: 1 })

a.a // => 1
b.a // => 2
b.b // => 1
c.a // => 3
c.b // => 1
c.c // => 1
```


## Installing

The easiest way is to grab it from NPM. If you're running in a Browser
environment, you can use [Browserify][]

    $ npm install versione


### Using with CommonJS

If you're not using NPM, [Download the latest release][release], and require
the `versione.umd.js` file:

```js
var versione = require('versione')
```


### Using with AMD

[Download the latest release][release], and require the `versione.umd.js`
file:

```js
require(['versione'], function(versione) {
  ( ... )
})
```


### Using without modules

[Download the latest release][release], and load the `versione.umd.js`
file. The properties are exposed in the global `versione` object:

```html
<script src="/path/to/versione.umd.js"></script>
```


### Compiling from source

If you want to compile this library from the source, you'll need [Git][],
[Make][], [Node.js][], and run the following commands:

    $ git clone git://github.com/robotlolita/versione.git
    $ cd versione
    $ npm install
    $ make bundle
    
This will generate the `dist/versione.umd.js` file, which you can load in
any JavaScript environment.

    
## Documentation

You can [read the documentation online][docs] or build it yourself:

    $ git clone git://github.com/robotlolita/versione.git
    $ cd versione
    $ npm install
    $ make documentation

Then open the file `docs/literate/index.html` in your browser.


## Platform support

This library assumes an ES5 environment, but can be easily supported in ES3
platforms by the use of shims. Just include [es5-shim][] :)


## Licence

Copyright (c) 2013 Quildreen Motta.

Released under the [MIT licence](https://github.com/robotlolita/versione/blob/master/LICENCE).

<!-- links -->
[Fantasy Land]: https://github.com/fantasyland/fantasy-land
[Browserify]: http://browserify.org/
[Git]: http://git-scm.com/
[Make]: http://www.gnu.org/software/make/
[Node.js]: http://nodejs.org/
[es5-shim]: https://github.com/kriskowal/es5-shim
[docs]: http://robotlolita.github.io/versione
<!-- [release: https://github.com/robotlolita/versione/releases/download/v$VERSION/versione-$VERSION.tar.gz] -->
[release]: https://github.com/robotlolita/versione/releases/download/v0.1.0/versione-0.1.0.tar.gz
<!-- [/release] -->
