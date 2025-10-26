-- drop database ecommerce;
use ecommerce;

-- =========
-- CLIENTES
-- =========
insert into Cliente (primeiroNome, sobrenome, telefone, email, logradouro, numero, complemento, bairro, cidade, estado, cep, tipoCliente, cpf, cnpj)
values 
('Ana', 'Souza', '11999990000', 'ana.souza@gmail.com', 'Rua das Flores', '45', 'Ap 101', 'Centro', 'São Paulo', 'SP', '01001000', 'F', '123.456.789-10', null),
('Carlos', 'Mendes', '21988887777', 'carlos.mendes@gmail.com', 'Av. Brasil', '34', null, 'Copacabana', 'Rio de Janeiro', 'RJ', '22041001', 'F', '234.567.890-11', null),
('Loja', 'TechPro', '1133332222', 'contato@techpro.com', 'Rua da Tecnologia', '300', null, 'Vila Mariana', 'São Paulo', 'SP', '04001000', 'J', null, '12.345.678/0001-99'),
('Maria', 'Oliveira', '27999990003', 'maria.oliveira@email.com', 'Rua do Sol',  '88', 'Apt 505', 'Campo Grande', 'Cariacica', 'ES', '08002300', 'F', '987.654.321-00', null),
('Construtora', 'Beta', '27999990004', 'contato@beta.com.br', 'Av. das Torres', '999', null, 'Praia da Costa', 'Vitória', 'ES', '16002355', 'J', null, '44.556.677/0001-22'),
('João', 'Silva', '27999990001', 'joao@email.com', 'Rua das Flores', '123', null, 'Itacibá', 'Cariacica', 'ES', '29102810', 'F', '123.481.789-01', null);

-- =========
-- PRODUTOS
-- =========
insert into Produto (nomeProduto, descricao, categoria, preco, dimensaoProduto, avaliacao)
values
('Geladeira Frost Free', 'Geladeira duplex 400L', 'Eletrodomésticos', 3200.00, '1.80x0.70x0.60m', 4.5),
('Smartphone Galaxy S23', 'Celular com 128GB e câmera tripla', 'Eletrônicos', 4200.00, '0.15x0.07x0.008m', 4.8),
('Sofá 3 Lugares', 'Sofá retrátil e reclinável', 'Móveis', 2500.00, '2.10x1.00x1.10m', 4.3),
('Livro - Dom Casmurro', 'Clássico da literatura brasileira', 'Livros', 45.90, '0.20x0.15x0.02m', 4.9),
('Toalha de Banho', 'Toalha 100% algodão', 'Casa, Mesa e Banho', 59.90, '1.50x0.80m', 4.7),
('Carrinho de Bebê', 'Carrinho multifuncional dobrável', 'Infantil', 850.00, '1.10x0.60x0.50m', 4.6);

-- ==========
-- PAGAMENTO
-- ==========
insert into Pagamento (Cliente_idCliente, formaPagamento)
values 
(1, 'CARTÃO CRÉDITO'),
(2, 'CARTÃO DE DÉBITO'),
(3, 'BOLETO'),
(4, 'PIX');

-- ========
-- PEDIDOS
-- ========
insert into Pedido (Cliente_idCliente, statusPedido, dataPedido, valorTotal, prazoDevolucao)
values
(1, 'ENTREGUE', '2025-10-01', 3259.90, '2025-10-30'),
(2, 'ENVIADO', '2025-10-10', 4245.90, '2025-11-09'),
(3, 'PENDENTE', '2025-10-20', 2500.00, '2025-11-19'),
(4, 'PROCESSANDO', '2025-10-15', 4650.00, '2025-10-30'),
(5, 'CANCELADO', '2025-10-18', 899.90, '2025-11-02');

-- ========================
-- VENDEDOR (TERCEIRIZADO)
-- ========================
insert into Vendedor (razaoSocial, cnpj, contatoVendedor)
values
('TechShop LTDA', '44.444.444/0001-44', '27-99999-0002'),
('BabyStore LTDA', '55.555.555/0001-55', '27-99999-0002'),
('TechVendas Ltda', '11.222.333/0001-88', '27-99999-0002'),
('Distribuidora Alpha', '99.887.766/0001-55', '27-99999-0002');

-- =============
-- FORNECEDORES
-- =============
insert into Fornecedor (razaoSocial, cnpj, contatoFornecedor)
values
('Eletro Distribuidora LTDA', '11.111.111/0001-11', '11-99999-0001'),
('Móveis Premium SA', '22.222.222/0001-22', '11-99999-0002'),
('Livraria Cultura Nacional', '33.333.333/0001-33', '11-99999-0003'),
('Dell Brasil', '12345678000100', '11-99999-0004'),
('Logitech Inc.', '98765432000177', '11-99999-0005');

-- ========================
-- ESTOQUE
-- ========================
insert into Estoque (quantEstoque, localizacao)
values
(150, 'Centro de Distribuição SP'),
(200, 'Centro de Distribuição RJ'),
(50, 'Centro de Distribuição - Vitória'),
(1240, 'Armazém - Serra');

-- ========
-- ENTREGA
-- ========
insert into Entrega (Pedido_idPedido, codigoRastream, statusEntrega, dataEnvio, dataEntrega)
values
(1, 'BR123456789SP', 'ENTREGUE', '2025-10-02', '2025-10-05'),
(2, 'BR987654321RJ', 'EM PROCESSO', '2025-10-11', null),
(3, 'BR555222111SP', 'EM PROCESSO', null, null),
(4, 'BR111222333ES', 'EM PROCESSO', '2025-10-18', NULL),
(5, 'BR444555666ES', 'DEVOLVIDO', '2025-10-19', '2025-10-20');

-- =====================
-- PRODUTO ↔ FORNECEDOR
-- =====================

insert into Produto_do_Fornecedor (Fornecedor_idFornecedor, Produto_idProduto, quantFornecedor)
values
(1, 1, 20), -- Eletro fornece Geladeira
(1, 2, 50), -- Eletro fornece Smartphone
(2, 3, 15), -- Móveis Premium fornece Sofá
(3, 4, 100), -- Livraria fornece livros
(1, 5, 60),  -- Eletro fornece Toalha
(2, 6, 30);  -- Móveis Premium fornece Carrinho

/* update Produto_do_Fornecedor
set Fornecedor_idFornecedor = 1
where Fornecedor_idFornecedor = 4 and Produto_idProduto = 5; */

-- ==================
-- PRODUTO ↔ ESTOQUE
-- ==================
insert into Produto_em_Estoque (Estoque_idEstoque, Produto_idProduto, quantDisponivel)
values
(1, 1, 10),
(1, 2, 15),
(2, 3, 5),
(1, 4, 25),
(2, 5, 30),
(2, 2, 0);

-- ===================
-- PRODUTO ↔ VENDEDOR
-- ===================
insert into Venda_Terceirizada (Vendedor_idVendedor, Produto_idProduto, quantVendedor)
values
(1, 2, 10), -- TechShop vende Galaxy S23
(2, 6, 5);  -- BabyStore vende Carrinho de Bebê

-- ===================
-- (Produto ↔ Pedido)
-- ===================
insert into Relacao_de_Produto_Pedido (Pedido_idPedido, Produto_idProduto, quantidade, precoUnitario)
values
(1, 5, 2, 59.90),  -- Notebook
(1, 4, 1, 45.90),  -- Livro
(2, 2, 1, 4200.00), -- Galaxy S23
(3, 3, 1, 2500.00); -- Sofá

-- Listar todos os clientes
SELECT * FROM Cliente;

-- Listar todos os produtos e seus preços
SELECT nomeProduto, preco FROM Produto;

-- Listar os clientes e seus Pedidos
select c.primeiroNome, c.sobrenome, p.idPedido, p.statusPedido, p.valorTotal
from Cliente c
join Pedido p on c.idCliente = p.Cliente_idCliente;

-- Listar os pedidos e suas datas e status
SELECT idPedido, Cliente_idCliente, dataPedido, statusPedido FROM Pedido;

-- Listar os produtos mais caros
select nomeProduto, preco from Produto order by preco desc limit 3;

-- Listar os pedidos com o nome completo do cliente
select p.idPedido, CONCAT(c.primeiroNome, ' ', c.sobrenome) as nomeCliente, p.statusPedido, p.dataPedido
from Pedido p
join Cliente c on p.Cliente_idCliente = c.idCliente;

-- Total de pedidos por status
select statusPedido, COUNT(*) AS quantidade
from Pedido
group by statusPedido;

-- Listar fornecedores e seus produtos
select f.razaoSocial, p.nomeProduto
from Fornecedor f
join Produto_do_Fornecedor pf on f.idFornecedor = pf.Fornecedor_idFornecedor
join Produto p on pf.Produto_idProduto = p.idProduto;

-- Pedidos com detalhes de entrega
select pe.idPedido, c.primeiroNome, e.statusEntrega, e.codigoRastream
from Pedido pe
join Cliente c on pe.Cliente_idCliente = c.idCliente
join Entrega e on e.Pedido_idPedido = pe.idPedido;

-- Listar produtos disponíveis em estoque e quantidades
select e.localizacao, p.nomeProduto, pe.quantDisponivel
from Produto_em_Estoque pe
join Produto p on p.idProduto = pe.Produto_idProduto
join Estoque e on e.idEstoque = pe.Estoque_idEstoque;

-- Listar quantos pedidos foram feitos por cliente
select c.idCliente, CONCAT(c.primeiroNome, ' ', c.sobrenome) as nomeCliente, COUNT(p.idPedido) as totalPedidos
from Cliente c
left join Pedido p on c.idCliente = p.Cliente_idCliente
group by c.idCliente;

-- Valor médio dos pedidos
select 
    avg(valorTotal) as mediaValorPedidos
from Pedido;

-- Listar produtos que nunca foram vendidos
select nomeProduto from Produto
where idProduto not in (
   select distinct Produto_idProduto from Relacao_de_Produto_Pedido
);

-- Listar clientes que já tiveram pedido entregue
select distinct c.idCliente, CONCAT(c.primeiroNome, ' ', c.sobrenome) AS nomeCliente
from Cliente c
join Pedido p on c.idCliente = p.Cliente_idCliente
join Entrega e on p.idPedido = e.Pedido_idPedido
where e.statusEntrega = 'ENTREGUE';