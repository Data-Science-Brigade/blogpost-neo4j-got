// Criando nodes com propriedades/atributos e relacionamentos com MERGE
// Cria os personagens com o comando MERGE
MERGE (p1 : Personagem {nome: 'Jon Snow', titulo: 'Rei do Norte', animal_estimacao: 'Lobo - Ghost'})
MERGE (p2 : Personagem {nome: 'Ned Stark', titulo: 'Lorde de Winterfell', frase: 'The Winter is Coming'}) 
MERGE (p3 : Personagem {nome: 'Daenerys Targaryen', titulo: 'Khaleesi, A Não-Queimada, Mãe de Dragões...' })
// Cria as duas casas dos personagens, com seus atributos 
MERGE (c1 : Casa {nome: 'Stark', simbolo: 'Lobo' })
MERGE (c2 : Casa {nome: 'Targaryen', simbolo: 'Dragao Vermelho de 3 cabeças' }) 
// Cria os relacionamentos entre personagens e suas casas
MERGE (p1)-[r1: PERTENCE_A_CASA]->(c1)
MERGE (p2)-[r2: PERTENCE_A_CASA]->(c1)
MERGE (p3)-[r3: PERTENCE_A_CASA]->(c2)
// Elementos retornados pela consulta
RETURN p1, p2, p3, c1, c2

// Retornar o schema do banco
CALL db.schema.visualization

// Encontrar os registros já criados e dar um nome (como se fosse atribuir um valor a uma variável para usar depois) e fazer o MERGE para criar os relacionamentos
MATCH (p1 : Personagem {nome: 'Jon Snow'}), (p2 : Personagem {nome: 'Ned Stark'}), (p3 : Personagem {nome: 'Daenerys Targaryen'}), (c1 : Casa {nome: 'Targaryen'})
MERGE (p1)-[:FILHO_BASTARDO {Temporadas:'1 - 6'}]->(p2)
MERGE (p1)-[:SOBRINHO {Temporadas:'6 - 8'}]->(p2)
MERGE (p1)-[:SOBRINHO {Temporadas:'6 - 8'}]->(p3)
MERGE (p1)-[:SE_APAIXONOU]->(p3)
MERGE (p1)-[:DOBROU_O_JOELHO]->(p3)
MERGE (p3)-[:TIA {Temporadas:'6 - 8'}]->(p1)
MERGE (p2)-[:PAI {Temporadas:'1 - 6'}]->(p1)
MERGE (p2)-[:TIO {Temporadas:'6 - 8'}]->(p1)
MERGE (p1)-[:PERTENCE_A_CASA]->(c1)

// Encontrar todos os nodes e relacionamentos
MATCH (n) RETURN (n)

