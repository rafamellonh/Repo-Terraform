# My Documentation

* ``` Taint ```:  é um comando para marcar o recurso como "contaminado", assim que marcado ele fica para ser recriado
  * exemplo : marca como taint o ip publico de uma vm, no próximo aplly ele será trocado.

* ``` lifecycle ``` : Serve para controlar o cilco de vida dos recursos, criação, atualização e exclusão:
  * create_before_destroy : aqui controla se o recurso deve ser criado antes de ser destruido.
  * prevent_destroy : previne uma destuição acidental.
  * ignore_changes : permite ignorar alterações no apply, util para deixar recursos imutáveis
  * replace_triggered_by : especifica explicidamente quais mudanças devem acionar a substituição de um recurso.

* ```provisioner ``` : é um bloco que permite executar configurações personalizadas antes ou depois da criação, atualização ou destruição de recursos de ingra
  * local-exec : executa comandos ou scritps diretamente na máquina onde o terraform está sendo executado
  * remote-exec : executa comandos ou scripts em uma máquina remota após a criação ou atualização de um recurso 

* ```Sensitive ``` : Serve para proteger dados sensiveis na interface do terraform, não irá expor senhas por exemplo
   
  ```
variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

  ```
