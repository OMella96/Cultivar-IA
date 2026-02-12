
import { IsString, IsOptional, IsDateString } from 'class-validator';

export class CreateCultivationDto {
    @IsString()
    name: string;

    @IsString()
    @IsOptional()
    description?: string;

    @IsDateString()
    @IsOptional()
    startDate?: string;
}
