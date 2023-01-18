
Crie os seguintes pods:
<br>

- `web-server`, com a imagem `nginx:1.22.1` no namespace `blue`
- `app`, com a imagem `busybox:1.35.0`, no namespace `yellow` e executando o seguinte comando: ["sh", "-c", "while true; do date >> /vol/date.log; sleep 1; done"]
- `db`, com a imagem `mysql:5.7.41`, no namespace `green`, com as seguintes variáveis de ambiente:

`MYSQL_ROOT_PASSWORD`, com o valor `gu1ldc0nt@in&rs`
`MYSQL_DATABASE`, com o valor `guild`

Além disso, o pod deve executar o seguinte comando:



```plain
echo amazing > /etc/my-second-file
```{{exec}}

And to verify we can run

```plain
cat /etc/my-second-file
```{{exec}}
