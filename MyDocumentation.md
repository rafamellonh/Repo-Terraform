# My Documentation

* ``` Taint ```:  é um comando para marcar o recurso como "contaminado", assim que marcado ele fica para ser recriado
  * exemplo : marca como taint o ip publico de uma vm, no próximo aplly ele será trocado.

* ``` lifecycle ``` : Serve para controlar o cilco de vida dos recursos, criação, atualização e exclusão:
  * create_before_destroy : aqui controla se o recurso deve ser criado antes de ser destruido.
  * prevent_destroy : previne uma destuição acidental.
  * ignore_changes : permite ignorar alterações no apply, util para deixar recursos imutáveis
  * replace_triggered_by : especifica explicidamente quais mudanças devem acionar a substituição de um recurso.