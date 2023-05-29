/*
  Warnings:

  - You are about to drop the `Journeys` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Stations` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Journeys" DROP CONSTRAINT "Journeys_departure_station_id_departure_station_name_fkey";

-- DropForeignKey
ALTER TABLE "Journeys" DROP CONSTRAINT "Journeys_return_station_id_return_station_name_fkey";

-- DropTable
DROP TABLE "Journeys";

-- DropTable
DROP TABLE "Stations";

-- CreateTable
CREATE TABLE "journeys" (
    "id" SERIAL NOT NULL,
    "departure" TIMESTAMP(6),
    "return" TIMESTAMP(6),
    "departure_station_id" INTEGER,
    "departure_station_name" TEXT,
    "return_station_id" INTEGER,
    "return_station_name" TEXT,
    "covered_distance" REAL,
    "duration" INTEGER,

    CONSTRAINT "journeys_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stations" (
    "fid" SERIAL NOT NULL,
    "id" SERIAL NOT NULL,
    "name_fin" TEXT,
    "name_swe" TEXT,
    "name_eng" TEXT,
    "address_fin" TEXT,
    "address_swe" TEXT,
    "city_fin" TEXT,
    "city_swe" TEXT,
    "operator" TEXT,
    "capacity" INTEGER,
    "x_coord" DOUBLE PRECISION,
    "y_coord" DOUBLE PRECISION,

    CONSTRAINT "stations_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "stations_fid_key" ON "stations"("fid");

-- AddForeignKey
ALTER TABLE "journeys" ADD CONSTRAINT "journeys_departure_station_id_fkey" FOREIGN KEY ("departure_station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "journeys" ADD CONSTRAINT "journeys_return_station_id_fkey" FOREIGN KEY ("return_station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
