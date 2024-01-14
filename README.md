# db_escola
README - Sistema de Controle de Biblioteca
Este repositório contém o código SQL para a criação de um banco de dados para um sistema de controle de biblioteca. O banco de dados é composto por quatro tabelas: sessão, livro, aluno e empréstimo. Abaixo detalhes sobre cada tabela:

Tabelas

sessão
A tabela sessão armazena informações sobre as sessões da biblioteca, como a classificação dos livros e sua localização.
sessão CREATE TABLE (
Código INT PRIMARY KEY,
Descrição VARCHAR(255) NOT NULL,
Localização VARCHAR(255) NOT NULL
);
Código: Chave primária identificadora da sessão.
Descrição: Descrição da sessão.
Localização: Localização física da sessão na biblioteca.

livro
A tabela livro armazena informações sobre os livros disponíveis na biblioteca.
CREATE TABLE livro (
Cod_Livro INT PRIMARY KEY,
Titulo VARCHAR(255) NOT NULL,
Autor VARCHAR(255) NOT NULL,
Cod_Sessao INT NOT NULL,
FOREIGN KEY (Cod_Sessao) REFERENCES sessao (Codigo)
);
Cod_Livro: Chave primária identificadora do livro.
Título: Título do livro.
Autor: Autor do livro.
Cod_Sessao: Chave estrangeira referenciando sessão a qual o livro pertence.

aluno
A tabela aluno armazena informações sobre os alunos da biblioteca.
CREATE TABLE aluno (
id INT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
matrícula INT NOT NULL UNIQUE,
email VARCHAR(255) NOT NULL,
telefone VARCHAR(20)
);
id: Chave primária identificadora do aluno.
nome: Nome do aluno.
matrícula: Número de matrícula do aluno (único).
email: Endereço de e-mail do aluno.
telefone: Número de telefone do aluno (opcional).

empréstimo
A tabela empréstimo registra os empréstimos de livros feitos pelos alunos.
CREATE TABLE emprestimo (
codigo INT PRIMARY KEY,
data_hora DATETIME NOT NULL,
matric_aluno INT NOT NULL,
cod_livro INT NOT NULL,
data_devolucao DATE,
FOREIGN KEY (matric_aluno) REFERENCES aluno (matricula),
FOREIGN KEY (cod_livro) REFERENCES livro (Cod_Livro)
);
código: Chave primária identificadora do empréstimo.
data_hora: Data e hora do empréstimo.
matric_aluno: Chave estrangeira referenciando o aluno que fez o empréstimo.
cod_livro: Chave estrangeira referenciando o livro emprestado.
data_devolucao: Dados previstos para a devolução do livro.

Relacionamentos
A tabela livro possui uma chave estrangeira (Cod_Sessao) que referencia a tabela sessão.
A tabela de empréstimo possui duas chaves estrangeiras (matric_aluno e cod_livro) que referenciam as tabelas aluno e livro, respectivamente.
Este esquema de banco de dados fornece uma estrutura básica para o controle de uma biblioteca, permitindo o gerenciamento de sessões, livros, aulas e empréstimos. Sinta-se à vontade para fazer alterações ou expandir conforme necessário para atender às necessidades específicas do seu projeto.
