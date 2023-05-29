import { TRPCError } from "@trpc/server";
import { createTRPCRouter, publicProcedure } from "~/server/api/trpc";

export const journeyRouter = createTRPCRouter({
    getAll: publicProcedure.query(async ({ ctx }) => {
        const journeys = await ctx.prisma.journeys.findMany({
            take: 100,
            orderBy: [
                { departure_station_name: "asc" }
            ]
        });
        return journeys;
    }),
});
