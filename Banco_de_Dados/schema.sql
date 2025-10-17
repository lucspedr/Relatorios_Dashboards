-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql.marize-us.svc.cluster.local
-- Tempo de geração: 17/10/2025 às 01:18
-- Versão do servidor: 8.0.43
-- Versão do PHP: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_user_3`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Análise`
--

CREATE TABLE `Análise` (
  `id_analise` int NOT NULL,
  `id_grafico` int NOT NULL,
  `id_usuario` int NOT NULL,
  `status_aprovacao` int NOT NULL,
  `comentarios` varchar(100) NOT NULL,
  `data_solicitacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cliente`
--

CREATE TABLE `Cliente` (
  `id_cliente` int NOT NULL,
  `id_usuario` int NOT NULL,
  `nome` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `empresa` varchar(80) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Estratégia`
--

CREATE TABLE `Estratégia` (
  `id_estrategia` int NOT NULL,
  `id_relatorio` int NOT NULL,
  `descricao` text NOT NULL,
  `responsavel` varchar(80) NOT NULL,
  `data_execucao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Feedback`
--

CREATE TABLE `Feedback` (
  `id_feedback` int NOT NULL,
  `id_grafico` int NOT NULL,
  `id_usuario` int NOT NULL,
  `comentario` text NOT NULL,
  `data_feedback` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Grafico`
--

CREATE TABLE `Grafico` (
  `id_grafico` int NOT NULL,
  `id_relatorio` int NOT NULL,
  `tipo_grafico` varchar(80) NOT NULL,
  `status` int NOT NULL,
  `data_criacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Log_Processamento`
--

CREATE TABLE `Log_Processamento` (
  `id_log` int NOT NULL,
  `id_relatorio` int NOT NULL,
  `acao` varchar(80) NOT NULL,
  `status` int NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Relatorio`
--

CREATE TABLE `Relatorio` (
  `id_relatorio` int NOT NULL,
  `id_usuario` int NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `data_criacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Solicitação`
--

CREATE TABLE `Solicitação` (
  `id_solicitacao` int NOT NULL,
  `id_grafico` int NOT NULL,
  `id_usuario` int NOT NULL,
  `tipo_solicitacao` varchar(80) NOT NULL,
  `status` int NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `data_solicitacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Usuario`
--

CREATE TABLE `Usuario` (
  `id_usuario` int NOT NULL,
  `nome` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(40) NOT NULL,
  `perfil` varchar(40) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Venda`
--

CREATE TABLE `Venda` (
  `id_venda` int NOT NULL,
  `id_cliente` int NOT NULL,
  `produto_servico` varchar(80) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data` date NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Análise`
--
ALTER TABLE `Análise`
  ADD PRIMARY KEY (`id_analise`),
  ADD KEY `id_grafico` (`id_grafico`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `Estratégia`
--
ALTER TABLE `Estratégia`
  ADD PRIMARY KEY (`id_estrategia`),
  ADD KEY `id_relatorio` (`id_relatorio`);

--
-- Índices de tabela `Feedback`
--
ALTER TABLE `Feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_grafico` (`id_grafico`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `Grafico`
--
ALTER TABLE `Grafico`
  ADD PRIMARY KEY (`id_grafico`),
  ADD KEY `id_relatorio` (`id_relatorio`);

--
-- Índices de tabela `Log_Processamento`
--
ALTER TABLE `Log_Processamento`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_relatorio` (`id_relatorio`);

--
-- Índices de tabela `Relatorio`
--
ALTER TABLE `Relatorio`
  ADD PRIMARY KEY (`id_relatorio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `Solicitação`
--
ALTER TABLE `Solicitação`
  ADD PRIMARY KEY (`id_solicitacao`),
  ADD KEY `id_grafico` (`id_grafico`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices de tabela `Venda`
--
ALTER TABLE `Venda`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Análise`
--
ALTER TABLE `Análise`
  MODIFY `id_analise` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Estratégia`
--
ALTER TABLE `Estratégia`
  MODIFY `id_estrategia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Feedback`
--
ALTER TABLE `Feedback`
  MODIFY `id_feedback` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Grafico`
--
ALTER TABLE `Grafico`
  MODIFY `id_grafico` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Log_Processamento`
--
ALTER TABLE `Log_Processamento`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Relatorio`
--
ALTER TABLE `Relatorio`
  MODIFY `id_relatorio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Solicitação`
--
ALTER TABLE `Solicitação`
  MODIFY `id_solicitacao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Venda`
--
ALTER TABLE `Venda`
  MODIFY `id_venda` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Análise`
--
ALTER TABLE `Análise`
  ADD CONSTRAINT `Análise_ibfk_1` FOREIGN KEY (`id_grafico`) REFERENCES `Grafico` (`id_grafico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Análise_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Cliente`
--
ALTER TABLE `Cliente`
  ADD CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Estratégia`
--
ALTER TABLE `Estratégia`
  ADD CONSTRAINT `Estratégia_ibfk_1` FOREIGN KEY (`id_relatorio`) REFERENCES `Relatorio` (`id_relatorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Feedback`
--
ALTER TABLE `Feedback`
  ADD CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`id_grafico`) REFERENCES `Grafico` (`id_grafico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Feedback_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Grafico`
--
ALTER TABLE `Grafico`
  ADD CONSTRAINT `Grafico_ibfk_1` FOREIGN KEY (`id_relatorio`) REFERENCES `Relatorio` (`id_relatorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Log_Processamento`
--
ALTER TABLE `Log_Processamento`
  ADD CONSTRAINT `Log_Processamento_ibfk_1` FOREIGN KEY (`id_relatorio`) REFERENCES `Relatorio` (`id_relatorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Relatorio`
--
ALTER TABLE `Relatorio`
  ADD CONSTRAINT `Relatorio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Solicitação`
--
ALTER TABLE `Solicitação`
  ADD CONSTRAINT `Solicitação_ibfk_1` FOREIGN KEY (`id_grafico`) REFERENCES `Grafico` (`id_grafico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Solicitação_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Venda`
--
ALTER TABLE `Venda`
  ADD CONSTRAINT `Venda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
