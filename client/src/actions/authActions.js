import axios from 'axios';
import { setAlert } from './alertActions';
import {
  REGISTER_SUCCESS,
  REGISTER_FAIL,
  USER_LOADED,
  AUTH_ERROR,
  LOGIN_SUCCESS,
  LOGIN_FAIL,
  LOGOUT,
  CLEAR_ERRORS
} from './types';
import setAuthToken from '../utils/setAuthToken';

// Load User
export const loadUser = () => async dispatch => {
  if (localStorage.token) {
    setAuthToken(localStorage.token);
  }

  try {
    const res = await axios.get('/api/auth/me');
    console.log('Load user response:', res.data);

    dispatch({
      type: USER_LOADED,
      payload: res.data.data || res.data.user || res.data
    });
  } catch (err) {
    console.error('Load user error:', err);
    // Clear token if it's invalid
    localStorage.removeItem('token');
    setAuthToken();
    
    dispatch({
      type: AUTH_ERROR
    });
  }
};

// Register User
export const register = (formData) => async dispatch => {
  try {
    console.log('Registering user with data:', formData);
    const config = {
      headers: {
        'Content-Type': 'application/json'
      }
    };

    const res = await axios.post('/api/auth/register', formData, config);
    console.log('Register response:', res.data);

    dispatch({
      type: REGISTER_SUCCESS,
      payload: res.data
    });

    dispatch(loadUser());
  } catch (err) {
    console.error('Register error:', err);
    console.error('Error response:', err.response);
    
    let errorMessage = 'Registration failed. Please try again.';
    
    if (err.response) {
      // Server responded with error status
      if (err.response.data && err.response.data.message) {
        errorMessage = err.response.data.message;
      } else if (err.response.data && err.response.data.error) {
        errorMessage = err.response.data.error;
      } else if (err.response.statusText) {
        errorMessage = `Registration failed: ${err.response.statusText}`;
      }
    } else if (err.request) {
      // Request was made but no response received
      errorMessage = 'Unable to connect to server. Please check your internet connection.';
    } else {
      // Something else happened
      errorMessage = err.message || 'An unexpected error occurred.';
    }

    dispatch(setAlert(errorMessage, 'danger'));

    dispatch({
      type: REGISTER_FAIL
    });
  }
};

// Login User
export const login = (email, password) => async dispatch => {
  const config = {
    headers: {
      'Content-Type': 'application/json'
    }
  };

  const body = JSON.stringify({ email, password });

  try {
    console.log('Logging in user:', email);
    const res = await axios.post('/api/auth/login', body, config);
    console.log('Login response:', res.data);

    dispatch({
      type: LOGIN_SUCCESS,
      payload: res.data
    });

    dispatch(loadUser());
  } catch (err) {
    console.error('Login error:', err);
    console.error('Error response:', err.response);
    
    let errorMessage = 'Login failed. Please try again.';
    
    if (err.response) {
      if (err.response.data && err.response.data.message) {
        errorMessage = err.response.data.message;
      } else if (err.response.data && err.response.data.error) {
        errorMessage = err.response.data.error;
      } else if (err.response.status === 401) {
        errorMessage = 'Invalid email or password.';
      } else if (err.response.statusText) {
        errorMessage = `Login failed: ${err.response.statusText}`;
      }
    } else if (err.request) {
      errorMessage = 'Unable to connect to server. Please check your internet connection.';
    } else {
      errorMessage = err.message || 'An unexpected error occurred.';
    }

    dispatch(setAlert(errorMessage, 'danger'));

    dispatch({
      type: LOGIN_FAIL
    });
  }
};

// Update profile
export const updateProfile = (formData) => async dispatch => {
  try {
    const config = {
      headers: {
        'Content-Type': 'application/json'
      }
    };

    const res = await axios.put('/api/auth/profile', formData, config);

    dispatch({
      type: USER_LOADED,
      payload: res.data.data
    });

    dispatch(setAlert('Profile Updated', 'success'));
  } catch (err) {
    const errors = err.response.data.message;

    if (errors) {
      dispatch(setAlert(errors, 'danger'));
    }

    dispatch({
      type: AUTH_ERROR
    });
  }
};

// Change password
export const changePassword = (passwordData) => async dispatch => {
  try {
    const config = {
      headers: {
        'Content-Type': 'application/json'
      }
    };

    await axios.put('/api/auth/change-password', passwordData, config);

    dispatch(setAlert('Password Changed Successfully', 'success'));
    
    return true;
  } catch (err) {
    const errors = err.response.data.message;

    if (errors) {
      dispatch(setAlert(errors, 'danger'));
    }
    
    return false;
  }
};


// Logout
export const logout = () => dispatch => {
  dispatch({ type: LOGOUT });
};

// Clear Errors
export const clearErrors = () => dispatch => {
  dispatch({ type: CLEAR_ERRORS });
};
