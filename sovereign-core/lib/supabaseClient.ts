import { createClient } from '@supabase/supabase-js';

/**
 * Client‑side Supabase instance.
 *
 * Uses the public anon key from your environment. Do not import this on the server
 * or expose sensitive keys. For server‑side operations, instantiate a separate
 * client with the service role key (see `lib/supabaseServer.ts`).
 */
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL as string;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY as string;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);