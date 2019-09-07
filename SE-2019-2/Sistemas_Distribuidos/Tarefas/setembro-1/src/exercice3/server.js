const dgram = require('dgram');
const server = dgram.createSocket('udp4');

server.on(
    'error',
    (err)=>{
        console.log('server error:\n$'+err.stack);
        server.close();
    }
);

server.on(
    'message',
    (msg, rinfo)=>{
        console.log('server got:\n'+msg+'\nfrom '+rinfo.address+':'+rinfo.port);
    }
);

server.on(
    'listening',
    ()=>{
        const address = server.address();
        console.log('server listening: '+address.address+':'+address.port+'.');
    }
)

server.bind({
    address : 'localhost',
    port : '8081',
    exclusive : true
});

