// Quantos relacionamentos (traições) temos em nosso grafo
MATCH (n)-[r]->()
RETURN COUNT(r)


// Todos os nodes da Casa Stark
MATCH (n:Personagem) 
WHERE n.casa = 'Stark'
RETURN n


// Todos os nodes da Casa Lannister
MATCH (n:Personagem) 
WHERE n.casa = 'Lannister'
RETURN n


// Todos os nodes da Casa Stark ou Lannister
MATCH (n:Personagem) 
WHERE n.casa = 'Stark' OR n.casa = 'Lannister'
RETURN n


// Todas as pessoas que trairam Ned Stark
MATCH (p)-[r]->(n:Personagem {nome:'Ned'})
RETURN p,r,n


// Quantas pessoas a Cersei traiu 
MATCH (n:Personagem {nome:'Cersei'})-[r]->(p)
RETURN COUNT(p) as PessoasCerseiTraiu

// Vamos conferir se ficou correto?! Afinal o pessoal gosta de trair as pessoas
MATCH (n:Personagem {nome:'Cersei'})-[r]->(p)
RETURN COUNT(p) as PessoasCerseiTraiu,r,c,p

// Quantas pessoas a Cersei traiu realmente
// No primeiro MATCH temos a quantidade de traições que a Cersei cometeu - ela traiu 2x o Robert
MATCH (n:Personagem {nome:'Cersei'})-[r]->(p)
RETURN COUNT(DISTINCT p) as PessoasCerseiTraiu


// Sobre Top Traidor
// Quem foi o mais traidor de nossa base de dados
MATCH (Traidor:Personagem)-[r:Traicao]->(Vitima:Personagem) 
RETURN Traidor, COUNT(Traidor) AS QtdeTraicao
ORDER BY QtdeTraicao DESC LIMIT 1

// Retornar quem  mais cometeu traições (Varys com 7) e quem ele traiu
MATCH (n1)-[r:Traicao]->(n2)
WITH n1, count((n1)-[]->()) AS toptraidor
ORDER BY toptraidor DESC LIMIT 1
MATCH (n1)-[r]->(p)
RETURN n1,r,p


// Sobre Top Vitima
// Personagem que foi mais traido
MATCH (c:Personagem)-[r:Traicao]->(Vitima:Personagem)  
RETURN Vitima, COUNT(*) AS QtdeTraicao
ORDER BY QtdeTraicao DESC LIMIT 1

// Retorna quem foi a maior vitima (Cersei) e quem/como traiu
MATCH (n1)-[r:Traicao]->(n2)
WITH n2, count((n2)-[]->()) AS topvitima
ORDER BY topvitima DESC LIMIT 1
MATCH (p)-[r]->(n2)
RETURN n2,r,p


// Quem não traiu ninguém e pertence a Casa Lannister
MATCH (n) WHERE NOT (n:Personagem)-[:Traicao]->() AND n.casa= 'Lannister'
RETURN n

// Quem não traiu ninguém e pertence a Casa Stark
MATCH (n) WHERE NOT (n:Personagem)-[:Traicao]->() AND n.casa= 'Lannister'
RETURN n


// Personagens que trairam a própria casa e suas traições/vitimas
MATCH (Traidor:Personagem)-[r]->(Vitima)
WHERE Traidor.casa = Vitima.casa
WITH Traidor, COUNT(*) as QtdeTraicao
ORDER BY QtdeTraicao DESC LIMIT 3
MATCH  (v:Personagem)<-[r]-(Traidor)
RETURN v,r,Traidor
