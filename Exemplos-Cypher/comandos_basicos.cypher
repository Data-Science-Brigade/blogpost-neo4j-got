// Criar um node com uma propriedade/atributo
CREATE (n { nome: 'Lannister' })

// Criar um node com uma propriedade/atributo e retornar a informação
CREATE (n { nome: 'Lannister' }) RETURN n

// Encontrar o node filtrado pela propriedade nome
MATCH (n { nome: 'Lannister' }) RETURN n

// Criar um node com Label e com uma propriedade/atributo
CREATE (n : Casa {nome: 'Lannister', simbolo: 'Um Leão Dourado' }) 
RETURN n

// Criar nodes com um relacionamento
CREATE (n1: Personagem{nome:'Tyrion Lannister'})-[r: PERTENCE_A_CASA]-> (n2: Casa {nome: 'Lannister', simbolo: 'Um Leão Dourado' }) 
RETURN n1,n2,r

// Encontrar todos os nodes e relacionamentos
MATCH (n) RETURN (n)

// Criar nova propriedade no node com o comando SET
MATCH (n { nome: 'Tyrion Lannister' }) 
SET n.teste = 'TESTE COMANDO SET'
RETURN n

// Alterar propriedade com o comando SET
MATCH (n { nome: 'Tyrion Lannister' }) 
SET n.teste = 'TESTE COMANDO SET - alterando propriedade teste'
RETURN n

// Remover propriedade 
MATCH (n { nome: 'Tyrion Lannister' }) 
REMOVE n.teste 
RETURN n

// Criar nova propriedade no relacionamento com o comando SET
MATCH (n { nome: 'Tyrion Lannister' })-[r: PERTENCE_A_CASA]->(n1) 
SET r.outroteste = 'nova propriedade no relacionamento'
return n,r,n1

// Alterar propriedade no relacionamento com o comando SET
MATCH (n { nome: 'Tyrion Lannister' })-[r: PERTENCE_A_CASA]->(n1) 
SET r.outroteste = 'outro teste'
return n,r,n1

// Remover propriedade
MATCH (n { nome: 'Tyrion Lannister' })-[r: PERTENCE_A_CASA]->(n1) 
REMOVE r.outroteste
return n,r,n1

// Encontrar o node filtrado pela propriedade nome e deletar
MATCH (n { nome: 'Lannister' }) DELETE n

// Deletar todos os nodes e relacionamentos
MATCH (n) OPTIONAL MATCH (n)-[r]-() 
DELETE n,r


