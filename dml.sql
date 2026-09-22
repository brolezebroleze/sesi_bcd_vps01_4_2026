use manutencao_equipamentos;

insert into equipamento
values
('torno cnc 01', 'usinagem', 'hamborgue', 'centur 30d', 'cnc2023001', '2021-03-15', 'ativo', 'usinagem', 85000.00),
('prensa hidráulica 50t', 'prensa', 'prensahidro', 'ph-50', 'ph2019088', '2019-07-20', 'manutenção', 'estamparia', 45000.00),
('compressor parafuso', 'pneumático', 'schulz', 'srp 4015', 'cp2022500', '2022-01-10', 'ativo', 'utilidades', 28000.00);

insert into tecnico
values
('gabriel hamborgueres', 'mecânica industrial', '(19) 98765-4321', 'gabham@fabrica.com'),
('natalia so que buti', 'eletrotécnica', '(19) 97654-3210', 'nataliabuti@fabrica.com'),
('spleff beberrao', 'automação', '(19) 96543-2109', 'bebomuitaagua@fabrica.com');

insert into peca
values
('rolamento de esfera skibidbungis', 'rolamento blindado para eixos', 50, 10, 45.50),
('filtro de óleo hamborgueres', 'filtro para sistema de alta pressão', 20, 5, 120.00),
('correia em v so que nao v', 'correia de transmissão em borracha', 35, 8, 32.90);

insert into ordem_manutencao 
values
(1, 'preventiva', 'troca de óleo e calibração de eixos', '2026-03-01 08:00:00', '2026-03-01 09:00:00', '2026-03-01 12:00:00', 'concluída', 'média'),
(2, 'corretiva', 'vazamento no cilindro principal', '2026-03-05 14:30:00', '2026-03-05 15:00:00', null, 'em andamento', 'alta'),
(3, 'preventiva', 'substituição de filtros e verificação de correias', '2026-03-10 10:00:00', '2026-03-10 10:30:00', '2026-03-10 11:30:00', 'concluída', 'baixa');

insert into manutencao
values
(1, 1, 'realizada troca de rolamentos e alinhamento do barramento', '2026-03-01 09:00:00', 3.0, 'equipamento liberado em perfeito estado.'),
(2, 2, 'desmontagem do retentor e diagnóstico de vedação com defeito', '2026-03-05 15:00:00', 2.5, 'aguardando reparo do retentor.'),
(3, 3, 'limpeza geral e substituição preventiva do filtro de óleo', '2026-03-10 10:30:00', 1.0, 'próxima preventiva agendada para daqui a 6 meses.');

insert into peca_manutencao
values
(1, 1, 2),
(2, 2, 1),
(3, 2, 1);

select * from equipamento;
select * from tecnico;
select * from peca;
select * from ordem_manutencao;
select * from manutencao;
select * from peca_manutencao;