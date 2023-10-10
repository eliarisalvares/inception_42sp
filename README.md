
# inception_42sp

### Preliminary tests

 - [ ]  Any credentials, API keys, environment variables must be set inside a .env file during the evaluation. </br>

<b> For this project, you have to clone their Git repository on their station.

### General instructions
- [ ] Ensure that all the files required to configure the application are located inside a srcs folder. The srcs folder must be located at the root of the repository.
- [ ] Ensure that a Makefile is located at the root of the repository.
- [ ] Before starting the evaluation, run this command in the terminal:
```
docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null
```
- [ ] Read the docker-compose.yml file. There musn't be *'network: host'* in it or *'links:'*. Otherwise, the evaluation ends now.
- [ ]  Read the docker-compose.yml file. There must be* 'network(s)'* in it. Otherwise, the evaluation ends now.
- [ ] Examine the Makefile and all the scripts in which Docker is used. There musn't be *'--link'* in any of them. Otherwise, the evaluation ends now.
- [ ] Examine the Dockerfiles. If you see 'tail -f' or any command run in background in any of them in the ENTRYPOINT section, the evaluation ends now. Same thing if 'bash' or 'sh' are used but not for running a script (e.g, 'nginx & bash' or 'bash').
- [ ] If the entrypoint is a script (e.g., ENTRYPOINT ["sh", "my_entrypoint.sh"], ENTRYPOINT ["bash", "my_entrypoint.sh"]), ensure it runs no program in background (e.g, 'nginx & bash').
- [ ] Examine all the scripts in the repository. Ensure none of them runs an infinite loop. The following are a few examples of prohibited commands: 'sleep infinity', 'tail -f /dev/null', 'tail -f /dev/random'
- [ ] <b> Run the Makefile. </br>

*Yes* No

 
## Mandatory part

This project consists in setting up a small infrastructure composed of different services using docker compose. Ensure that all the following points are correct. 

### Project overview

The evaluated person has to explain to you in simple terms:

1. How Docker and docker compose work

R: Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and ship it all out as one package. Docker compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

2. The difference between a Docker image used with docker compose and without docker compose

R: Docker compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration. Without docker compose, you have to run each container individually.

3. The difference between a Docker image and a Docker container

R: A Docker image is a file, comprised of multiple layers, that is used to execute code in a Docker container. An image is essentially built from the instructions for a complete and executable version of an application, which relies on the host OS kernel. A Docker container is a runtime instance of a Docker image.

4. The benefit of Docker compared to VMs

R: Docker containers are more lightweight than virtual machines. They are isolated processes and don’t require any hypervisor to run. Containers are also portable, meaning they can be moved between environments. Docker containers are also easier to manage than VMs because they can be controlled from a single command line.

4. The pertinence of the directory structure required for this project (an example is provided in the subject's PDF file).

R: The directory structure is required to make the project easier to understand and to make it easier to find the files and different services that will run together.

*Yes* No

### Simple setup

- [ ] Ensure that NGINX can be accessed by port 443 only. Once done, open the page.*

<b> To check if NGINX can be accessed by port 443 only, you can run the command 'docker-compose ps' and check the PORTS column.

- [ ]  Ensure that a SSL/TLS certificate is used.*

<b> Show the certificate by running the command 'docker-compose exec nginx sh' and then run 'openssl x509 -text -noout -in /etc/nginx/certificate.pem'.

  - [ ]  Ensure that the WordPress website is properly installed and configured (you shouldn't see the WordPress Installation page). To access it, open https://login.42.fr in your browser, where login is the login of the evaluated student. You shouldn't be able to access the site via http://login.42.fr. If something doesn't work as expected, the evaluation process ends now.

*Yes* No

### Docker Basics

- [ ]  Start by checking the Dockerfiles. There must be one Dockerfile per service. Ensure that the Dockerfiles are not empty files. If it's not the case or if a Dockerfile is missing, the evaluation process ends now.

- [ ]  Make sure the evaluated student has written their own Dockerfiles and built their own Docker images. Indeed, it is forbidden to use ready-made ones or to use services such as DockerHub.

- [ ]  Ensure that every container is built from the penultimate stable version of Alpine/Debian. If a Dockerfile does not start with 'FROM alpine:X.X.X' or 'FROM debian:XXXXX', or any other local image, the evaluation process ends now.

- [ ]  The Docker images must have the same name as their corresponding service. Otherwise, the evaluation process ends now.

<b> Use 'container-name' to avoid the "srcs_" prefix;
  
  - [ ]  Ensure that the Makefile has set up all the services via docker compose. This means that the containers must have been built using docker compose and that no crash happened. Otherwise, the evaluation process ends.

*Yes* No

### Docker Network

- [ ] Ensure that docker-network is used by checking the docker-compose.yml file. Then run the 'docker network ls' command to verify that a network is visible.

<b> Use the command 'docker network inspect <network  name>' to check that the network is configured correctly. To ensure the containers and the network do not have the directory name as a prefix, use "container_name: <name>" and "name: <name>" in the docker-compose.yml file when configuring the services and the network.

*Yes* No

- [ ] The evaluated student has to give you a simple explanation of docker-network. If any of the above points is not correct, the evaluation process ends now.

R: Docker network is a command that allows you to manage networks. It is used to create, delete, and manage networks. It also allows you to connect a container to a network, disconnect a container from a network, and inspect networks. A network is a group of containers that can communicate with each other via a private network. Docker network is used to create a network and connect containers to it.

*Yes* No

### NGINX with SSL/TLS

- [ ]  Ensure that there is a Dockerfile.

- [ ]  Using the 'docker compose ps' command, ensure that the container was created (using the flag '-p' is authorized if necessary).

- [ ]  Try to access the service via http (port 80) and verify that you cannot connect.
<b> https://127.0.0.1:443 must work and https://localhost:443 as well and https://127.0.0.1:80 and https://localhost:80 must not work.

- [ ] Open https://login.42.fr/ in your browser, where login is the login of the evaluated student. The displayed page must be the configured WordPress website (you shouldn't see the WordPress Installation page).

- [ ] The use of a TLS v1.2/v1.3 certificate is mandatory and must be demonstrated. The SSL/TLS certificate doesn't have to be recognized. A self-signed certificate warning may appear. If any of the above points is not clearly explained and correct, the evaluation process ends now.

******

*Yes* No

  
### WordPress with php-fpm and its volume

- [ ] Ensure that there is a Dockerfile.
- [ ] Ensure that there is no NGINX in the Dockerfile.
- [ ] Using the 'docker compose ps' command, ensure that the container was created (using the flag '-p' is authorized if necessary).
- [ ]Ensure that there is a Volume. To do so: Run the command 'docker volume ls' then 'docker volume inspect <volume  name>'. Verify that the result in the standard output contains the path '/home/login/data/', where login is the login of the evaluated student.
- [ ] Ensure that you can add a comment using the available WordPress user. </br>
-[ ] Sign in with the administrator account to access the Administration dashboard. The Admin username must not include 'admin' or 'Admin' (e.g., admin, administrator, Admin-login, admin-123, and so forth).
- [ ] From the Administration dashboard, edit a page. Verify on the website that the page has been updated. If any of the above points is not correct, the evaluation process ends now. </br>

*Yes* No

### MariaDB and its volume

- [ ] Ensure that there is a Dockerfile.
- [ ] Ensure that there is no NGINX in the Dockerfile.
- [ ] Using the '*docker compose ps*' command, ensure that the container was created (using the flag '-p' is authorized if necessary).
- [ ] Ensure that there is a Volume. To do so: Run the command 'docker volume ls' then 'docker volume inspect <volume  name>'. Verify that the result in the standard output contains the path '/home/login/data/', where login is the login of the evaluated student.
- [ ] The evaluated student must be able to explain you how to login into the database. Verify that the database is not empty. If any of the above points is not correct, the evaluation process ends now.

<b> R: To login into the database, you can run the command 'docker-compose exec mariadb sh' and then 'mysql -u root -p'. The password is 'password'. To verify that the database is not empty, you can run the command 'show databases;' and then 'use wordpress;'. Then, you can run the command 'show tables;' and then 'select * from wp_users;'.

*Yes* No

### Persistence!

This part is pretty straightforward. You have to reboot the virtual machine. </br>

Once it has restarted, launch docker compose again. Then, verify that everything is functional, and that both WordPress and MariaDB are configured. </br>

The changes you made previously to the WordPress website should still be here.[] If any of the above points is not correct, the evaluation process ends now. </br>

*Yes* No

# Português

**Inception_42sp**  
*Testes preliminares*  
Qualquer credencial, chaves de API, variáveis de ambiente devem ser definidas dentro de um arquivo .env durante a avaliação.  
Para este projeto, você deve clonar o repositório Git na sua estação.

**Instruções gerais**  
- Garanta que todos os arquivos necessários para configurar o aplicativo estejam localizados dentro de uma pasta chamada srcs. A pasta srcs deve estar localizada na raiz do repositório.
- Garanta que um Makefile esteja localizado na raiz do repositório.
- Antes de iniciar a avaliação, execute este comando no terminal: [comando docker].
- Leia o arquivo docker-compose.yml. Ele não deve conter 'network: host' ou 'links:'. Caso contrário, a avaliação termina agora.
- Leia o arquivo docker-compose.yml. Ele deve conter *'network(s)'*. Caso contrário, a avaliação termina agora.
- Examine o Makefile e todos os scripts nos quais o Docker é usado. Não deve haver '--link' em nenhum deles. Caso contrário, a avaliação termina agora.
- Examine os Dockerfiles. Se você vir 'tail -f' ou qualquer comando executado em segundo plano em qualquer um deles na seção ENTRYPOINT, a avaliação termina agora. O mesmo vale se 'bash' ou 'sh' são usados, mas não para executar um script.
- Se o entrypoint for um script (por exemplo, ENTRYPOINT ["sh", "my_entrypoint.sh"], ENTRYPOINT ["bash", "my_entrypoint.sh"]), garanta que ele não execute nenhum programa em segundo plano.
- Examine todos os scripts no repositório. Garanta que nenhum deles execute um loop infinito.
- Execute o Makefile.

**Parte Obrigatória**  
Este projeto consiste em configurar uma pequena infraestrutura composta por diferentes serviços usando docker compose. Garanta que todos os seguintes pontos estejam corretos.

**Visão geral do projeto**  
O avaliado deve explicar em termos simples:
- Como o Docker e docker compose funcionam.
- A diferença entre uma imagem Docker usada com e sem docker compose.
- A diferença entre uma imagem Docker e um contêiner Docker.
- A vantagem do Docker em comparação com VMs.
- A pertinência da estrutura de diretório exigida para este projeto.

**Configuração Simples**  
- Garanta que o NGINX possa ser acessado apenas pela porta 443.
- Garanta que um certificado SSL/TLS esteja sendo usado.
- Garanta que o site WordPress esteja instalado e configurado corretamente.

**Básicos do Docker**  
- Comece verificando os Dockerfiles.
- Garanta que o aluno tenha escrito seus próprios Dockerfiles e construído suas próprias imagens Docker.
- Garanta que cada contêiner seja construído a partir da penúltima versão estável do Alpine/Debian.
- As imagens Docker devem ter o mesmo nome que seus serviços correspondentes.
- Garanta que o Makefile tenha configurado todos os serviços via docker compose.

**Rede Docker**  
- Garanta que a rede docker esteja sendo usada.
- O aluno avaliado deve lhe dar uma explicação simples da rede docker.

**NGINX com SSL/TLS**  
- Garanta que haja um Dockerfile.
- Tente acessar o serviço via http.
- Abra [link] no navegador.
- O uso de um certificado TLS v1.2/v1.3 é obrigatório.

**WordPress com php-fpm e seu volume**  
- Garanta que haja um Dockerfile.
- Garanta que o NGINX não esteja no Dockerfile.
- Garanta que haja um Volume.
- Garanta que você possa adicionar um comentário usando o usuário WordPress disponível.
- Faça login com a conta de administrador para acessar o painel de controle do administrador.
- Edite uma página a partir do painel de controle do administrador.

**MariaDB e seu volume**  
- Garanta que haja um Dockerfile.
- Garanta que o NGINX não esteja no Dockerfile.
- Garanta que haja um Volume.
- O aluno avaliado deve ser capaz de explicar como fazer login no banco de dados.

**Persistência!**  
- Você deve reiniciar a máquina virtual.
- Uma vez reiniciada, inicie o docker compose novamente.
- Verifique se tudo está funcionando e que WordPress e MariaDB estão configurados.
