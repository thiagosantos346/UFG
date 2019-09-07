//creditos https://gist.github.com/tedmiston/5935757 
var net = require('net')

var server = net.createServer();

server.on(
    'close',
    function(){
        console.log('Log: Servidor desconectado.');
    }
);

server.on(
    'connection',
    function(socket){
        
        console.log('Tamanho do buffer: '+socket.bufferSize);
        
        console.log('---------------- Detalhes do Servidor ----------------');
        
        var address = server.address();
        var port = address.port;
        var ipVersion = 4;
        var ipaddr = address.adress;
        
        console.log('Servidor - Endereço: '+address.ipaddr);
        console.log('Servidor - Porta: '+address.port);
        console.log('Servidor - Versão IP: '+address.ipVersion);
        
        var listernPort = socket.localPort;
        var listernAddress = socket.localAddress;

        console.log('Servidor - Escutando na porta: '+listernPort+' do endereço: '+listernAddress+'.');
        
        console.log('---------------- Detalhes do Cliente -----------------')
        
        var remotePort = socket.remotePort;
        var remoteAddress = socket.remoteAddress;
        var remoteIpVersion = socket.remoteFamily;

        console.log('Cliente - Endereço: '+remoteAddress);
        console.log('Cliente - Porta: '+remotePort);
        console.log('Cliente - Versão IP: '+remoteIpVersion);
        
        console.log('------------------------------------------------------')
        
        server.getConnections(
            function(error, count){
                console.log('Log: Número de conexões concorrentes, ativas: '+count);
                
            }
        );

        socket.setEncoding('utf-8');
        
        socket.setTimeout(
            800000,
            function(){
                console.log('Log: Tempo expirado!');
            }
        );
        
        function reverseString(str){
            var spliteString = str.split("");
            var reverseArray = spliteString.reverse();

            var joinArray = reverseArray.join("");

            return joinArray;
            //creditos:https://medium.com/sonyamoisset/reverse-a-string-in-javascript-a18027b8e91c
        };

        function calc(str){
            return eval(str);
            //creditos: https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/eval
        }

        socket.on(
            'data',
            function(data){
                var bytesRead = socket.bytesRead;
                var bytesWrite = socket.bytesWrite;
                var rData = calc(data);
                

                console.log('Log[data]: Entrada: '+bytesRead);
                console.log('Log: Saída[data]: '+bytesWrite);
                console.log('Log: Dados enviados ao servidor[data]: '+data);        

                var is_kernel_buffer_full = socket.write(
                    '[Response] Data ::'+rData
                );
                
                if(is_kernel_buffer_full){
                    console.log('Log: Dados do buffers esvasiados com sucesso!')
                }else{
                    socket.pause();
                }

            }
        );

        socket.on(

            'drain',
            function(){
                console.log('Log: Buffers pronto para uso, retornando receber dados...');
                socket.resume();
            }

        );

        socket.on(
            'error',
            function(error){
                console.log('Log: Um evento de erro retornou: '+error);
            }
                
        );

        socket.on(
            'timeout',
            function(){
                console.log('Log: Tempo expirado!');
                socket.end('Event: Fim, Tempo Expirado!');
            }
        )

        socket.on(
            'end',
            function(data){
                console.log('Socket parou, por algum outro motivo...');
                console.log('Dados de finalização: '+data);
            }
        );

        socket.on(
            'close',
            function(erro){
                var bytesRead = socket.bytesRead;
                var bytesWrite = socket.bytesWrite;
                
                console.log('Log: Entrada: '+bytesRead);
                console.log('Log: Saída: '+bytesWrite);
                console.log('Log: Servidor finalizado!.');
                
                if(erro){
                    console.log('Socket finalizado por erro de transmiçao de dados!')
                }
            }

        );

        setTimeout(
            function(){
                var isDrestroyed = socket.destroy;
                console.log('Socket destruido: '+ isDrestroyed);
                socket.destroy();
            },
            1200000
        );


    }
);

server.on(
    'error',
    function(error){
        console.log('Log: Erro: '+error);
    }
        
);

server.on(
    'listening',
    function(){
        console.log('Server is listening!');
    }
);
  

server.maxConnections = 5;
server.listen({
    port:'8081',
    address:'127.0.0.1',
    family:4
});



/*server.listen(
    function(){
        var address = server.address();
        var port = address.port;
        var ipVersion = address.family;
        var ipaddr = address.address;
        
        console.log('Servidor - Endereço: '+ipaddr);
        console.log('Servidor - Porta: '+port);
        console.log('Servidor - Versão IP: '+ipVersion);

    }
);*/


var isListerning = server.listening;

if(isListerning){
    console.log('Servidor escutando...');
}else{
    console.log('Servidor não está escutando...');
}

setTimeout(
    function(){
        server.close();
    }
    ,5000000
);
  