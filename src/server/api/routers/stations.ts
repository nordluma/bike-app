import { TRPCError } from "@trpc/server";
import { z } from "zod";
import { createTRPCRouter, publicProcedure } from "~/server/api/trpc";

export const stationRouter = createTRPCRouter({
    getAll: publicProcedure.query(async ({ ctx }) => {
        const stations = await ctx.prisma.stations.findMany({
            select: {
                id: true,
                name_fin: true,
            },
            orderBy: {
                name_fin: "asc"
            }
        });
        return stations;
    }),
    getById: publicProcedure
        .input(z.object({ id: z.number() }))
        .query(async ({ ctx, input }) => {
            const station = await ctx.prisma.stations.findUnique({
                where: { id: input.id }
            });

            if (!station) {
                throw new TRPCError({
                    code: "NOT_FOUND",
                    message: "Station not found",
                })
            }

            return station
        })
});
