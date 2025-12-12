# Sovereign Core

This repository contains the **enforcement core** of the Sovereign Trader Institute system. It is not a product or course; it is the backend and frontend scaffold that governs access to all external‑facing and internal‑facing assets.

## Architecture overview

The core is a Next.js application backed by Supabase for authentication, row‑level security (RLS) enforced storage, and a simple state machine for mode management. It is deployed to Vercel. This repository includes no content, curriculum, or business logic. Instead, it provides:

- A mode engine that controls visibility of assets based on system‑assigned states (entry, active, restricted, recovery, exit).
- Strict role‑based access control (RBAC) with **no discretionary overrides**.
- Logging of all user interactions for governance audits.
- Stubs for Supabase schemas and RLS policies (see `supabase/` and `policies/`).

## Getting started

1. Install dependencies:

   ```bash
   npm install
   ```

2. Copy the `.env.example` file to `.env.local` and fill in your Supabase project URL and service keys. These values are generated from your own Supabase project settings.

3. Run the development server:

   ```bash
   npm run dev
   ```

4. Open [http://localhost:3000](http://localhost:3000) in your browser. You should see a blank page; the UI will be built incrementally as enforcement layers are added.

## Repository structure

```
sovereign-core/
├── app/                 # Next.js app router components
│   ├── layout.tsx       # Root layout
│   └── page.tsx         # Landing page
├── lib/                 # Client‑side helpers (Supabase client, auth)
├── supabase/            # SQL schema definitions and seed data
├── policies/            # Documentation for Supabase RLS policies
├── scripts/             # Auxiliary scripts (e.g. seeding)
├── package.json         # Project metadata and scripts
└── README.md            # This file
```

The `app` directory uses the Next.js App Router. The default layout provided here contains no styling or business logic. All enforcement logic will be added progressively.

## Notes

This codebase is intentionally minimal. There are **no pages, components, or styles** beyond what is needed to boot a Next.js application and connect to Supabase. As you build out the enforcement system, avoid adding any content, motivators, or explanations. Every file added should enforce a rule, capture telemetry, or manage state. When in doubt, leave it out.