use banco;

insert into conta values('A-101', 'Niteroi',   500);
insert into conta values('A-102', 'São Paulo', 400);
insert into conta values('A-201', 'Brasilia',   900);      
insert into conta values('A-215', 'Manaus',     700);
insert into conta values('A-217', 'Brasilia',   750);
insert into conta values('A-222', 'Rio de Janeiro',    700);
insert into conta values('A-305', 'Belo Horizonte', 350);


insert into agencia values('Brasilia',   'DF',    7100000);
insert into agencia values('Niteroi',   'Rio de Janeiro',    9000000);
insert into agencia values('Manaus',     'Amazonas',    400000);
insert into agencia values('Salvador', 'Bahia',         3700000);
insert into agencia values('São Paulo', 'São Paulo',   1700000);
insert into agencia values('Londrina',     'Parana',   300000);
insert into agencia values('Rio de Janeiro',    'Rio de Janeiro',   2100000);
insert into agencia values('Belo Horizonte', 'Minas Gerais',   8000000);


insert into cliente values('Adams',    'Sao Paulo',     'SP');
insert into cliente values('Brooks',   'Niteroi',    'RJ');
insert into cliente values('Curry',    'Rio de Janeiro',      'RJ');
insert into cliente values('Glenn',    'Londrina',  'PR');
insert into cliente values('Green',    'Salvador',     'BA');
insert into cliente values('Hayes',    'Manaus',       'AM');
insert into cliente values('Johnson',  'Rio de Janeiro',       'RJ');
insert into cliente values('Jones',    'Manaus',       'AM');
insert into cliente values('Lindsay',  'Sao Paulo',       'Sao Paulo');
insert into cliente values('Smith',    'Niteroi',      'RJ');
insert into cliente values('Turner',   'Belo Horizonte',     'MG');
insert into cliente values('Williams', 'Brasilia',     'DF');



insert into correntista values('Hayes',    'A-102');
insert into correntista values('Johnson',  'A-102');
insert into correntista values('Johnson',  'A-201');
insert into correntista values('Jones',    'A-217');
insert into correntista values('Lindsay',  'A-222');
insert into correntista values('Smith',    'A-215');
insert into correntista values('Turner',   'A-305');


insert into emprestimo values('L-110', 'Belo Horizonte',    900);
insert into emprestimo values('L-140', 'Niteroi',     1500);
insert into emprestimo values('L-150', 'São Paulo',   1500);
insert into emprestimo values('L-160', 'São Paulo',   1300);
insert into emprestimo values('L-170', 'Niteroi',     1000);
insert into emprestimo values('L-230', 'Rio de Janeiro',      2000);
insert into emprestimo values('l-930', 'Manaus',        500);

insert into mutuario values('Adams',     'L-160');
insert into mutuario values('Curry',     'L-930');
insert into mutuario values('Hayes',     'L-150');
insert into mutuario values('Jackson',   'L-140');
insert into mutuario values('Jones',     'L-170');
insert into mutuario values('Smith',     'L-110');
insert into mutuario values('Smith',     'L-230');
insert into mutuario values('Williams',  'L-170');


insert into funcionario values('Adams',     'São Paulo',  1500);
insert into funcionario values('Brown',     'São Paulo',  1300);
insert into funcionario values('Gopal',     'São Paulo',  5300);
insert into funcionario values('Johnson',   'Niteroi',    1500);
insert into funcionario values('Loreena',   'Niteroi',    1300);
insert into funcionario values('Peterson',  'Niteroi',    2500);
insert into funcionario values('Rao',       'Rio de janeiro',      1500);
insert into funcionario values('Sato',      'Londrina',      1600);

