import React from 'react';
import { createRoot } from 'react-dom/client';
import './index.css';
import App from './App';
import axios from 'axios';

// Debug environment variables
console.log('Environment Variables Debug:');
console.log('NODE_ENV:', process.env.NODE_ENV);
console.log('REACT_APP_API_URL:', process.env.REACT_APP_API_URL);

// Set base URL for all axios requests
const API_URL = 'https://agri-connect-1-1ubj.onrender.com'; // Hardcoded for deployment
axios.defaults.baseURL = API_URL;

console.log('Axios Base URL set to:', axios.defaults.baseURL);

// Test API connection
const testAPIConnection = async () => {
  try {
    console.log('Testing API connection to:', API_URL);
    // Don't await this, just test if we can reach the server
    fetch(`${API_URL}/`)
      .then(response => {
        console.log('API connection test - Status:', response.status);
        if (response.status === 404) {
          console.log('✅ API server is reachable (404 is expected for root path)');
        } else {
          console.log('✅ API server responded with status:', response.status);
        }
      })
      .catch(error => {
        console.error('❌ API connection test failed:', error.message);
        console.error('This may cause registration/login issues');
      });
  } catch (error) {
    console.error('❌ API connection test error:', error);
  }
};

// Test connection after a short delay
setTimeout(testAPIConnection, 1000);

// Get the root element
const container = document.getElementById('root');
const root = createRoot(container);

// Render the app
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
