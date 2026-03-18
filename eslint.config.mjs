import { defineConfig, globalIgnores } from 'eslint/config';
import spellbookx from 'eslint-plugin-spellbookx';

export default defineConfig([
  globalIgnores([
    'apps/server/src/models/prisma/**',
    'apps/server/www/**',
    'apps/www/.react-router/**',
  ]),
  spellbookx.configs.recommended,
]);
