# Wnodex React Router Template

This is a full-stack template repository using [Wnodex](https://github.com/dcdavidev/wnodex), React Router, Prisma, and Turborepo.

## Project Structure

This is a monorepo managed by [pnpm workspaces](https://pnpm.io/workspaces) and [Turborepo](https://turbo.build/):

- `apps/server`: Node.js Express server using Prisma for database access and `wnodex` for integrating the frontend.
- `apps/www`: The frontend web application built with [React Router](https://reactrouter.com/) (v7) and Vite.

## Prerequisites

- [Node.js](https://nodejs.org/) (check `.nvmrc` for the recommended version)
- [pnpm](https://pnpm.io/) (v10)
- [Docker](https://www.docker.com/) (for running the PostgreSQL database locally)

## Getting Started

1. **Install dependencies:**

   ```bash
   pnpm install
   ```

2. **Start the local database:**

   ```bash
   pnpm run docker:up
   ```

3. **Run database migrations and generate Prisma client:**

   ```bash
   pnpm run prisma:migrate
   pnpm run prisma:generate
   ```

4. **Start the development servers:**
   ```bash
   pnpm run dev
   ```
   This command starts both the backend server and the frontend React Router application in watch mode.

## Scripts

From the root of the project, you can run the following commands:

- `pnpm run dev`: Starts the development environment for all apps.
- `pnpm run build`: Builds all applications for production.
- `pnpm run check-types`: Runs TypeScript type checking across all packages.
- `pnpm run lint`: Runs ESLint to check for code quality issues.
- `pnpm run fmt`: Runs Prettier to format the codebase.
- `pnpm run docker:up` / `pnpm run docker:down`: Starts or stops the local database via Docker Compose.
- `pnpm run prisma:migrate`: Runs Prisma database migrations for the development environment.
- `pnpm run prisma:generate`: Generates the Prisma client.

## Building for Production

To build the project for production, run:

```bash
pnpm run build
```

This will build both the frontend and the backend. The backend's `wnodex-build` command will automatically bundle the compiled server code and the frontend's static assets into `apps/server/dist/www`, creating a self-contained application ready for deployment.
