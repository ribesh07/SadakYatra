<?php

require __DIR__ .'/vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;

// // Path to your service account key JSON file
// $serviceAccount = ServiceAccount::fromJsonFile('/sadakyatra-firebase.json');

// // Initialize the Firebase Admin SDK
// $firebase = (new Factory)
//     ->withServiceAccount($serviceAccount)
//     ->create();

$firebase = (new Factory)
    ->withServiceAccount(__DIR__.'/sadakyatra-firebase.json')
    ->withDatabaseUri('https://sadakyatra-fd6de-default-rtdb.asia-southeast1.firebasedatabase.app/');

// Get Firestore instance
$firestore = $firebase->createFirestore();
$database = $firestore->database();

// Add a document to Firestore
$docRef = $database->collection('users')->document('user_123');
$docRef->set([
    'first' => 'John',
    'last' => 'Doe',
    'born' => 1990
]);

// Retrieve a document from Firestore
$snapshot = $docRef->snapshot();
if ($snapshot->exists()) {
    printf('Document data: %s' . PHP_EOL, json_encode($snapshot->data()));
} else {
    printf('Document does not exist!' . PHP_EOL);
}

// Update a document in Firestore
$docRef->update([
    ['path' => 'born', 'value' => 1991]
]);

// Delete a document from Firestore
$docRef->delete();

echo "Firestore operations completed successfully.";


