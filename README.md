# Inser-o-Tabela-com-Update

Cadastro de Material – ABAP Report
📖 Descrição

Este programa ABAP foi desenvolvido para realizar o cadastro e manutenção de registros na tabela ZTMaterial.
<img width="877" height="415" alt="Captura de tela 2026-02-27 212512" src="https://github.com/user-attachments/assets/b8f6a6a4-ff86-44ae-9317-b5085d61d8ef" />
<img width="853" height="435" alt="Captura de tela 2026-02-27 212653" src="https://github.com/user-attachments/assets/ef029e95-58ed-4d0f-895d-fad3d228e9f5" />
O report permite:

Inserir novos materiais

Atualizar materiais existentes (quando autorizado via checkbox)

Validar duplicidade de código antes da gravação

Exibir mensagens de sucesso ou erro conforme o processamento

🧠 Lógica do Programa

O programa está dividido em dois principais eventos do ABAP clássico:

🔹 1. AT SELECTION-SCREEN (Validação)

Realiza um SELECT SINGLE na tabela ZTMaterial para verificar se o código informado já existe.

Caso o código exista e o checkbox de atualização não esteja marcado:

O sistema emite uma mensagem de erro (TYPE 'E')

A execução é interrompida

O usuário retorna à tela de seleção

Essa abordagem garante integridade dos dados antes do processamento.

🔹 2. START-OF-SELECTION (Processamento)

Após validação bem-sucedida:

Os dados informados nos parâmetros são atribuídos a uma estrutura do tipo ZTMaterial.

O sistema verifica se o código já existia:

Se existir → executa UPDATE

Se não existir → executa INSERT

O retorno do banco é validado via sy-subrc.

Uma mensagem de sucesso é exibida conforme a operação realizada.

🛠 Tecnologias e Conceitos Utilizados

PARAMETERS

SELECT SINGLE

Controle de fluxo com sy-subrc

IS NOT INITIAL

INSERT

UPDATE

Eventos clássicos de Report ABAP

Validação em AT SELECTION-SCREEN

🎯 Objetivo Técnico

Este projeto tem como finalidade praticar:

Manipulação de dados em tabela customizada

Controle de integridade antes de inserção

Separação entre validação e processamento

Boas práticas em desenvolvimento ABAP clássico


