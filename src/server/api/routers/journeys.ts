import { TRPCError } from "@trpc/server";
import { createTRPCRouter, publicProcedure } from "~/server/api/trpc";

export const journeyRouter = createTRPCRouter({
    getAll: publicProcedure.query(async ({ ctx }) => {
        const journeys = await ctx.prisma.journeys.findMany({
            take: 100,
            orderBy: [
                { departure: "asc" }
            ]
        });
        return journeys;
    }),
});
