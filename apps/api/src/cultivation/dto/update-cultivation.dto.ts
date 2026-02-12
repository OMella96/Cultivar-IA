import { PartialType } from '@nestjs/mapped-types';
import { CreateCultivationDto } from './create-cultivation.dto';

export class UpdateCultivationDto extends PartialType(CreateCultivationDto) { }
