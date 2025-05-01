import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { ConfigModule } from '@nestjs/config';
import { AppService } from './app.service';
import { FirebaseService } from './firebase/firebase.service';
import { FirebaseModule } from './firebase/firebase.module';
import { UsersModule } from './users/users.module';

@Module({
  imports: [
    FirebaseModule,
    UsersModule,
    ConfigModule.forRoot({
      isGlobal: true, // Makes config accessible anywhere
    }),
  ],
  controllers: [AppController],
  providers: [AppService, FirebaseService],
})
export class AppModule {}
