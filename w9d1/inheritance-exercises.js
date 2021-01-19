Function.prototype.inherits = function(parent){
  // function Surrogate(){};
  // Surrogate.prototype = parent.prototype;
  // this.prototype = new Surrogate();
  // this.prototype.constructor = this;
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
}



function Person(name){
  this.name = name;
}

Person.prototype.sayName = function(){
  console.log(this.name);
}

function Pirate(name){
  this.name = name;
}

Pirate.inherits(Person);

const ryan = new Pirate("ryan");
ryan.sayName();