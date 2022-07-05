#   Terraform
##  Deploy and config github repositories

Простой пример использования Terraform.
В данном случае Terraform управляет репозиториями в github в т.ч. текущим.

---

### Зависимости

Провайдер [integrations/github](https://github.com/integrations/terraform-provider-github)

---

### Подготовка

1.  Провайдер.

    В связи с тем, что HashiCorp блоикирует доступ к своим репозиториям необходимо найти зеркало провайдера github или собрать из исходников [terraform-provider-github_4.26.1](https://github.com/integrations/terraform-provider-github/archive/refs/tags/v4.26.1.zip).

    В файле ```version.tf``` должен быть указан путь к провйдеру (в случае ручной сборки).

2.  Backend.

    В случае локального хранения состояния данный пункт можно пропустить.

    Рекомендуется использовать S3 backet для хранения состояний. В ```./example/backend.tf``` приведен пример использования YandexCloud S3.

3.  Задать перменную ```git_token = "< Github token >"``` (см. ```./example/terraform.tfvars```)

4.  Инициализировать terraform

    ```shell
    terraform init
    ```
    ```shell
    Initializing the backend...

    Successfully configured the backend "s3"! Terraform will automatically
    use this backend unless the backend configuration changes.

    Initializing provider plugins...
    - Finding local/integrations/github versions matching ">= 4.26.1"...
    - Installing local/integrations/github v4.26.1...
    - Installed local/integrations/github v4.26.1 (unauthenticated)

    ...

    Terraform has been successfully initialized!
    ```

---

### Пример использования

Изменить переменную ```repositoriesList``` в файле ```./variables.tf``` перечислив репозитории.

По умолчанию используется три параметра:
-   Имя
-   Описание
-   Видимость

```
variable "repositoriesList" {
  default = [
    {
      repoName        = "terraform-deploy-gitgub",
      repoDescription = "TF. Deploy and config repositories",
      repoVisibility  = "public",
    },
  ]
}
```
Применить кофигурацию 
```shell
terraform apply
```

```shell
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

git_info = tomap({
  "0" = {
    "Description" = "TF. Deploy and config repositories"
    "HTTP" = "https://github.com/DmitriiTrotskii/terraform-deploy-gitgub.git"
    "Name" = "terraform-deploy-gitgub"
    "SSH" = "git@github.com:DmitriiTrotskii/terraform-deploy-gitgub.git"
  }
})
```
