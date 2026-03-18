# Stage 1: Builder
FROM node:24-slim AS builder

# Install dependencies including rsync for the sync script
RUN apt-get update && apt-get install -y rsync && rm -rf /var/lib/apt/lists/*

# Install pnpm and turbo
RUN npm install -g pnpm@10.30.3 turbo

WORKDIR /app

# Copy the entire workspace
COPY . .

# Install dependencies
RUN pnpm install --frozen-lockfile

# Run turbo build for the server
# This will trigger build:www (in apps/www) and sync (in apps/server)
RUN turbo run build

# Stage 2: Runner
FROM node:24-slim AS runner

RUN apt-get update && apt-get install -y --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Set production environment
ENV NODE_ENV=production

WORKDIR /opt/app

COPY --from=builder --chown=node:node /app/apps/server/dist/ .
COPY --from=builder --chown=node:node /app/apps/server/www ./www

# Install production dependencies
RUN npm install --omit=dev

USER node

EXPOSE 3000

CMD ["node", "main.js"]
