import { createTRPCRouter, publicProcedure } from "~/server/api/trpc";

export const stationRouter = createTRPCRouter({
    getAll: publicProcedure.query(async ({ ctx }) => {
        const stations = await ctx.prisma.stations.findMany({
            orderBy: {
                name_fin: "asc"
            }
        });
        return stations;
    }),
});
