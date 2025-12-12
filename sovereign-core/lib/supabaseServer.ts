import { createClient } from '@supabase/supabase-js';

/**
 * Server‑side Supabase client using the service role key.
 *
 * This client should only be used in server actions and API routes. Never
 * expose the service role key to the browser.
 */
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL as string;
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY as string;

export const supabaseServer = createClient(
  supabaseUrl,
  supabaseServiceRoleKey,
  {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  }
);