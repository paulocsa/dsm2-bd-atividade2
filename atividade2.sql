create database estacionamento;
use estacionamento;

create table clientes(
    cpf varchar(14),
    nome varchar(50),
    dataNasc date
);

create table modelos(
    codModelo int primary key,
    descricaoModelo varchar(50)
);

create table patios(
    numPatio int primary key,
    endereco varchar(50),
    numVagas int	
);

create table estacionamentos(
    codServico int primary key,
    numPatio int,
    placaVeiculo varchar(20), 
    dataEntrada date,
    dataSaida date,
    horaEntrada time, 
    horaSaida time 
);

create table veiculos(
    placa varchar(20) primary key,
    modelo varchar(20),
    cliente varchar(50),
    cor varchar(20),
    ano int
);

insert into clientes (cpf, nome, dataNasc)
values
('123.456.789-01', 'Wagner Toth', '1981-05-23'),
('234.567.890-12', 'Lucas Guedes', '1996-08-18'),
('345.678.901-23', 'Antonio Henrique Marcondes', '1994-03-27'),
('456.789.012-34', 'Andre Oliveira', '1990-02-15');

insert into modelos (codModelo, descricaoModelo) values
(1, 'Sedan'),
(2, 'Hatch'),
(3, 'SUV'),
(4, 'Utilitário'),
(5, 'Moto');

insert into patios(numPatio,endereco,numVagas) values 
(1,'Rua A',20),
(2,'Rua B',25),
(3,'Rua C',40),
(4,'Rua D',30);

insert into veiculos (placa, modelo, cliente, cor, ano) values
("ABC-1A23", 1, "123.456.789-01", "Preto", 2000),
("BAC-2834", 2, "234.567.890-12", "Azul", 2020),
("CBA-3C45", 3, "345.678.901-23", "Branco", 2021),
("BCA-4056", 4, "456.789.012-34", "Preto", 2019),
("ACB-5E67", 5, "123.456.789-01", "Branco", 2020),
("CAB-6F78", 3, "345.678.901-23", "Vermelho", 2019),
("AAA-7689", 3, "456.789.012-34", "Cinza", 2005);


insert into estacionamentos (codServico, numPatio, placaVeiculo, dataEntrada, dataSaida, horaEntrada, horaSaida) values
(1,1, 'ABC-1A23', '2021-01-03', '2021-01-03', '08:00:30', '08:05:59'),
(2,2, 'BAC-2834', '2020-12-24', '2020-12-27', '18:50:00', '12:35:30'),
(3,3, 'CBA-3C45', '2020-12-31', '2021-01-02', '15:05:25', '17:00:34'),
(4,4, 'BCA-4D56', '2021-01-02', '2021-01-02', '08:40:12', '18:34:21'),
(5,1, 'ACB-5E67', '2021-02-01', '2021-02-01', '09:30:13', '09:35:20'),
(6,1, 'CAB-6F78', '2021-02-05', '2021-02-05', '10:05:35', '12:45:36'),
(7,1, 'AAA-7689', '2021-02-10', '2021-02-10', '11:12:45', '12:00:00'),
(8,2, 'BAC-2834', '2021-01-08', '2021-01-08', '10:45:36', '11:05:55'),
(9,2, 'ACB-5E67', '2021-01-15', '2021-01-15', '09:23:45', '10:30:56'),
(10,3, 'CBA-3045', '2021-01-03', '2021-01-03', '08:02:34', '11:34:35'),
(11,4, 'AAA-7689', '2021-01-04', '2021-01-04', '07:59:59', '17:59:59'),
(12,4, 'CAB-6F78', '2021-02-15', null, '06:30:28', null),
(13,2, 'BAC-2834', '2021-02-18', null, '09:59:30', null),
(14,3, 'ABC-1A23', '2021-02-14', null, '11:59:20', null),
(15,1, 'BCA-4056', '2021-01-30', '2021-01-30', '16:34:58', '19:45:38');


-- 01. Retorne a quantidade de vagas usadas em cada pátio 
select numPatio , count(*) as VagasUsadas
from estacionamentos
group by numPatio;


-- 02. Retorne o nome dos clientes e seus veículos, bem como a data de entrada e data saída ordenados por pátios.
select nome as NomeCliente,placa as PlacaVeiculo,dataEntrada as DataEntrada, dataSaida as DataSaida from estacionamentos 
join veiculos on placaVeiculo = placa 
join clientes on cliente = cpf
order by numPatio;


-- 03. Retorne o nome dos clientes com modelo do veículo e as respectivas placas dos veículos ordenados por cliente 
select nome as NomeCliente, descricaoModelo as ModeloVeiculo, placa as PlacaVeiculo 
from clientes
join veiculos on cpf = cliente
join modelos on modelo = codModelo
order by cliente;



-- 04. Retorne o número total de vagas somando todos os pátios
 select sum(numVagas) as TotalVagas from patios;


-- 05. Retorne os pátios utilizados pelo cliente cujo cpf seja 123.456.789-10, a data de entrada, data de saída, placa do veículo.
select clientes.nome as NomeCliente, patios.numPatio as Patio, estacionamentos.dataEntrada as DataEntrada, estacionamentos.dataSaida as DataSaida, placa as PlacaVeiculos
from patios
join estacionamentos on estacionamentos.numPatio = patios.numPatio
join veiculos on estacionamentos.placaVeiculo = veiculos.placa
join clientes on veiculos.cliente = clientes.cpf
where clientes.cpf = '123.456.789-01';


-- 06. Retorne Proprietário, Placa, Pátio, Data Entrada e Data Saída dos veículos estacionados no período de 01/01/2020 a 31/12/2020 
select clientes.nome as Nome, veiculos.placa as PlacaVeiculo, estacionamentos.dataEntrada as DataEntrada, estacionamentos.dataSaida as DataSaida 
from estacionamentos
join veiculos on estacionamentos.placaVeiculo = veiculos.placa
join clientes on clientes.cpf = veiculos.cliente
where estacionamentos.dataEntrada between '2020-01-01' and '2020-12-31'
and estacionamentos.dataSaida between '2020-01-01' and '2020-12-31'
order by clientes.nome;



-- 07. Retorne Proprietário, Placa, Pátio, Data Entrada e Data Saída dos veículos foram 
-- estacionados com data entrada no período de 01/01/2020 a 31/12/2020
select 
clientes.nome as NomeProprietário, 
veiculos.placa as PlacaVeiculo, 
patios.numPatio as Pátio, 
estacionamentos.dataEntrada as DataEntrada, 
estacionamentos.dataSaida as DataSaida
from clientes 
join veiculos on clientes.cpf = veiculos.cliente
join estacionamentos on veiculos.placa = estacionamentos.placaVeiculo
join patios on estacionamentos.numPatio = patios.numPatio
where estacionamentos.dataEntrada between '2020-01-01' and '2020-12-31'
and estacionamentos.dataSaida between '2020-01-01' and '2020-12-31';


-- 08. Selecione os proprietários de motos e retorne Nome do proprietário, modelo, placa,
-- cor, data e hora de entrada, data e hora de saída, pátio, endereço do pátio 
select
clientes.nome as NomeProprietario,
veiculos.modelo as Modelo,placa as Placa,cor as Cor,
estacionamentos.dataEntrada as DataEntrada,dataSaida as DataSaida,horaEntrada as HoraEntrada,horaSaida as HoraSaida,
patios.numPatio as NumeroPatio,
patios.endereco as EnderecoPatio
from clientes
join veiculos on clientes.cpf = veiculos.cliente
join estacionamentos on veiculos.placa = estacionamentos.placaVeiculo
join patios on estacionamentos.numPatio = patios.numPatio
join modelos on veiculos.modelo = modelos.codModelo
where  modelos.descricaoModelo = 'Moto';


-- 09. Selecione a propriedade de veículos sedan retornando o modelo, cor, placa
select 
modelos.codModelo,descricaoModelo,
veiculos.cor,placa
from veiculos 
join modelos on veiculos.modelo = modelos.codModelo
where modelos.descricaoModelo = 'Sedan';


-- 10. Retorne Placa, Modelo, Cor, Proprietário, Data de Entrada, Hora de Entrada, Data
-- de Saída, Hora de Saída, Pátio, Endereço Pátio, dos veículos que estão estacionados
-- sem registro de saída - OBS: Usa o parâmetro IS na condição NULA. 
select
veiculos.placa as Placa,modelo as Modelo,cor as Cor,
clientes.nome as Nome,
estacionamentos.dataEntrada as DataEntrada,horaEntrada as HoraEntrada,dataSaida as DataSaida,horaSaida as HoraSaida,
patios.numPatio as NúmeroPatio,endereco as Endereco
from veiculos
join clientes on veiculos.cliente = clientes.cpf
join estacionamentos on veiculos.placa = estacionamentos.placaVeiculo
join patios on estacionamentos.numPatio = patios.numPatio
where estacionamentos.dataSaida is null;


