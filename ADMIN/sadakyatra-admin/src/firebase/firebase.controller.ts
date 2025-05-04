import { Controller, Get } from '@nestjs/common';
import { FirebaseService } from './firebase.service';

@Controller('firebase')
export class FirebaseController {
  constructor(private readonly firebaseService: FirebaseService) {}

  @Get()
  getFirebaseInfo() {
    return {
      projectId: process.env.FIREBASE_PROJECT_ID,
      databaseURL: process.env.FIREBASE_DATABASE_URL,
    };
  }

  @Get('firebase-check')
  async firebaseCheck() {
    try {
      const user = await this.firebaseService
        .getFirestore()
        .collection('users');
      return { status: 'ok', message: 'Firebase is working', user };
    } catch (e) {
      return { status: 'error', message: e };
    }
  }
}
