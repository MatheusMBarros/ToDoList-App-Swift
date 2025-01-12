To-Do List App
Este é um aplicativo simples de lista de tarefas (To-Do List) desenvolvido em Swift utilizando o padrão de arquitetura MVVM (Model-View-ViewModel). O objetivo é demonstrar a separação de responsabilidades e um código mais organizado e testável.

🚀 Funcionalidades
Adicionar tarefas.
Listar tarefas.
Marcar tarefas como concluídas.
Excluir tarefas.
Interface simples e intuitiva.

🛠️ Tecnologias Utilizadas
Swift: Linguagem de programação principal.
MVVM (Model-View-ViewModel): Arquitetura para separação de responsabilidades.
UIKit: Construção da interface gráfica.
UserDefaults: Armazenamento simples e persistente para dados do usuário.

Diretórios
Models: Contém as estruturas e classes que representam os dados principais do aplicativo, como Task.
ViewModels: Contém a lógica de negócios e a interface entre os dados do modelo e as views, como o TaskViewModel.
Views: Contém as telas, controladores de visualização e células personalizadas para exibir dados ao usuário.

📖 Padrão MVVM
Model: Representa os dados e as regras de negócios. Exemplo: Task.
ViewModel: Faz a ponte entre os modelos e as views, processando dados para exibição. Exemplo: TaskViewModel.
View: Exibe os dados e interage com o usuário. Exemplo: TaskListViewController.

