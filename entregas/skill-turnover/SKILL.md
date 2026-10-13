---
name: turnover
description: Use when analyzing employee turnover, taxa de turnover, desligamentos, relatorio RH mensal. Gera indicadores e relatorio a partir de HTML, CSV ou planilha.
---

# Análise de Turnover

Skill para transformar base de RH em indicadores e relatório mensal padronizado.

## Quando usar

Use ONLY when o usuário pedir análise de turnover, taxa de desligamento,
rotatividade por área/cargo, relatório mensal de RH.

Trigger keywords: turnover, rotatividade, desligamentos, retenção, relatório RH,
voluntário, involuntário, early turnover, headcount.

## Inputs esperados

1. Arquivo fonte: `.html`, `.csv`, `.xlsx` com pelo menos:
   - `data_admissao`
   - `data_desligamento` (vazio = ativo)
   - `area`, `cargo`
   - `motivo_desligamento` (voluntário / involuntário / indefinido)
   - `headcount` inicial/final ou lista de ativos
2. Período de análise: `YYYY-MM` ou intervalo. Se ausente, perguntar.

Se a fonte for HTML, extrair a tabela primeiro, depois tratar como CSV.

## Fórmulas (não alterar)

- `headcount_medio = (headcount_inicial + headcount_final) / 2`
- `turnover_geral = (desligados_periodo / headcount_medio) * 100`
- `turnover_voluntario = (desligados_voluntarios / headcount_medio) * 100`
- `turnover_involuntario = (desligados_involuntarios / headcount_medio) * 100`
- `early_turnover_90d = (desligados_com_tenure<=90d / admissoes_periodo) * 100`

Tenure em dias = `data_desligamento - data_admissao`.

## Passo a passo

1. Identificar período e ler fonte completa. Não amostrar.
2. Limpar dados: normalizar datas para ISO, area/cargo em minúsculas, motivo vazio = `indefinido`.
3. Calcular:
   - headcount inicial, final, médio
   - desligados total, voluntários, involuntários
   - turnover geral, voluntário, involuntário
   - quebra por area, cargo, faixa de tenure (0-90d, 91-180d, 181-365d, >365d)
4. Gerar arquivo `relatorio-turnover-YYYY-MM.md` com:
   - Tabela resumo de KPIs
   - Tabela por área e por cargo
   - Top 3 áreas/cargos críticos
   - 3 recomendações de retenção objetivas
5. Se `motivo_desligamento` ausente, marcar como `indefinido`. Nunca chutar motivo.

## Exemplo de saída

```markdown
# Turnover 2026-09
- Headcount médio: 210
- Turnover geral: 3.8% (8 desligados)
- Voluntário: 2.4% | Involuntário: 1.4%
- Early turnover 90d: 12.5%
- Área crítica: Logística 7.1%
```

## Regras

- Não inventar dados. Usar só o que está na fonte.
- Anonimizar nomes. Respeitar LGPD: não expor CPF, e-mail, dados sensíveis.
- Se headcount_medio = 0, abortar e pedir base correta.
- Após salvar qualquer mudança nesta skill, reiniciar o opencode para recarregar.
