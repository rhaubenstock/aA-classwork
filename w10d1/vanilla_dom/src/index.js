const DOMNodeCollection = require ('./dom_node_collection');

const callbackQueue = [];

window.$l = function(arg){
  if(typeof arg === "string"){
    const nodeList = document.querySelectorAll(arg);
    const nodeListArr = Array.from(nodeList);
    return new DOMNodeCollection(nodeListArr);
  }else if( arg instanceof HTMLElement ){
    return new DOMNodeCollection([arg]);
  } else if(typeof arg === "function"){
    // console.log(document.readyState);
    if (document.readyState !== "complete"){ //document.readyState is loading 
      callbackQueue.push(arg);
    }else{ //document.readyState is complete
      // console.log("immediate invoke");
      arg();  
    }
  }
}

window.$l.extend = function(...args){
  const mergedObject = {};
  for (object of [...args]) {
    for (key in object) { 
      mergedObject[key] = object[key];
    }
  } 
  return args[0] = mergedObject;
}

window.$l(()=> console.log("hi"));
console.log("after hi in code but before hi in console!");

document.addEventListener('DOMContentLoaded', () => {
  callbackQueue.forEach(func => func());
});

