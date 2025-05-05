import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class CreateUserDto {
  @IsNotEmpty()
  @IsString()
  name: string | undefined;

  @IsNotEmpty()
  @IsEmail()
  email: string | undefined;

  id: any;
}
