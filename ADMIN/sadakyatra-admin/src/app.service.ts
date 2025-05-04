import { Injectable } from '@nestjs/common';
import { FirebaseService } from './firebase/firebase.service';

@Injectable()
export class AppService {
  private usersCollection: FirebaseFirestore.CollectionReference;

  constructor(private readonly firebaseService: FirebaseService) {
    const db = this.firebaseService.getFirestore();
    this.usersCollection = db.collection('users');
  }
  async getHello() {
    const snapshot = await this.usersCollection.get();
    return snapshot.docs.map((doc) => ({ id: doc.id, ...doc.data() }));
  }
}
