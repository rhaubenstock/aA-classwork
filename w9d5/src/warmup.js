
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  // create a p element -> put the string in 

  if(Array.from(htmlElement.children).length > 0) htmlElement.textContent = '';


  let el = document.createElement("p");
  el.textContent = string;
  // append to htmlElement
  htmlElement.append(el);
};

htmlGenerator('Party Time.', partyHeader);