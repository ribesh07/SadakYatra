import { Body, Controller, Get, Param, Post, Render } from '@nestjs/common';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  @Render('users') //for rendering a view named 'users.ejs'
  async getUsers() {
    const users = await this.usersService.getUsers();
    return { users };
  }

  //Render a form to create a new user
  @Get('create')
  @Render('create-user') //for rendering a view named 'create-user.ejs'
  getCreateForm() {
    return {};
  }

  // Create a user
  @Get('create')
  @Render('/users') //for rendering a view named 'users.ejs'
  async createUser(@Body() body: any) {
    const user = await this.usersService.createUser(body);
    return { user };
  }

  // Render a form to update a user
  @Get('update/:id')
  @Render('/users') //for rendering a view named 'user.ejs'
  async getUpdateForm(@Param('id') id: string, @Body() body: any) {
    const user = await this.usersService.updateUser(id, body);
    return { user };
  }

  @Post('delete/:id')
  @Render('/users') //for rendering a view named 'users.ejs'
  async deleteUser(@Param('id') id: string) {
    await this.usersService.deleteUser(id);
    return { message: 'User deleted successfully' };
  }
}
