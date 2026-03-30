# Arquitetura limpa no Flutter — perguntas, respostas e decisões

Documento de apoio para comunicar **raciocínio e trade-offs** (ex.: LinkedIn, README da equipe). Projeto: **task_radar** — camadas com **BLoC**, **DI**, **Go Router**, **l10n**, **tema claro/escuro**, estrutura preparada para testes.

---

## 1. O que é `lib/app/bootstrap/`?

- Código que roda **no início** do app, antes ou junto do `runApp`: DI, config de ambiente, cache, analytics, etc.
- **Objetivo:** `main` fino, ordem de inicialização explícita e fácil de testar/isolar.
- **Decisão:** separar “subir o mundo” da árvore de widgets raiz.

**Frase para post:** *“Bootstrap não é moda: é onde documento a ordem em que o app fica pronto — DI, env, serviços — sem inflar o `main`.”*

---

## 2. O que é `lib/app/observers/`?

- Classes que **observam eventos globais** (ex.: `BlocObserver` para transições/erros de todos os Blocs).
- Pode incluir observadores de **navegação** (`RouteObserver`) quando fizer sentido.
- **Decisão:** telemetria e debug centralizados, ligáveis por flavor (debug vs produção).

**Frase para post:** *“Observers globais ficam fora das features: um `BlocObserver` único para log e crash em todos os fluxos de estado.”*

---

## 3. O que entra em `lib/core/errors/`?

- **Vocabulário de falhas** estável: `Failure` (sealed/base), `NetworkFailure`, `ServerFailure`, etc.
- Repositórios retornam `Either<Failure, T>` / `Result`; BLoC mapeia para estado de UI.
- **Decisão:** domínio não depende de exceção crua de HTTP; detalhe de API fica em `data`.

**Frase para post:** *“`core/errors` não é ‘qualquer exception’: é o contrato de ‘o que pode dar errado’ que a UI e o domínio entendem.”*

---

## 4. O que entra em `lib/core/network/`?

- **Cliente HTTP** compartilhado: base URL, timeouts, interceptors (auth, log).
- **Não** entra endpoint específico de feature (isso vai em `features/.../data/datasources/remote`).
- **Decisão:** uma porta de saída configurada uma vez, injetada no DI.

**Frase para post:** *“Network no core é infraestrutura; o path `/tasks` mora no datasource da feature.”*

---

## 5. `lib/shared/` vs widgets da feature vs `core`

| Onde | O quê |
|------|--------|
| `features/.../presentation/widgets` | UI **só daquela** feature |
| `lib/shared/presentation/widgets` | UI **reutilizada** (botões padrão, loading, erro, vazio) |
| `lib/core` | **Sem** árvores de widget pesadas: tema (tokens), erros, rede, utils |

- **Decisão:** `core` = transversal técnico/estável; `shared` = componentes visuais globais. *(Dá para usar `core/ui` se o time preferir — é convenção.)*

**Frase para post:** *“Core não vira lixeira de widget: shared é onde a UI transversal mora sem misturar com HTTP e Failure.”*

---

## 6. Domain/Data por feature vs pastas globais `domain/` e `data/`

| Abordagem | Vantagem | Risco |
|-----------|----------|--------|
| **Por feature** (fatias verticais) | Fronteira de produto clara; remover/evoluir feature é local | Precisa disciplina para não duplicar; compartilhamento via `core`/`shared` |
| **Global** (`lib/domain`, `lib/data`) | Um lugar para ‘todos os repos’; bom domínio pequeno | App grande: pastas gigantes e acoplamento cruzado |

- **Decisão neste projeto:** estrutura **por feature** pensando em **escala**; ajustável extraindo contratos para `core` quando necessário.

**Frase para post:** *“Feature-first não é dogma: é cortar o acoplamento onde o produto cresce — com regra clara de quando algo sobe para o kernel.”*

---

## 7. Use case ou repository usado em outra feature — como organizar?

- Se **≥2 features** de produto precisam do mesmo contrato → **interface** (e muitas vezes a entidade) em **`core/domain`** ou **`shared/domain`** (kernel).
- **Implementação** em `core/data`, `shared/data` ou `features/X/data`, desde que outras features dependam só da **abstração** + **DI**.
- **Evitar:** `import` de `features/B/data` dentro de `features/A`.

**Frase para post:** *“Reutilização entre features = contrato no kernel, implementação registrada no DI — nunca importar a pasta `data` da vizinha.”*

---

## 8. `TaskRepository` em muitas telas — vai direto para `shared`?

- **Muitas telas na mesma feature** (lista, detalhe, edição) → pode ficar em **`features/tasks/domain`**.
- **Várias features** (Home, Relatórios, Tasks) → **contrato** `TaskRepository` (e `Task`) em **`core/domain`** (ou `shared/domain`); implementação onde fizer sentido + DI.
- **`shared`** no nosso layout é mais **UI**; contratos de domínio costumam ir para **`core/domain`**.

**Frase para post:** *“Usar em muitas telas não empurra tudo pro shared: só quando o conceito atravessa features é que o repositório vira contrato do core.”*

---

## 9. Exemplo mental (Task usado em Home + Tasks)

1. `core/domain/repositories/task_repository.dart` — `abstract class TaskRepository`.
2. `core/domain/entities/task.dart` — entidade compartilhada.
3. `features/tasks/data/repositories/task_repository_impl.dart` — implementação.
4. `home` e `tasks` recebem `TaskRepository` no BLoC via **DI**.
5. Registro único: `TaskRepository` → `TaskRepositoryImpl`.

---

## Resumo em uma linha (elevator pitch)

*Arquitetura limpa com BLoC: app só compõe (bootstrap, DI, router, observers); core segura falhas, rede e contratos globais; features fecham domínio/dados/UI quando o contexto é local; qualquer coisa usada por várias features sobe para o kernel e entra por interface — testável e escalável sem pastas que viram monólito.*

---

*Documento gerado para registro interno do projeto **task_radar**. Atualize quando adotar novas convenções (ex.: pacotes internos, melos, etc.).*
