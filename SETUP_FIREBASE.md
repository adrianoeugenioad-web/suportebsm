# ADSB 8.0 Online — Configuração inicial

Projeto Firebase conectado: `adsb-fc226`

## IMPORTANTE: senha do Firebase
O Firebase Authentication exige senha com **pelo menos 6 caracteres**.
Por isso, a antiga senha `2101` não pode ser usada diretamente no Authentication.

## 1. Publique as regras do Firestore
No Firebase:
1. Firestore → Regras.
2. Copie todo o conteúdo de `firestore.rules`.
3. Cole no editor de regras.
4. Clique em **Publicar**.

## 2. Crie SOMENTE o primeiro usuário administrador no Authentication
No Firebase:
1. Authentication → Usuários.
2. Clique em **Adicionar usuário**.
3. E-mail recomendado: `ariel@adsbregional.app`
4. Escolha uma senha de pelo menos 6 caracteres.
5. Salve.

Não precisa criar manualmente as 11 congregações no Authentication.
Depois do primeiro acesso, o próprio painel do ADSB criará os demais usuários.

## 3. Primeiro acesso
Abra o ADSB e entre com:
- Usuário: `ariel`
- Senha: a senha que você criou no Authentication.

Como o banco ainda não terá o perfil do administrador, aparecerá a tela **Primeira configuração**.
Clique em **Criar perfil Administrador**.

Isso criará:
- `usuarios/{UID_DO_ARIEL}`
- `config/app`

A partir daí o bootstrap fica encerrado e as regras passam a exigir o perfil administrador.

## 4. Cadastre as congregações
Administrador → Congregações → Nova.

## 5. Crie os acessos das congregações
Administrador → Mais → Gerenciar Usuários → Novo Usuário.

Exemplo:
- Nome: Congregação Canaã
- Usuário: `canaa`
- Senha: mínimo 6 caracteres
- Perfil: Pastor / Congregação
- Congregação: Canaã

O ADSB transforma `canaa` em `canaa@adsbregional.app` apenas internamente.
Na tela de login, o usuário pode digitar somente `canaa`.

## 6. Como funciona a segurança
- Administrador: lê e edita todos os dados.
- Congregação: lê apenas seus membros, obreiros e festividades.
- Secretário: pode editar dados da própria congregação.
- Consulta: somente leitura.
- Agenda Regional: todos os autenticados podem ler; só administrador edita.
- Congregações: cada usuário vê a própria; administrador vê todas.

## 7. GitHub Pages
Envie para a raiz do repositório:
- index.html
- manifest.json
- service-worker.js
- firestore.rules (pode ficar no repositório como referência)
- pastas css, js, img e icons

O GitHub Pages continuará hospedando o app. O Firebase será usado para login e banco.

## 8. Fotos
Esta versão não usa Firebase Storage para manter o projeto no plano Spark sem cartão.
A partir de fevereiro de 2026, Cloud Storage for Firebase exige Blaze.
A arte de login fica como arquivo estático no GitHub.

## 9. Coleções Firestore usadas
- config
- usuarios
- congregacoes
- obreiros
- membros
- festividades
- agendaRegional
