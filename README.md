# Documentação do Projeto: SQL

Este repositório contém scripts SQL para diversas operações de banco de dados.  
Abaixo está uma descrição detalhada de cada script, incluindo exemplos de queries e tabelas de exemplo.

---

## 📦 ESTOQUE DE PRODUTOS.sql

Um script para gerenciar o estoque de produtos. Inclui comandos para adicionar, atualizar, excluir e visualizar registros de produtos.

**Exemplo de Tabela: `Produtos`**

| id | nome            | descricao                      | preco   | quantidade | data_adicao |
|----|-----------------|--------------------------------|---------|------------|--------------|
| 1  | Notebook Gamer  | Notebook de alta performance  | 7500.00 | 15         | 2025-09-16   |
| 2  | Mouse sem Fio   | Mouse ergonômico              | 120.50  | 50         | 2025-09-10   |
| 3  | Teclado Mecânico| Teclado com switches azuis    | 450.00  | 8          | 2025-09-15   |

**Queries SQL**
```sql
-- Inserir um novo produto
INSERT INTO Produtos (nome, descricao, preco, quantidade) VALUES
('Monitor Curvo', 'Monitor ultrawide 240Hz', 1800.00, 20);

-- Atualizar a quantidade de um produto
UPDATE Produtos SET quantidade = 10 WHERE id = 3;

-- Selecionar produtos com quantidade baixa (menos de 10 unidades)
SELECT nome, quantidade FROM Produtos WHERE quantidade < 10 ORDER BY quantidade ASC;


---

🔐 autoSec.sql

Um script para automatizar verificações e processos de segurança no banco de dados, como o gerenciamento de permissões de usuários e auditoria básica.

Exemplo de Tabela: Usuarios_DB

id_usuario	nome_usuario	permissao

1	admin	ALL PRIVILEGES
2	relatorios	SELECT
3	financeiro	SELECT, INSERT


Queries SQL

-- Criar um novo usuário com permissão de somente leitura
CREATE USER 'convidado_relatorio'@'localhost' IDENTIFIED BY 'senha_relatorio';
GRANT SELECT ON NomeDoBanco.* TO 'convidado_relatorio'@'localhost';
FLUSH PRIVILEGES;

-- Remover permissão de um usuário
REVOKE INSERT ON NomeDoBanco.financeiro FROM 'financeiro'@'localhost';

-- Mostrar todas as permissões concedidas a um usuário
SHOW GRANTS FOR 'admin'@'localhost';


---

🎂 averageAge.sql

Um script para calcular a idade média de clientes ou usuários armazenados no banco de dados.

Exemplo de Tabela: Usuarios

id	nome	data_nascimento	cidade

101	João	1990-05-20	Campina Grande
102	Maria	1985-11-15	João Pessoa
103	Pedro	2000-01-25	Campina Grande


Queries SQL

-- Calcular a idade média de todos os usuários
SELECT
    AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS idade_media
FROM Usuarios;

-- Calcular a idade média por cidade
SELECT
    cidade,
    AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS idade_media_por_cidade
FROM Usuarios
GROUP BY cidade;


---

🏨 bookingRequestsFromHotelsLocation.sql

Um script que gera consultas para filtrar solicitações de reserva e localizações de hotéis, usando joins para combinar dados de diferentes tabelas.

Exemplo de Tabelas

Hoteis

id_hotel	nome_hotel	localizacao

1	Hotel Sol & Mar	Praia de Tambaú
2	Pousada da Montanha	Serra da Borborema
3	Hotel Urbano JP	Centro de João Pessoa


Reservas

id_reserva	id_hotel	data_reserva

1001	1	2025-10-01
1002	1	2025-10-05
1003	2	2025-10-10


Queries SQL

-- Selecionar todas as reservas e os nomes dos hotéis
SELECT H.nome_hotel, B.id_reserva
FROM Hoteis H
INNER JOIN Reservas B ON H.id_hotel = B.id_hotel;

-- Selecionar todos os hotéis, mesmo sem reservas
SELECT H.nome_hotel, B.id_reserva
FROM Hoteis H
LEFT JOIN Reservas B ON H.id_hotel = B.id_hotel;


---

💰 budget.sql

Um script para gerenciar registros de orçamento. Inclui comandos para rastrear receitas, despesas e gerar relatórios.

Exemplo de Tabela: Transacoes

id	descricao	tipo	valor	data

1	Salário	receita	3500.00	2025-09-01
2	Aluguel	despesa	1000.00	2025-09-05
3	Freelance	receita	500.00	2025-09-10
4	Supermercado	despesa	450.00	2025-09-12


Queries SQL

-- Calcular o saldo total (receitas - despesas)
SELECT SUM(CASE WHEN tipo = 'receita' THEN valor ELSE -valor END) AS saldo_total
FROM Transacoes;

-- Gerar um relatório de despesas por mês
SELECT YEAR(data) AS ano, MONTH(data) AS mes, SUM(valor) AS total_despesas
FROM Transacoes
WHERE tipo = 'despesa'
GROUP BY ano, mes
ORDER BY ano, mes;


---

👕 clothesStore.sql

Um script para gerenciar o inventário e os registros de vendas de uma loja de roupas.

Exemplo de Tabela: Roupas

id	nome	tamanho	cor	estoque

101	Camiseta Branca	M	Branco	25
102	Calça Jeans	42	Azul	15
103	Casaco de Lã	P	Preto	10


Queries SQL

-- Registrar uma nova venda e atualizar o estoque
BEGIN TRANSACTION;

INSERT INTO Vendas (id_roupa, quantidade, data_venda) VALUES (101, 1, NOW());
UPDATE Roupas SET estoque = estoque - 1 WHERE id = 101;

COMMIT;

-- Selecionar itens com estoque baixo (menos de 5 unidades)
SELECT nome, estoque FROM Roupas WHERE estoque < 5;


---

🎁 customerOffer.sql

Um script para gerenciar ofertas e promoções para clientes.

Exemplo de Tabela: Ofertas

id_oferta	nome_oferta	desconto	ativa	data_inicio	data_fim

1	Desconto de Inverno	15.00	TRUE	2025-06-01	2025-08-31
2	Frete Grátis	100.00	TRUE	2025-09-01	2025-10-31
3	Black Friday	50.00	FALSE	2025-11-20	2025-11-25


Queries SQL

-- Selecionar todas as ofertas ativas na data atual
SELECT * FROM Ofertas WHERE ativa = TRUE AND CURDATE() BETWEEN data_inicio AND data_fim;

-- Desativar uma oferta manualmente
UPDATE Ofertas SET ativa = FALSE WHERE id_oferta = 1;


---

🛠 serviceOrders.sql

Um script para gerenciar ordens de serviço, com comandos para criar, atualizar e rastrear o status de cada ordem.

Exemplo de Tabela: OrdensDeServico

id_os	descricao	status	data_abertura

1	Reparo do PC	aberta	2025-09-15
2	Instalação de software	em_andamento	2025-09-14
3	Troca de peça	concluida	2025-09-10


Queries SQL

-- Inserir uma nova ordem de serviço
INSERT INTO OrdensDeServico (descricao, status) VALUES
('Limpeza de componentes', 'aberta');

-- Atualizar o status de uma ordem de serviço
UPDATE OrdensDeServico SET status = 'concluida' WHERE id_os = 1;

-- Selecionar ordens de serviço em andamento
SELECT * FROM OrdensDeServico WHERE status = 'em_andamento';


---

📊 sumByCategory.sql

Um script para calcular a soma de transações ou registros agrupados por categoria.

Exemplo de Tabela: Gastos

id_gasto	descricao	categoria	valor	data

1	Jantar fora	Alimentação	85.00	2025-09-10
2	Combustível	Transporte	150.00	2025-09-12
3	Livro	Lazer	60.00	2025-09-13
4	Supermercado	Alimentação	300.00	2025-09-15


Queries SQL

-- Calcular o total gasto por categoria
SELECT categoria, SUM(valor) AS valor_total
FROM Gastos
GROUP BY categoria
ORDER BY valor_total DESC;

-- Contar o número de transações e somar o valor por categoria
SELECT categoria, COUNT(id_gasto) AS numero_de_gastos, SUM(valor) AS valor_total
FROM Gastos
GROUP BY categoria;


---

👉 Quer que eu também adicione um **índice (sumário interativo com links clicáveis)** no topo do README para facilitar a navegação entre os scripts?

