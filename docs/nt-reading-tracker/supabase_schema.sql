-- 在 Supabase SQL Editor 執行這段
create table if not exists public.reading_state (
  profile_key text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.reading_state enable row level security;

drop policy if exists "anon_select_reading_state" on public.reading_state;
create policy "anon_select_reading_state"
on public.reading_state
for select
to anon
using (true);

drop policy if exists "anon_insert_reading_state" on public.reading_state;
create policy "anon_insert_reading_state"
on public.reading_state
for insert
to anon
with check (true);

drop policy if exists "anon_update_reading_state" on public.reading_state;
create policy "anon_update_reading_state"
on public.reading_state
for update
to anon
using (true)
with check (true);
