# Lista de Exercício SQL – Banco de Dados 02

Uma empresa de estacionamentos resolveu informatizar seu controle de prestação
de serviço de estacionamento particular, suas necessidades de controles são: 



- Controlar Clientes Cadastrados (CPF, Nome, Data de Nascimento).
    - Todos os clientes deverão ser cadastrados no sistema para poder estacionar.
    
- Controlar os tipos de modelo de veículos (Código do Modelo, Descrição do Modelo (Ex.: Sedan, Hatch, Suv, Utilitário, Moto).

- Controlar os pátios existentes (Número do pátio, Endereço do Pátio, número
de Vagas em cada pátio).

- Controlar os veículos cadastrados (Placa, Modelo, Cliente, Cor, Ano).
    - Todos os veículos deverão ter um modelo associado a ele e já cadastrado no controle de modelo de veículos.
    - Todos os veículos deverão ter um cliente associado a ele e já cadastrado no controle de clientes.

- Controlar os Serviços de Estacionamento (Código do serviço, número do pátio, placa do veículo, data da entrada, data da saída, hora da entrada, hora da saída) 

    - Para poder estacionar o veículo ele já deve estar cadastrado no cadastro de veículos
    - O pátio a ser utilizado terá que estar cadastrado no controle de pátios. 












<br>

## Abra seu framework e vamos criar o nosso banco de dados.


#### Crie um Banco de Dados chamada Estacionamento
```sql
create database estacionamento;
```
<br>

#### Selecione o banco estacionamento.
```sql
use estacionamento;
```

<br>

#### Com base a esta descrição breve dos requisitos a serem atendidos crie as tabelas para os devidos controles. 
```sql
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
```

<br>

## Insira os dados fornecidos abaixo



### Tabela de Clientes

| CPF           | Nome                     | Data de Nascimento |
|---------------|--------------------------|--------------------|
| 123.456.789-01| Wagner Toth              | 1981-05-23         |
| 234.567.890-12| Lucas Guedes             | 1996-08-18         |
| 345.678.901-23| Antonio Henrique Marcondes| 1994-03-27        |
| 456.789.012-34| Andre Oliveira           | 1990-02-15         |

```sql
insert into clientes (cpf, nome, dataNasc)
values
('123.456.789-01', 'Wagner Toth', '1981-05-23'),
('234.567.890-12', 'Lucas Guedes', '1996-08-18'),
('345.678.901-23', 'Antonio Henrique Marcondes', '1994-03-27'),
('456.789.012-34', 'Andre Oliveira', '1990-02-15');

```
<br>

### Tabela de Modelos

| CodModelo | DescricaoModelo |
|-----------|-----------------|
| 1         | Sedan           |
| 2         | Hatch           |
| 3         | SUV             |
| 4         | Utilitário      |
| 5         | Moto            |

```sql
insert into modelos (codModelo, descricaoModelo) values
(1, 'Sedan'),
(2, 'Hatch'),
(3, 'SUV'),
(4, 'Utilitário'),
(5, 'Moto');
```
<br>

### Tabela de Pátios

| NumPatio | Endereço | NumVagas |
|----------|----------|----------|
| 1        | Rua A    | 20       |
| 2        | Rua B    | 25       |
| 3        | Rua C    | 40       |
| 4        | Rua D    | 30       |

```sql
insert into patios(numPatio,endereco,numVagas) values 
(1,'Rua A',20),
(2,'Rua B',25),
(3,'Rua C',40),
(4,'Rua D',30);

```
<br>

### Tabela de Veículos

| Placa    | Modelo | Cliente            | Cor     | Ano  |
|----------|--------|--------------------|---------|------|
| ABC-1A23 | 1      | 123.456.789-01     | Preto   | 2000 |
| BAC-2834 | 2      | 234.567.890-12     | Azul    | 2020 |
| CBA-3C45 | 3      | 345.678.901-23     | Branco  | 2021 |
| BCA-4056 | 4      | 456.789.012-34     | Preto   | 2019 |
| ACB-5E67 | 5      | 123.456.789-01     | Branco  | 2020 |
| CAB-6F78 | 3      | 345.678.901-23     | Vermelho| 2019 |
| AAA-7689 | 3      | 456.789.012-34     | Cinza   | 2005 |

```sql
insert into veiculos (placa, modelo, cliente, cor, ano) values
("ABC-1A23", 1, "123.456.789-01", "Preto", 2000),
("BAC-2834", 2, "234.567.890-12", "Azul", 2020),
("CBA-3C45", 3, "345.678.901-23", "Branco", 2021),
("BCA-4056", 4, "456.789.012-34", "Preto", 2019),
("ACB-5E67", 5, "123.456.789-01", "Branco", 2020),
("CAB-6F78", 3, "345.678.901-23", "Vermelho", 2019),
("AAA-7689", 3, "456.789.012-34", "Cinza", 2005);
```
<br>

### Tabela de Estacionamentos

| CodServico | NumPatio | PlacaVeiculo | DataEntrada | DataSaida | HoraEntrada | HoraSaida |
|------------|----------|--------------|-------------|-----------|-------------|----------|
| 1          | 1        | ABC-1A23     | 2021-01-03  | 2021-01-03| 08:00:30    | 08:05:59 |
| 2          | 2        | BAC-2834     | 2020-12-24  | 2020-12-27| 18:50:00    | 12:35:30 |
| 3          | 3        | CBA-3C45     | 2020-12-31  | 2021-01-02| 15:05:25    | 17:00:34 |
| 4          | 4        | BCA-4056     | 2021-01-02  | 2021-01-02| 08:40:12    | 18:34:21 |
| 5          | 1        | ACB-5E67     | 2021-02-01  | 2021-02-01| 09:30:13    | 09:35:20 |
| 6          | 1        | CAB-6F78     | 2021-02-05  | 2021-02-05| 10:05:35    | 12:45:36 |
| 7          | 1        | AAA-7689     | 2021-02-10  | 2021-02-10| 11:12:45    | 12:00:00 |
| 8          | 2        | BAC-2834     | 2021-01-08  | 2021-01-08| 10:45:36    | 11:05:55 |
| 9          | 2        | ACB-5E67     | 2021-01-15  | 2021-01-15| 09:23:45    | 10:30:56 |
| 10         | 3        | CBA-3045     | 2021-01-03  | 2021-01-03| 08:02:34    | 11:34:35 |
| 11         | 4        | AAA-7689     | 2021-01-04  | 2021-01-04| 07:59:59    | 17:59:59 |
| 12         | 4        | CAB-6F78     | 2021-02-15  | NULL      | 06:30:28    | NULL     |
| 13         | 2        | BAC-2834     | 2021-02-18  | NULL      | 09:59:30    | NULL     |
| 14         | 3        | ABC-1A23     | 2021-02-14  | NULL      | 11:59:20    | NULL     |
| 15         | 1        | BCA-4056     | 2021-01-30  | 2021-01-30| 16:34:58    | 19:45:38 |

```sql
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
```
<br>

## Com base nos dados inseridos e as tabelas criadas resolva os exercícios abaixo relacionados. 





#### 01. Retorne a quantidade de vagas usadas em cada pátio 

```sql
CREATE VIEW ex1 AS
select numPatio , count(*) as VagasUsadas
from Estacionamentos
group by numPatio;
```

#### 02. Retorne o nome dos clientes e seus veículos, bem como a data de entrada e data saída ordenados por pátios.

```sql
CREATE VIEW ex2 AS
SELECT nome AS NomeCliente,placa AS PlacaVeiculo,dataEntrada AS DataEntrada, dataSaida AS DataSaida FROM Estacionamentos 
JOIN Veiculos ON placaVeiculo = placa 
JOIN Clientes ON cliente = cpf
ORDER BY numPatio;
```

#### 03. Retorne o nome dos clientes com modelo do veículo e as respectivas placas dos veículos ordenados por cliente 

```sql
CREATE VIEW ex3 AS 
SELECT nome AS NomeCliente, descricaoModelo AS ModeloVeiculo, placa AS PlacaVeiculo 
FROM clientes
JOIN veiculos ON cpf = cliente
JOIN modelos ON modelo = codModelo
ORDER BY cliente;
```

#### 04. Retorne o número total de vagas somando todos os pátios

```sql
CREATE VIEW ex4 AS 
SELECT SUM(numVagas) AS TotalVagas FROM patios;
```

#### 05. Retorne os pátios utilizados pelo cliente cujo cpf seja 123.456.789-10, a data de entrada, data de saída, placa do veículo.

```sql
SELECT clientes.nome AS NomeCliente, patios.numPatio AS Patio, estacionamentos.dataEntrada AS DataEntrada, estacionamentos.dataSaida AS DataSaída, placa AS PlacaVeiculos
FROM patios
JOIN estacionamentos ON estacionamentos.numPatio = patios.numPatio
JOIN veiculos ON estacionamentos.placaVeiculo = veiculos.placa
JOIN clientes ON veiculos.cliente = clientes.cpf
WHERE clientes.cpf = '123.456.789-01';
```

#### 06. Retorne Proprietário, Placa, Pátio, Data Entrada e Data Saída dos veículos estacionados no período de 01/01/2020 a 31/12/2020 

```sql
SELECT clientes.nome AS Nome, veiculos.placa AS PlacaVeiculo, estacionamentos.dataEntrada AS DataEntrada, estacionamentos.dataSaida AS DataSaida 
FROM estacionamentos
JOIN veiculos ON estacionamentos.placaVeiculo = veiculos.placa
JOIN clientes ON clientes.cpf = veiculos.cliente
WHERE estacionamentos.dataEntrada BETWEEN '2020-01-01' AND '2020-12-31'
AND estacionamentos.dataSaida BETWEEN '2020-01-01' AND '2020-12-31'
ORDER BY clientes.nome;
```

#### 07. Retorne Proprietário, Placa, Pátio, Data Entrada e Data Saída dos veículos foram estacionados com data entrada no período de 01/01/2020 a 31/12/2020

```sql
SELECT 
clientes.nome AS NomeProprietário, 
veiculos.placa AS PlacaVeiculo, 
patios.numPatio AS Pátio, 
estacionamentos.dataEntrada AS DataEntrada, 
estacionamentos.dataSaida AS DataSaida
FROM clientes 
JOIN veiculos ON clientes.cpf = veiculos.cliente
JOIN estacionamentos ON veiculos.placa = estacionamentos.placaVeiculo
JOIN patios ON estacionamentos.numPatio = patios.numPatio
WHERE estacionamentos.dataEntrada BETWEEN '2020-01-01' AND '2020-12-31'
AND estacionamentos.dataSaida BETWEEN '2020-01-01' AND '2020-12-31';
```

#### 08. Selecione os proprietários de motos e retorne Nome do proprietário, modelo, placa, cor, data e hora de entrada, data e hora de saída, pátio, endereço do pátio 

```sql
SELECT
clientes.nome AS NomeProprietario,
veiculos.modelo AS Modelo,placa AS Placa,cor AS Cor,
estacionamentos.dataEntrada AS DataEntrada,dataSaida AS DataSaida,horaEntrada AS HoraEntrada,horaSaida AS HoraSaida,
patios.numPatio AS NumeroPatio,
patios.endereco AS EnderecoPatio
FROM clientes
JOIN veiculos ON clientes.cpf = veiculos.cliente
JOIN estacionamentos ON veiculos.placa = estacionamentos.placaVeiculo
JOIN patios ON estacionamentos.numPatio = patios.numPatio
JOIN modelos ON veiculos.modelo = modelos.codModelo
WHERE  modelos.descricaoModelo = 'Moto';
```

#### 09. Selecione a propriedade de veículos sedan retornando o modelo, cor, placa

```sql
SELECT 
modelos.codModelo,descricaoModelo,
veiculos.cor,placa
FROM veiculos 
JOIN modelos ON veiculos.modelo = modelos.codModelo
WHERE modelos.descricaoModelo = 'Sedan';
```

#### 10. Retorne Placa, Modelo, Cor, Proprietário, Data de Entrada, Hora de Entrada, Data de Saída, Hora de Saída, Pátio, Endereço Pátio, dos veículos que estão estacionados sem registro de saída - OBS: Usa o parâmetro IS na condição NULA. 

```sql
SELECT
veiculos.placa AS Placa,modelo AS Modelo,cor AS Cor,
clientes.nome AS Nome,
estacionamentos.dataEntrada AS DataEntrada,horaEntrada AS HoraEntrada,dataSaida AS DataSaida,horaSaida AS HoraSaida,
patios.numPatio AS NúmeroPatio,endereco AS Endereco
FROM veiculos
JOIN clientes ON veiculos.cliente = clientes.cpf
JOIN estacionamentos ON veiculos.placa = estacionamentos.placaVeiculo
JOIN patios ON estacionamentos.numPatio = patios.numPatio
WHERE estacionamentos.dataSaida IS NULL;
```
