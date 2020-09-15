# Blog Post: Neo4j - Entenda de Forma Leve e Descontraída

Simplificando Neo4j e Cypher com exemplos Hands-On baseados na série GoT. Além de um breve comparativo com o Amazon Neptune.

Este repositório foi criado por causa desse blog post <link> onde falamos um pouco sobre Neo4j e Cypher. A idéia é disponibilizar scripts com comandos básicos e bases de dados utilizados para que qualquer pessoa possa simular os testes com neo4j e até mesmo incrementar.


### Instalando o Neo4j

Acessar o [`link de download do Neo4j`](https://neo4j.com/download/) e seguir o passo a passo recomendado. Não tem segredo.


### Estrutura 

* Dados - Arquivo .csv com algumas traições entre personagens.
    * Onde salvar os arquivos para importação:
        * Mac OS or Linux – `<neo4j-home>/import`
        
            Ex.: `/Users/<userid>/Library/Application Support/Neo4j Desktop/Application/neo4jDatabases/database-<id#>/installation-<neo4jVersion>/import`

        * Windows Desktop – `<neo4j-home>\import`
        
            Ex.: `C:\Users\<userid>\.Neo4jDesktop\neo4jDatabases\database-<id#>\installation-<neo4jVersion>\import`
    
     Você pode encontrar mais exemplos de como fazer a importação na [`Documentação Oficial`](https://neo4j.com/developer/guide-import-csv/).  

* Exemplos-Cypher - Contém arquivos .cypher (algumas pessoas utilizam a extensão .cql) com comandos básicos.
    * comandos_basicos.cypher: Comandos básicos explicados no artigo.
    * got.cypher: Como criar relacionamentos entre nodes baseados em GoT.
    * load-csv.cypher: Importação de dados via arquivo .csv sobre algumas das traições de GoT.
    * exemplos-consultas.cypher: Consultas mais avançadas baseadas nos grafos de traições de GoT.

