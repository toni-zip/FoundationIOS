# 📱 Pokedex App

Uma aplicação iOS moderna desenvolvida para consulta de Pokémon, integrando-se com a **PokeAPI**. Este projeto foi construído utilizando **SwiftUI** e segue padrões de arquitetura limpa para garantir escalabilidade e testabilidade.

## 🚀 Tecnologias Utilizadas
* **Linguagem:** Swift (v5.0)
* **Framework de UI:** SwiftUI
* **Arquitetura:** Organização baseada em camadas (Data, Model, View)
* **Gerenciamento de Versão:** Git
* **Ferramenta de Desenvolvimento:** Xcode 15.2

## 🛠️ Estrutura do Projeto
O projeto está organizado para facilitar a manutenção:
* **View:** Contém as telas principais como `HomeView`, `PokemonListView`, `PokemonDetailsView` e `ProfileView`.
* **Data:** Responsável pela lógica de rede (`PokeAPI.swift`) e tratamento de erros (`PokeError.swift`).
* **Model:** Definições das estruturas de dados (`PokemonModel.swift`).
* **Extensions:** Extensões de utilitários como cores personalizadas (`Color.swift`).
* **Components:** Elementos de UI reutilizáveis para manter a consistência visual.

## 📱 Funcionalidades
- [x] Listagem dinâmica de Pokémon.
- [x] Visualização detalhada de atributos e status.
- [x] Perfil de usuário.
- [x] Suporte a temas de cores personalizados.
- [x] Testes unitários e de UI integrados.

## ⚙️ Requisitos
* iOS 17.2+
* Xcode 15.2 ou superior

## 📥 Como Rodar o Projeto
1. Clone este repositório:
   ```bash
   git clone [https://github.com/toni-zip/FoundationiOS.git](https://github.com/toni-zip/FoundationiOS.git)

- Abra o arquivo Pokedex.xcodeproj no seu Xcode.

- Selecione um simulador (ex: iPhone 15) ou um dispositivo físico.

- Pressione Cmd + R para rodar a aplicação.
