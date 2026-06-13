# Case de Análise de Dados: Diagnóstico Sazonal de Vendas (Contoso Retail)

Este repositório apresenta um estudo de caso prático focado em inteligência de negócio e auditoria de dados históricos utilizando **SQL Server (T-SQL)** sobre o Data Warehouse da *Contoso Retail*.

## 🎯 O Contexto de Negócio
Imagine o seguinte cenário: O time de planejamento de estoque e marketing da Contoso identificou que o mês de dezembro de 2008 foi um dos períodos mais agressivos em vendas na história da empresa. Para planejar as campanhas dos anos seguintes, a diretoria solicitou um **diagnóstico detalhado de um dia específico de pico (20 de Dezembro de 2008)**, que caiu em um sábado pré-natalino. 

O objetivo era responder de forma cirúrgica: **Qual categoria de produto liderou o volume de itens vendidos (Sales Quantity) e qual gerou o maior faturamento absoluto (Sales Amount) nesse dia estratégico?**

## 🛠️ Habilidades Técnicas Demonstradas
* **Modelagem Star Schema:** Junção eficiente de tabelas de fatos (`FactSales`) com múltiplas dimensões (`DimDate`, `DimProduct`, `DimProductSubcategory`, `DimProductCategory`).
* **Tratamento de Dados:** Uso de funções condicionais (`ISNULL`) para garantir a integridade dos nomes das categorias no relatório.
* **Manipulação Temporal Avançada:** Uso de funções de extração de data (`DATENAME`, `DATEPART`, `DAY`, `YEAR`) para isolar o comportamento do consumidor no dia exato solicitado pelo negócio.
* **Agregação e Ordenação:** Agrupamento multi-nível e ordenação focada na métrica de maior valor para o estoque (quantidade de itens movimentados).

## 🗄️ A Solução em SQL
O script estruturado para responder a essa pergunta de negócio está disponível no arquivo:
👉 `analise_pico_vendas_2008.sql`

## 📊 Resultado da Análise (Output)
Abaixo está a visualização dos dados e do ranking gerado diretamente pelo banco de dados SQL Server:

<img width="1172" height="1065" alt="image" src="https://github.com/user-attachments/assets/410a92dd-6cd3-4b75-ba1e-d421828f5e56" />


## 💡 O que esse resultado traria para o Negócio? (Insights)
Ao executar essa análise estruturada, o negócio consegue:
1. **Evitar Ruptura de Estoque (Stockout):** Saber exatamente o que o cliente compra no último sábado antes do Natal permite abastecer as gôndolas e os centros de distribuição com antecedência.
2. **Estratégia de Precificação (Markup):** Identificar se a categoria que mais vende volume é também a que traz maior faturamento, ajudando a equilibrar promoções de fim de ano.
