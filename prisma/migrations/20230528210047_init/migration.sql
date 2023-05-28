-- CreateTable
CREATE TABLE "Stations" (
    "fid" SERIAL NOT NULL,
    "id" SERIAL NOT NULL,
    "nimi" TEXT NOT NULL,
    "namn" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "osoite" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "kaupunki" TEXT NOT NULL,
    "stad" TEXT NOT NULL,
    "operator" TEXT NOT NULL,
    "kapasiteet" INTEGER NOT NULL,
    "x" DOUBLE PRECISION NOT NULL,
    "y" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Stations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Journeys" (
    "id" TEXT NOT NULL,
    "departure" TIMESTAMP(3) NOT NULL,
    "return" TIMESTAMP(3) NOT NULL,
    "departure_station_id" INTEGER NOT NULL,
    "departure_station_name" TEXT NOT NULL,
    "return_station_id" INTEGER NOT NULL,
    "return_station_name" TEXT NOT NULL,
    "covered_distance" INTEGER NOT NULL,
    "duration" INTEGER NOT NULL,

    CONSTRAINT "Journeys_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Stations_nimi_key" ON "Stations"("nimi");

-- CreateIndex
CREATE UNIQUE INDEX "Stations_namn_key" ON "Stations"("namn");

-- CreateIndex
CREATE UNIQUE INDEX "Stations_name_key" ON "Stations"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Stations_osoite_key" ON "Stations"("osoite");

-- CreateIndex
CREATE UNIQUE INDEX "Stations_address_key" ON "Stations"("address");

-- CreateIndex
CREATE UNIQUE INDEX "Stations_id_nimi_key" ON "Stations"("id", "nimi");

-- AddForeignKey
ALTER TABLE "Journeys" ADD CONSTRAINT "Journeys_departure_station_id_departure_station_name_fkey" FOREIGN KEY ("departure_station_id", "departure_station_name") REFERENCES "Stations"("id", "nimi") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journeys" ADD CONSTRAINT "Journeys_return_station_id_return_station_name_fkey" FOREIGN KEY ("return_station_id", "return_station_name") REFERENCES "Stations"("id", "nimi") ON DELETE RESTRICT ON UPDATE CASCADE;
