create extension if not exists pgcrypto;

create table if not exists public.tickets (
  id uuid primary key default gen_random_uuid(),
  numero text,
  titulo text,
  descricao text,
  solicitante text,
  setor text,
  prioridade text,
  status text default 'Aberto',
  responsavel text,
  user_email text,
  created_at timestamptz default now()
);

alter table public.tickets enable row level security;

create policy "tickets_select_authenticated"
on public.tickets for select to authenticated using (true);

create policy "tickets_insert_authenticated"
on public.tickets for insert to authenticated with check (true);

create policy "tickets_update_authenticated"
on public.tickets for update to authenticated using (true);

create policy "tickets_delete_authenticated"
on public.tickets for delete to authenticated using (true);
