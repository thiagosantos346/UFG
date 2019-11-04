import React, {useState, useEffect} from 'react';
import SquareButton from './SquareButton';
import './Game.css';

export default function BoardButton(props){

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

    const calculateWinner = (buttons) => {
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
            if(    buttons[a] 
                && buttons[a] === buttons[b]
                && buttons[a] === buttons[c]){
                return buttons[a];
            }
        }
        return null;
    }

    const handleClick = (id) => {
        if (   ! props.buttons[id] 
            && ! winner
            && round < 9){
            props.buttons[id] = player;
            setWinner(calculateWinner(props.buttons));
            if(! winner ){
                player === 'x'? setPlayer('o') : setPlayer('x')
                setRound(round+1);
            }
        }
        console.log(props.buttons);
    }

    const renderButton = (i) => < SquareButton
        valueButton={props.buttons[i]}
        id={i}
        handleClick={handleClick}
    />;

    return (
        <div>
            <div className="status">
                {status}
            </div>
            <div className="board-row">
                {renderButton(0)}
                {renderButton(1)}
                {renderButton(2)}
            </div>
            <div className="board-row">
                {renderButton(3)}
                {renderButton(4)}
                {renderButton(5)}
            </div>
            <div className="board-row">
                {renderButton(6)}
                {renderButton(7)}
                {renderButton(8)}
            </div>
        </div>
    )
}

