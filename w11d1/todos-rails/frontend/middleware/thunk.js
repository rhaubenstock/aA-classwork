

const thunkMiddleware = ({dispatch, getState}) => next => action => {
  if (typeof action === 'function'){
    // console.log("action")
    // console.log(action)
    return action(dispatch, getState);
  } else {
    // console.log("next")
    return next(action);
  }
};

export default thunkMiddleware;