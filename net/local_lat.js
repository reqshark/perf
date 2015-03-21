'use strict';

var net     = require('net')
var assert  = require('assert');

if (process.argv.length != 5) {
  console.log('usage: node local_lat.js <bind-to> <msg-size> <roundtrips>');
  process.exit(1);
}
var bind_to = process.argv[2].split('//')[1].split(':');
var sz      = Number(process.argv[3]);
var rts     = Number(process.argv[4]);

var i       = 0;
var s       = net.createServer({ setNoDelay: true }, function(sock) {
  sock.pipe(sock).on('data', handler);
});
s.listen(bind_to[1]);

function handler (data) {
  assert.equal(data.length, sz);
  if (++i == rts){
    s.unref();
  }
}
