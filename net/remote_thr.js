'use strict';

var net         = require('net');
var assert      = require('assert');

if (process.argv.length != 5) {
  require('util').log('usage: node remote_thr.js <bind-to> <msg-size> <msg-count>');
  process.exit(1);
}
var connect_to  = process.argv[2].split('//')[1].split(':');
var sz          = Number(process.argv[3]);
var count       = Number(process.argv[4])*1.1;
var buf         = new Buffer(sz), i = 0;
buf.fill('o');
assert(buf.length === sz);

var s = new net.Socket();
setTimeout(function(){
  s.connect(connect_to[1], function() {
    s.write(buf);
  });
}, 1000)

s.on('data', function (data) {
  assert(data.length === sz);
  if(++i < count)
    return s.write(buf);
  return s.unref();
});
