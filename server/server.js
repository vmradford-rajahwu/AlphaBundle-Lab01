const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// Base health check
app.get('/api', (req, res) => {
  res.send('AlphaBundle SIRA Core Serverless Engine Live.');
});

// Refactored ingestion route
app.post('/api/submit', (req, res) => {
  const body = req.body;
  console.log('Serverless Ingestion Received:', body);
  
  res.json({
    status: 'success',
    received: body
  });
});

// CRITICAL: Export the Express instance for Vercel's handler
module.exports = app;