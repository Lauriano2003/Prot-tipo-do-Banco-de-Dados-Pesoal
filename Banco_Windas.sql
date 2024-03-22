create database Windas ;
use Windas;

CREATE TABLE Sensores (
idSensor			INT AUTO_INCREMENT PRIMARY KEY,
nome				varchar(50),
tipo				varchar(50) not null,
localizacao 		varchar(100) 
);

create table Leituras_temperatura_umidade(
idLeitura				int auto_increment	primary key,
idSensor				int,
temp_externa			float,
umid_externa			float,
temp_interna			float,
umid_interna			float,
horario_externo			time,
dt_externa				date,
horario_interno			time,
dt_interna				date,
chovendo				tinyint(1) default 0,
foreign key (idSensor) references Sensores(idSensor)
);

create table Bloqueio(
idBloq			int auto_increment primary key,
idSensor		int,
bloquado		tinyint(1) default 0,
motivo			varchar(100),
foreign key (idSensor) references Sensores(idSensor)
);

insert into Sensores (nome, tipo, localizacao) values
('Sensor1', 'Temperatura', 'Sala de Estar'),
('Sensor2', 'Umidade', 'Quarto'),
('Sensor3', 'Bloqueio', 'Cozinha');

insert into Leituras_temperatura_umidade (idSensor, temp_externa, umid_externa, temp_interna, umid_interna, horario_externo, dt_externa, horario_interno, dt_interna, chovendo) 
values
(1, 25.5, 60.0, 23.0, 50.0, '12:00:00', '2024-03-13', '12:05:00', '2024-03-13', 0),
(2, 22.0, 65.0, 21.5, 55.0, '12:00:00', '2024-03-13', '12:05:00', '2024-03-13', 1),
(3, 26.8, 55.0, 24.5, 50.0, '14:30:00', '2024-03-13', '14:35:00', '2024-03-13', 0);

insert into Bloqueio (idSensor, bloquado, motivo)
values
(3, 1, 'Obstrução detectada'),
(1, 0, null),
(2, 1, 'Umidade alta');


select * from Sensores;
select * from Leituras_temperatura_umidade;
select * from bloqueio;

drop database Windas
