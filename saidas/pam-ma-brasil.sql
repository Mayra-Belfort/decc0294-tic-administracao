-- PAM participacao MA no Brasil
-- Fonte: IBGE SIDRA tabela 5457, variavel 215
-- MA 2025=13936879, BR 2025=928003291 -> 1,50%; MA 2024=12972489, BR 2024=783212909 -> 1,66%
-- APIs: .../5457/periodos/2024,2025/variaveis/215?localidades=N3[21] e ...?localidades=N1[1]
SELECT 'participacao MA/BR 2025' AS categoria, 1.5 AS valor_pct;
