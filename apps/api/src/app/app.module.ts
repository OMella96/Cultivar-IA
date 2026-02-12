import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CultivationModule } from '../cultivation/cultivation.module';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  imports: [PrismaModule, CultivationModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
