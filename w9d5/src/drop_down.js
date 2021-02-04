
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = () => {
  const linkArr = [];
  for(const dog in dogs) { 
    const dogLink = document.createElement('a');
    dogLink.innerHTML = dog;
    dogLink.href = dogs[dog];
    const dogLi = document.createElement('li');
    dogLi.classList.add('dog-link');
    dogLi.append(dogLink);
    linkArr.push(dogLi);
   }
   return linkArr;
};

const attachDogLinks = () => {
  let dogLinks = dogLinkCreator();
  const dogList = document.getElementsByClassName("drop-down-dog-list")[0];
  dogLinks.forEach( ele => dogList.append(ele) );
};


// () =>
// arg =>
// (arg1, arg2) => 
const handleEnter = e => {
  Array.from(e.currentTarget.querySelector('ul').children).forEach( child => child.classList.remove('dog-link'));
};

const handleLeave = e => {
  Array.from(e.currentTarget.querySelector('ul').children).forEach( child => child.classList.add('dog-link'));
};

const dogListNav = document.getElementsByClassName("drop-down-dog-nav")[0];
dogListNav.addEventListener("mouseenter", handleEnter);
dogListNav.addEventListener("mouseleave", handleLeave);

attachDogLinks();