import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CultivationService } from './cultivation.service';
import { CreateCultivationDto } from './dto/create-cultivation.dto';
import { UpdateCultivationDto } from './dto/update-cultivation.dto';

@Controller('cultivation')
export class CultivationController {
  constructor(private readonly cultivationService: CultivationService) { }

  @Post()
  create(@Body() createCultivationDto: CreateCultivationDto) {
    return this.cultivationService.create(createCultivationDto);
  }

  @Get()
  findAll() {
    return this.cultivationService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.cultivationService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCultivationDto: UpdateCultivationDto) {
    return this.cultivationService.update(id, updateCultivationDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.cultivationService.remove(id);
  }
}
