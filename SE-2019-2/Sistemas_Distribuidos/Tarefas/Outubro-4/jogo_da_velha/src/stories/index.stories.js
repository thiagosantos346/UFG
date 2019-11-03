import React from 'react';
import { storiesOf } from '@storybook/react';
import Default from '../components/default';
import Square from '../components/Square';
import Board from '../components/Board';

storiesOf('Default_test', module)
    .add('default', ()=> <Default name='Working'/>)
    .add('square', ()=> <Square 
                                width='50'
                                height='50'
                                value='o'
                                color='#f1f1f1' />)
    .add('board', () => <Board      
                        squares={[
                            null, null, null, 
                            null, null, null, 
                            null, null, null
                        ]} 
                    />)