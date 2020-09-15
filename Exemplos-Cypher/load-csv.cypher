LOAD CSV WITH HEADERS FROM "file:///got-traicoes.csv" AS linha
WITH linha
MERGE (Traidor:Personagem {nome: linha.Traidor, casa: linha.CasaTraidor})
MERGE (Vitima:Personagem {nome: linha.Vitima, casa: linha.CasaVitima})
MERGE (Traidor)-[Traicao:Traicao {
`Descrição da Traição`: linha.Traicao, 
`Relação Traidor-Vitima`: linha.`Relac_Traidor-Vitima`, 
`Consequencia Imediata`: CASE WHEN linha.ConsequenciaImediata IS NOT NULL THEN linha.ConsequenciaImediata ELSE '' END,
Local: CASE WHEN linha.Local IS NOT NULL THEN linha.Local ELSE '' END
}]->(Vitima)