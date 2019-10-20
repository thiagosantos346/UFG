var http = require('http');
var url = require('url');
var fs = require('fs');
//https://www.w3schools.com/nodejs/nodejs_filesystem.asp

http.createServer(
    (req, res) =>{
        var request_url = url.parse(req.url, true);
        var filename = "."+ request_url.pathname;
        fs.readFile(
             filename
            ,(err, data) =>{
                if(err){
                    res.writeHead(404, {'content-Type' : 'text\html'});
                    return res.end('404 not Found');
                }
                res.writeHead(200, {'ContentType' : 'text\html'});
                //res.write(data);
                fs.stat(
                     data 
                    ,(err, stats) =>{
                        //res.write(stats.isDirectory());
                        res.write(stats);
                    }
                );

            }
        );
    }
).listen({port:8080, host : 'localhost'});