# Estudantes

  1) Seja possível cadastrar 2 entidades básicas: Estudantes e Cursos

  2) Após executar o cadastro acima, crie um processo de matrícula, ou seja, uma
  “tela” onde seja possível vincular um Estudante a um Curso, registrando
  inclusive a data e hora que o mesmo foi vinculado.

Na execução do projeto é necessária a utilização das seguintes tecnologias:
  
  - RubyOnRails:
    - tradução/locale:
      - de models
      - de controllers
      - e/ou views
  - RSpec:
    - testes de aceitação com Capybara,
    - controller,
    - model com FactoryGirl
  - utilização da gem Responder,
  - utilização da gem Enumerate It,
  - utilização da gem Slim-Rails,
  - e PostgreSQL.

Nos cadastros básicos e matrícula é desejável que seja realizado as validações e
máscaras Javascript para tornar mais agradável o uso da aplicação WEB.

Ao seu critério é desejável o melhor visual dos cadastros básicos e matrícula
utilizando CSS/HTML.

Para as questões acima, utilize o seguinte modelo entidade relacional:

```ERD
+------------------------------+    +---------------------+    +--------------------------+
| students                     |---<| classrooms          |>---| courses                  |
+------------------------------+    +---------------------+    +--------------------------+
| PK id: INT                   |    | PK id: INT          |    | PK id: INT               |
| name: VARCHAR(45)            |    | FK students_id: INT |    | name: VARCHAR(45)        |
| register_number: VARCHAR(45) |    | FK courses_id: INT  |    | description: VARCHAR(45) |
| status: INT                  |    | entry_at: DATETIME  |    | status: INT              |
+------------------------------+    +---------------------+    +--------------------------+
```
