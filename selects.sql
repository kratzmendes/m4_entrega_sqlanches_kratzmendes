-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
  pd.*, pr.*
  FROM 
    produtos_pedidos pr_pd

  INNER JOIN 
    pedidos pd ON pr_pd.pedido_id = pd.id
  INNER JOIN 
    produtos pr ON pr_pd.produto_id = pr.id

-- 2)
SELECT
  pd.id

  FROM 
    produtos_pedidos pr_pd

  INNER JOIN 
    pedidos pd ON pr_pd.pedido_id = pd.id
  INNER JOIN 
    produtos pr ON pr_pd.produto_id = pr.id

  WHERE  
    pr.nome = 'Fritas'

-- 3)
SELECT
  cl.nome AS gostam_de_fritas

  FROM 
    produtos_pedidos pr_pd

  INNER JOIN 
    pedidos pd ON pr_pd.pedido_id = pd.id
  INNER JOIN 
    produtos pr ON pr_pd.produto_id = pr.id
  INNER JOIN 
    clientes cl ON pd.cliente_id = cl.id

  WHERE  
    pr.nome = 'Fritas'

-- 4)
SELECT
  SUM(pr."preço")

  FROM 
    produtos_pedidos pr_pd

  INNER JOIN 
    pedidos pd ON pr_pd.pedido_id = pd.id
  INNER JOIN 
    produtos pr ON pr_pd.produto_id = pr.id
  INNER JOIN 
    clientes cl ON pd.cliente_id = cl.id

  WHERE  
    cl.nome= 'Laura';

-- 5)

SELECT
  pr.nome,
  COUNT(pd.id)

  FROM 
    produtos_pedidos pr_pd

  INNER JOIN 
    pedidos pd ON pr_pd.pedido_id = pd.id
  INNER JOIN 
    produtos pr ON pr_pd.produto_id = pr.id
  INNER JOIN 
    clientes cl ON pd.cliente_id = cl.id

  GROUP BY 
    pr.nome 
  ORDER BY
    pr.nome ASC; 