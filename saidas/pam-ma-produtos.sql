-- PAM 2025 Maranhao por produto: valor (mil R$)
-- Fonte: IBGE SIDRA tabela 5457, variavel 215, N3[21], classificacao 782 por produto
-- API ex: .../5457/periodos/2025/variaveis/215?localidades=N3[21]&classificacao=782[40124,40122,40106,40102,40099,40119,40136,40112,40092,40120]
-- Soja 40124=8921025, Milho 40122=2975809, Cana 40106=778886, Arroz 40102=305535, Algodao 40099=299591
SELECT categoria, valor FROM saidas_serie_pam_ma_valor;
