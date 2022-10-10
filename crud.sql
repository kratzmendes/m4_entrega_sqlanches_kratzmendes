-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes
    (nome, lealdade)
  VALUES
    ('Georgia', 0)


-- 2)

INSERT INTO pedidos 
    (status, cliente_id)
VALUES
  ('Recebido', 6)

-- 3)

INSERT INTO produtos_pedidos
  (pedido_id, produto_id)
  VALUES
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8)

-- Leitura

-- 1)
SELECT
  cl.*, pd.*, pr.*

FROM 
  produtos_pedidos pr_pd

INNER JOIN 
  pedidos pd ON pr_pd.pedido_id = pd.id
INNER JOIN 
  produtos pr ON pr_pd.produto_id = pr.id
INNER JOIN 
  clientes cl ON pd.cliente_id = cl.id

WHERE  
  cl.nome = 'Georgia'


-- Atualização

-- 1)

UPDATE 
  clientes 
  SET   
    lealdade = 
    (SELECT
      SUM (pr.pts_de_lealdade)

      FROM 
        produtos_pedidos pr_pd

      INNER JOIN 
        pedidos pd ON pr_pd.pedido_id = pd.id
      INNER JOIN 
        produtos pr ON pr_pd.produto_id = pr.id
      INNER JOIN 
        clientes cl ON pd.cliente_id = cl.id

      WHERE  
        cl.nome = 'Georgia'
    )

  WHERE  clientes.nome = 'Georgia'



-- Deleção

-- 1)

DELETE FROM 
  clientes 

WHERE  
  clientes.nome = 'Marcelo';