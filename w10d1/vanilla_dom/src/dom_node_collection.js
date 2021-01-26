class DOMNodeCollection {
  constructor(htmlElements){
    this.htmlCollection = htmlElements; //array of HTMLElements
  }

  html(str){
    if(typeof str === 'string'){
      this.htmlCollection.forEach(el => el.innerHTML = str);
    }else {
      return this.htmlCollection[0].innerHTML;
    }
  }

  empty(){
    this.html("");
  }
  // calling object is the partent. parameter / arg is the object to append. 
  // This method should accept either a jQuery-lite wrapped 
  // collection, an HTML element, or a string. 
  append(arg){
    if (typeof arg === 'string') {
      console.log("hit")
      this.htmlCollection.forEach( ele => {
        ele.innerHTML += arg
      });
    } else if (arg instanceof HTMLElement ){
      this.htmlCollection.forEach( ele => {
        ele.innerHTML += arg.outerHTML
      });
    } else if(arg instanceof DOMNodeCollection){
      arg.htmlCollection.forEach (node => this.append(node));
    }
  }

  attr(){
    console.log("in attr");
    return this.htmlCollection.map(el => el.attributes);
  }
  
  addClass(arg){
    // check type of arg -> if string do sth, if arr do sth else
    if (typeof arg === 'string'){
      this.htmlCollection.forEach(el => el.classList.add(arg));
    }
    else{
      this.htmlCollection.forEach(el => el.classList.add(...arg));
    }
  }
  removeClass(arg){
    if (typeof arg === 'string'){
      this.htmlCollection.forEach(el => el.classList.remove(arg));
    }
    else{
      this.htmlCollection.forEach(el => el.classList.remove(...arg));
    }
  }
  
  children(){
    //return an instance of DOMNodeCollection
    let childArr = [];
    this.htmlCollection.forEach(node => {
      childArr = childArr.concat(Array.from(node.children));
    });
    return new DOMNodeCollection(childArr);
  }

  parent(){
    let parentArray = [];
    this.htmlCollection.forEach(el => {
      parentArray.push(el.parentElement);
    });
    return new DOMNodeCollection(parentArray);
  }
  
  find(selector){
    let foundNodes = [];
    this.htmlCollection.forEach(el => {
      let nodes = el.querySelectorAll(selector);
      foundNodes = foundNodes.concat(nodes);
    });
    return new DOMNodeCollection(foundNodes);
  }

  remove(){
    //this.htmlCollection // our array of HTMLElements
    this.htmlCollection.forEach(el => el.outerHTML = "");
  }

  on(type, callback){
    //want to add listeners to each element in htmlCollection
    this.htmlCollection.forEach(el => {
      el.addEventListener(type, callback);
      el[type] = callback;
    });
  }

  off(type){
    this.htmlCollection.forEach(el => {
      let callback = el[type];
      el.removeEventListener(type, callback);
    });
  }
}


module.exports = DOMNodeCollection;