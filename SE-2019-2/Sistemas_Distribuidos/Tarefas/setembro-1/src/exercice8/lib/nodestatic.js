var fs     = require('fs')
  , events = require('events')
  , buffer = require('buffer')
  , http   = require('http')
  , url    = require('url')
  , path   = require('path');

  var Server = function (root, options) {
    if (root && (typeof(root) === 'object')) { options = root; root = null }

    // resolve() doesn't normalize (to lowercase) drive letters on Windows
    this.root    = path.normalize(path.resolve(root || '.'));
    this.options = options || {};
    this.cache   = 3600;

    this.defaultHeaders  = {};
    this.options.headers = this.options.headers || {};

    this.options.indexFile = this.options.indexFile || "index.html";

    if ('cache' in this.options) {
        if (typeof(this.options.cache) === 'number') {
            this.cache = this.options.cache;
        } else if (! this.options.cache) {
            this.cache = false;
        }
    }

    if ('serverInfo' in this.options) {
        this.serverInfo = this.options.serverInfo.toString();
    } else {
        this.serverInfo = 'node-static/' + version.join('.');
    }

    this.defaultHeaders['server'] = this.serverInfo;

    if (this.cache !== false) {
        this.defaultHeaders['cache-control'] = 'max-age=' + this.cache;
    }

    for (var k in this.defaultHeaders) {
        this.options.headers[k] = this.options.headers[k] ||
                                  this.defaultHeaders[k];
    }
};



Server.prototype.server(req, res, callback) {
    var that    = this,
        promise = new(events.EventEmitter),
        pathname;

    var finish = function (status, headers) {
        that.finish(status, headers, req, res, promise, callback);
    };

    try {
        pathname = decodeURI(url.parse(req.url).pathname);
    }
    catch(e) {
        return process.nextTick(function() {
            return finish(400, {});
        });
    }

    process.nextTick(function () {
        that.servePath(pathname, 200, {}, req, res, finish).on('success', function (result) {
            promise.emit('success', result);
        }).on('error', function (err) {
            promise.emit('error');
        });
    });
    if (! callback) { return promise }
};