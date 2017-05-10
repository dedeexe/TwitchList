# Desafio

Nós do time de mobile do VivaReal gostamos de jogar videogames. Gostaríamos de saber quais são o top 50 games no Twitch. 🤓

O objetivo do teste é fazer uma lista com a imagem e o nome do jogo e uma tela de detalhes com a imagem, nome do jogo, contador de canais e quantidade de visualizações.

# API

Para desenvolver o app você vai precisar usar o endpoint do Twitch https://github.com/justintv/Twitch-API/blob/master/v3_resources/games.md#get-gamestop

# Requisitos Essenciais

* Usar Swift 3 e iOS 9+.
* Interface desenvolvida no Storyboard, utilizando Auto Layout.
* App Universal: Você deve desenvolver uma interface que se adapte bem em telas maiores.
* CoreData: Salve as informações dos jogos para que os usuários consigam acessar offline.
* Tratamento de falha de conexão: Avise o usuário quando o download dos jogos falhar por falta de conexão
* Pull to refresh

# Bônus

* Testes unitários

# Observações

* Você pode utilizar bibliotecas de terceiros e gerenciadores de dependências (CocoaPods, Carthage, etc) como preferir.

# Enviando o seu teste  

Crie o seu próprio repositório e nos envie o link. Se seu repositório for privado, adicione o(s) usuário(s) do time de mobile do VivaReal com permissão de leitura para podermos ver seu código.

# Observacoes

* Nao foi feito a persistencia com CoreData. Apenas foi salvo o json em um arquivo de texto em NSDocumentsDirectory
* Nao deu para dar uma pincelada nas telas.
