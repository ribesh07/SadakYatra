import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Redirect,
  Render,
  Req,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { messaging } from 'firebase-admin';
import { UpdateUserDto } from './dto/update-users.dto';
import { CreateUserDto } from './dto/users.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  @Render('users') //for rendering a view named 'users.ejs'
  async getUsers() {
    const users = await this.usersService.getUsers();
    return { users };
  }

  // Create a user
  @Post('create')
  @Redirect('/users') //for rendering a view named 'users.ejs'
  async createUser(@Body() body: CreateUserDto, @Req() req: any) {
    const user = await this.usersService.createUser(body);
    req.flash('success', `${body.name} created successfully!`);
  }

  // Render a form to update a user
  @Post('update/:id')
  @Redirect('/users')
  async updateUser(
    @Param('id') id: any,
    @Body() body: UpdateUserDto,
    @Req() req: any,
  ) {
    // Validate the body using class-validator or any other validation library
    console.log('body', body);
    console.log('id', id);
    await this.usersService.updateUser(id, body);
    req.flash('success', `${body.name} updated successfully!`);
  }

  @Post('delete/:id')
  @Redirect('/users') //for rendering a view named 'users.ejs'
  async deleteUser(@Param('id') id: any, @Req() req: any) {
    const result = await this.usersService.deleteUser(id);
    req.flash('success', result.message);
  }

  //END of the code
}
