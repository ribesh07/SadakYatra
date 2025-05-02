// <!DOCTYPE html>
// <html>
// <head>
//   <title>My App</title>
// </head>
// <body>
//   <h1><%= message %></h1>
// </body>
// </html>
// const express = require('express');
// const app = express();

// Set the view engine to ejs
app.set('view engine', 'ejs');

// Define a route
app.get('/', (req, res) => {
  // Render the 'index.ejs' view and pass data to it
  res.render('index', { message: 'Hello, World!' });
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});