CREATE DATABASE Clinica
go
use Clinica



CREATE table  Paciente(
Num_Beneficario    int not null,
nome            varchar(100) not null,
Logradouro      varchar(200) not null,
Numero          int          not null,
CEP             char(8)      not null,
complemento     varchar (255) not null,
telefone        varchar (11) not null,
Primary key (Num_Beneficario)
)
go

create table Especialidade(
iD      int       not null,
Especilidade    varchar (100) not null
primary key (id)
)
go
create table Medico(
codigo  int   not null,
Nome    varchar (100) not null,
Logradouro varchar (200) not null,
numero    int not null,
cep    char (8) not null,
complemento varchar(255) not null,
contato varchar (11) not null,
id      int    not null
primary key (codigo)
foreign key (id) references Especialidade(id)
)
go

create table Consulta (
Data_hora   datetime not null,
observacao   varchar(255) not null,
Num_Beneficario  int not null,
codigo        int not null
primary key (Data_hora)
foreign key (Num_Beneficario) references Paciente(Num_Beneficario),
foreign key (codigo) references Medico (codigo)
)

exec sp_help Paciente
exec sp_help medico
insert into Paciente values 
(99901,'Washington Silva', 'R.Anhaia', 150,'02345000','casa','922229999'),
(99902,'Luis Ricardo','R.Voluntarios da Patria',2251,'0325410','Bloco B.Apto 25','923450987'),
(99903,'Maria luiza','Av.Aguai de Haia',1188,'6987020', 'Apto 1208', '912348765'),
(99904,'José Araujo','R.XV de novenbro',18,'03678000','Casa','945674312'),
(99905,'Joana Paula','R.7 de Abril',97,'01214000','Conjunto 3 -Apto 801','912095674')
select *
from Paciente

Insert into Especialidade values
(1, 'otorrinolaringologista'),
(2,'Urologista'),
(3,'Geriatria'),
(4,'Pediatria')

select *
from Especialidade

Insert into Medico Values
(100001,'Ana Paula','R. 7 de Setembro',256,'03698000','casa','915689456',1),
(100002,'Maria Aparecida','Av.Brasil',32,'0214507','casa','923235454',1),
(100003,'Lucas Borges','Av.do Estado',321,'05241000','Apto 205','963698585',2),
(100004,'Gabriel Oliveira','Av. Dom Helder Camara',350,'3145000','Apto 602','932458745',3)

select *
from Medico

Insert into Consulta values 
('2021-09-04 13:20', 'infecção Urinaria',99901,100002),
('2021-09-04 13:15', 'Gripe',99902,100003),
('2021-09-04 12:30','Infecção Garganta',99901,100001)
select *
from Consulta 

alter table Medico
add  dia_atendimento varchar(30)


update Medico
set dia_atendimento ='Passa a atender na 2º feira'
where codigo=100001 

update Medico
set dia_atendimento ='Passa a atender na 2º feira'
where codigo=100003 

update Medico
set dia_atendimento ='Passa a atender na 4º feira'
where codigo=100002 

update Medico
set dia_atendimento ='Passa a atender na 5º feira'
where codigo=100004 

delete Especialidade
where iD = 4


alter table Medico
add dia_semana_atendimento varchar(30)
update Medico
set dia_semana_atendimento ='Passa a atender na 2º feira'
where codigo=100001 

update Medico
set dia_semana_atendimento ='Passa a atender na 2º feira'
where codigo=100003 

update Medico
set dia_semana_atendimento='Passa a atender na 4º feira'
where codigo=100002 

update Medico
set dia_semana_atendimento='Passa a atender na 5º feira'
where codigo=100004 
select *
from Medico

alter table medico
drop column dia_atendimento

update Medico
set Logradouro = 'Av.Bras Leme', numero = 876, complemento = 'Apto 504', cep = '02122000'
where Nome = 'Lucas Borges'

alter table consulta
alter column observacao varchar(200)
exec sp_help consulta

