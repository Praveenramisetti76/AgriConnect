import React from 'react';

const EnvironmentDebug = () => {
  const apiUrl = process.env.REACT_APP_API_URL;
  const nodeEnv = process.env.NODE_ENV;
  
  // Only show in development or if there are connection issues
  if (nodeEnv === 'production' && apiUrl) {
    return null;
  }

  return (
    <div style={{
      position: 'fixed',
      top: 0,
      right: 0,
      background: '#ff4444',
      color: 'white',
      padding: '10px',
      zIndex: 9999,
      fontSize: '12px',
      maxWidth: '300px'
    }}>
      <h4>🔧 Debug Info</h4>
      <p><strong>NODE_ENV:</strong> {nodeEnv || 'undefined'}</p>
      <p><strong>REACT_APP_API_URL:</strong> {apiUrl || 'undefined'}</p>
      <p><strong>Expected API:</strong> https://agri-connect-1-1ubj.onrender.com</p>
      {!apiUrl && (
        <p style={{color: '#ffff88'}}>
          ⚠️ REACT_APP_API_URL not set! Using fallback.
        </p>
      )}
    </div>
  );
};

export default EnvironmentDebug;
