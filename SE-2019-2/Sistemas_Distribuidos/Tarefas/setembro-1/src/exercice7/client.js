//https://nodejs.dev/making-http-requests-with-nodejs

const http = require('http');
const options = {
    hostname : 'localhost',
    port: 8080,
    path: '/summer.html',
    method: 'GET'
}

const req = http.request(
    options,
    (res) => {
        console.log('statusCode:'+res.statusCode);
        
        res.on(
             'data'
            ,(d) => { process.stdout.write(d); }
        );

        res.on(
            'error'
            ,(error) => { console.error(error); }
        );
    }
);

req.end();