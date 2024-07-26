const admin = require('firebase-admin');
const serviceAccount = require('./sadakyatra-firebase.json');


// Initialize the Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: 'sadakyatra-fd6de.appspot.com'
});

// Get a Firestore instance
const db = admin.firestore();

// Retrieve a document from Firestore
async function getDocument() {
  const docRef = db.collection('users').doc('user_123');
  // const docRef = db.collection('users');
  const doc = await docRef.get();
  // console.log(doc.data);
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
const multer = require('multer');
const path = require('path');
const { v4: uuidv4 } = require('uuid');

const bucket = admin.storage().bucket();

// Set up multer for file uploads
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

//to render index
app.get('/', (req, res) => {
   console.log('Hello World!');
    // await addDocument();
    res.render('index', { message: 'SadakYatra' });
  });

  //to render user-page
app.get('/users-edit', async(req, res) => {
   console.log('Hello World!');
   try {
    const snapshot = await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').get();
    const users = snapshot.docs.map(doc => doc.data());
    // console.log(users);
    // res.json(users);
    res.render('users-edit', { message:'SadakYatra',data :users });
  } catch (error) {
    // res.status(500).send('Error getting users:', error);
    var message = "Error Getting Users!"
    alert(message);
  }
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

  //upload-image page
app.get('/upload-image', (req, res) => {
//    console.log('Hello World!');
    res.render('upload-image', { message: 'Success' });
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

// Endpoint to fetch data from Firestore
app.get('/users', async (req, res) => {
  try {
    const snapshot = await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').get();
    const users = snapshot.docs.map(doc => doc.data());
    console.log(users);
    res.json(users);
  } catch (error) {
    res.status(500).send('Error getting users:', error);
  }
});

//replace hypens
function replaceSpacesWithHyphens(inputString) {
  // Replace all spaces with hyphens
  return inputString.replace(/\s+/g, '-');
}
//upload image and description 
app.post('/upload', upload.single('image'), async (req, res) => {
  try {
    const description = req.body.description;
    const imageFile = req.file;
    const folderName = "images";

    if (!imageFile || !description) {
      return res.status(400).send('Image file and description are required.');
    }
    const resultArray = imageFile.originalname.split('.');
    const imageName = resultArray[0];
    const modifiedName = replaceSpacesWithHyphens(imageName);
    const imageName1 = `${folderName}/${modifiedName}`;
    const imageBlob = bucket.file(imageName1);
    
    await imageBlob.save(imageFile.buffer, {
      contentType: imageFile.mimetype,
      metadata: { firebaseStorageDownloadTokens: uuidv4() }
    });

    console.log("\n\nimage file ---"+imageFile);

    const file = bucket.file(imageName1); 
    const [url] = await file.getSignedUrl({
      action: 'read',
      expires: '03-01-2500'
    });
    console.log(url);
    // Store description and image URL in Firestore
    await db.collection('uploads').add({
      description: description,
      imageUrl: url,
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    });

    console.log('Description:', description);
    console.log(modifiedName);

  res.status(200).send('Files uploaded successfully');
  } catch (error) {
    console.error('Error uploading files:', error);
    res.status(500).send('Error uploading files');
  }
});

// Route to get the image URL
app.get('/image-url', async (req, res) => {
  const imageName = req.body.imageName;
  try {
    const file = bucket.file('images/joker.jpg'); // Path to your image in Firebase Storage
    const [url] = await file.getSignedUrl({
      action: 'read',
      expires: '03-01-2500'
    });
    res.json({ imageUrl: url });
  } catch (error) {
    res.status(500).send(error.message);
  }
});

 //to create user data
 app.post('/user-create',upload.single('image'),async (req, res) => {
  //  alert("success");
  try {
    const username = req.body.username;
    const email = req.body.email;
    const password = req.body.password;
    const contact = req.body.contact;
    const userId = uuidv4(); 

    // const description = req.body.description;
    const imageFile = req.file;
    const folderName = "user_images";

    if (!imageFile) {
      return res.status(400).send('Image file and description are required.');
    }
    const resultArray = imageFile.originalname.split('.');
    const imageName = resultArray[0];
    const modifiedName = replaceSpacesWithHyphens(imageName);
    const modifiedUserImage = (username+'-'+ modifiedName);
    const imageName1 = `${folderName}/${modifiedUserImage}`;
    const imageBlob = bucket.file(imageName1);
    
    await imageBlob.save(imageFile.buffer, {
      contentType: imageFile.mimetype,
      metadata: { firebaseStorageDownloadTokens: uuidv4() }
    });

    console.log("\n\nimage file -----------------------------\n\ninside create---user");

    const file = bucket.file(imageName1); 
    const [url] = await file.getSignedUrl({
      action: 'read',
      expires: '03-01-2500'
    });
    console.log(url);
    // Store description and image URL in Firestore
    await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').doc(userId).add({
      uid: userId,
      username: username,
      email: email,
      password: password,
      contact: contact,
      imageUrl: url,
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    });

    // console.log('Description:', description);
    console.log(modifiedName);

  res.status(200).send('Files uploaded successfully');
  } catch (error) {
    console.error('Error uploading files:', error);
    res.status(500).send('Error uploading files');
  }
  // res.render('users-create',{ message: 'SadakYatra' });
});

// Route to handle user update by email
app.post('/user-update', upload.single('image'), async (req, res) => {
  try {
    const { email, username, password, contact } = req.body;
    userId = req.body.uid;
    console.log(userId);
    if (!email) {
      return res.status(400).send('Email is required');
    }

    const userQuerySnapshot = await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').where('email', '==', email).get();

    if (userQuerySnapshot.empty) {
      return res.status(404).send('User not found');
    }

    const userDoc = userQuerySnapshot.docs[0];
    // const userId = userDoc.uid;

    const userData = {
      username,
      password,
      contact,
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),

    };

    // Check if an image file is included in the request
    if (req.file) {
      const imageFile = req.file;
      const folderName = 'user_images';
     
      const resultArray = imageFile.originalname.split('.');
    const imageName = resultArray[0];
    const modifiedName = replaceSpacesWithHyphens(imageName);
    const modifiedUserImage = (username+'-'+ modifiedName);
    const imageName1 = `${folderName}/${modifiedUserImage}`;
    const imageBlob = bucket.file(imageName1);
    
    await imageBlob.save(imageFile.buffer, {
      contentType: imageFile.mimetype,
      metadata: { firebaseStorageDownloadTokens: uuidv4() }
    });

    console.log("\n\nimage file -----------------------------\n\ninside create---user");

    const file = bucket.file(imageName1); 
    const [url] = await file.getSignedUrl({
      action: 'read',
      expires: '03-01-2500'
    });
    console.log(url);
    console.log(modifiedName);

    userData.imageUrl = url;
    console.log(userId);
    await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').doc(userId).update(userData);
    res.status(200).json('success');
  } else {
    await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').doc(userId).update(userData);
    res.status(200).json('success');
    }
  } catch (error) {
    console.error('Error updating user:', error);
    res.status(500).json('Error updating user');
  }
});

//delete users
app.delete('/delete-user/:userId', async (req, res) => {
  try {
    const { userId } = req.params;
    console.log(userId);
    await db.collection('users').doc(userId).delete();
    res.json({ success: true, message: 'User deleted successfully' });
  } catch (error) {
    console.error('Error deleting user:', error);
    res.status(500).send('Error deleting user');
  }
});

app.listen(port, () => { 
    // getDocument();
    console.log(` App listening at http://localhost:${port}`);
  });

