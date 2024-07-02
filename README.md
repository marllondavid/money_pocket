# dindin_pocket

DinDin Pocket é um aplicativo Flutter baseado em um projeto do professor Leonardo Moura, da Udemy, onde acrescentei algumas outras funcionalidades.

O app foi projetado para ajudar os usuários a controlar seus gastos semanais. Ele fornece uma maneira intuitiva de visualizar e gerenciar despesas, exibindo um gráfico que mostra a porcentagem dos gastos em relação ao total da semana.

Funcionalidades
Adicionar Transações: O usuário pode adicionar novas transações com descrição, valor e data.
Visualizar Gráfico: Exibe gráfico de barras que mostram os gastos diários e a porcentagem em relação ao total da semana.
Remover Transações: Permite a remoção de transações indesejadas ou incorretas.
Adicionei a tela de login, de recuperação de senha e de cadastro, que até o momento estão apenas com a validação do package ValidadorLess


Explicação da Distribuição da Porcentagem
A ChartBar utiliza um FractionallySizedBox para ajustar a altura da barra de acordo com a porcentagem dos gastos diários em relação ao total da semana. A altura da barra é proporcional à porcentagem de gasto, proporcionando uma visualização clara e imediata da distribuição dos gastos.

Adicionar uma Transação:

Toque no botão "Adicionar" e preencha os campos com a descrição, valor e data da transação.
Toque em "Nova Despesa" para salvar a transação.
Visualizar Gráficos:

O gráfico de barras mostra os gastos diários e a porcentagem em relação ao total semanal.
Remover uma Transação:

Clique no botão de lixeira para remover a transação que deseja.

Instalação
Para executar este projeto, certifique-se de ter o Flutter instalado. Clone o repositório e execute os seguintes comandos:

bash
Copiar código
flutter pub get
flutter run
Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests.

Esperamos que o DinDin Pocket ajude você a gerenciar melhor seus gastos semanais!
