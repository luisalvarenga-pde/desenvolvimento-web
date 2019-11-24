use banco;

select *  
    from emprestimo
 where nome_agencia = 'Rio de Janeiro' 
     and montante > 1100;
     
select numero_emprestimo 
    from emprestimo
   where montante between 1000 and 1500;
   
select *
  from agencia;
   
select distinct T.*
    from agencia as T
    join agencia as S
      on T.ativos > S.ativos
   where S.cidade_agencia = 'DF';
   
  select T.nome_cliente, T.numero_emprestimo, S.montante 
    from mutuario as T
    join emprestimo as S
      on T.numero_emprestimo = S.numero_emprestimo;
      
(select nome_cliente from correntista)
union 
(select nome_cliente from mutuario);

select *
  from correntista
 where nome_cliente not in 
    (select nome_cliente from mutuario);
    
select cnt.nome_agencia, count(distinct crt.nome_cliente)
  from correntista crt
  join conta cnt
    on crt.numero_conta = cnt.numero_conta
 group by cnt.nome_agencia;
 
select nome_agencia, count(distinct nome_cliente)
  from correntista crt
  join conta cnt
    on crt.numero_conta = cnt.numero_conta
 group by nome_agencia;
 
select nome_agencia, avg(saldo)
  from conta
 group by nome_agencia
having avg(saldo) > 500;

select distinct nome_cliente 
  from mutuario
 where nome_cliente in
      (select nome_cliente from correntista);
      
  select distinct nome_cliente
    from mutuario
   where nome_cliente not in
        (select nome_cliente from correntista);

drop view vw_clientes;

create view vw_clientes as
 (select nome_agencia, nome_cliente
    from correntista crt
       join conta cnt
         on crt.numero_conta = cnt.numero_conta)
    union
 (select nome_agencia, nome_cliente
    from mutuario mtr
       join emprestimo ept
      on mtr.numero_emprestimo = ept.numero_emprestimo);

select *
  from vw_clientes
 where nome_agencia = 'Rio de Janeiro';
 
 select * 
   from emprestimo emp
   join mutuario mut
     on emp.numero_emprestimo = mut.numero_emprestimo
  order by  emp.numero_emprestimo;

 select * 
   from emprestimo emp
   left join mutuario mut
     on emp.numero_emprestimo = mut.numero_emprestimo
  order by  emp.numero_emprestimo;


select nome_agencia
  from agencia
 where ativos > all
   (select a.ativos
		from agencia a
	  where a.nome_agencia = 'Brasilia');