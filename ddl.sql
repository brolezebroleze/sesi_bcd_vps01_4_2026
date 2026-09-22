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