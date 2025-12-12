# Scripts

This directory contains scripts used to manage the Supabase database and seed initial data. Scripts are written in JavaScript or SQL and are executed manually by an administrator. They are *not* part of the public API.

## seed.ts

The `seed.ts` script (to be added) will populate the database with initial values such as modes, roles, and example users. It should be run once after setting up the Supabase project:

```bash
npx ts-node scripts/seed.ts
```

Before running any script, ensure that your environment variables are set up correctly (`.env.local`) and that you have installed all dependencies.