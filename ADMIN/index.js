const admin = require('firebase-admin');
const serviceAccount = require('./sadakyatra-firebase.json');

// Initialize the Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

// Get a Firestore instance
const db = admin.firestore();

// Add a document to Firestore
async function addDocument() {
  const docRef = db.collection('users').doc('user_123');
  await docRef.set({
    first: 'John',
    last: 'Doe',
    born: 1990
  });
  console.log('Document added.');
}

// Retrieve a document from Firestore
async function getDocument() {
  const docRef = db.collection('users').doc('user_123');
  const doc = await docRef.get();
  if (doc.exists) {
    console.log('Document data:', doc.data());
  } else {
    console.log('No such document!');
  }
}

// Update a document in Firestore
async function updateDocument() {
  const docRef = db.collection('users').doc('user_123');
  await docRef.update({
    born: 1991
  });
  console.log('Document updated.');
}

// Delete a document from Firestore
async function deleteDocument() {
  const docRef = db.collection('users').doc('user_123');
  await docRef.delete();
  console.log('Document deleted.');
}

// Call the functions
// (async () => {
//     await addDocument();
//     await getDocument();
//     await updateDocument();
//     await getDocument();
//     await deleteDocument();
//     await getDocument();
// })();

const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 4444;    //server port 
app.use(express.static('views'));       //static path
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
let alert = require('alert'); 



//to render index
app.get('/', (req, res) => {
   console.log('Hello World!');
    // await addDocument();
    res.render('index', { message: 'SadakYatra' });
  });

  //to render user-page
app.get('/users-edit', (req, res) => {
   console.log('Hello World!');
    res.render('users-edit', { message: 'SadakYatra' });
  });
  //to render agent-page
app.get('/agent-edit', (req, res) => {
   console.log('Hello World!');
    res.render('agent-edit', { message: 'SadakYatra' });
  });

  //to render agent-page
app.get('/news-blog', (req, res) => {
   console.log('Hello World!');
    res.render('news-blog', { message: 'SadakYatra' });
  });
  //to render bus-edit
app.get('/bus-edit', (req, res) => {
   console.log('Hello World!');
    res.render('bus-edit', { message: 'SadakYatra' });
  });

  //success page
app.get('/success', (req, res) => {
//    console.log('Hello World!');
    res.render('users-edit', { message: 'Success' });
  });


  //to update user data
  app.post('/user-update',async (req, res) => {
    console.log("user-update", req.body);
    // await alert("success");
    console.log('Form data received successfully');
    res.render('users-edit',{ message: 'SadakYatra' });
    });

  //to update agent data
  app.post('/agent-update',async (req, res) => {
    console.log("agent-update", req.body);
    // await alert("success");
    console.log('Form data received successfully');
    res.render('agent-edit',{ message: 'SadakYatra' });
    });

  //to update and add news-blog data
  app.post('/news-update',async (req, res) => {
    console.log("news-blog", req.body);
    // await alert("success");
    console.log('Form data received successfully');
    res.render('news-blog',{ message: 'SadakYatra' });
    });
  //to update and add news-blog data
  app.post('/bus-edit',async (req, res) => {
    console.log("news-blog", req.body);
    // await alert("success");
    console.log('Form data received successfully');
    res.render('bus-edit',{ message: 'SadakYatra' });
    });


  app.listen(port, () => { 
    console.log(` App listening at http://localhost:${port}`);
    });

// Sample data
const data = [
  { id: 1, name: 'Alice', age: 28 },
  { id: 2, name: 'Bob', age: 34 },
  { id: 3, name: 'Charlie', age: 23 }
];

// Endpoint to send data
app.get('/data', (req, res) => {
  res.json(data);
});