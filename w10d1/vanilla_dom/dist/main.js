/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/***/ ((module) => {

eval("class DOMNodeCollection {\n  constructor(htmlElements){\n    this.htmlCollection = htmlElements; //array of HTMLElements\n  }\n\n  html(str){\n    if(typeof str === 'string'){\n      this.htmlCollection.forEach(el => el.innerHTML = str);\n    }else {\n      return this.htmlCollection[0].innerHTML;\n    }\n  }\n\n  empty(){\n    this.html(\"\");\n  }\n  // calling object is the partent. parameter / arg is the object to append. \n  // This method should accept either a jQuery-lite wrapped \n  // collection, an HTML element, or a string. \n  append(arg){\n    if (typeof arg === 'string') {\n      console.log(\"hit\")\n      this.htmlCollection.forEach( ele => {\n        ele.innerHTML += arg\n      });\n    } else if (arg instanceof HTMLElement ){\n      this.htmlCollection.forEach( ele => {\n        ele.innerHTML += arg.outerHTML\n      });\n    } else if(arg instanceof DOMNodeCollection){\n      arg.htmlCollection.forEach (node => this.append(node));\n    }\n  }\n\n  attr(){\n    console.log(\"in attr\");\n    return this.htmlCollection.map(el => el.attributes);\n  }\n  \n  addClass(arg){\n    // check type of arg -> if string do sth, if arr do sth else\n    if (typeof arg === 'string'){\n      this.htmlCollection.forEach(el => el.classList.add(arg));\n    }\n    else{\n      this.htmlCollection.forEach(el => el.classList.add(...arg));\n    }\n  }\n  removeClass(arg){\n    if (typeof arg === 'string'){\n      this.htmlCollection.forEach(el => el.classList.remove(arg));\n    }\n    else{\n      this.htmlCollection.forEach(el => el.classList.remove(...arg));\n    }\n  }\n  \n  children(){\n    //return an instance of DOMNodeCollection\n    let childArr = [];\n    this.htmlCollection.forEach(node => {\n      childArr = childArr.concat(Array.from(node.children));\n    });\n    return new DOMNodeCollection(childArr);\n  }\n\n  parent(){\n    let parentArray = [];\n    this.htmlCollection.forEach(el => {\n      parentArray.push(el.parentElement);\n    });\n    return new DOMNodeCollection(parentArray);\n  }\n  \n  find(selector){\n    let foundNodes = [];\n    this.htmlCollection.forEach(el => {\n      let nodes = el.querySelectorAll(selector);\n      foundNodes = foundNodes.concat(nodes);\n    });\n    return new DOMNodeCollection(foundNodes);\n  }\n\n  remove(){\n    //this.htmlCollection // our array of HTMLElements\n    this.htmlCollection.forEach(el => el.outerHTML = \"\");\n  }\n\n  on(type, callback){\n    //want to add listeners to each element in htmlCollection\n    this.htmlCollection.forEach(el => {\n      el.addEventListener(type, callback);\n      el[type] = callback;\n    });\n  }\n\n  off(type){\n    this.htmlCollection.forEach(el => {\n      let callback = el[type];\n      el.removeEventListener(type, callback);\n    });\n  }\n}\n\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
eval("const DOMNodeCollection = __webpack_require__ (/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\nconst callbackQueue = [];\n\nwindow.$l = function(arg){\n  if(typeof arg === \"string\"){\n    const nodeList = document.querySelectorAll(arg);\n    const nodeListArr = Array.from(nodeList);\n    return new DOMNodeCollection(nodeListArr);\n  }else if( arg instanceof HTMLElement ){\n    return new DOMNodeCollection([arg]);\n  } else if(typeof arg === \"function\"){\n    // console.log(document.readyState);\n    if (document.readyState !== \"complete\"){ //document.readyState is loading \n      callbackQueue.push(arg);\n    }else{ //document.readyState is complete\n      // console.log(\"immediate invoke\");\n      arg();  \n    }\n  }\n}\n\nwindow.$l.extend = function(...args){\n  const mergedObject = {};\n  for (object of [...args]) {\n    for (key in object) { \n      mergedObject[key] = object[key];\n    }\n  } \n  return args[0] = mergedObject;\n}\n\nwindow.$l(()=> console.log(\"hi\"));\nconsole.log(\"after hi in code but before hi in console!\");\n\ndocument.addEventListener('DOMContentLoaded', () => {\n  callbackQueue.forEach(func => func());\n});\n\n\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;