import { PrismaClient } from "@prisma/client";

async function main() {
  const prisma = new PrismaClient();

  const result = await prisma.transcriber.findOne({
    where: { id: "one" },
    select: {
      id: true,
      firstName: true,
      lastName: true,
      email: true,
      competencies: {
        select: {
          id: true,
          level: true,
          transcriberId: true,
          competency: {
            select: {
              id: true,
              type: true,
              name: true,
            },
          },
        },
      },
    },
  });
  console.log(result);
  prisma.disconnect();
}

main();
