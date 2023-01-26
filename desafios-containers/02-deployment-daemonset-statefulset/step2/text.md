Crie o seguinte deployment de nome `payroll` no namespace `finance` com as seguintes configurações: 

Imagem: `nginx:latest` <br>
Replicas: `1` <br>
Labels: `environment=production` <br>
Porta exposta: `80` <br>
Variáveis de ambiente: `ROOT_FOLDER=/var/http/www` e `HOSTNAME=payroll.company.com` <br>

