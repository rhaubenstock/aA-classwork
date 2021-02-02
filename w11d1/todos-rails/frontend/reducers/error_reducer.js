import {CLEAR_ERRORS, RECEIVE_ERRORS} from '../actions/error_actions';


const errorsReducer = (state=[], action) => {

  switch (action.type) {
    case CLEAR_ERRORS:
      return []

    case RECEIVE_ERRORS:
      console.log("received errors")
      return action.errors

    default:
      return state
  }  

}

export default errorsReducer;


