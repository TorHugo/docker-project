# 1º FROM | Permite que a IMAGEM será criada utilizando NODE.js
FROM node:18-alpine

# 2º DOCKER RUN -IT app | Cria a imagem definitiva

# 3º WORKDIR | Define um diretório RAIZ para a IMAGEM
WORKDIR /app

# OBS.: Deve ser criado um usuário novo, para que não seja executado tudo no user ROOT
#RUN addgroup dev && adduser -S -G victor dev
#USER victor

# 4º COPY | Copiará os arquivos selecionados para a IMAGEM
# ADD | Pode ser utilizado para (COPY) de arquivos (.zip | https)
COPY package.json .

# 5º RUN | Instala as dependencias utilizadas no APP 
RUN apk add --no-cache python3 g++ make
RUN yarn install --production

# ENV (KEY = VALUE)| Adiciona váriaveis de ambiente no projeto
# ENV API_URL = https://api.victorhugo.com/

COPY . .

# 6º CMD (executable, parameter) | Executa a aplicação como estivesse pelo CMD
CMD ["node", "src/index.js"]

# 7º EXPOSE (value) | Adiciona uma porta aonde o container será executado 
EXPOSE 3000

# 8º Para a execução definitiva:
# DOCKER RUN -DP 3000:3000 app 
# DOCKER RUN -DP (PORTA WINDOWS:PORTA DOCKER) (IMAGEM)