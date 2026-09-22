<div align="center">
   
# Projeto: Manutenção de Equipamentos
<img src="diagrama lógico.png" height="900"/>
 <div align="center"> </br>
 <details>
      <summary>Modelo Conceitual</summary>
<div align="center">
<img src="modelo conceitual.png" height="600"/>
</details>
  

##

# Dicionário de Dados


| Entidade | Atributo | Tipo | Tamanho | Descrição |
| --- | --- | --- | --- | --- |
| Equipamento | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Equipamento | nome | Texto | 100 | Nome do equipamento |
| Equipamento | tipo | Texto | 50 | Tipo do equipamento |
| Equipamento | marca | Texto | 50 | Marca do equipamento |
| Equipamento | modelo | Texto | 50 | Modelo do equipamento |
| Equipamento | numero_serie | Texto | 50 | Número de série do equipamento |
| Equipamento | data_aquisicao | Data | - | Data de aquisição do equipamento |
| Equipamento | status | Texto | 30 | Status atual do equipamento |
| Equipamento | setor | Texto | 50 | Setor onde o equipamento está alocado |
| Equipamento | valor_aquisicao | Decimal | 10,2 | Valor de aquisição do equipamento |
| Ordem de Manutenção | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Ordem de Manutenção | id_equipamento | Inteiro | 11 | Identificador do equipamento, FK referenciando Equipamento (id) |
| Ordem de Manutenção | tipo | Texto | 30 | Tipo da ordem de manutenção (ex: preventiva, corretiva) |
| Ordem de Manutenção | descricao | Texto | 255 | Descrição da ordem de manutenção |
| Ordem de Manutenção | data_abertura | Data/Hora | - | Data e hora de abertura da ordem |
| Ordem de Manutenção | data_inicio | Data/Hora | - | Data e hora de início do serviço |
| Ordem de Manutenção | data_fim | Data/Hora | - | Data e hora de encerramento do serviço |
| Ordem de Manutenção | status | Texto | 30 | Status da ordem de manutenção |
| Ordem de Manutenção | prioridade | Texto | 30 | Nível de prioridade da ordem |
| Técnico | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Técnico | nome | Texto | 100 | Nome do técnico responsável |
| Técnico | especialidade | Texto | 50 | Especialidade profissional do técnico |
| Técnico | telefone | Texto | 20 | Número de telefone para contato do técnico |
| Técnico | email | Texto | 100 | Endereço de e-mail do técnico |
| Peça | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Peça | nome | Texto | 100 | Nome da peça ou componente |
| Peça | descricao | Texto | 255 | Descrição detalhada da peça |
| Peça | quantidade_estoque | Inteiro | 11 | Quantidade disponível em estoque |
| Peça | estoque_minimo | Inteiro | 11 | Quantidade mínima exigida em estoque |
| Peça | preco | Decimal | 10,2 | Preço unitário da peça |
| Manutenção | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Manutenção | id_ordem | Inteiro | 11 | Identificador da ordem, FK referenciando Ordem de Manutenção (id) |
| Manutenção | id_tecnico | Inteiro | 11 | Identificador do técnico, FK referenciando Técnico (id) |
| Manutenção | descricao_servico | Texto | 255 | Detalhamento do serviço executado |
| Manutenção | data_execucao | Data/Hora | - | Data e hora da execução do serviço |
| Manutenção | horas_trabalhadas | Decimal | 5,2 | Quantidade de horas gastas na manutenção |
| Manutenção | observacoes | Texto | 255 | Observações gerais sobre a manutenção realizada |
| Peça da Manutenção | id_manutencao | Inteiro | 11 | Identificador da manutenção, parte da PK e FK referenciando Manutenção (id) |
| Peça da Manutenção | id_peca | Inteiro | 11 | Identificador da peça, parte da PK e FK referenciando Peça (id) |
| Peça da Manutenção | quantidade | Inteiro | 11 | Quantidade de peças utilizadas nesta manutenção |

##
</div>
</div>

<details>
  <summary>Dados de Teste em CSV</summary>
  <ol>
    <li>
      <div style="margin-left: 15px; margin-top: 5px;">
        <span>╰ <a href="ordem_manutencao.csv">Ordem e Manutenção</a></span><br/>
        <span>╰ <a href="manutencao.csv">Manutenção</a></span><br/>
        <span>╰ <a href="equipamento.csv">Equipamento</a></span><br/>
        <span>╰ <a href="peca.csv">Peças</a></span><br/>
        <span>╰ <a href="peca_manutenção.csv">Peças e Manutenção</a></span><br/>
        <span>╰ <a href="tecnico.csv">Técnicos</a></span>
</details>

##
        
## Script SQL DDL (Desenvolvimanto: Criação do Banco de dados)
  
```sql
drop database if exists manutencao_equipamentos;
create database manutencao_equipamentos;
use manutencao_equipamentos;

create table equipamento(
    id int primary key auto_increment,
    nome varchar(100) not null,
    tipo varchar(50) not null,
    marca varchar(50) not null,
    modelo varchar(50) not null,
    numero_serie varchar(50) not null,
    data_aquisicao date not null,
    status enum('ativo', 'inativo') not null,
    setor varchar(50) not null,
    valor_aquisicao decimal(10,2) not null
);

create table ordem_manutencao(
    id_ordem int primary key auto_increment,
    id_equipamento int not null,
    tipo varchar(50) not null,
    descricao text not null,
    data_abertura datetime not null,
    data_inicio datetime,
    data_fim datetime,
    status enum('aberto', 'em andamento', 'concluido', 'cancelado') not null,
    prioridade enum('baixa', 'media', 'alta') not null
);

create table tecnico(
    id int primary key auto_increment,
    nome varchar(100) not null,
    especialidade varchar(50) not null,
    telefone varchar(15) not null,
    email varchar(100) not null
);

create table peca(
    id_peca int primary key auto_increment,
    nome varchar(100) not null,
    descricao text not null,
    quantidade_estoque int not null,
    estoque_minimo int not null,
    preco decimal(10,2) not null
);

create table manutencao(
    id_manutencao int primary key auto_increment,
    id_ordem int not null,
    id_tecnico int not null,
    descricao_servico text not null,
    data_execucao datetime not null,
    horas_trabalhadas decimal(5,2) not null,
    observacoes text
);

create table peca_manutencao(
    id_manutencao int not null,
    id_peca int not null,
    quantidade int not null,
    primary key (id_manutencao, id_peca)
);

alter table ordem_manutencao add constraint fk_ordem_equipamento foreign key (id_equipamento) references equipamento(id);
alter table manutencao add constraint fk_manutencao_ordem foreign key (id_ordem) references ordem_manutencao(id_ordem);
alter table manutencao add constraint fk_manutencao_tecnico foreign key (id_tecnico) references tecnico(id);
alter table peca_manutencao add constraint fk_peca_manutencao_manutencao foreign key (id_manutencao) references manutencao(id_manutencao);
alter table peca_manutencao add constraint fk_peca_manutencao_peca foreign key (id_peca) references peca(id_peca);

show tables;
describe equipamento;
describe ordem_manutencao;
describe tecnico;
describe peca;
describe manutencao;
describe peca_manutencao;
```
##

<details>
<summary>Script SQL DML(Manipulação: População com dados de teste)</summary>

  
```sql
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
```
</details>
