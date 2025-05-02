<?php
require __DIR__ .'/vendor/autoload.php';

use Google\Cloud\Firestore\FirestoreClient;

$config = array(
    'apiKey' => 'AIzaSyDw0EmozI0IJLFgkI91O3xeIo54z5KCLNE',
    'projectId' => 'sadakyatra-fd6de',
);

// $firestore = new FirestoreClient($config);

// $collectionReference = $firestore->collection('users');
// $documentReference = $collectionReference->document('ak');
// $snapshot = $documentReference->snapshot();

// echo "Hello " . $snapshot['name'];

$firestoreClient = new FirestoreClient($config);
