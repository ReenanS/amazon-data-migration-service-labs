-- Usar a base de dados criada
USE testdatabase;
GO

-- Criação da tabela Cursos
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    Nome NVARCHAR(100),
    Departamento NVARCHAR(100)
);

-- Criação da tabela Professores
CREATE TABLE Professores (
    ProfessorID INT PRIMARY KEY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100),
    CursoID INT,
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Criação da tabela Estudantes
CREATE TABLE Estudantes (
    EstudanteID INT PRIMARY KEY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100),
    CursoID INT,
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);