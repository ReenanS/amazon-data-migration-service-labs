-- Usar a base de dados criada
USE testdb;
GO

-- Criação da tabela Estudantes
CREATE TABLE Estudantes (
    EstudanteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100),
    Curso NVARCHAR(100),
    Professor NVARCHAR(100)
);
