CREATE DATABASE semijoias;
USE semijoias;

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    Cidade VARCHAR(50),
    Estado CHAR(2),
    CEP CHAR(8),
    Data_Cadastro DATE,
    Historico_Compras TEXT
);

CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Tipo ENUM('Prata', 'Banhada', 'Pedra sintética'),
    Preco DECIMAL(10,2) NOT NULL,
    Imagem VARCHAR(255),
    Categoria ENUM('Anel', 'Pulseira', 'Colar', 'Brinco'),
    Quantidade_Estoque INT DEFAULT 0
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    Data_Pedido DATE,
    Status ENUM('Em andamento', 'Enviado', 'Entregue') DEFAULT 'Em andamento',
    Total_Pedido DECIMAL(10,2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Pagamento (
    ID_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT NOT NULL UNIQUE,
    Metodo_Pagamento ENUM('Cartão', 'Boleto', 'Pix') NOT NULL,
    Status_Pagamento ENUM('Pendente', 'Pago') DEFAULT 'Pendente',
    Valor_Pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Estoque (
    ID_Estoque INT PRIMARY KEY AUTO_INCREMENT,
    ID_Produto INT NOT NULL,
    Quantidade_Disponivel INT DEFAULT 0,
    Data_Reposicao DATE,
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

CREATE TABLE ItemPedido (
    ID_ItemPedido INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT NOT NULL,
    ID_Produto INT NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);



