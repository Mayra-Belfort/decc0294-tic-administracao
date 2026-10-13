# Turnover 2026-09 — CONFIRMADO (base: dados_simulados_turnover.csv)

> Período 2026-09 confirmado pela estudante. Todas as 3 ações aprovadas, com prioridade para Logística. Fonte única: `decc0294-tic-administracao/entregas/skill-turnover/dados_simulados_turnover.csv` (30 registros F001–F030, lidos integralmente, sem amostragem).

## 1. Período e headcount

- Período confirmado: 2026-09 (todos os 6 desligamentos com `data_desligamento` caem em 2026-09-08 a 2026-09-28).
- Critério headcount: inicial = admitidos até 2026-08-31 e ainda ativos em 2026-09-01; final = ativos após 2026-09-30.
- `headcount_inicial = 30` (contagem direta da base).
- `headcount_final = 24` (30 − 6 desligados + 0 admissões em setembro).
- `headcount_medio = (30 + 24) / 2 = 27`

## 2. Tabela resumo de KPIs

| KPI | Fórmula (skill) | Resultado |
|---|---|---|
| Desligados período | contagem `data_desligamento` em 2026-09 | 6 (F002, F003, F005, F008, F012, F025) |
| Voluntários | contagem motivo = voluntario | 4 |
| Involuntários | contagem motivo = involuntario | 2 |
| Indefinidos | motivo vazio | 0 |
| Turnover geral | (6 / 27) * 100 | **22,22%** |
| Turnover voluntário | (4 / 27) * 100 | **14,81%** |
| Turnover involuntário | (2 / 27) * 100 | **7,41%** |
| Admissões período | contagem `data_admissao` em 2026-09 | 0 |
| Early turnover 90d | (2 com tenure ≤90d / 0 admissões) * 100 | **não calculável (divisão por zero)** — 2 casos early: F008 (77d) e F025 (58d) |

Tenure = `data_desligamento − data_admissao` em dias. Calculado via Python: F002=819d, F003=1054d, F005=900d, F008=77d, F012=756d, F025=58d.

## 3. Quebra por área

Metodologia área: mesmo cálculo do geral aplicado ao headcount médio da área. Valores vindos da contagem por `area` normalizada em minúsculas.

| Área | HI | HF | HM | Deslig. | Turnover área |
|---|---|---|---|---|---|
| logistica | 6 | 4 | 5,0 | 2 (1 vol + 1 invol) | 40,00% |
| rh | 3 | 2 | 2,5 | 1 (1 vol) | 40,00% |
| atendimento | 6 | 5 | 5,5 | 1 (1 vol) | 18,18% |
| ti | 6 | 5 | 5,5 | 1 (1 invol) | 18,18% |
| vendas | 6 | 5 | 5,5 | 1 (1 vol) | 18,18% |
| financeiro | 3 | 3 | 3,0 | 0 | 0,00% |

## 4. Quebra por cargo

| Cargo | HI | HF | HM | Deslig. | Turnover cargo |
|---|---|---|---|---|---|
| desenvolvedor | 2 | 1 | 1,5 | 1 | 66,67% |
| estagiario | 3 | 2 | 2,5 | 1 | 40,00% |
| analista | 4 | 3 | 3,5 | 1 | 28,57% |
| assistente | 4 | 3 | 3,5 | 1 | 28,57% |
| atendente | 5 | 4 | 4,5 | 1 | 22,22% |
| vendedor | 5 | 4 | 4,5 | 1 | 22,22% |
| auxiliar | 1 | 1 | 1,0 | 0 | 0,00% |
| conferente | 2 | 2 | 2,0 | 0 | 0,00% |
| suporte | 2 | 2 | 2,0 | 0 | 0,00% |
| supervisor | 2 | 2 | 2,0 | 0 | 0,00% |

## 5. Faixa de tenure (só desligados 2026-09)

| Faixa | Qtd | Quem |
|---|---|---|
| 0–90d | 2 | F008 (77d), F025 (58d) |
| 91–180d | 0 | — |
| 181–365d | 0 | — |
| >365d | 4 | F002 (819d), F003 (1054d), F005 (900d), F012 (756d) |

## 6. Top 3 críticos

Áreas:
1. logistica — 40,00% (2/5,0)
2. rh — 40,00% (1/2,5)
3. atendimento / ti / vendas — 18,18% empatados (1/5,5 cada)

Cargos:
1. desenvolvedor — 66,67% (1/1,5) — atenção: base pequena (n=2)
2. estagiario — 40,00% (1/2,5)
3. analista / assistente — 28,57% (1/3,5 cada)

## 7. Plano aprovado — prioridade Logística

**PRIORIDADE 1 — Logística (2 saídas em HM 5,0 = 40,00%, número vindo de 2/5,0):**
- Semana 1: entrevista de desligamento padrão com roteiro (motivo real de F002 voluntário 819d e F003 involuntário 1054d — números vindos da tenure calculada). Dono: RH + gestão Logística.
- Semana 2: auditoria de escala/turno e condições com remanescentes F001, F017, F018, F027 (4 ativos, número vindo da contagem da área). Entrega: mapa de horas extras e pausa.
- Meta: zero saída em outubro. Acompanhar semanalmente.

2. Early (2 de 6 desligados com <90d, ambos voluntários — F008 77d e F025 58d, números vindos da tenure): buddy + checkpoint 30/60/90 para os 6 admitidos em ago/26. Dono: RH.
3. TI-desenvolvedor (1 saída em HM 1,5 = 66,67% — número vindo de 1/1,5, base pequena n=2): 1:1 de retenção + mapeamento de conhecimento de F012. Dono: gestão TI.

## 8. Limitações declaradas

- Período 2026-09 confirmado pela estudante em 13/10/2026.
- Early turnover pela fórmula oficial é impossível aqui porque `admissoes_periodo = 0` (número vindo da contagem de admissões em 2026-09). Alternativa (2/6 = 33,3% dos desligados são early) é informativa, não oficial.
- Taxas por cargo/área com n pequeno (ex.: desenvolvedor n=2) inflam o % — interpretar com cautela.
- Nomes anonimizados (só IDs F001–F030). Nenhum CPF/e-mail na fonte. Motivo `ativo` tratado como sem desligamento; nenhum `motivo_desligamento` vazio/indefinido nos desligados.
- Headcount_medio = 27 ≠ 0, então cálculo seguiu.

## 9. Decisão humana — resolvido

- [x] Período oficial confirmado: 2026-09.
- [x] Todas as 3 ações aprovadas, prioridade Logística.
- [ ] Pendente operacional: agendar entrevistas e auditoria de escala (com RH/Logística).
