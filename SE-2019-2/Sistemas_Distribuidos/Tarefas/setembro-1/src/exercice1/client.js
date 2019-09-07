//creditos https://gist.github.com/tedmiston/5935757 
var net = require('net');

const clients = net.connect({port: 8081}, () => {
    // 'connect' listener
    console.log('connected to server!');
    clients.write('Esta Frase vai voltar de constas!');
});

clients.on('data', (data) => {
    console.log(data.toString());
    clients.end();
    });
    clients.on('end', () => {
    console.log('disconnected from server');
});

