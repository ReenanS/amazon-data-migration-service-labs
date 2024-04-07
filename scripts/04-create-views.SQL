-- Usar a base de dados criada
USE testdatabase;
GO

-- Criar view de exemplo para unir as informações das três tabelas 
CREATE VIEW UniversidadeView AS
SELECT 
    Estudantes.EstudanteID,
    Estudantes.Nome AS Nome_Estudante,
    Estudantes.Email AS Email_Estudante,
    Cursos.Nome AS Nome_Curso,
    Cursos.Departamento AS Departamento_Curso,
    Professores.Nome AS Nome_Professor,
    Professores.Email AS Email_Professor
FROM Estudantes
INNER JOIN Cursos ON Estudantes.CursoID = Cursos.CursoID
LEFT JOIN Professores ON Cursos.CursoID = Professores.CursoID;