import { PartialType } from '@nestjs/mapped-types';
import { CreateUserDto } from './users.dto';

export class UpdateUserDto extends PartialType(CreateUserDto) {}
