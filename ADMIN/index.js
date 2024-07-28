const admin = require('firebase-admin');
const serviceAccount = require('./sadakyatra-firebase.json');


// Initialize the Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: 'sadakyatra-fd6de.appspot.com',
  ignoreUndefinedProperties: true
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
app.use(express.json());
app.use(express.urlencoded({
  extended:true
}));


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

app.post('/add-bus',(req,res)=>{

 console.log(req.body);
  const name = req.body.name+" sah"
console.log(name);
  res.send("form submitted"+req.body);
})

  //to render user-page
app.get('/users-edit', async(req, res) => {
   console.log('Hello World!');
   try {
    const snapshot = await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').get();
    const users = snapshot.docs.map(doc => doc.data());
    res.render('users-edit', { message:'SadakYatra',data :users });
  } catch (error) {
    // res.status(500).send('Error getting users:', error);
    var message = "Error Getting Users!"
    alert(message);
  }
  });
  //to render agent-page
  
  // Function to get all collections inside a document
  async function getAllCollectionsInDocument(docRef) {
    const collections = await docRef.listCollections();
    const collectionsData = {};
    
    for (const collection of collections) {
      const snapshot = await collection.get();
      const documents = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
      collectionsData[collection.id] = documents;
    }
    return collectionsData;
  }
  //replace hypens
  function replaceSpacesWithHyphens(inputString) {
    // Replace all spaces with hyphens
    return inputString.replace(/\s+/g, '-');
  }
  //upload-image page
app.get('/upload-image', (req, res) => {
//    console.log('Hello World!');
    res.render('upload-image', { message: 'Success' });
  });
  //to render agent-page
  app.get('/news-blog',async (req, res) => {
    console.log('Hello World!');
    try {
      const resDef = db.collection('sadakyatra').doc('packages');
      const collectionsData = await getAllCollectionsInDocument(resDef);
      
      res.render('news-blog', { message:'SadakYatra',data :collectionsData });
    } catch (error) {
      res.status(500).send('Error getting users');
    }
  });
  
  //reservation details
  app.get('/reservation-edit', async(req, res) => {
     console.log('Hello World!');
     try {
      const resDef = db.collection('sadakyatra').doc('reservation');
      const collectionsData = await getAllCollectionsInDocument(resDef);
      
      res.render('reservation-edit', { message:'SadakYatra',data :collectionsData });
    } catch (error) {
      res.status(500).send('Error getting users');
    }
    });

    //to reservation update
    app.post('/reservation-update',upload.none(),async (req, res) => {
      console.log("reservation-update", req.body);
      const { uid , location ,status} = req.body;
    console.log(uid);
    console.log(location);
    console.log(status);
      // await alert("success");
    try{
      await db.collection('sadakyatra').doc('reservation').collection(location).doc(uid).update(
        {
          status :status
        }
      ); 
      res.status(200).send('success');
    } catch (error) {
        console.log(error);
        res.status(500).send('failed');
    }
      console.log('Form data received successfully');
      
    });

  //to delete reservation
app.post('/delete-reservation',upload.none(), async (req, res) => {
  try {
    const { uid , location} = req.body;
    console.log(uid);
    console.log(location);
    await db.collection('sadakyatra').doc('reservation').collection(location).doc(uid).delete(); 
    res.status(200).json('success');
  } catch (error) {
    console.log(error);
    res.status(500).json('failed');
  }
});
  
  //to render bus-edit
app.get('/bus-edit', async(req, res) => {
   console.log('Hello World!');
    try {
      const resDef = db.collection('sadakyatra').doc('busTicketDetails');
      const collectionsData = await getAllCollectionsInDocument(resDef);
      
      // console.log(collectionsData);

      res.render('bus-edit', { message:'SadakYatra',data :collectionsData });
    } catch (error) {
      res.status(500).send('Error getting users');
      // var message = "Error Getting Users!"
      // alert(message);
    }
  });



  //to create news and package data
 app.post('/package-create',upload.single('image'),async (req, res) => {
  //  alert("success");
  try {
    const name = req.body.name;
    const price = req.body.price;
    const package = req.body.package;
   
    const imageFile = req.file;
    const folderName = "tour_packages_images";

    if (!imageFile) {
      return res.status(400).send('Image file and description are required.');
    }
    const resultArray = imageFile.originalname.split('.');
    const imageName = resultArray[0];
    const modifiedName = replaceSpacesWithHyphens(imageName);
    const modifiedUserImage = (name+'-'+ modifiedName);
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

    //generate uid 
    const userDocRef = db.collection('sadakyatra').doc('packages').collection(package).doc();
    const userId = userDocRef.id;
    console.log(userId);
    // Store description and image URL in Firestore
    await userDocRef.set({
      uid: userId,
      name: name,
      price: price,
      location:package,
      imageUrl: url,
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    });

    console.log(modifiedName);

  res.status(200).send('Files uploaded successfully');
  } catch (error) {
    console.error('Error uploading files:', error);
    res.status(500).send('Error uploading files');
  }

});
  
//to delete package
app.post('/delete-package',upload.none(), async (req, res) => {
  try {
    const { uid , package} = req.body;
    console.log(uid);
    console.log(package);
    await db.collection('sadakyatra').doc('packages').collection(package).doc(uid).delete();
    res.status(200).json('success');
  } catch (error) {
    console.log(error);
    res.status(500).json('failed');
  }
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

  //to update bus data
app.post('/bus-create',upload.none(),async (req, res) => {
    console.log("bus-create");
    // await alert("success");
  try{
    const { busName, busNumber, location, price, busType } = req.body;
    console.log('Bus Name:', busName);
    console.log('Bus Number:', busNumber);
    console.log('Location:', location);
    console.log('Price:', price);
    console.log('Bus Type:', busType);
    console.log(req.body);
 
    //generate uid 
    const userDocRef = db.collection('sadakyatra').doc('busTicketDetails').collection(location).doc();
    const userId = userDocRef.id;
    console.log(userId);
    // Store description and image URL in Firestore
    await userDocRef.set({
      uid: userId,
      busName: busName,
      busNumber: busNumber,
      location: location,
      busType: busType,
      price: price,
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    });

    console.log(userId);
    res.status(200).json('success');
    }catch(e){
      console.log(e);
      res.status(500).json('failed');
    }
   
  });

//to delete bus
app.post('/delete-bus',upload.none(), async (req, res) => {
  try {
    const { uid , location} = req.body;
    console.log(uid);
    console.log(location);
    await db.collection('sadakyatra').doc('busTicketDetails').collection(location).doc(uid).delete();
    res.status(200).json('success');
  } catch (error) {
    console.log(error);
    res.status(500).json('failed');
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

    //generate uid 
    const userDocRef = db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').doc();
    const userId = userDocRef.id;
    console.log(userId);
    // Store description and image URL in Firestore
    await userDocRef.set({
      uid: userId,
      username: username,
      email: email,
      password: password,
      contact: contact,
      imageUrl: url,
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    });

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
    await db.collection('sadakyatra').doc('userDetailsDatabase').collection('users').doc(userId).delete();
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

