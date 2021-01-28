import {RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP} from '../actions/step_actions';


const stepsReducer = (state, action) => {

  state = Object.assign({}, state);
  switch (action.type) {
    case (RECEIVE_STEP):
      state[action.step.id] = action.step
      return state;

    case (RECEIVE_STEPS):
      let newSteps = {};
      action.steps.forEach( step => {
        newSteps[step.id] = step
      })
      return newSteps;

    case (REMOVE_STEP):
      delete state[action.id]
      return state

    default:
      return state
  }  

}

export default stepsReducer;


