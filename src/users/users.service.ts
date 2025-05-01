// src/users/users.service.ts
import { Injectable } from '@nestjs/common';
import { FirebaseService } from '../firebase/firebase.service';

@Injectable()
export class UsersService {
  private usersCollection: FirebaseFirestore.CollectionReference;

  constructor(private readonly firebaseService: FirebaseService) {
    const db = this.firebaseService.getFirestore();
    this.usersCollection = db.collection('users');
  }

  async createUser(data: any) {
    const doc = await this.usersCollection.add(data);
    return { id: doc.id };
  }

  async getUsers() {
    const snapshot = await this.usersCollection.get();
    return snapshot.docs.map((doc) => ({ id: doc.id, ...doc.data() }));
  }

  async updateUser(id: string, data: any) {
    await this.usersCollection.doc(id).update(data);
  }

  async deleteUser(id: string) {
    await this.usersCollection.doc(id).delete();
  }
}
