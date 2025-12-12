--
-- Row‑Level Security (RLS) policy definitions for Sovereign Core
--

-- Enable RLS on the tables
alter table users enable row level security;
alter table logs enable row level security;
alter table book_access enable row level security;

-- Users table: allow users to select and update their own row
create policy "Users: self read" on users
  for select
  using (auth.uid() = id);

create policy "Users: self update" on users
  for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- Logs table: allow inserting logs for yourself
create policy "Logs: insert self" on logs
  for insert
  with check (auth.uid() = user_id);

-- Logs table: allow users to read their own logs
create policy "Logs: self read" on logs
  for select
  using (auth.uid() = user_id);

-- Logs table: allow coaches to read participants' logs
-- This policy assumes there is a 'role' column in the users table.
create policy "Logs: coach read" on logs
  for select
  using (
    exists (
      select 1 from users u
      where u.id = auth.uid() and u.role = 'coach'
    )
  );

-- Book access table: allow users to read their own book access
create policy "Book: self read" on book_access
  for select
  using (auth.uid() = user_id);

-- Book access table: allow users to insert a row for themselves when book is assigned
create policy "Book: insert self" on book_access
  for insert
  with check (auth.uid() = user_id);

-- Note: Additional policies will be needed as more tables are added.
-- Review and adjust these policies before enabling them in production.