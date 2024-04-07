-- Usar a base de dados criada
USE testdatabase;
GO

-- Inserts de exemplo para a tabela Cursos
INSERT INTO Cursos (CursoID, Nome, Departamento) VALUES
(1, 'Ciência da Computação', 'Ciência da Computação'),
(2, 'Engenharia Elétrica', 'Engenharia Elétrica'),
(3, 'Matemática Aplicada', 'Matemática');

-- Inserts de exemplo para a tabela Professores
INSERT INTO Professores (ProfessorID, Nome, Email, CursoID) VALUES
(1, 'João Silva', 'joao.silva@example.com', 1),
(2, 'Maria Oliveira', 'maria.oliveira@example.com', 2),
(3, 'Pedro Santos', 'pedro.santos@example.com', 1);

-- Inserts de exemplo para a tabela Estudantes
INSERT INTO Estudantes (EstudanteID, Nome, Email, CursoID) VALUES
(1, 'Ana Sousa', 'ana.sousa@example.com', 1),
(2, 'Luís Pereira', 'luis.pereira@example.com', 2),
(3, 'Mariana Costa', 'mariana.costa@example.com', 1);