---
name: clean-implementation
description: >-
  Orienta implementações com clean code, clean architecture, boas práticas,
  design system, padrões de estado (incl. state pattern quando aplicável) e
  design patterns. Usar ao implementar ou refatorar código, criar features,
  UI, camadas, fluxo de estado ou discutir arquitetura neste repositório.
---

# Implementação alinhada a padrões

Skill **genérica**: aplica a stack, pastas e convenções **já existentes** no projeto. Onde faltar norma local, propõe o mínimo consistente e deixa nota para o humano afinar.

## Regra de estrutura do projeto (obrigatória)

- Antes de criar novos diretórios/arquivos-base de arquitetura, mapear a estrutura existente e reutilizar o padrão já adotado.
- Se já existir pasta equivalente (ex.: `lib/app/di`, `lib/core`, `features/...`), usar essa estrutura e **não** criar hierarquia paralela.
- Evitar mover/renomear arquitetura sem pedido explícito.
- Em caso de dúvida entre dois padrões possíveis, pedir confirmação antes de criar uma nova organização.

## Clean code

- Nomes que revelam intenção; evitar abreviações opacas e "números mágicos" sem constante.
- Funções/métodos curtos, uma responsabilidade principal; extrair quando crescer demais.
- Comentários só para o "porquê" não óbvio; código legível em primeiro lugar.
- Duplicação: DRY com critério — não abstrair antes de haver segunda ocorrência real.
- Em funções anônimas/closures, quando um parâmetro não for usado, nomeá-lo como `_`.

## Regra obrigatória de comentários (clean code)

- Comentário é permitido apenas quando agrega contexto não óbvio (motivo da decisão, trade-off, restrição de negócio/técnica).
- É proibido comentar o óbvio ou descrever literalmente o que o código já expressa.
- Preferir clareza por nomes, funções pequenas e composição antes de adicionar comentários.
- Quando houver comentário, escrever curto, direto e atualizado com o comportamento real do código.

## Clean architecture

- Regras de negócio e contratos estáveis no núcleo; detalhes de framework, IO e UI nas bordas.
- Dependências apontam para **dentro**: domínio não importa camadas externas.
- Interfaces (ports) no núcleo ou fronteira estável; implementações (adapters) injetáveis (DI/factory).
- Respeitar a estrutura do repo (por feature, por camada, etc.); não inventar outra sem pedido explícito.

## Boas práticas

- Erros e falhas: vocabulário explícito (tipos/result/either conforme o projeto), sem engolir exceções silenciosamente.
- Testes no nível que o projeto já usa (unit, widget, integration); cobrir caminhos críticos e regressões.
- Segurança e I/O: validar inputs, timeouts, secrets fora do código versionado, quando relevante.
- Performance e acessibilidade: considerar quando impactam UX (listas grandes, foco, leitores de ecrã).

## Design system

- Priorizar **tokens** (cor, tipo, espaçamento, raio) e **componentes** já definidos no projeto.
- Não introduzir estilos ad hoc que quebrem consistência; se faltar componente, estender o DS ou alinhar com padrão existente.
- Estados de UI (loading, vazio, erro) tratados de forma uniforme com o restante app.

## Estado e state pattern

- Estados de UI/domínio **explícitos** (enum/sealed/union conforme linguagem); evitar combinações ambíguas de booleans.
- Onde fizer sentido, **State pattern** (ou estratégia equivalente) para comportamento que varia por estado, em vez de `if` encadeados gigantes.
- Transições claras; efeitos colaterais isolados (um sítio), não espalhados pela árvore sem critério.
- Alinhar com a solução de estado do projeto (BLoC, Provider, Redux, etc.) em vez de introduzir outra sem necessidade.

## Design patterns

- Usar padrão quando **reduz acoplamento** ou **clarifica extensão**; evitar padrão por moda ou over-engineering.
- Preferir composição quando bastar; herança só com contrato estável.
- Mencionar brevemente o trade-off quando a escolha não for óbvia (1–2 frases).

## Checklist rápido antes de concluir

- [ ] Verifiquei a estrutura existente e reutilizei o padrão já adotado.
- [ ] Evitei criar pastas/arquitetura paralela quando já havia equivalente no projeto.
- [ ] Camadas e imports respeitam a arquitetura do projeto.
- [ ] Nomes, erros e estados legíveis e consistentes com o código existente.
- [ ] Comentários seguem clean code (somente contexto não óbvio; sem descrever o óbvio).
- [ ] UI alinhada ao design system (ou justificativa mínima se exceção).
- [ ] Estado modelado sem ambiguidade; padrão de estado adequado ao caso.
- [ ] Testes ou extensão de testes quando o projeto exige.
