CREATE TABLE sessao (
  Codigo INT PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL,
  Localizacao VARCHAR(255) NOT NULL
);

CREATE TABLE livro (
  Cod_Livro INT PRIMARY KEY,
  Titulo VARCHAR(255) NOT NULL,
  Autor VARCHAR(255) NOT NULL,
  Cod_Sessao INT NOT NULL,
  FOREIGN KEY (Cod_Sessao) REFERENCES sessao (Codigo)
);

CREATE TABLE aluno (
  id INT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  matricula INT NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(20)
);

CREATE TABLE emprestimo (
  codigo INT PRIMARY KEY,
  data_hora DATETIME NOT NULL,
  matric_aluno INT NOT NULL,
  cod_livro INT NOT NULL,
  data_devolucao DATE,
  FOREIGN KEY (matric_aluno) REFERENCES aluno (matricula),
  FOREIGN KEY (cod_livro) REFERENCES livro (Cod_Livro)
);
