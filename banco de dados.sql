CREATE DATABASE IF NOT EXISTS loja1;
USE loja1;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente INT,
    nome VARCHAR(100),
    endereco VARCHAR(100),
    cidade VARCHAR(100),
    cep INT
);

CREATE TABLE pedidos (
    num_pedido INT PRIMARY KEY,
    data_pedido DATE, 
    item VARCHAR(100),
    valor DECIMAL(10, 2), 
    cod_cliente INT, 
    CONSTRAINT fk_cliente FOREIGN KEY (cod_cliente) REFERENCES cliente(id)
);



INSERT INTO cliente (cod_cliente, nome, endereco, cidade, cep)
VALUES
    (1, 'julia', 'Rua jorge vasco', 'sao paulo', '02213882'),
    (2, 'paloma', 'Rua das flores', 'sao paulo', '02214442'),
    (3, 'raysa', 'Rua marechal deodoro', 'sao paulo', '022153676');


DELETE FROM pedidos WHERE num_pedido = 1;

INSERT INTO pedidos (num_pedido, data_pedido, item, valor, cod_cliente)
VALUES
    (1, '2025/04/12', 'monitor', 100, 1), 
    (2, '2025/04/16', 'teclado', 150, 2), 
    (3, '2025/04/17', 'mouse', 150, 3);

SELECT * FROM pedidos;
SELECT * FROM cliente;
DELETE FROM pedido WHERE id = 10;'4', '2025', 'monitor', '100', '1'
