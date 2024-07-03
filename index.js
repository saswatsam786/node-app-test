// Import required modules
const express = require('express');

// Create an Express application
const app = express();

// Define a route handler for the root path
app.get('/', (req, res) => {
    res.send('Hello, world!');
});

// Define a port for the server to listen on
const PORT = process.env.PORT || 3000;

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
