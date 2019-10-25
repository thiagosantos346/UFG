import React from 'react';
import { storiesOf } from '@storybook/react';
import Hello from '../components/Hello';
import Button from '../components/InputButton';
import InputText from '../components/InputText';
import List from '../components/List';

const numbers = ['thiago', 'silva'];

storiesOf('Testes', module)
    .add(
        'Hello'
        ,()=> < Hello name='Olá' value=' Mundo' />
    )
    .add(
        'Button'
        ,()=> <Button value='OK' type='button'/>
    )
    .add(
        'InputText'
        ,()=> <InputText value='' type='inputText' placeHolder='Nome do Item'/>
    )
    .add(
        'List'
    ,() => <List numbers={numbers} />
    )