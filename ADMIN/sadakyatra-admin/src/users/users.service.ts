// src/users/users.service.ts
import { Injectable } from '@nestjs/common';
import { FirebaseService } from 'src/firebase/firebase.service';
import { CreateUserDto } from './dto/users.dto';
import { UpdateUserDto } from './dto/update-users.dto';
import { v4 as uuidv4 } from 'uuid';

@Injectable()
export class UsersService {
  private usersCollection: FirebaseFirestore.CollectionReference;

  constructor(private readonly firebaseService: FirebaseService) {
    const db = this.firebaseService.getFirestore();
    this.usersCollection = db.collection('users');
  }

  async createUser(createUserDto: CreateUserDto) {
    const id = uuidv4(); // Generate unique ID

    const data = {
      id,
      name: createUserDto.name,
      email: createUserDto.email,
    };

    await this.usersCollection.doc(id).set(data);

    return data;
  }

  async getUsers() {
    const snapshot = await this.usersCollection.get();

    const users = snapshot.docs.map((doc) => ({
      id: doc.id, // <== document ID
      ...doc.data(), // <== document fields
    }));

    return users;
  }

  async updateUser(id: string, data: UpdateUserDto) {
    // const plainData = JSON.parse(JSON.stringify(data));
    const plainData = { ...data };

    console.log('plainData', plainData);
    await this.usersCollection.doc(id).update(plainData);
  }

  async deleteUser(id: string) {
    console.log('User deleted:', id);
    const docRef = this.usersCollection.doc(id);
    const doc = await docRef.get();
    if (!doc.exists) {
      throw new Error(`User with ID ${id} not found`);
    }
    console.log('User deleted:', doc.id, '=>', doc.data());
    const userData = doc.data() as CreateUserDto;
    await this.usersCollection.doc(id).delete();

    return { message: `User ${userData.name} deleted !!!` };
  }
}
