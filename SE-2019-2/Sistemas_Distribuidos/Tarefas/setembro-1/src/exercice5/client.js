//creditos https://github.com/MarceauKa/NodeJS-UDP-Chat-Example/blob/master/client.js
//https://github.com/schmidsi/nodejs-udp-chat
var dgram  = require('dgram'),
	server = {
		host: 'localhost',
		port: 8081
	};

function Command() {

	process.stdin.on('data', function(chunk) {

		var message = chunk.toString().replace(/\n|\n/g, '');

		if (message === 'exit') {
			var object  = '{"type":"disconnect"}';
			console.log('Appuyez sur "Ctrl + C" pour terminer.');
		} else {
			var buffer = new Buffer(message.toString(), 'ascii');
			var object  = buffer;
		}

	 	var buffer  = new Buffer(object);
	 	client.send(buffer, 0, buffer.length, server.port, server.host);

	});

}

var client = dgram.createSocket('udp4', function(message, rinfo) {
	
	console.log('%s', message.toString());
	process.stdin.resume();

	process.stdin.removeAllListeners('data');
	process.stdin.on('data', function(chunk) {
	 	Command();
	});

});

client.bind();

client.on('listening', function() {

	var buffer = new Buffer('{"type":"connect"}');

	console.log('Client connecté sur le port %d.', client.address().port);
	console.log('(Tapez "exit" pour terminer)');
	client.send(buffer, 0, buffer.length, server.port, server.host);

});

client.on('error', function(err) {
	console.log(err);
});

client.on('close', function() {

	var buffer = new Buffer('{"type":"disconnect"}');

	console.log('Client déconnecté.', client.address().port);
	client.send(buffer, 0, buffer.length, server.port, server.host);

})

process.stdin.resume();
Command();
