import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const Root = () => {
    const tabInfoArr = [{title: "one", content: "I am the first"},
                        {title: "two", content: "Second pane here"},
                        {title: "three", content: "Third pane here"},
                        {title: "will this show up", content: "FOurth"}
                       ];
    return(<div>
                <Clock />
                <Tabs tabInfoArr={tabInfoArr} />
           </div>
    );
}


export default Root;

// passing function as argument vs invoking
// anonymous functions :   function(args){code} or (args)=>{code}