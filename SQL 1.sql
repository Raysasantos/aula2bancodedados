CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cpf_dono VARCHAR(14),
    telefone_dono VARCHAR(50),
    endereco_dono VARCHAR(100)
);

-- Tabela de pets
CREATE TABLE pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    especie VARCHAR(50),
    raca VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Tabela de consultas
CREATE TABLE consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pet INT,
    data_consulta DATE,
    descricao TEXT,
    FOREIGN KEY (id_pet) REFERENCES pets(id)
);

-- Tabela de vacinas
CREATE TABLE vacinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pet INT,
    nome_vacina VARCHAR(100),
    data_aplicacao DATE,
    proxima_dose DATE,
    FOREIGN KEY (id_pet) REFERENCES pets(id)
);

-- Tabela de agendamentos
CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pet INT,
    data_agendamento DATE,
    horario TIME,
    servico VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (id_pet) REFERENCES pets(id)
);

-- Inserindo dados fictícios em clientes
INSERT INTO clientes (nome, cpf_dono, telefone_dono, endereco_dono) VALUES
('Carlos Silva', '123.456.789-00', '(11) 91234-5678', 'Rua das Flores, 123'),
('Ana Paula', '987.654.321-00', '(11) 99876-5432', 'Av. Brasil, 456'),
('João Pedro', '159.753.486-33', '(11) 98888-9999', 'Rua do Sol, 654');

-- Inserindo dados fictícios em pets
INSERT INTO pets (nome, especie, raca, id_cliente) VALUES
('Rex', 'Cachorro', 'Labrador', 1),
('Mimi', 'Gato', 'Persa', 2),
('Nina', 'Cachorro', 'Golden Retriever', 1);

-- Inserindo consultas
INSERT INTO consultas (id_pet, data_consulta, descricao) VALUES
(1, '2025-05-01', 'Consulta de rotina. Tudo normal.'),
(2, '2025-05-05', 'Exame de pele. Prescrito shampoo especial.'),
(3, '2025-05-10', 'Consulta por dor na pata traseira.');

-- Inserindo vacinas
INSERT INTO vacinas (id_pet, nome_vacina, data_aplicacao, proxima_dose) VALUES
(1, 'Antirrábica', '2025-04-20', '2026-04-20'),
(2, 'V4 Felina', '2025-04-15', '2026-04-15'),
(3, 'V10 Canina', '2025-03-10', '2026-03-10');

-- Inserindo agendamentos
INSERT INTO agendamentos (id_pet, data_agendamento, horario, servico, status) VALUES
(1, '2025-05-20', '10:30:00', 'Banho e Tosa', 'Agendado'),
(2, '2025-05-22', '14:00:00', 'Vacinação', 'Confirmado'),
(3, '2025-05-25', '09:00:00', 'Consulta', 'Pendente');

-- CONSULTAS ÚTEIS

-- 1. Listar todos os pets com seus donos
SELECT 
    p.nome AS pet_nome, 
    p.especie, 
    p.raca, 
    c.nome AS dono 
FROM pets p
JOIN clientes c ON p.id_cliente = c.id;

-- 2. Histórico de consultas dos pets
SELECT 
    p.nome AS pet_nome, 
    c.data_consulta, 
    c.descricao 
FROM consultas c
JOIN pets p ON c.id_pet = p.id;

-- 3. Histórico de vacinas
SELECT 
    p.nome AS pet_nome, 
    v.nome_vacina, 
    v.data_aplicacao, 
    v.proxima_dose 
FROM vacinas v
JOIN pets p ON v.id_pet = p.id;

-- 4. Agendamentos futuros
SELECT 
    p.nome AS pet_nome, 
    a.data_agendamento, 
    a.horario, 
    a.servico, 
    a.status 
FROM agendamentos a
JOIN pets p ON a.id_pet = p.id
WHERE a.data_agendamento >= CURDATE();

-- 5. Buscar donos com seus contatos
SELECT 
    nome, 
    cpf_dono, 
    telefone_dono, 
    endereco_dono 
FROM clientes;

-- CRUD EXEMPLOS

-- CREATE (Inserir novo cliente)
INSERT INTO clientes (nome, cpf_dono, telefone_dono, endereco_dono)
VALUES ('Fernanda Lima', '321.987.654-22', '(11) 90000-1111', 'Travessa Azul, 321');

-- READ (Listar todos os pets)
SELECT * FROM pets;

-- UPDATE (Atualizar telefone do cliente)
UPDATE clientes 
SET telefone_dono = '(11) 91111-0000' 
WHERE id = 1;

-- DELETE (Excluir um agendamento)
DELETE FROM agendamentos 
WHERE id = 1;
