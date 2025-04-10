-- Criar o banco de dados
CREATE DATABASE hospital_db;

-- Usar o banco de dados
USE hospital_db;

-- Cria o banco de dados
CREATE DATABASE hospital_simples_db;
USE hospital_simples_db;

-- Tabela: paciente
CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Índice para busca por nome
CREATE INDEX idx_paciente_nome ON paciente(nome);

-- Tabela: medico
CREATE TABLE medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especialidade VARCHAR(50),
    crm VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela: consulta
CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT,
    id_medico INT,
    data_consulta DATE,
    observacoes TEXT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

-- Inserções em paciente
INSERT INTO paciente (nome, data_nascimento, telefone, email) VALUES
('João Silva', '1980-05-10', '11999998888', 'joao@email.com'),
('Maria Souza', '1992-11-25', '21988887777', 'maria@email.com'),
('Carlos Oliveira', '2000-03-30', '31977776666', 'carlos@email.com');

-- Inserções em medico
INSERT INTO medico (nome, especialidade, crm, email) VALUES
('Dr. Ricardo Lima', 'Cardiologia', 'CRM1234', 'ricardo@hospital.com'),
('Dra. Ana Paula', 'Pediatria', 'CRM5678', 'ana@hospital.com');

-- Inserções em consulta
INSERT INTO consulta (id_paciente, id_medico, data_consulta, observacoes) VALUES
(1, 1, '2025-04-10', 'Paciente com dor no peito'),
(2, 2, '2025-04-11', 'Consulta de rotina'),
(3, 2, '2025-04-12', 'Paciente com febre alta');

-- VIEW: Consultas com nome do paciente e médico
CREATE VIEW vw_consultas_detalhadas AS
SELECT 
    c.id_consulta,
    p.nome AS paciente,
    m.nome AS medico,
    c.data_consulta,
    c.observacoes
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN medico m ON c.id_medico = m.id_medico;

-- VIEW: Lista de pacientes com e-mail e telefone
CREATE VIEW vw_contatos_pacientes AS
SELECT nome, email, telefone
FROM paciente;

-- UPDATE: Atualizar o telefone de um paciente
UPDATE paciente
SET telefone = '11900001111'
WHERE id_paciente = 1;

-- DELETE: Deletar uma consulta
DELETE FROM consulta
WHERE id_consulta = 3;

-- SELECTs para verificar os dados
SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM consulta;
SELECT * FROM vw_consultas_detalhadas;
SELECT * FROM vw_contatos_pacientes;
