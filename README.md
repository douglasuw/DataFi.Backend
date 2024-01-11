# Tela de login
	- identificar se existe conta logada, e se existir, redirecionar para o painel do sistema
	- se não existir conta logada
		- mostrar os campos de login
		- com opção para criação de conta (caso não possua)
		- no topo, mostrar o logo à esquerda, e à direita mostrar o ícone de linguagem
			- no ícone de linguagem, permitir trocar a língua selecionada, e já gravar no cookie, para quando entrar no sistema, carregar na linguagem selecionada no login
		- no login, mostrar o checkbox "Mantenha-me conectado", para gravar o cookie da sessão no navegador do usuário
			- informar junto ao botão que o login ficará com a sessão gravada por 45 dias, devedendo realizar novo login após esse período
		- deve haver também o botão de de recuperação de senha, com o envio de email

# Tela principal (Dashboard)
	- no topo, apresentar o botão para vincular nova conta de anúncio
		- ao clicar, abrirá o popup para criação de novo projeto para vincular a conta de anúncio
		- quando clicar, carregará as contas de anúncios separadas por BM (Business Manager), facilitando seleção
			- definir se essa separação por BM será feita em selects distintos, ou no mesmo, mas com títulos de seção dentro do select
			- priorizar a primeira opção: fazer o controle com dois selects
		- ao selecionar a conta de anúncio (filtrada por BM), o usuário deve dar um nome ao projeto
			- caso não seja informado um nome para o projeto, será atribuído o nome da conta de anúncio

	- abaixo, apresentar a lista de projetos ativos, com as contas de anúncio vinculadas
		- listando por:
			- nome do projeto
			- data de criação
			- status do projeto (ativo ou inativo)
		- apresentar na listagem:
			- o nome do projeto
			- o ícone do projeto será a primeira letra do nome do projeto (maiúscula, e sem acentos)
			- dentro do projeto, o usuário terá liberdade para inserir uma imagem como ícone do projeto dentro do sistema (Future FEATURE)
				- deixar o campo preparado no banco de dados
				- mas será implementada em feature futura, não no momento da liberação do MVP
					- nesse momento será liberada com a funcionalidade primária de mostrar o ícone com a primeira letra do nome do projeto

# Funcionalidades do sistema
	- tocante aos Projetos
		- permitir que sejam vinculados colaboradores ao projeto (Future FEATURE)
			- esse vínculo acontecerá através do email do colaborador
			- o usuário dono da conta principal, irá informar o email desejado e o colaborador irá receber acesso através de tal email

			<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>

