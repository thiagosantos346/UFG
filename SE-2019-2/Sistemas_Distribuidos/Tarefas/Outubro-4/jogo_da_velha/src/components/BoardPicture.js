import React, {useState, useEffect} from 'react';
import SquarePicture from './SquarePicture';
import './Game.css';

export default function BoardPicture(props){

    const [player, setPlayer] = useState('x');
    const [status, setStatus] = useState('Next player : '+player);
    const [winner, setWinner ] = useState(null);
    const [round , setRound ] = useState(0);

    useEffect(()=>{

        if(!winner){
            if(round === 9){
                setStatus('The game tied :-(')
            }else{
                //setStatus('Next player : '+player)
                if( player === 'o'){
                    setStatus('Next player : Ant-Virus');
                }else{
                    setStatus('Next player : Virus');
                }
            }
        }else{
            if( winner === 'o'){
                setStatus('Ant-Virus won the game!');
            }else{
                setStatus('Virus won the game!');
            }

            //setStatus(winner+' won the game!')
        
        }

    }, [player, winner, round])

    const calculateWinner = (valuePictures) => {
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
            if(    valuePictures[a] 
                && valuePictures[a] === valuePictures[b]
                && valuePictures[a] === valuePictures[c]){
                return valuePictures[a];
            }
        }
        return null;
    }

    const handleClick = (id) => {
        if (   ! props.valuePictures[id] 
            && ! winner
            && round < 9){
            props.valuePictures[id] = player;
            setWinner(calculateWinner(props.valuePictures));
            if(! winner ){
                player === 'x'? setPlayer('o') : setPlayer('x')
                setRound(round+1);
            }
        }
    }

    const renderButton = (i) => < SquarePicture
        valuePicture={props.valuePictures[i]}
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

