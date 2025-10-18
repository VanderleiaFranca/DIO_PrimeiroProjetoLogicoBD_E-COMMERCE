CREATE DATABASE IF NOT EXISTS ecommerce CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ecommerce;

-- Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    tipoCliente ENUM('F', 'J') NOT NULL,
    cpf CHAR(11) UNIQUE,
    cnpj CHAR(14) UNIQUE,
    login VARCHAR(50) UNIQUE,
    senha VARCHAR(255) NOT NULL,
    CHECK (
        (tipoCliente = 'F' AND cpf IS NOT NULL AND cnpj IS NULL) OR
        (tipoCliente = 'J' AND cnpj IS NOT NULL AND cpf IS NULL)
    )
);

-- Pagamento
CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_idCliente INT NOT NULL,
    formaPagamento ENUM('CARTAO_CREDITO', 'CARTAO_DEBITO', 'BOLETO', 'TRANSFERENCIA', 'PIX') NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDENTE',
    pagamentoTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Pedido
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_idCliente INT NOT NULL,
    Pagamento_idPagamento INT,
    statusPedido ENUM('PENDENTE', 'PROCESSANDO', 'ENVIADO', 'ENTREGUE', 'CANCELADO', 'DEVOLVIDO') DEFAULT 'PENDENTE',
    dataPedido DATE NOT NULL,
    valorTotal DECIMAL(10,2) DEFAULT 0.00,
    prazoDevolucao DATE,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Entrega
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    Pedido_idPedido INT NOT NULL,
    codigoRastream VARCHAR(50),
    statusEntrega ENUM('EM_PROCESSO', 'ENTREGUE', 'DEVOLVIDO') DEFAULT 'EM_PROCESSO',
    dataEnvio DATE,
    dataEntrega DATE,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- Produto
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    dimensaoProduto VARCHAR(50)
);

-- Vendedor
CREATE TABLE Vendedor (
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE,
    contatoVendedor VARCHAR(100)
);

-- Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE,
    contatoFornecedor VARCHAR(100)
);

-- Estoque
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    localizacao VARCHAR(100) NOT NULL
);

-- Produto_do_Fornecedor (N:N)
CREATE TABLE Produto_do_Fornecedor (
    Fornecedor_idFornecedor INT NOT NULL,
    Produto_idProduto INT NOT NULL,
    quantFornecedor INT DEFAULT 0,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Produto_em_Estoque (N:N)
CREATE TABLE Produto_em_Estoque (
    Estoque_idEstoque INT NOT NULL,
    Produto_idProduto INT NOT NULL,
    quantDisponivel INT DEFAULT 0,
    PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Venda_Terceirizada (Produto ↔ Vendedor)
CREATE TABLE Venda_Terceirizada (
    Terceiro_Vendedor_idVendedor INT NOT NULL,
    Produto_idProduto INT NOT NULL,
    quantVendedor INT DEFAULT 0,
    PRIMARY KEY (Terceiro_Vendedor_idVendedor, Produto_idProduto),
    FOREIGN KEY (Terceiro_Vendedor_idVendedor) REFERENCES Vendedor(idVendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Relacao_de_Produto_Pedido (Produto ↔ Pedido)
CREATE TABLE Relacao_de_Produto_Pedido (
    Pedido_idPedido INT NOT NULL,
    Produto_idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);
