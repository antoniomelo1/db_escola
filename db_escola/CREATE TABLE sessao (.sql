CREATE TABLE `aluno` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `matricula` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `emprestimo` (
  `codigo` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `matric_aluno` int(11) NOT NULL,
  `cod_livro` int(11) NOT NULL,
  `data_devolucao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `livro` (
  `Cod_Livro` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Autor` varchar(255) NOT NULL,
  `Cod_Sessao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `sessao` (
  `Codigo` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Localizacao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`);


ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `matric_aluno` (`matric_aluno`),
  ADD KEY `cod_livro` (`cod_livro`);


ALTER TABLE `livro`
  ADD PRIMARY KEY (`Cod_Livro`),
  ADD KEY `Cod_Sessao` (`Cod_Sessao`);


ALTER TABLE `sessao`
  ADD PRIMARY KEY (`Codigo`);


ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`matric_aluno`) REFERENCES `aluno` (`matricula`),
  ADD CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`cod_livro`) REFERENCES `livro` (`Cod_Livro`);


ALTER TABLE `livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`Cod_Sessao`) REFERENCES `sessao` (`Codigo`);
COMMIT;
