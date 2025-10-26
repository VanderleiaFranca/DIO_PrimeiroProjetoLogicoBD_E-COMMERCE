-- Criação do Banco de Dados para o cenário de e-comerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- ==========================
-- Criação da Tabela Cliente
-- ==========================
create table Cliente (
    idCliente int auto_increment primary key,
    primeiroNome varchar(50) not null,
    sobrenome varchar(50) not null,
    telefone varchar(20) not null,
    email varchar(30),
	logradouro varchar(50),
    numero varchar(10),
    complemento varchar(50),
    bairro varchar(30),
    cidade varchar(30),
    estado varchar(20),
    cep varchar(10) not null,
    tipoCliente enum('F', 'J') not null,
    cpf char(15) unique,
    cnpj char(20) unique,
    check (
        (tipoCliente = 'F' and cpf is not null and cnpj is null) or
        (tipoCliente = 'J' and cnpj is not null and cpf is null)
    )
);
alter table Cliente auto_increment = 1;
-- desc Cliente;

-- ==========================
-- Criação da Tabela Produto
-- ==========================
create table Produto (
    idProduto int auto_increment primary key,
    nomeProduto varchar(50) not null,
    descricao text(200),
    categoria enum('Eletrodomésticos', 'Eletrônicos', 'Móveis', 'Livros', 'Casa, Mesa e Banho', 'Infantil') not null,
    preco float not null,
    dimensaoProduto varchar(50),
    avaliacao float default 0
);
-- desc Produto;

-- ============================
-- Criação da Tabela Pagamento
-- ============================
create table Pagamento (
    idPagamento int auto_increment primary key,
    Cliente_idCliente int not null,
    formaPagamento enum('CARTÃO CRÉDITO', 'CARTÃO DE DÉBITO', 'BOLETO', 'PIX') not null,
    foreign key (Cliente_idCliente) references Cliente(idCliente)
);
-- desc Pagamento;

-- =========================
-- Criação da Tabela Pedido
-- =========================
create table Pedido (
    idPedido int auto_increment primary key,
    Cliente_idCliente int not null,
    statusPedido enum('PENDENTE', 'PROCESSANDO', 'ENVIADO', 'ENTREGUE', 'CANCELADO', 'DEVOLVIDO') default 'PENDENTE',
    dataPedido date not null,
    valorTotal float default 1.00,
    prazoDevolucao date,
    foreign key (Cliente_idCliente) references Cliente(idCliente)
);
-- desc Pedido;

-- ==========================
-- Criação da Tabela Estoque
-- ==========================
create table Estoque (
    idEstoque int auto_increment primary key,
    quantEstoque int default 0,
    localizacao varchar(255) NOT NULL
);
-- desc Estoque;

-- =============================
-- Criação da Tabela Fornecedor
-- =============================
create table Fornecedor (
    idFornecedor int auto_increment primary key,
    razaoSocial varchar(100) not null,
    cnpj char(20) unique,
    contatoFornecedor varchar(15)
);
-- desc Fornecedor;

-- ===========================
-- Criação da Tabela Vendedor
-- ===========================
create table Vendedor (
    idVendedor int auto_increment primary key,
    razaoSocial varchar(100) not null,
    cnpj char(20) unique,
    contatoVendedor varchar(100)
);
-- desc Vendedor;

-- ==========================
-- Criação da Tabela Entrega
-- ==========================
create table Entrega (
    idEntrega int auto_increment primary key,
    Pedido_idPedido int not null,
    codigoRastream varchar(50),
    statusEntrega enum('EM PROCESSO', 'ENTREGUE', 'DEVOLVIDO') DEFAULT 'EM PROCESSO',
    dataEnvio date,
    dataEntrega date,
	foreign key (Pedido_idPedido) references Pedido(idPedido)
);
-- desc Entrega;

-- ================================================================
-- Criação da Tabela Venda_Terceirizada (Produto ↔ Vendedor) (N:N)
-- ================================================================
create table Venda_Terceirizada (
    Vendedor_idVendedor int not null,
    Produto_idProduto int not null,
    quantVendedor int default 1,
    primary key(Vendedor_idVendedor, Produto_idProduto),
    foreign key (Vendedor_idVendedor) references Vendedor(idVendedor),
    foreign key (Produto_idProduto) references Produto(idProduto)
);
-- desc Venda_Terceirizada;

-- =====================================================================
-- Criação da Tabela Produto_do_Fornecedor (Produto ↔ Fornecedor) (N:N)
-- =====================================================================
create table Produto_do_Fornecedor (
    Fornecedor_idFornecedor int not null,
    Produto_idProduto int not null,
    quantFornecedor int default 1,
    primary key (Fornecedor_idFornecedor, Produto_idProduto),
    foreign key (Fornecedor_idFornecedor) references Fornecedor(idFornecedor),
    foreign key (Produto_idProduto) references Produto(idProduto)
);
-- desc Produto_do_Fornecedor;

-- ===============================================================
-- Criação da Tabela Produto_em_Estoque (Produto ↔ Estoque) (N:N)
-- ===============================================================
create table Produto_em_Estoque (
    Estoque_idEstoque int not null,
    Produto_idProduto int not null,
    quantDisponivel int default 1,
    primary key (Estoque_idEstoque, Produto_idProduto),
    foreign key (Estoque_idEstoque) references Estoque(idEstoque),
    foreign key (Produto_idProduto) references Produto(idProduto)
);
-- desc Produto_em_Estoque;

-- =====================================================================
-- Criação da Tabela Relacao_de_Produto_Pedido (Produto ↔ Pedido) (N:N)
-- =====================================================================
create table Relacao_de_Produto_Pedido (
    Pedido_idPedido int not null,
    Produto_idProduto int not null,
    quantidade int not null,
    precoUnitario float not null,
    primary key (Pedido_idPedido, Produto_idProduto),
    foreign key (Pedido_idPedido) references Pedido(idPedido),
    foreign key (Produto_idProduto) references Produto(idProduto)
);
-- desc Relacao_de_Produto_Pedido;

show tables;
show databases;