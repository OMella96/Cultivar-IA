import { Injectable } from '@nestjs/common';
import { CreateCultivationDto } from './dto/create-cultivation.dto';
import { UpdateCultivationDto } from './dto/update-cultivation.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class CultivationService {
  constructor(private readonly prisma: PrismaService) { }

  create(createCultivationDto: CreateCultivationDto) {
    // Assuming organizationId is required, for now hardcoding or expecting it in DTO
    // But DTO usually doesn't have it. We should extract it from user context later.
    // For MVP, we'll require it in DTO or use a default one if valid.

    // However, the generated DTO is empty. I will need to update DTO first.
    // Let's implement the service assuming standard Prisma calls.
    return this.prisma.cultivation.create({
      data: {
        ...createCultivationDto,
        organizationId: 'default-org-id', // TODO: Get from auth context
      } as any, // Temporary cast until DTO is updated
    });
  }

  findAll() {
    return this.prisma.cultivation.findMany({
      include: { plants: true },
    });
  }

  findOne(id: string) {
    return this.prisma.cultivation.findUnique({
      where: { id },
      include: { plants: true, logs: true },
    });
  }

  update(id: string, updateCultivationDto: UpdateCultivationDto) {
    return this.prisma.cultivation.update({
      where: { id },
      data: updateCultivationDto as any,
    });
  }

  remove(id: string) {
    return this.prisma.cultivation.delete({
      where: { id },
    });
  }
}
