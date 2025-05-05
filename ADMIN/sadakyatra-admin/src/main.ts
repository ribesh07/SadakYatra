import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { AppModule } from './app.module';
import { join } from 'path';
import { config } from 'dotenv';
import { ValidationPipe } from '@nestjs/common';
import * as session from 'express-session';
import * as flash from 'express-flash';

async function bootstrap() {
  config();
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  app.enableCors({
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    preflightContinue: false,
  });
  app.useStaticAssets(join(__dirname, '..', 'public'), {
    prefix: '/public/',
  });
  app.useBodyParser('urlencoded', { extended: true });

  app.setBaseViewsDir(join(__dirname, '..', 'views'));
  app.setViewEngine('ejs');
  app.useGlobalPipes(new ValidationPipe());
  app.use(
    session({
      secret: process.env.SESSION_SECRET,
      resave: false,
      saveUninitialized: true,
    }),
  );

  app.use(flash());

  await app.listen(process.env.PORT || 3000);

  console.log(`Server is running for : ${process.env.FIREBASE_PROJECT_ID}`);
  console.log(`Application is running on: ${await app.getUrl()}`);
}
bootstrap();
