-- =============================================================
--  BANCO DE DADOS: Gerenciamento de Eventos - Vale do Paraíba
--  Arquivo de dados corrigido
--  Correções aplicadas para garantir resultado em todas as
--  consultas a) → j)
-- =============================================================

USE gerenciamento_eventos;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE evento_servico;
TRUNCATE TABLE inscricao;
TRUNCATE TABLE ocorrencia_evento;
TRUNCATE TABLE evento;
TRUNCATE TABLE local_evento;
TRUNCATE TABLE zona;
TRUNCATE TABLE organizador;
TRUNCATE TABLE tipo_evento;
TRUNCATE TABLE tipo_ingresso;
TRUNCATE TABLE servico_adicional;
TRUNCATE TABLE participante;
TRUNCATE TABLE cidade;
TRUNCATE TABLE regiao;
SET FOREIGN_KEY_CHECKS = 1;

-- =====================================================================
-- 1. CIDADE
-- =====================================================================
INSERT INTO cidade (nome, estado) VALUES
  ('Sao Jose dos Campos','SP'),  -- id 1
  ('Jacarei','SP'),              -- id 2
  ('Taubate','SP'),              -- id 3
  ('Pindamonhangaba','SP'),      -- id 4
  ('Lorena','SP'),               -- id 5
  ('Guaratingueta','SP'),        -- id 6
  ('Cruzeiro','SP'),             -- id 7
  ('Cachoeira Paulista','SP'),   -- id 8
  ('Aparecida','SP'),            -- id 9
  ('Cacapava','SP');             -- id 10

-- =====================================================================
-- 2. REGIAO
-- =====================================================================
INSERT INTO regiao (nome) VALUES
  ('Vale do Paraiba'),           -- id 1
  ('Serra da Mantiqueira'),      -- id 2
  ('Litoral Norte'),             -- id 3
  ('Alto Tiete'),                -- id 4
  ('Bragantina');                -- id 5

-- =====================================================================
-- 3. ZONA
-- CORREÇÃO: Adicionada zona 'Central' para SJC (id_cidade=1)
--           necessária para a consulta e)
-- =====================================================================
INSERT INTO zona (nome, id_cidade) VALUES
  ('Sul',     1),   -- id 1  → SJC Sul     (consulta a)
  ('Norte',   1),   -- id 2  → SJC Norte
  ('Leste',   1),   -- id 3  → SJC Leste
  ('Oeste',   1),   -- id 4  → SJC Oeste
  ('Central', 1),   -- id 5  → SJC Central (consulta e) ← CORRIGIDO: antes não existia
  ('Sul',     2),   -- id 6  → Jacareí Sul
  ('Norte',   2),   -- id 7  → Jacareí Norte
  ('Central', 2),   -- id 8  → Jacareí Central
  ('Sul',     3),   -- id 9  → Taubaté Sul
  ('Central', 3),   -- id 10 → Taubaté Central
  ('Sul',     4),   -- id 11 → Pinda Sul
  ('Central', 4),   -- id 12 → Pinda Central
  ('Sul',     5),   -- id 13 → Lorena Sul
  ('Central', 5),   -- id 14 → Lorena Central
  ('Sul',     6),   -- id 15 → Guaratinguetá Sul
  ('Central', 6),   -- id 16 → Guaratinguetá Central
  ('Sul',     7),   -- id 17 → Cruzeiro Sul
  ('Central', 7),   -- id 18 → Cruzeiro Central
  ('Sul',     8),   -- id 19 → Cachoeira Sul
  ('Central', 8),   -- id 20 → Cachoeira Central
  ('Sul',     9),   -- id 21 → Aparecida Sul
  ('Central', 9),   -- id 22 → Aparecida Central
  ('Sul',     10),  -- id 23 → Caçapava Sul
  ('Central', 10);  -- id 24 → Caçapava Central

-- =====================================================================
-- 4. TIPO_EVENTO
-- =====================================================================
INSERT INTO tipo_evento (descricao) VALUES
  ('Show Musical'),            -- id 1
  ('Congresso Cientifico'),    -- id 2
  ('Workshop de Tecnologia'),  -- id 3
  ('Palestra Motivacional'),   -- id 4
  ('Feira Gastronomica'),      -- id 5
  ('Festival de Arte'),        -- id 6
  ('Seminario de Saude'),      -- id 7
  ('Conferencia de Negocios'), -- id 8
  ('Show de Stand-up'),        -- id 9
  ('Festival de Musica');      -- id 10

-- =====================================================================
-- 5. ORGANIZADOR
-- =====================================================================
INSERT INTO organizador (nome, cpf_cnpj, email, telefone) VALUES
  ('Carlos Silva',      '100.000.000-00', 'carlos.silva@eventos.com',      '(12) 99000-1001'),
  ('Ana Paula Santos',  '100.000.000-01', 'ana.paula@eventos.com',         '(12) 99000-1002'),
  ('Roberto Ferreira',  '100.000.000-02', 'roberto.ferreira@eventos.com',  '(12) 99000-1003'),
  ('Juliana Costa',     '100.000.000-03', 'juliana.costa@eventos.com',     '(12) 99000-1004'),
  ('Marcos Oliveira',   '100.000.000-04', 'marcos.oliveira@eventos.com',   '(12) 99000-1005'),
  ('Fernanda Lima',     '100.000.000-05', 'fernanda.lima@eventos.com',     '(12) 99000-1006'),
  ('Eduardo Souza',     '100.000.000-06', 'eduardo.souza@eventos.com',     '(12) 99000-1007'),
  ('Patricia Alves',    '100.000.000-07', 'patricia.alves@eventos.com',    '(12) 99000-1008'),
  ('Ricardo Mendes',    '100.000.000-08', 'ricardo.mendes@eventos.com',    '(12) 99000-1009'),
  ('Camila Rodrigues',  '100.000.000-09', 'camila.rodrigues@eventos.com',  '(12) 99000-1010'),
  ('Felipe Carvalho',   '100.000.000-10', 'felipe.carvalho@eventos.com',   '(12) 99000-1011'),
  ('Mariana Pereira',   '100.000.000-11', 'mariana.pereira@eventos.com',   '(12) 99000-1012'),
  ('Andre Barbosa',     '100.000.000-12', 'andre.barbosa@eventos.com',     '(12) 99000-1013'),
  ('Aline Nascimento',  '100.000.000-13', 'aline.nascimento@eventos.com',  '(12) 99000-1014'),
  ('Guilherme Rocha',   '100.000.000-14', 'guilherme.rocha@eventos.com',   '(12) 99000-1015');

-- =====================================================================
-- 6. TIPO_INGRESSO
-- =====================================================================
INSERT INTO tipo_ingresso (descricao, preco) VALUES
  ('Inteira',   80.00),   -- id 1
  ('Meia',      40.00),   -- id 2
  ('VIP',      200.00),   -- id 3
  ('Estudante', 30.00),   -- id 4
  ('Gratuito',   0.00);   -- id 5

-- =====================================================================
-- 7. SERVICO_ADICIONAL
-- =====================================================================
INSERT INTO servico_adicional (tipo, descricao, fornecedor) VALUES
  ('buffet',     'Buffet completo 200 pax',       'Buffet Sabor Arte'),   -- id 1
  ('som',        'Sistema PA 5kW',                'Audio Pro SJC'),       -- id 2
  ('iluminacao', 'LED cenico completo',           'LightShow Brasil'),    -- id 3
  ('seguranca',  'Equipe 10 segurancas',          'SecureEvent SJC'),     -- id 4
  ('outro',      'Decoracao completa',            'Arte Eventos'),        -- id 5
  ('buffet',     'Coffee break executivo',         'Buffet Requinte'),     -- id 6
  ('som',        'Line array 500 pax',            'Som Total'),           -- id 7
  ('iluminacao', 'Moving heads e strobes',        'LED Show'),            -- id 8
  ('seguranca',  'Equipe 20 segurancas',          'Guarda Forte'),        -- id 9
  ('outro',      'Transmissao ao vivo',           'Criativos Eventos'),   -- id 10
  ('buffet',     'Jantar de gala',                'Buffet Requinte'),     -- id 11
  ('som',        'Microfones e retorno',          'Som Total'),           -- id 12
  ('iluminacao', 'Projecao mapeada',              'LED Show'),            -- id 13
  ('seguranca',  'Monitoramento CCTV',            'Guarda Forte'),        -- id 14
  ('outro',      'Foto e video profissional',     'Criativos Eventos');   -- id 15

-- =====================================================================
-- 8. LOCAL_EVENTO
-- Legenda de zonas usadas:
--   id_zona  1 = Sul     SJC  (cidade 1)   → consulta a)
--   id_zona  5 = Central SJC  (cidade 1)   → consulta e)
--   demais zonas para outras cidades
--
-- Legenda de regiões:
--   id_regiao 1 = Vale do Paraiba         → consulta i)
--   id_regiao 2 = Serra da Mantiqueira    → consulta c)
-- =====================================================================
INSERT INTO local_evento (nome, endereco, capacidade_maxima, tipo_ambiente, id_zona, id_cidade, id_regiao) VALUES
  -- Locais em SJC - Zona Sul (id_zona=1) / Vale do Paraiba
  ('Centro de Convencoes Jaguari',  'Av. Shishima, 100',   300, 'aberto',  1, 1, 1),  -- id  1
  ('Espaco Sul Premium',            'Rua das Flores, 200', 500, 'aberto',  1, 1, 1),  -- id  2
  ('Arena Sul Aberta',              'Rua Brasil, 300',     800, 'aberto',  1, 1, 1),  -- id  3

  -- Locais em SJC - Zona Central (id_zona=5) / Vale do Paraiba
  ('Teatro Municipal SJC',          'Rua XV de Nov, 400',  400, 'aberto',  5, 1, 1),  -- id  4  ← Central SJC aberto (consulta e)
  ('Ginasio Central SJC',           'Rua Central, 500',    600, 'fechado', 5, 1, 1),  -- id  5
  ('Parque Central SJC',            'Av. Central, 600',   1000, 'aberto',  5, 1, 1),  -- id  6  ← Central SJC aberto (consulta e)

  -- Locais em SJC - Zona Norte / Vale do Paraiba
  ('Auditorio ETEP',                'Rua ETEP, 700',       500, 'fechado', 2, 1, 1),  -- id  7
  ('Ginasio Norte SJC',             'Rua Norte, 800',     1000, 'fechado', 2, 1, 1),  -- id  8

  -- Locais em SJC - Serra da Mantiqueira
  ('Centro Eventos Mantiqueira SJC','Rua Serra, 900',      400, 'fechado', 2, 1, 2),  -- id  9
  ('Arena Mantiqueira SJC',         'Rua Alta, 1000',      700, 'misto',   2, 1, 2),  -- id 10

  -- Locais em Jacareí / Vale do Paraiba
  ('Salao Nobre Jacarei',           'Rua Jacarei, 100',    300, 'fechado', 6, 2, 1),  -- id 11
  ('Arena Cultural Jacarei',        'Av. Jacarei, 200',    600, 'aberto',  6, 2, 1),  -- id 12
  ('Centro Jacarei',                'Rua Rio, 300',        400, 'misto',   7, 2, 1),  -- id 13

  -- Locais em Taubaté / Vale do Paraiba
  ('Centro Convencoes Taubate',     'Rua Taubate, 100',    500, 'fechado', 9, 3, 1),  -- id 14
  ('Arena Taubate',                 'Av. Taubate, 200',    800, 'misto',   9, 3, 1),  -- id 15

  -- Locais em Pindamonhangaba / Vale do Paraiba
  ('Espaco Pindamonhangaba',        'Rua Pinda, 100',      300, 'fechado',11, 4, 1),  -- id 16
  ('Anfiteatro Pindamonhangaba',    'Av. Pinda, 200',      600, 'misto',  11, 4, 1),  -- id 17

  -- Locais em Lorena / Vale do Paraiba
  ('Casa de Cultura Lorena',        'Rua Lorena, 100',     400, 'aberto', 13, 5, 1),  -- id 18
  ('Centro Cultural Lorena',        'Av. Lorena, 200',     700, 'fechado',13, 5, 1),  -- id 19

  -- Locais em Guaratinguetá / Vale do Paraiba
  ('Salao Guaratingueta',           'Rua Guara, 100',      300, 'fechado',15, 6, 1),  -- id 20

  -- Locais em Cruzeiro / Serra da Mantiqueira
  ('Centro Cruzeiro',               'Rua Cruzeiro, 100',   400, 'fechado',17, 7, 2),  -- id 21
  ('Arena Cruzeiro',                'Av. Cruzeiro, 200',   600, 'misto',  17, 7, 2),  -- id 22

  -- Locais em Cachoeira Paulista / Serra da Mantiqueira
  ('Auditorio Cachoeira',           'Rua Cachoeira, 100',  300, 'fechado',19, 8, 2),  -- id 23
  ('Espaco Cachoeira',              'Av. Cachoeira, 200',  500, 'misto',  19, 8, 2),  -- id 24

  -- Locais em Aparecida / Valle do Paraiba
  ('Espaco Aparecida',              'Rua Aparecida, 100',  400, 'fechado',21, 9, 1),  -- id 25
  ('Arena Aparecida',               'Av. Aparecida, 200',  700, 'misto',  21, 9, 1);  -- id 26

-- =====================================================================
-- 9. EVENTO
-- Mapeamento dos requisitos por consulta:
--   a) ≥1 evento: SJC, zona Sul, inscricoes_abertas=1, data_inicio 2026-06-03 a 2026-09-03
--   b) ≥1 evento: SJC ou Jacareí, com inscrições, data_inicio últimos 5 meses (jan/2026-jun/2026)
--   c) ≥1 evento: local com id_regiao=2 (Serra da Mantiqueira)
--   d) ≥1 inscrição por ano em 2022, 2023, 2024, 2025
--   e) ≥1 evento: SJC Central, tipo_ambiente=aberto, inscritos >= capacidade_maxima
--   f) ≥1 participante feminina adulta inscrita por tipo de evento
--   g) ≥1 participante com presença=1 em >1 evento no último ano (jun/2025-jun/2026)
--   h) ≥1 evento cancelado/adiado em SJC nos últimos 10 anos com ocorrencia
--   i) ≥1 local com eventos no Vale do Paraiba (id_regiao=1)
--   j) ≥1 evento_servico com evento de 2026
-- =====================================================================
INSERT INTO evento (nome, descricao, data_inicio, data_fim, capacidade_maxima, status, inscricoes_abertas, id_tipo, id_local, id_organizador) VALUES

  -- ---------------------------------------------------------------
  -- EVENTOS 2022 (consulta d - faturamento 2022)
  -- ---------------------------------------------------------------
  -- ev 1: SJC/Sul, ativo, 2022 → inscrições d)
  ('Festival Verao SJC 2022',    'Festival de verao',   '2022-01-15 20:00:00', '2022-01-15 23:00:00', 300, 'encerrado', 0, 1,  1, 1),
  -- ev 2: Jacareí, 2022
  ('Congresso Tech Jacarei 2022','Congresso tecnologia','2022-03-10 09:00:00', '2022-03-10 18:00:00', 500, 'encerrado', 0, 2, 12, 2),
  -- ev 3: Taubaté, 2022
  ('Workshop Empreend 2022',     'Workshop empreend',   '2022-06-05 14:00:00', '2022-06-05 18:00:00', 200, 'encerrado', 0, 3, 14, 3),
  -- ev 4: SJC/Central, cancelado, 2022 → consulta h)
  ('Show MPB SJC 2022',          'Show de MPB',         '2022-09-10 20:00:00', '2022-09-10 23:00:00', 400, 'cancelado', 0, 1,  4, 4),
  -- ev 5: SJC/Central, adiado, 2022 → consulta h)
  ('Palestra Lideranca SJC 2022','Palestra lideranca',  '2022-11-20 18:00:00', '2022-11-20 21:00:00', 300, 'adiado',   0, 4,  5, 5),

  -- ---------------------------------------------------------------
  -- EVENTOS 2023 (consulta d - faturamento 2023)
  -- ---------------------------------------------------------------
  -- ev 6: SJC/Sul, 2023
  ('Rock no Parque SJC 2023',    'Show de rock',        '2023-02-18 20:00:00', '2023-02-18 23:00:00', 800, 'encerrado', 0, 1,  2, 6),
  -- ev 7: Jacareí, 2023
  ('Feira Gastro Jacarei 2023',  'Feira gastronomica',  '2023-05-06 10:00:00', '2023-05-06 20:00:00', 600, 'encerrado', 0, 5, 12, 7),
  -- ev 8: SJC/Serra Mantiqueira, 2023 → consulta c)
  ('Congresso Mantiqueira 2023', 'Congresso cientifico','2023-07-22 09:00:00', '2023-07-22 18:00:00', 400, 'encerrado', 0, 2,  9, 8),
  -- ev 9: Lorena, 2023
  ('Seminario Saude Lorena 2023','Seminario de saude',  '2023-09-14 09:00:00', '2023-09-14 18:00:00', 300, 'encerrado', 0, 7, 18, 9),
  -- ev 10: SJC/Central, cancelado, 2023 → consulta h)
  ('Festival Danca SJC 2023',    'Festival de danca',   '2023-11-03 15:00:00', '2023-11-03 22:00:00', 500, 'cancelado', 0, 6,  6,10),

  -- ---------------------------------------------------------------
  -- EVENTOS 2024 (consulta d - faturamento 2024)
  -- ---------------------------------------------------------------
  -- ev 11: SJC/Sul, 2024
  ('Summit TI Vale 2024',        'Summit de TI',        '2024-02-03 09:00:00', '2024-02-03 18:00:00', 500, 'encerrado', 0, 8,  1, 1),
  -- ev 12: Jacareí, 2024
  ('Jazz Night Jacarei 2024',    'Show de jazz',        '2024-04-13 20:00:00', '2024-04-13 23:00:00', 300, 'encerrado', 0, 1, 12, 2),
  -- ev 13: Serra Mantiqueira, 2024 → consulta c)
  ('Workshop Mantiqueira 2024',  'Workshop tecnologia', '2024-06-08 09:00:00', '2024-06-08 18:00:00', 200, 'encerrado', 0, 3, 10, 3),
  -- ev 14: SJC/Central aberto, lotado → consulta e) [capacidade_maxima=50, receberá 50 inscrições]
  ('Expo Arte Central SJC 2024', 'Exposicao de arte',   '2024-08-17 10:00:00', '2024-08-17 18:00:00',  50, 'encerrado', 0, 6,  4, 4),
  -- ev 15: Taubaté, 2024
  ('Conferencia Negoc Taubate 2024','Conferencia negoc','2024-10-05 09:00:00', '2024-10-05 18:00:00', 400, 'encerrado', 0, 8, 14, 5),

  -- ---------------------------------------------------------------
  -- EVENTOS 2025 (consulta d - faturamento 2025)
  -- ---------------------------------------------------------------
  -- ev 16: SJC/Sul, 2025
  ('Show Sertanejo SJC 2025',    'Show sertanejo',      '2025-01-11 20:00:00', '2025-01-11 23:00:00', 800, 'encerrado', 0, 1,  1, 6),
  -- ev 17: Jacareí, 2025
  ('Feira Arte Jacarei 2025',    'Feira de artesanato', '2025-03-08 10:00:00', '2025-03-08 18:00:00', 500, 'encerrado', 0, 5, 11, 7),
  -- ev 18: SJC/Serra Mantiqueira → consulta c)
  ('Summit Mantiqueira SJC 2025','Summit tecnologia',   '2025-04-26 09:00:00', '2025-04-26 18:00:00', 300, 'encerrado', 0, 2,  9, 8),
  -- ev 19: SJC/Central aberto, adiado → consulta h)
  ('Congresso Saude SJC 2025',   'Congresso saude',     '2025-07-19 09:00:00', '2025-07-19 18:00:00', 400, 'adiado',   0, 7,  4, 9),
  -- ev 20: SJC/Sul, 2025 (para participantes com presença no último ano → consulta g)
  ('Festival MPB SJC 2025',      'Festival de MPB',     '2025-09-06 19:00:00', '2025-09-06 23:00:00', 500, 'encerrado', 0, 1,  2, 10),
  -- ev 21: SJC/Sul, 2025 (outro evento para participantes multi-presença → consulta g)
  ('Rock Urbano SJC 2025',       'Show rock urbano',    '2025-11-22 20:00:00', '2025-11-22 23:00:00', 500, 'encerrado', 0, 1,  3, 11),

  -- ---------------------------------------------------------------
  -- EVENTOS 2026 (consultas a, b, j)
  -- ---------------------------------------------------------------
  -- ev 22: SJC/Sul, inscricoes_abertas=1, 2026-07 → consulta a)
  ('Festival Inverno Sul SJC 2026','Festival de inverno','2026-07-05 18:00:00', '2026-07-05 23:00:00', 300, 'ativo',   1, 1,  1, 1),
  -- ev 23: SJC/Sul, inscricoes_abertas=1, 2026-08 → consulta a)
  ('Show Acoustic Sul SJC 2026', 'Show acustico',        '2026-08-15 19:00:00', '2026-08-15 22:00:00', 200, 'ativo',   1, 1,  2, 2),
  -- ev 24: Jacareí, 2026 → consulta b) (últimos 5 meses desde jun/2026)
  ('Congresso Tech Jacarei 2026','Congresso tech',       '2026-02-07 09:00:00', '2026-02-07 18:00:00', 400, 'encerrado', 0, 2, 11, 3),
  -- ev 25: SJC, 2026 → consulta b)
  ('Feira Gastro SJC 2026',      'Feira gastronomica',  '2026-03-14 10:00:00', '2026-03-14 20:00:00', 500, 'encerrado', 0, 5,  1, 4),
  -- ev 26: SJC/Central aberto, 2026 → consulta e) com lotação [cap=30]
  ('Expo Design Central SJC 2026','Expo design',         '2026-06-20 10:00:00', '2026-06-20 18:00:00',  30, 'ativo',   1, 6,  6, 5),
  -- ev 27: Jacareí, 2026 → consulta b) com inscrições
  ('Workshop Jacarei 2026',      'Workshop tecnologia', '2026-04-18 09:00:00', '2026-04-18 18:00:00', 200, 'encerrado', 0, 3, 12, 6),
  -- ev 28: SJC/Serra Mantiqueira, 2026 → consulta c) + j)
  ('Forum Mantiqueira 2026',     'Forum regional',      '2026-05-09 09:00:00', '2026-05-09 18:00:00', 300, 'encerrado', 0, 8,  9, 7),
  -- ev 29: SJC/Sul, 2026 com serviços → consulta j)
  ('Conferencia Vale 2026',      'Conferencia regional','2026-05-30 09:00:00', '2026-05-30 18:00:00', 400, 'encerrado', 0, 8,  1, 8),
  -- ev 30: Jacareí, 2026 com serviços → consulta j)
  ('Summit Tech Jacarei 2026',   'Summit de tecnologia','2026-01-17 09:00:00', '2026-01-17 18:00:00', 350, 'encerrado', 0, 2, 13, 9);

-- =====================================================================
-- 10. OCORRENCIA_EVENTO
-- Consulta h): eventos cancelados/adiados em SJC (locais 1-10) nos últimos 10 anos
--   - ev 4 (cancelado, SJC Central, 2022)
--   - ev 5 (adiado,    SJC Central, 2022)
--   - ev 10 (cancelado, SJC Central, 2023)
--   - ev 19 (adiado,   SJC Central, 2025)
-- =====================================================================
INSERT INTO ocorrencia_evento (id_evento, tipo, motivo, data_registro, nova_data) VALUES
  ( 4, 'cancelamento', 'Condicoes climaticas adversas',   '2022-09-02', NULL),
  ( 5, 'adiamento',    'Reformas no local',               '2022-11-10', '2023-01-28 18:00:00'),
  (10, 'cancelamento', 'Problemas com fornecedores',      '2023-10-20', NULL),
  (19, 'adiamento',    'Aguardando alvara da prefeitura', '2025-07-05', '2026-02-21 09:00:00');

-- =====================================================================
-- 11. PARTICIPANTE
-- Precisamos de:
--   - Participantes femininas adultas (≥18 anos) com inscrições → f)
--   - Participantes com presença em >1 evento no último ano (jun/2025-jun/2026) → g)
-- =====================================================================
INSERT INTO participante (nome, cpf, data_nascimento, genero, email, telefone) VALUES
  -- id 1: masculino, adulto
  ('Joao Silva',        '200.000.000-00', '1990-03-15', 'masculino', 'joao.silva@gmail.com',        '(12) 98000-0001'),
  -- id 2: feminino, adulta → consulta f) e g)
  ('Maria Santos',      '200.000.000-01', '1995-07-20', 'feminino',  'maria.santos@gmail.com',      '(12) 98000-0002'),
  -- id 3: masculino
  ('Pedro Oliveira',    '200.000.000-02', '1988-11-02', 'masculino', 'pedro.oliveira@gmail.com',    '(12) 98000-0003'),
  -- id 4: feminino, adulta → consulta f) e g)
  ('Ana Costa',         '200.000.000-03', '1992-05-14', 'feminino',  'ana.costa@gmail.com',         '(12) 98000-0004'),
  -- id 5: masculino
  ('Lucas Souza',       '200.000.000-04', '1985-09-30', 'masculino', 'lucas.souza@gmail.com',       '(12) 98000-0005'),
  -- id 6: feminino, adulta → consulta f)
  ('Juliana Ferreira',  '200.000.000-05', '1998-01-25', 'feminino',  'juliana.ferreira@gmail.com',  '(12) 98000-0006'),
  -- id 7: masculino
  ('Mateus Alves',      '200.000.000-06', '1982-06-08', 'masculino', 'mateus.alves@gmail.com',      '(12) 98000-0007'),
  -- id 8: feminino, adulta → consulta f)
  ('Larissa Mendes',    '200.000.000-07', '2000-12-19', 'feminino',  'larissa.mendes@gmail.com',    '(12) 98000-0008'),
  -- id 9: masculino
  ('Gabriel Rodrigues', '200.000.000-08', '1993-04-11', 'masculino', 'gabriel.rodrigues@gmail.com', '(12) 98000-0009'),
  -- id 10: feminino, adulta → consulta f)
  ('Fernanda Lima',     '200.000.000-09', '1987-08-03', 'feminino',  'fernanda.lima@gmail.com',     '(12) 98000-0010'),
  -- id 11: masculino
  ('Rafael Carvalho',   '200.000.000-10', '1979-02-27', 'masculino', 'rafael.carvalho@gmail.com',   '(12) 98000-0011'),
  -- id 12: feminino, adulta
  ('Camila Pereira',    '200.000.000-11', '1996-10-16', 'feminino',  'camila.pereira@gmail.com',    '(12) 98000-0012'),
  -- id 13: masculino
  ('Vinicius Barbosa',  '200.000.000-12', '1991-03-22', 'masculino', 'vinicius.barbosa@gmail.com',  '(12) 98000-0013'),
  -- id 14: feminino, adulta
  ('Isabela Nascimento','200.000.000-13', '2003-07-09', 'feminino',  'isabela.nascimento@gmail.com','(12) 98000-0014'),
  -- id 15: masculino
  ('Caio Rocha',        '200.000.000-14', '1984-11-28', 'masculino', 'caio.rocha@gmail.com',        '(12) 98000-0015');

-- =====================================================================
-- 12. INSCRICAO
-- Requisitos:
--   b) Eventos 24,25,27 (SJC/Jacareí, últimos 5 meses de 2026) com múltiplos inscritos
--   d) Ao menos 1 inscrição por ano 2022, 2023, 2024, 2025 (baseado em data_inicio do evento)
--   e) Evento 14 (Central SJC aberto, cap=50): 50 inscrições (lotação exata)
--      Evento 26 (Central SJC aberto, cap=30): 30 inscrições (lotação exata)
--   f) Participantes femininas adultas em eventos de cada tipo
--   g) Participantes 2 e 4 com presente=1 em 2 eventos do último ano (ev 20 e ev 21)
--   i) Eventos em locais do Vale do Paraíba → já coberto pelos eventos acima
-- =====================================================================
INSERT INTO inscricao (id_evento, id_participante, id_tipo_ingresso, data_inscricao, presente, valor_pago) VALUES

  -- ----- Consulta d): faturamento 2022 (eventos 1,2,3) -----
  (1,  1, 1, '2022-01-10 10:00:00', 1,  80.00),
  (1,  2, 2, '2022-01-11 10:00:00', 1,  40.00),
  (1,  3, 3, '2022-01-12 10:00:00', 1, 200.00),
  (2,  4, 1, '2022-03-05 10:00:00', 1,  80.00),
  (2,  5, 2, '2022-03-06 10:00:00', 1,  40.00),
  (3,  6, 4, '2022-05-30 10:00:00', 1,  30.00),
  (3,  7, 1, '2022-06-01 10:00:00', 1,  80.00),

  -- ----- Consulta d): faturamento 2023 (eventos 6,7,8,9) -----
  (6,  1, 1, '2023-02-10 10:00:00', 1,  80.00),
  (6,  2, 3, '2023-02-11 10:00:00', 1, 200.00),
  (7,  3, 1, '2023-04-28 10:00:00', 1,  80.00),
  (7,  4, 2, '2023-04-29 10:00:00', 1,  40.00),
  (8,  5, 1, '2023-07-15 10:00:00', 1,  80.00),
  (8,  6, 4, '2023-07-16 10:00:00', 1,  30.00),
  (9,  7, 1, '2023-09-06 10:00:00', 1,  80.00),
  (9,  8, 2, '2023-09-07 10:00:00', 1,  40.00),

  -- ----- Consulta d): faturamento 2024 (eventos 11,12,13,14,15) -----
  (11, 1, 1, '2024-01-25 10:00:00', 1,  80.00),
  (11, 2, 3, '2024-01-26 10:00:00', 1, 200.00),
  (12, 3, 1, '2024-04-05 10:00:00', 1,  80.00),
  (12, 4, 2, '2024-04-06 10:00:00', 1,  40.00),
  (13, 5, 4, '2024-06-01 10:00:00', 1,  30.00),
  (13, 6, 1, '2024-06-02 10:00:00', 1,  80.00),
  (15, 7, 1, '2024-09-28 10:00:00', 1,  80.00),
  (15, 8, 2, '2024-09-29 10:00:00', 1,  40.00),

  -- ----- Consulta e): Evento 14 - Central SJC aberto - LOTAÇÃO (cap=50) -----
  (14,  1, 1, '2024-08-01 10:00:00', 1,  80.00),
  (14,  2, 2, '2024-08-01 10:00:00', 1,  40.00),
  (14,  3, 3, '2024-08-02 10:00:00', 1, 200.00),
  (14,  4, 4, '2024-08-02 10:00:00', 1,  30.00),
  (14,  5, 1, '2024-08-03 10:00:00', 1,  80.00),
  (14,  6, 2, '2024-08-03 10:00:00', 1,  40.00),
  (14,  7, 3, '2024-08-04 10:00:00', 1, 200.00),
  (14,  8, 4, '2024-08-04 10:00:00', 1,  30.00),
  (14,  9, 1, '2024-08-05 10:00:00', 1,  80.00),
  (14, 10, 2, '2024-08-05 10:00:00', 1,  40.00),
  (14, 11, 3, '2024-08-06 10:00:00', 1, 200.00),
  (14, 12, 4, '2024-08-06 10:00:00', 1,  30.00),
  (14, 13, 1, '2024-08-07 10:00:00', 1,  80.00),
  (14, 14, 2, '2024-08-07 10:00:00', 1,  40.00),
  (14, 15, 1, '2024-08-08 10:00:00', 1,  80.00),

  -- *** Para atingir exatamente 50 inscrições no evento 14, precisamos de mais 35.
  -- Usamos combinações de participantes com diferentes ingressos (sem duplicar par ev+part).
  -- Reusamos os ids de participante com datas diferentes (o UNIQUE é por ev+part, ok).
  -- Na verdade UNIQUE KEY proíbe repetição do mesmo participante no mesmo evento.
  -- Portanto ajustamos capacidade_maxima=15 para bater com os 15 inscritos.
  -- (O UPDATE abaixo corrige a capacidade para que HAVING funcione.)

  -- ----- Consulta d): faturamento 2025 (eventos 16,17,18,20,21) -----
  (16,  1, 1, '2025-01-05 10:00:00', 1,  80.00),
  (16,  2, 3, '2025-01-06 10:00:00', 1, 200.00),
  (16,  3, 2, '2025-01-07 10:00:00', 1,  40.00),
  (17,  4, 1, '2025-03-01 10:00:00', 1,  80.00),
  (17,  5, 2, '2025-03-02 10:00:00', 1,  40.00),
  (18,  6, 4, '2025-04-18 10:00:00', 1,  30.00),
  (18,  7, 1, '2025-04-19 10:00:00', 1,  80.00),

  -- ----- Consulta g): presença em >1 evento no último ano -----
  -- Participante 2 (feminino): presente nos eventos 20 e 21 (set e nov/2025)
  (20,  2, 1, '2025-08-25 10:00:00', 1,  80.00),
  (21,  2, 2, '2025-11-10 10:00:00', 1,  40.00),
  -- Participante 4 (feminino): presente nos eventos 20 e 21
  (20,  4, 3, '2025-08-26 10:00:00', 1, 200.00),
  (21,  4, 4, '2025-11-11 10:00:00', 1,  30.00),
  -- Participante 1 (masculino): presente nos eventos 20 e 21
  (20,  1, 2, '2025-08-27 10:00:00', 1,  40.00),
  (21,  1, 1, '2025-11-12 10:00:00', 1,  80.00),

  -- ----- Consulta b): inscrições em eventos de SJC/Jacareí nos últimos 5 meses 2026 -----
  -- Evento 24 (Jacareí, fev/2026): inscrições
  (24,  1, 1, '2026-01-28 10:00:00', 1,  80.00),
  (24,  2, 2, '2026-01-29 10:00:00', 1,  40.00),
  (24,  3, 3, '2026-01-30 10:00:00', 1, 200.00),
  (24,  4, 4, '2026-01-31 10:00:00', 1,  30.00),
  (24,  5, 1, '2026-02-01 10:00:00', 1,  80.00),
  -- Evento 25 (SJC, mar/2026): inscrições
  (25,  6, 1, '2026-03-07 10:00:00', 1,  80.00),
  (25,  7, 2, '2026-03-08 10:00:00', 1,  40.00),
  (25,  8, 3, '2026-03-09 10:00:00', 1, 200.00),
  (25,  9, 4, '2026-03-10 10:00:00', 1,  30.00),
  (25, 10, 1, '2026-03-11 10:00:00', 1,  80.00),
  (25, 11, 2, '2026-03-12 10:00:00', 1,  40.00),
  -- Evento 27 (Jacareí, abr/2026): inscrições
  (27,  1, 4, '2026-04-10 10:00:00', 1,  30.00),
  (27,  2, 1, '2026-04-11 10:00:00', 1,  80.00),
  (27,  3, 2, '2026-04-12 10:00:00', 1,  40.00),
  (27,  4, 3, '2026-04-13 10:00:00', 1, 200.00),
  -- Evento 28 (SJC/Mantiqueira, mai/2026): inscrições
  (28,  5, 1, '2026-05-01 10:00:00', 1,  80.00),
  (28,  6, 2, '2026-05-02 10:00:00', 1,  40.00),
  (28,  7, 3, '2026-05-03 10:00:00', 1, 200.00),
  -- Evento 29 (SJC/Sul, mai/2026): inscrições
  (29,  8, 1, '2026-05-22 10:00:00', 1,  80.00),
  (29,  9, 2, '2026-05-23 10:00:00', 1,  40.00),
  (29, 10, 4, '2026-05-24 10:00:00', 1,  30.00),
  -- Evento 30 (Jacareí, jan/2026): inscrições
  (30, 11, 1, '2026-01-10 10:00:00', 1,  80.00),
  (30, 12, 2, '2026-01-11 10:00:00', 1,  40.00),
  (30, 13, 3, '2026-01-12 10:00:00', 1, 200.00),

  -- ----- Consulta e): Evento 26 - Central SJC aberto 2026 - LOTAÇÃO (cap=30) -----
  -- Temos 15 participantes; ajustaremos capacidade para 15 via UPDATE
  (26,  1, 1, '2026-06-10 10:00:00', 0,  80.00),
  (26,  2, 2, '2026-06-11 10:00:00', 0,  40.00),
  (26,  3, 3, '2026-06-12 10:00:00', 0, 200.00),
  (26,  4, 4, '2026-06-13 10:00:00', 0,  30.00),
  (26,  5, 1, '2026-06-14 10:00:00', 0,  80.00),
  (26,  6, 2, '2026-06-15 10:00:00', 0,  40.00),
  (26,  7, 3, '2026-06-16 10:00:00', 0, 200.00),
  (26,  8, 4, '2026-06-17 10:00:00', 0,  30.00),
  (26,  9, 1, '2026-06-18 10:00:00', 0,  80.00),
  (26, 10, 2, '2026-06-19 10:00:00', 0,  40.00),
  (26, 11, 3, '2026-06-20 10:00:00', 0, 200.00),
  (26, 12, 4, '2026-06-21 10:00:00', 0,  30.00),
  (26, 13, 1, '2026-06-22 10:00:00', 0,  80.00),
  (26, 14, 2, '2026-06-23 10:00:00', 0,  40.00),
  (26, 15, 1, '2026-06-24 10:00:00', 0,  80.00);

-- Ajusta capacidade_maxima dos eventos com lotação para bater com o total de inscrições
-- Evento 14: 15 inscritos → capacidade = 15
-- Evento 26: 15 inscritos → capacidade = 15
UPDATE evento SET capacidade_maxima = 15 WHERE id_evento IN (14, 26);

-- =====================================================================
-- 13. EVENTO_SERVICO
-- Consulta j): serviços contratados em eventos de 2026
--   Usamos eventos 24, 25, 26, 27, 28, 29, 30 (todos de 2026)
-- =====================================================================
INSERT INTO evento_servico (id_evento, id_servico, custo) VALUES
  -- Evento 24 (Congresso Tech Jacareí 2026)
  (24,  1, 3500.00),   -- buffet
  (24,  2, 4500.00),   -- som
  (24,  3, 6000.00),   -- iluminacao
  (24,  4, 5000.00),   -- seguranca
  (24,  5, 2500.00),   -- outro
  -- Evento 25 (Feira Gastro SJC 2026)
  (25,  6, 4000.00),   -- buffet
  (25,  7, 5500.00),   -- som
  (25,  8, 7000.00),   -- iluminacao
  (25,  9, 6000.00),   -- seguranca
  (25, 10, 3000.00),   -- outro
  -- Evento 26 (Expo Design Central SJC 2026)
  (26,  1, 2500.00),   -- buffet
  (26,  2, 3500.00),   -- som
  (26, 11, 8000.00),   -- buffet jantar gala
  (26, 12, 4500.00),   -- som microfones
  -- Evento 27 (Workshop Jacareí 2026)
  (27,  2, 2000.00),   -- som
  (27,  4, 3000.00),   -- seguranca
  (27,  5, 1500.00),   -- outro
  (27, 13, 5000.00),   -- iluminacao projecao
  -- Evento 28 (Forum Mantiqueira 2026)
  (28,  1, 4500.00),   -- buffet
  (28,  3, 6500.00),   -- iluminacao
  (28,  9, 7000.00),   -- seguranca 20 pessoas
  (28, 14, 8500.00),   -- seguranca CCTV
  -- Evento 29 (Conferencia Vale 2026)
  (29,  6, 5000.00),   -- buffet coffee break
  (29,  7, 6000.00),   -- som line array
  (29, 10, 4000.00),   -- outro transmissao
  (29, 15, 3500.00),   -- outro foto/video
  -- Evento 30 (Summit Tech Jacareí 2026)
  (30,  2, 7000.00),   -- som PA
  (30,  8, 9000.00),   -- iluminacao moving heads
  (30,  4, 5500.00),   -- seguranca
  (30, 11, 6500.00);   -- buffet jantar gala

-- =====================================================================
-- FIM DO ARQUIVO
-- =====================================================================
