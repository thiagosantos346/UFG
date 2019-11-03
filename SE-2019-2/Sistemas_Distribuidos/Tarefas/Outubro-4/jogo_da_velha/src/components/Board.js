import React, {useState, useEffect} from 'react';
import Square from './Square';
import './Game.css';

export default function Board(props){

    const [player, setPlayer] = useState('x');
    const [status, setStatus] = useState('Next player : '+player);
    const [winner, setWinner ] = useState(null);
    const [round , setRound ] = useState(0);

    useEffect(()=>{
        if(!winner){
            if(round === 9){
                setStatus('The game tied')
            }else{
                setStatus('Next player : '+player)
            }
        }else{
            setStatus(winner+' won the game!')
        }

    }, [player, winner, round])

    const calculateWinner = (squares) => {
        const lines = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6],
        ];

        for(let i = 0; i < lines.length; i++){
            const[a,b,c] = lines[i];
            if( squares[a] && squares[a] === squares[b] && squares[a] === squares[c]){
                return squares[a];
            }
        }
        return null;
    }

    const handleClick = (id) => {
        if (   ! props.squares[id] 
            && ! winner
            && round < 9){
            props.squares[id] = player;
            setWinner(calculateWinner(props.squares));
            if(! winner ){
                player === 'x'? setPlayer('o') : setPlayer('x')
                setRound(round+1);
            }
        }
        console.log(props.squares);
    }

    const renderSquare = (i) => < Square 
        width='50'
        height='50'
        value={props.squares[i]}
        color='#f1f1f1'
        id={i}
        handleClick={handleClick}
    />;

    return (
        <div>
            <div className="status">
                {status}
            </div>
            <div className="board-row">
                {renderSquare(0)}
                {renderSquare(1)}
                {renderSquare(2)}
            </div>
            <div className="board-row">
                {renderSquare(3)}
                {renderSquare(4)}
                {renderSquare(5)}
            </div>
            <div className="board-row">
                {renderSquare(6)}
                {renderSquare(7)}
                {renderSquare(8)}
            </div>
        </div>
    )
}

