

const toDos = JSON.parse(localStorage.getItem('todo')) || [];

const ul = document.querySelector('.todos');
const form = document.querySelector('.add-todo-form');

const addTodo = e => {
    e.preventDefault();
    const toDo = document.querySelector("input[name='add-todo']");
    const newToDo = {toDo: toDo.value, done: false};
    toDos.push(newToDo);
    toDo.value = '';
    populateList(toDos);
    localStorage.setItem('todo', JSON.stringify(toDos));
}

const populateList = (toDos) => {
    ul.innerHTML = "";
    for(let i = 0; i < toDos.length; i++) {
        const toDo = toDos[i];
        const label = document.createElement('label');
        label.innerHTML = toDo.toDo;
        const checkbox = document.createElement('input');
        checkbox.setAttribute('type', 'checkbox');
        checkbox.checked = toDo.done;
        checkbox.dataset.index = i; 
        label.append(checkbox);
        const liEl = document.createElement('li');
        liEl.append(label);
        ul.append(liEl);
    };

}

function check(e) {
    const idx = e.target.dataset.index;
    toDos[idx].done = !toDos[idx].done;
    localStorage.setItem('todo', JSON.stringify(toDos));
}

form.addEventListener("submit", addTodo);
ul.addEventListener("change", check);
//event listener on ul
//target -> checkbox
// update toDos and localStorage -> 
//  set the corresponding value of the done key to toggle

populateList(toDos);