
# Como utilizar o Git Flow?

![](https://lh3.googleusercontent.com/70jaEZnESXQ6SssU5uI4yO62JBz6xq2sNrrz8bW_ap2CuWUaQlbKs3j6NyRJnvcvYwAugkW8WzNJX21dZ2SMd9O_1TTpKZT-FsBkYSPy4rUSpJSo2C-WPTaLc2jQ8ancyj1TetXQ)

---

##### Em nosso repositórios nós temos as banchs:
1. main
2. develop
3. feature
4. hotfix
5. release

# Explicação para cada Branch:

## Branch Main
```
Principal branch, contém associadas a ela as versões de publicação para facilitar o acesso e a busca por versões mais antigas. Também entendemos que é o espelho do programa que está no ar, já que o último código dessa branch deve sempre estar em produção. Além do mais, a única maneira de interagir com essa branch é através de uma Hotfix ou de uma nova Release.
```

## Branch Develop
```
É uma das principais branches e serve como uma linha com os últimos desenvolvimentos. Como visto na imagem, é uma cópia da branch principal contendo algumas funcionalidades que ainda não foram publicadas. Sendo assim, é a base para o desenvolvimento de novas features.
```

## Branch Feature
```
Uma das branches temporárias e auxiliares do nosso fluxo, sendo a branch que contém uma nova funcionalidade específica para a nossa aplicação. Nela temos a convenção do nome feature/nome_do_recurso que será utilizada no nosso fluxo de trabalho. Não podemos esquecer que toda nova Feature começa e termina obrigatoriamente a partir da develop.
```

## Branch Hotfix
```
Também é uma branch auxiliar e temporária, utilizada quando ocorre algum problema no ambiente de produção no qual a correção deve ser feita imediatamente. Conseguimos com isso solucionar o erro e fazer a mesclagem da solução para as branches main/master e develop para que não ocorra a perda do nosso código.
```

## Branch Release
```
Por fim, a branch de lançamento do nosso programa. Nela unimos o que está pronto em nossa branch de desenvolvimento e “jogamos” para a branch principal. No mais, é criado uma nova versão etiquetada no nosso projeto para que possamos ter um histórico completo do desenvolvimento.
```

---

# Comandos do Git Flow

> A seguir, vamos aprender os principais comandos do `Git Flow`, desde a inicialização até o momento do push para o ambiente em produção.

## Init
```
É o comando inicial do Git Flow e serve para configurar o repositório com as branches do fluxo padrão. Da mesma forma que você tem que inicializar o git em um novo diretório, esse comando tem o mesmo propósito.
```

## Feature

Dentro desse comando temos algumas ramificações possíveis, como por exemplo:

##### Comando que inicia uma nova feature, nela temos a criação de uma nova branch com a nomenclatura feature/nome_feature.

```bash
git flow feature start nome_feature
```

##### Comando para encerrar uma feature anteriormente criada, além disso será feito um merge para a branch Develop.

```bash
git flow feature finish nome_feature
```

##### Se você está trabalhando em equipe e deseja compartilhar a sua nova funcionalidade, esse comando publica no servidor remoto que está configurado no seu Git local.

```bash
git flow feature publish nome_feature
```

##### Ao contrário da anterior, essa serve para obter uma feature do servidor remoto.

```bash
git flow feature pull nome_feature
```

# Release

Com a terminologia parecida, veremos os comandos referentes ao lançamento:

##### Utilize esse comando para iniciar uma versão baseada na branch de desenvolvimento, aqui você pode passar opcionalmente o código de algum commit para usar como base.

```bash
git flow release start nome_release [BASE]
```

##### É aconselhável publicar a branch de release após criá-la para permitir commits de outras pessoas desenvolvedoras. O comando é semelhante à publicação de uma nova feature.

```bash
git flow release publish nome_release
```

##### Novamente, se você quiser acompanhar alguma versão remota da release, existe esse comando.

```bash
git flow release track nome_release
```

##### Novamente, se você quiser acompanhar alguma versão remota da release, existe esse comando.

```bash
git flow release finish nome_release
```

Com esse comando você finaliza e `cria uma nova versão`, logo em seguida é executada uma série de ações:

1. Junta a branch na Main/Master;
2. Cria uma tag com o nome da branch;
3. Também junta a branch com a Develop;
4. Por último, apaga a própria branch.

## Hotfix

Por fim temos os comandos da Hotfix:

##### A partir do último commit da branch Main/Master cria-se uma branch com a nomenclatura de hotfix/nome_hotfix. É obrigatório que seja passado o nome da hotfix e opcionalmente você pode passar um BASENAME.

```bash
git flow hotfix start nome_hotfix
```

##### Temos novamente o comando para a finalização da hotfix. Quando terminado o processo final vemos que é feito uma mesclagem da hotfix nas branches main/master e develop e também temos a criação de uma etiqueta na main/master.

```bash
git flow hotfix finish nome_hotfix
```

# Entenda o fluxo Git Flow com exemplos práticos!

Agora que instalamos e sabemos o básico sobre esse fluxo, vamos dar uma olhada em `alguns exemplos com Git Flow`:

## Criando o repositório

Primeiramente vamos criar um repositório para que possamos executar nossos testes

```bash
mkdir teste-git-flow
cd teste-git-flow
git init
```

### Iniciando o Git Flow

```bash
git flow init
```

Aparecerá uma série de questões referentes às nomenclaturas das branches e algumas configurações. No momento, recomendamos que você apenas `aperte enter em todas as linhas`:

![](https://lh3.googleusercontent.com/FJp83dy1K08C3XGgvnMwXiyjCBE5Am9sN0xbSsZ2naCQEZmXDTKMarTw3cs2djrvdyTSdBI5YlhAxzgwFRgQ8OWIOS_OfkmGW3iAN7t9R5Pwk76W8LvaoQKYv7KwA-0hzbi6NR88)

Além de criar toda a `estrutura para o nosso repositório`, o comando também já faz o `checkout para a branch Develop`.

### Feature

#### Iniciando uma nova Feature

Imagine que estamos desenvolmento uma tela de cadastro e que queremos separar o nosso desenvolvimento da branch principal. Com isso, criamos uma nova feature:

```bash
git flow feature start tela-cadastro
```

![](https://lh6.googleusercontent.com/lVfhPRYjOIp6TMFgn1o7Pz_eS77uVeZP77ZYgGG2Sd1n2MoNjZwA1RGTNF3BKKqJSOwWUYcxMrZRltZiyzV7dtK1E8QDIY8aIcSatwXKUcYWBe6ATXoEDzf8JwFMGy8DY4-1QDmP)
![](https://lh3.googleusercontent.com/BHWEgu1OOTbGaO-ffMaYKAivsSTTmE9gmZLqWwXFCUJRql4S7i4D9ivfgC87mq4vK-_q0_bdxSLa9DTovOjrlmtXcddW085Q0_eE4uq515PRSiWxE5YXMloK-1j_maHVZkwyfBzB)

Para o nosso teste, vamos criar um arquivo `HTML` e fazer um commit:

```bash
touch tela-cadastro.html        // Criando arquivo html
git add .                // Adicionando arquivo criado
git commit -m "Criando tela de cadastro" // Fazendo commit
```

#### Finalizando a Feature

Já que finalizamos o desenvolvimento, vamos agora rodar o comando para fechar essa branch e mesclá-la com a develop:

```bash
git flow feature finish tela-cadastro
```

![](https://lh4.googleusercontent.com/8sap5en4rCb2mFcddifzbjWpVCCOI81R2uEXUqJ7tY5uw-0L1vnwYfpuJigH4Lm_wSqoTuvArbGtgtY1TE7Er82YkMA3tyTqrYpfEid6LwsNS5t-U8I4HDcGeOymeLl6xJAt7oUq)

Como podemos ver, algumas ações foram feitas:
1. Merge da feature para a develop;
2. A nossa branch da feature foi DELETADA;
3. Foi feito o checkout para a develop;

### Release

#### Iniciando uma release

Vamos agora simular uma release com o nome de “release-teste”:

```bash
git flow release start release-teste
```

![](https://lh6.googleusercontent.com/ylxwyH7Bh7qxQeyPk7CpFsQkxI-mNNHUreb9gm2cd54SJ6eIi9QM0jWXYAZkLkjDZSWHwP7wx0bRQDhVrOu_gkHS_m_rf8KhQbfpCalG2ZxJFB27ODQ-uDwtDZAdkmY2Kwo0jUK7)

Podemos ver que foi criado uma branch e que automaticamente fomos redirecionados para ela.

#### Finalizando uma release

Vamos agora finalizar a nossa release:

```bash
git flow release finish release-teste 1.0.0
```

![](https://lh5.googleusercontent.com/3txA5OitWOl9tHtCVrGY0xTIVwLT1wWajh4zo365q5S2yu2cgGyPWIY2WlZ4AKr4Jt7N8yKK9-nsj_IZDVlO9zKSL7F1ClNthriN2BRCEIDqGcUmVd5dhgyOaLMXLyTXKakJxMnS)

Quando o comando for executado vai aparecer uma tela parecida com essa. **Não se assuste**, é apenas um programa chamado `Vim` que é um editor de texto para o terminal. Para prosseguirmos com o nosso tutorial, siga os próximos passos:

1. Aperte a tecla "I" e escreva uma mensagem, no meu caso vou escrever “finalizando”.
2. Em seguida aperte "ESC" e digite o comando ":wq" para salvar e fechar o Vim.

![](https://lh6.googleusercontent.com/bMdh5bA6PDUJejexNzPuIs2E9U16JpZ4-rDVC97L6g97p8ptSV0Pj_12TM2JWmnQl-D5q1uyAh4x-mxteROLMJNID-kiDaHM2-vWbRSHYqZtUeKjl8Vs1wBmv-rsWwUO33Or2WD8)

Como podemos ver foram feitas várias ações no nosso repositório, tais como:

1. Mesclagem da nossa branch de release para main e develop;
2. Criação da tag “release-teste” na main;
3. Remoção da nossa branch de release;
4. Checkout para a branch develop.

Com muita facilidade conseguimos `finalizar e criar uma nova versão` para o nosso projeto de testes.

### Hotfix

#### Iniciando uma Hotfix

Vamos partir para mais uma demonstração. Primeiramente execute o comando de início de uma nova hotfix:

```bash
git flow hotfix start hotfix-teste
```

![](https://lh3.googleusercontent.com/nwqEi3N1d_LVCq7xco6wiF7ZP3gqorWV1Z_EnYH_wTpEPlgVpOPOkmxVsy9Q4RQsBj2xJLEjd3LjPbUOFmxfcbGdU-UhX5RduX7e-lGdIoOfxTd9wO3LWmPcVpi4SHCbG4UKaMR3)

Semelhante aos outros comandos, é criado para a gente uma nova branch com o nome que passamos. Além disso, somos realocados para ela.

Novamente, para fins de `teste`, vou criar um novo arquivo `JavaScript` simulando uma correção.

```bash
touch arquivo-correcao.js
git add .
git commit -m "Correção do bug"
```

#### Finalizando uma Hotfix

Vamos agora finalizar a nossa **correção**:

```bash
git flow hotfix start hotfix-teste
```

![](https://lh6.googleusercontent.com/wIFPkPl1mm_OSP4mb6efyCWwOsCc9_36GiQate4RkV1n-jGbY1pacp1Lx8tiWdTuoOGs4rNg3nw1iFaDFHlA_5OWcfE9mCeYVhDNFMm6OU_uPzfBYy1EiGn55zgo9YKLj7LJBLW8)

Novamente nos deparamos com a tela do **Vim**, porém, agora já estamos experientes com essa situação. Relembrando, aperte a tecla **"I"** e escreva uma mensagem. Logo em seguida aperte **"ESC"** e escreva **":wq"**

![](https://lh4.googleusercontent.com/8ZNCGgAPu6W1XtNAp83SOAOFoPpslE5z2McaWwvTuRe-a5wGgJ5LItqdOkPvk2a3ellTjNQw2Pjh_PINo6WI4EtwiU2WOp6wwU2RhlGRnyVwBLnGe23gsv6lApgVxi65ykvR8WPa)

O processo de finalização de uma *hotfix* é muito semelhante ao de uma release. Com isso, temos o merge da nossa branch com a main e develop. Também é criado uma etiqueta na main, é deletado a nossa branch de correção e, por último, somos levados para a develop.
