-- CreateTable
CREATE TABLE "journeys" (
    "id" SERIAL NOT NULL,
    "departure" TIMESTAMP(6) NOT NULL,
    "return" TIMESTAMP(6) NOT NULL,
    "departure_station_id" INTEGER NOT NULL,
    "departure_station_name" TEXT NOT NULL,
    "return_station_id" INTEGER NOT NULL,
    "return_station_name" TEXT NOT NULL,
    "covered_distance" REAL NOT NULL,
    "duration" INTEGER NOT NULL,

    CONSTRAINT "journeys_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stations" (
    "fid" SERIAL NOT NULL,
    "id" SERIAL NOT NULL,
    "name_fin" TEXT NOT NULL,
    "name_swe" TEXT NOT NULL,
    "name_eng" TEXT NOT NULL,
    "address_fin" TEXT NOT NULL,
    "address_swe" TEXT NOT NULL,
    "city_fin" TEXT NOT NULL,
    "city_swe" TEXT NOT NULL,
    "operator" TEXT,
    "capacity" INTEGER NOT NULL,
    "x_coord" DOUBLE PRECISION NOT NULL,
    "y_coord" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "stations_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "stations_fid_key" ON "stations"("fid");

-- AddForeignKey
ALTER TABLE "journeys" ADD CONSTRAINT "journeys_departure_station_id_fkey" FOREIGN KEY ("departure_station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "journeys" ADD CONSTRAINT "journeys_return_station_id_fkey" FOREIGN KEY ("return_station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

