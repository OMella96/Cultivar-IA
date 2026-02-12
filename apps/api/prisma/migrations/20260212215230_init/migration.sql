-- CreateExtension
CREATE EXTENSION IF NOT EXISTS "vector";

-- CreateEnum
CREATE TYPE "PlantStage" AS ENUM ('SEEDLING', 'VEGETATIVE', 'FLOWERING', 'DRYING', 'CURING', 'HARVESTED');

-- CreateEnum
CREATE TYPE "LogType" AS ENUM ('WATERING', 'FEEDING', 'OBSERVATION', 'PHOTO', 'ISSUE_PEST', 'ISSUE_DEFICIENCY', 'ENV_CHANGE', 'STAGE_CHANGE');

-- CreateEnum
CREATE TYPE "EquipmentType" AS ENUM ('LIGHT', 'TENT', 'FAN', 'FILTER', 'HUMIDIFIER', 'DEHUMIDIFIER', 'POT', 'SUBSTRATE', 'SENSOR', 'OTHER');

-- CreateTable
CREATE TABLE "Organization" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "organizationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cultivation" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "organizationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Cultivation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Plant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "cultivationId" TEXT NOT NULL,
    "strainId" TEXT,
    "stage" "PlantStage" NOT NULL DEFAULT 'SEEDLING',
    "germinatedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Plant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Strain" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "breeder" TEXT,
    "type" TEXT,
    "floweringDays" INTEGER,

    CONSTRAINT "Strain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlantLog" (
    "id" TEXT NOT NULL,
    "plantId" TEXT NOT NULL,
    "type" "LogType" NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "data" JSONB,
    "notes" TEXT,
    "imageIds" TEXT[],
    "embedding" vector(1536),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlantLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CultivationLog" (
    "id" TEXT NOT NULL,
    "cultivationId" TEXT NOT NULL,
    "type" "LogType" NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "data" JSONB,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CultivationLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "EquipmentType" NOT NULL,
    "specification" JSONB,
    "organizationId" TEXT NOT NULL,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquipmentStack" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "cultivationId" TEXT,

    CONSTRAINT "EquipmentStack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquipmentStackItem" (
    "id" TEXT NOT NULL,
    "stackId" TEXT NOT NULL,
    "equipmentId" TEXT NOT NULL,
    "settings" JSONB,

    CONSTRAINT "EquipmentStackItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cultivation" ADD CONSTRAINT "Cultivation_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Plant" ADD CONSTRAINT "Plant_cultivationId_fkey" FOREIGN KEY ("cultivationId") REFERENCES "Cultivation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Plant" ADD CONSTRAINT "Plant_strainId_fkey" FOREIGN KEY ("strainId") REFERENCES "Strain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlantLog" ADD CONSTRAINT "PlantLog_plantId_fkey" FOREIGN KEY ("plantId") REFERENCES "Plant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CultivationLog" ADD CONSTRAINT "CultivationLog_cultivationId_fkey" FOREIGN KEY ("cultivationId") REFERENCES "Cultivation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentStack" ADD CONSTRAINT "EquipmentStack_cultivationId_fkey" FOREIGN KEY ("cultivationId") REFERENCES "Cultivation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentStackItem" ADD CONSTRAINT "EquipmentStackItem_stackId_fkey" FOREIGN KEY ("stackId") REFERENCES "EquipmentStack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentStackItem" ADD CONSTRAINT "EquipmentStackItem_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
