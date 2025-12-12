--
-- Supabase schema for Sovereign Core
--

-- This file contains SQL definitions for tables required by the mode engine,
-- user management, logging, and asset gating. It does not include any
-- business data or content. After creating your Supabase project, run
-- these statements to set up the database.

-- Users table (authenticated users and coaches)
create table if not exists users (
  id uuid primary key default uuid_generate_v4(),
  email text not null unique,
  role text not null check (role in ('participant', 'coach', 'auditor', 'admin')), 
  mode text not null default 'entry' check (mode in ('entry','active','restricted','recovery','exit')),
  created_at timestamp with time zone default now()
);

-- Logs table (immutable audit trail)
create table if not exists logs (
  id bigserial primary key,
  user_id uuid references users(id),
  action text not null,
  metadata jsonb,
  created_at timestamp with time zone default now()
);

-- Example of an assets table controlling book access
create table if not exists book_access (
  user_id uuid references users(id),
  completed boolean default false,
  created_at timestamp with time zone default now(),
  primary key (user_id)
);

-- More tables will be added as the enforcement engine expands.