import { Test, TestingModule } from '@nestjs/testing';
import { CultivationController } from './cultivation.controller';
import { CultivationService } from './cultivation.service';

describe('CultivationController', () => {
  let controller: CultivationController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CultivationController],
      providers: [CultivationService],
    }).compile();

    controller = module.get<CultivationController>(CultivationController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
