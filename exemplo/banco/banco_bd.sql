create database if not exists banco;
use banco;


create table if not exists conta
(
numero_conta char(5) not null primary key,
nome_agencia varchar(10),
saldo double
);

create table if not exists agencia
(
nome_agencia varchar(10) not null primary key,
cidade_agencia varchar(10),
ativos double
);

create table if not exists cliente
(
nome_cliente varchar(20) not null primary key,
endereco_cliente varchar(20),
cidade_cliente varchar(10)
);

create table if not exists emprestimo
(
numero_emprestimo varchar(5) not null primary key,
nome_agencia varchar(10),
montante double
);

create table if not exists mutuario
(
nome_cliente varchar(20) not null,
numero_emprestimo varchar(5) not null,
primary key(nome_cliente, numero_emprestimo)
);


create table if not exists correntista
(
nome_cliente varchar(20) not null,
numero_conta char(5) not null,
primary key(nome_cliente, numero_conta)
);


create table if not exists funcionario
(
nome_funcionario varchar(20) not null,
nome_agencia varchar(10) not null,
salario double,
primary key(nome_funcionario,nome_agencia)
);
