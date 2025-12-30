CREATE TABLE noticias (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL CHECK (char_length(descricao) <= 2000)
);

INSERT INTO noticias (titulo, descricao) VALUES
('Título da Notícia 1', 'Descrição da notícia 1. Aqui vai um texto mais longo representando a descrição da primeira notícia.'),
('Título da Notícia 2', 'Descrição da notícia 2. Este é um exemplo de texto que pode ser usado como descrição para a segunda notícia.'),
('Título da Notícia 3', 'Descrição da notícia 3. Descrições podem variar em tamanho, mas esta é apenas uma demonstração.'),
('Título da Notícia 4', 'Descrição da notícia 4. Cada notícia pode ter uma história única e detalhes relevantes.'),
('Título da Notícia 5', 'Descrição da notícia 5. Informações importantes e atualizações podem ser incluídas aqui.'),
('Título da Notícia 6', 'Descrição da notícia 6. Notícias variam desde eventos locais até acontecimentos globais importantes.'),
('Título da Notícia 7', 'Descrição da notícia 7. Este texto serve como um exemplo para a inserção de registros.'),
('Título da Notícia 8', 'Descrição da notícia 8. A descrição fornece detalhes e contexto sobre a notícia.'),
('Título da Notícia 9', 'Descrição da notícia 9. Notícias podem influenciar a opinião pública e informar a comunidade.'),
('Título da Notícia 10', 'Descrição da notícia 10. Este é o último exemplo de notícia para completar a inserção de 10 registros.');