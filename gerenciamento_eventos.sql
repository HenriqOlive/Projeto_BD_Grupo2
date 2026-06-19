-- ============================================================
--  GERENCIAMENTO DE EVENTOS - VALE DO PARAÍBA
--  Consultas de Análise (Questões a → j)
-- ============================================================

USE gerenciamento_eventos;

-- ============================================================
-- a) Quantos eventos estão cadastrados para acontecer na
--    zona sul de São José dos Campos nos próximos 3 meses
--    e com inscrições abertas no momento?
-- ============================================================

SELECT
    COUNT(*)                    AS total_eventos
FROM evento e
JOIN local_evento le ON e.id_local    = le.id_local
JOIN zona z          ON le.id_zona    = z.id_zona
JOIN cidade c        ON z.id_cidade   = c.id_cidade
WHERE
    c.nome               = 'Sao Jose dos Campos'
    AND z.nome           = 'Sul'
    AND e.inscricoes_abertas = 1
    AND e.data_inicio    BETWEEN NOW()
                             AND DATE_ADD(NOW(), INTERVAL 3 MONTH);

-- ============================================================
-- b) Quais e quantos eventos tiveram o maior número de
--    participantes inscritos em Jacareí e São José dos
--    Campos nos últimos 5 meses?
-- ============================================================

SELECT
    e.nome                      AS evento,
    c.nome                      AS cidade,
    e.data_inicio,
    COUNT(i.id_inscricao)       AS total_inscritos
FROM evento e
JOIN local_evento le ON e.id_local        = le.id_local
JOIN cidade c        ON le.id_cidade      = c.id_cidade
JOIN inscricao i     ON i.id_evento       = e.id_evento
WHERE
    c.nome IN ('Sao Jose dos Campos', 'Jacarei')
    AND e.data_inicio >= DATE_SUB(NOW(), INTERVAL 5 MONTH)
GROUP BY
    e.id_evento, e.nome, c.nome, e.data_inicio
ORDER BY
    total_inscritos DESC;

WITH eventos_inscritos AS (
    SELECT
        e.id_evento,
        e.nome AS evento,
        c.nome AS cidade,
        COUNT(i.id_inscricao) AS total_inscritos
    FROM evento e
    JOIN local_evento le ON e.id_local = le.id_local
    JOIN cidade c ON le.id_cidade = c.id_cidade
    JOIN inscricao i ON i.id_evento = e.id_evento
    WHERE
        c.nome IN ('Sao Jose dos Campos', 'Jacarei')
        AND e.data_inicio >= DATE_SUB(NOW(), INTERVAL 5 MONTH)
    GROUP BY
        e.id_evento, e.nome, c.nome
)
SELECT COUNT(*) AS qtd_eventos_com_maximo
FROM eventos_inscritos
WHERE total_inscritos = (
    SELECT MAX(total_inscritos)
    FROM eventos_inscritos
);

-- ============================================================
-- c) Quais organizadores são responsáveis pela maior
--    quantidade de eventos realizados na região da
--    Serra da Mantiqueira?
-- ============================================================

SELECT
    o.nome                      AS organizador,
    o.email,
    o.telefone,
    COUNT(e.id_evento)          AS total_eventos
FROM organizador o
JOIN evento e        ON e.id_organizador = o.id_organizador
JOIN local_evento le ON e.id_local       = le.id_local
JOIN regiao r        ON le.id_regiao     = r.id_regiao
WHERE
    r.nome = 'Serra da Mantiqueira'
GROUP BY
    o.id_organizador, o.nome, o.email, o.telefone
ORDER BY
    total_eventos DESC;


-- ============================================================
-- d) Qual é o faturamento total obtido com a venda de
--    ingressos nos anos de 2022, 2023, 2024 e 2025?
-- ============================================================

SELECT
    YEAR(e.data_inicio)         AS ano,
    SUM(i.valor_pago)           AS faturamento_total
FROM inscricao i
JOIN evento e ON i.id_evento = e.id_evento
WHERE
    YEAR(e.data_inicio) IN (2022, 2023, 2024, 2025)
GROUP BY
    YEAR(e.data_inicio)
ORDER BY
    ano ASC;


-- ============================================================
-- e) Quantos e quais eventos atingiram a lotação máxima de
--    participantes e que ocorreram em ambiente aberto na
--    região central de São José dos Campos?
-- ============================================================

SELECT
    e.nome                      AS evento,
    e.capacidade_maxima,
    COUNT(i.id_inscricao)       AS total_inscritos,
    le.tipo_ambiente,
    z.nome                      AS zona,
    c.nome                      AS cidade
FROM evento e
JOIN local_evento le ON e.id_local    = le.id_local
JOIN zona z          ON le.id_zona    = z.id_zona
JOIN cidade c        ON z.id_cidade   = c.id_cidade
LEFT JOIN inscricao i ON i.id_evento  = e.id_evento
WHERE
    le.tipo_ambiente = 'aberto'
    AND z.nome       = 'Central'
    AND c.nome       = 'Sao Jose dos Campos'
GROUP BY
    e.id_evento, e.nome, e.data_inicio,
    e.capacidade_maxima, le.tipo_ambiente, z.nome, c.nome
HAVING
    COUNT(i.id_inscricao) >= e.capacidade_maxima
ORDER BY
    e.data_inicio DESC;

WITH eventos AS (
    SELECT
        e.id_evento,
        COUNT(i.id_inscricao) AS total_inscritos,
        e.capacidade_maxima
    FROM evento e
    JOIN local_evento le ON e.id_local = le.id_local
    JOIN zona z ON le.id_zona = z.id_zona
    JOIN cidade c ON z.id_cidade = c.id_cidade
    LEFT JOIN inscricao i ON i.id_evento = e.id_evento
    WHERE
        le.tipo_ambiente = 'aberto'
        AND z.nome = 'Central'
        AND c.nome = 'Sao Jose dos Campos'
    GROUP BY e.id_evento, e.capacidade_maxima
)
SELECT COUNT(*) AS qtd_eventos_lotados
FROM eventos
WHERE total_inscritos >= capacidade_maxima;

-- ============================================================
-- f) Qual é a média de participantes adultos e do gênero
--    feminino por cada tipo de evento cadastrado?
-- ============================================================

SELECT
    te.descricao                                            AS tipo_evento,
    COUNT(DISTINCT e.id_evento)                            AS total_eventos_do_tipo,
    COUNT(i.id_inscricao)                                  AS total_adultas_femininas,
    ROUND(
        COUNT(i.id_inscricao) /
        NULLIF(COUNT(DISTINCT e.id_evento), 0)
    , 2)                                                    AS media_por_evento
FROM tipo_evento te
JOIN evento e       ON e.id_tipo          = te.id_tipo
JOIN inscricao i    ON i.id_evento        = e.id_evento
JOIN participante p ON i.id_participante  = p.id_participante
WHERE
    p.genero = 'feminino'
    AND TIMESTAMPDIFF(YEAR, p.data_nascimento, CURDATE()) >= 18
GROUP BY
    te.id_tipo, te.descricao
ORDER BY
    media_por_evento DESC;


-- ============================================================
-- g) Quais participantes estiveram presentes em mais de
--    um evento no último ano?
-- ============================================================

SELECT
    p.nome                              AS participante,
    p.email,
    p.genero,
    TIMESTAMPDIFF(
        YEAR, p.data_nascimento, CURDATE()
    )                                   AS idade,
    COUNT(DISTINCT i.id_evento)         AS total_eventos_presente
FROM participante p
JOIN inscricao i ON i.id_participante = p.id_participante
JOIN evento e    ON i.id_evento       = e.id_evento
WHERE
    i.presente   = 1
    AND e.data_inicio >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY
    p.id_participante, p.nome, p.email, p.genero, p.data_nascimento
HAVING
    COUNT(DISTINCT i.id_evento) > 1
ORDER BY
    total_eventos_presente DESC;


-- ============================================================
-- h) Quais eventos foram cancelados ou adiados em São José
--    dos Campos nos últimos 10 anos e quais os motivos?
-- ============================================================

SELECT
    e.nome                      AS evento,
    e.data_inicio               AS data_original,
    e.status,
    oe.tipo                     AS tipo_ocorrencia,
    oe.motivo,
    oe.data_registro,
    oe.nova_data,
    c.nome                      AS cidade
FROM evento e
JOIN ocorrencia_evento oe ON oe.id_evento   = e.id_evento
JOIN local_evento le      ON e.id_local     = le.id_local
JOIN cidade c             ON le.id_cidade   = c.id_cidade
WHERE
    c.nome        = 'Sao Jose dos Campos'
    AND e.status  IN ('cancelado', 'adiado')
    AND oe.data_registro >= DATE_SUB(CURDATE(), INTERVAL 10 YEAR)
ORDER BY
    oe.data_registro DESC;

-- ============================================================
-- i) Quais e quantos locais receberam o maior número de
--    eventos em todo Vale do Paraíba?
-- ============================================================

SELECT
    le.nome                     AS local_evento,
    c.nome                      AS cidade,
    COUNT(e.id_evento)          AS total_eventos
FROM local_evento le
JOIN regiao r ON le.id_regiao   = r.id_regiao
JOIN cidade c ON le.id_cidade   = c.id_cidade
JOIN evento e ON e.id_local     = le.id_local
WHERE
    r.nome = 'Vale do Paraiba'
GROUP BY
    le.id_local, le.nome, le.tipo_ambiente, le.capacidade_maxima, c.nome
ORDER BY
    total_eventos DESC;

WITH locais AS (
    SELECT
        le.id_local,
        COUNT(e.id_evento) AS total_eventos
    FROM local_evento le
    JOIN regiao r ON le.id_regiao = r.id_regiao
    JOIN evento e ON e.id_local = le.id_local
    WHERE r.nome = 'Vale do Paraiba'
    GROUP BY le.id_local
)

SELECT COUNT(*) AS qtd_locais_com_max_eventos
FROM locais
WHERE total_eventos = (
    SELECT MAX(total_eventos) FROM locais
);

-- ============================================================
-- j) Quais serviços adicionais contratados geraram maior
--    custo total para os eventos em 2026?
-- ============================================================

SELECT
    sa.tipo                         AS tipo_servico,
    
    sa.descricao,
    sa.fornecedor,
    COUNT(es.id_evento_servico)     AS contratos_em_2026,
    SUM(es.custo)                   AS custo_total,
    AVG(es.custo)                   AS custo_medio_por_contrato
FROM servico_adicional sa
JOIN evento_servico es ON es.id_servico = sa.id_servico
JOIN evento e          ON es.id_evento  = e.id_evento
WHERE
    YEAR(e.data_inicio) = 2026
GROUP BY
    sa.id_servico, sa.tipo, sa.descricao, sa.fornecedor
ORDER BY
    custo_total DESC;
