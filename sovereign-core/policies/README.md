# Supabase Row‑Level Security (RLS) Policies

This directory documents the row‑level security policies required by the Sovereign Core. Policies enforce that users can only read or write data that aligns with their role and mode. Actual policy definitions live in your Supabase project and are not stored in this repository for security reasons.

## Principles

1. **Mode gating**: queries must include checks on the `mode` column in the `users` table. For example, participants in `entry` mode cannot read rows requiring `active` mode.
2. **Role gating**: coaches may read participant data but may not write it. Participants cannot read or write any other participant’s data. Auditors can read logs but cannot modify anything.
3. **No cross‑asset leakage**: each table has its own policies that do not reference other tables’ sensitive data.
4. **No discretionary overrides**: policies should never include OR conditions that give global access to certain user IDs or roles.

## Applying policies

After creating your schema, sign in to the [Supabase SQL editor](https://supabase.com/dashboard/project/_/sql) and define policies. Example stub:

```sql
-- Only allow inserting into logs if the user is authenticated
create policy "enable insert for authenticated users" on logs
  for insert
  using (auth.uid() = user_id);

-- Prevent participants from reading other participants' log entries
create policy "participants can only read their own logs" on logs
  for select
  using (
    auth.role() = 'authenticated' AND
    auth.uid() = user_id
  );
```

As the system evolves, update this documentation to reflect the full set of RLS rules.