var express = require('express');
var app = express();
var router = express.Router();
const port = 3000;
const fs = require("fs");
const max = 50;
const min = 25;
app.get('/', (req, res)=>{
    res.sendFile(__dirname+'/templates/index.html');
});

app.get('/soma/:x/:y', (req, res)=>{
    rest = parseInt(req.params.x)  + parseInt( req.params.y);
    res.send({ "resultado":rest});
});

app.listen(port, function(){
    var pontos = [  '.  '
                    ,' . '
                    ,'  .'
                    ,'  .'
                    ,' . '
                    ,'.  '];
    i=0;
    const timer = setInterval(function(){
        i++
        console.clear();
        console.log(`Ouvindo a porta: ${port}${pontos[i%pontos.length]}`);
        if(i == pontos.length ){
            i = 0;
        }
    
    }, Math.floor( Math.random() * (max - min)+ min) * Math.PI )
        
});