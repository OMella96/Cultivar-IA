import { Module } from '@nestjs/common';
import { CultivationService } from './cultivation.service';
import { CultivationController } from './cultivation.controller';

@Module({
  controllers: [CultivationController],
  providers: [CultivationService],
})
export class CultivationModule {}
