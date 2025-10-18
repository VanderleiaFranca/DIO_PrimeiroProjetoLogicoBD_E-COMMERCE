INSERT INTO Cliente (nome, endereco, email, telefone, tipoCliente, cpf, cnpj, login, senha)
VALUES 
('João Silva', 'Rua das Flores, 123', 'joao@email.com', '27999990001', 'F', '12345678901', NULL, 'joaos', 'senha123'),
('Empresa XYZ', 'Av. Central, 456', 'contato@xyz.com.br', '27999990002', 'J', NULL, '12345678000199', 'xyzcorp', 'segura456'), 
('Maria Oliveira', 'Rua do Sol, 88', 'maria.oliveira@email.com', '27999990003', 'F', '98765432100', NULL, 'mariao', 'senha456'),
('Construtora Beta', 'Av. das Torres, 999', 'contato@beta.com.br', '27999990004', 'J', NULL, '44556677000122', 'betacorp', 'construtora789');

INSERT INTO Pagamento (Cliente_idCliente, formaPagamento, status)
VALUES 
(1, 'PIX', 'PENDENTE'),
(2, 'BOLETO', 'PENDENTE'),
(3, 'CARTAO_CREDITO', 'PENDENTE'),
(4, 'TRANSFERENCIA', 'PENDENTE');

INSERT INTO Produto (nomeProduto, descricao, preco, dimensaoProduto)
VALUES 
('Notebook Dell', 'Notebook com 16GB RAM e SSD 512GB', 4500.00, '35x25x2 cm'),
('Mouse Logitech', 'Mouse sem fio com alta precisão', 150.00, '10x6x4 cm'),
('Monitor LG', 'Monitor 24" Full HD', 899.90, '55x35x10 cm');

INSERT INTO Vendedor (razaoSocial, cnpj, contatoVendedor)
VALUES 
('TechVendas Ltda', '11222333000188', 'vendas@techvendas.com'),
('Distribuidora Alpha', '99887766000155', 'contato@alpha.com');

INSERT INTO Fornecedor (razaoSocial, cnpj, contatoFornecedor)
VALUES 
('Dell Brasil', '12345678000100', 'suporte@dell.com'),
('Logitech Inc.', '98765432000177', 'brasil@logitech.com');

INSERT INTO Estoque (localizacao)
VALUES 
('Centro de Distribuição - Vitória'),
('Armazém - Serra');

INSERT INTO Produto_do_Fornecedor (Fornecedor_idFornecedor, Produto_idProduto, quantFornecedor)
VALUES 
(1, 1, 50),
(2, 2, 200);

INSERT INTO Produto_em_Estoque (Estoque_idEstoque, Produto_idProduto, quantDisponivel)
VALUES 
(1, 1, 30),
(1, 2, 100),
(2, 3, 40), 
(2, 2, 0); -- Mouse Logitech esgotado no Armazém Serra

INSERT INTO Venda_Terceirizada (Terceiro_Vendedor_idVendedor, Produto_idProduto, quantVendedor)
VALUES 
(1, 1, 10),
(2, 2, 25),
(1, 3, 35); -- Vendedor TechVendas vendeu 35 monitores LG

INSERT INTO Pedido (Cliente_idCliente, Pagamento_idPagamento, statusPedido, dataPedido, valorTotal, prazoDevolucao)
VALUES 
(1, 1, 'PROCESSANDO', '2025-10-15', 4650.00, '2025-10-30'),
(2, 2, 'PENDENTE', '2025-10-16', 150.00, '2025-10-31'), 
(3, 3, 'CANCELADO', '2025-10-18', 899.90, '2025-11-02'),
(4, 4, 'DEVOLVIDO', '2025-10-19', 150.00, '2025-11-03');

INSERT INTO Relacao_de_Produto_Pedido (Pedido_idPedido, Produto_idProduto, quantidade, precoUnitario)
VALUES 
(1, 1, 1, 4500.00),
(1, 2, 1, 150.00),
(2, 2, 1, 150.00), 
(3, 3, 1, 899.90),
(4, 2, 1, 150.00);

INSERT INTO Entrega (Pedido_idPedido, codigoRastream, statusEntrega, dataEnvio, dataEntrega)
VALUES 
(1, 'BR1234567890', 'EM_PROCESSO', '2025-10-16', NULL),
(2, 'BR9876543210', 'EM_PROCESSO', '2025-10-17', NULL), 
(3, 'BR111222333', 'EM_PROCESSO', '2025-10-18', NULL),
(4, 'BR444555666', 'DEVOLVIDO', '2025-10-19', '2025-10-20');
