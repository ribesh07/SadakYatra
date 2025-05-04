import { Controller, Get, Render } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Render('index')
  async getHello(): Promise<{
    message: string;
    users: any[]; // Adjust the type according to your user data structure
  }> {
    const users = await this.appService.getHello();
    return { message: 'SaralYatra', users };
  }
}
