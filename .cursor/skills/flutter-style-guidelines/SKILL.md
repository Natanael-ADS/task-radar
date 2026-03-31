---
name: flutter-style-guidelines
description: >-
  Define convenções de legibilidade e estilo para Flutter/Dart no projeto,
  incluindo nomes de parâmetros anônimos e escolha de builders reativos. Usar
  ao criar ou refatorar widgets, estado e UI em arquivos Dart.
---

# Flutter Style Guidelines

Aplicar estas convenções em código Flutter/Dart, respeitando a estrutura, componentes e libs já existentes no projeto.

## Convenções obrigatórias

- Em funções anônimas/closures, quando um parâmetro não for usado, nomear como `_`.
- Priorizar legibilidade e previsibilidade na árvore de widgets.
- Preferir APIs reativas mais explícitas para estado simples, evitando complexidade desnecessária.

## Builders reativos

- Para reagir a `Listenable` ou `ValueListenable` sem foco em animação visual, preferir `ListenableBuilder` ou `ValueListenableBuilder`.
- Evitar `AnimatedBuilder` quando ele estiver sendo usado apenas como "escutador genérico" e não para uma animação.
- Manter `AnimatedBuilder` quando o caso for de animação e a semântica dele ficar mais clara.

## Escopo de aplicação

- Aplicar ao implementar/refatorar widgets, telas, componentes, controllers e fluxo de estado em Dart.
- Reutilizar padrões e componentes já existentes antes de introduzir novos wrappers/helpers.

## Checklist rápido

- [ ] Parâmetros anônimos não usados foram nomeados como `_`.
- [ ] O builder escolhido reflete a intenção (`ListenableBuilder`/`ValueListenableBuilder` vs `AnimatedBuilder`).
- [ ] Código ficou mais legível sem alterar comportamento.
- [ ] Estrutura de pastas e padrões existentes do projeto foram respeitados.
