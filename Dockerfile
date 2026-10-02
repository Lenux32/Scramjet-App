FROM node:18-alpine

ENV NODE_ENV=production
ARG PNPM_VERSION=10.18.3
EXPOSE 8080/tcp

LABEL maintainer="Mercury Workshop"
LABEL summary="Scramjet Demo Image"
LABEL description="Example application of Scramjet"

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm@${PNPM_VERSION}

COPY ["package.json", "pnpm-lock.yaml", "./"]
RUN apk add --upgrade --no-cache python3 make g++
RUN pnpm install --frozen-lockfile --prod

COPY . .

ENTRYPOINT [ "node" ]
CMD ["src/index.js"]
