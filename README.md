### Hexlet tests and linter status:
[![Actions Status](https://github.com/AccessHasBeenDenied/devops-engineer-from-scratch-project-315/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AccessHasBeenDenied/devops-engineer-from-scratch-project-315/actions)


это развернутый проект https://bulletin.qamo.ru/ 

это форк приложения: https://github.com/AccessHasBeenDenied/project-devops-deploy/tree/dev

### Сборка

Для сборки использовалась только ветка dev.

- бэкенд собирается в докер образ ghcr.io
- фронтенд собирается в https://www.npmjs.com/package/@_accesshasbeendenied/project-devops-deploy-frontend

Сборка фронтенда используется не совсем по прямому назначению. В npm пакет включена папка dist, которая на этапе деплоя извлекается и кладется в папку со статикой.

### Деплой

Для деплоя сделано два окружения. У них разная инфраструктура, разные зависимости и разные inventory.

- `dev` деплоится локально в vagrant машину. В этом окружении не деплоится certbot, но дополнительно разворачивается minio для работы с s3.

- `prod` задеплоен в облако. Для инфры используются две машины и облачный s3. Здесь уже деплоится certbot.

### Rollback

`Автоматический`: деплой ожидает поднятия контейнера. Если healthcheck контейнера не отработал в заданный промежуток времени, то с помощью rescue механизма деплоится версия образа, использовавшаяся до деплоя.

`Ручной`: запускаем деплой предыдущего рабочего коммита.


### How to run

#### prod

```
make deploy/prod
```

It deploys 

- postgres database in docker
- letsencrypt certificate
- bulletin app in docker
- nginx reverse proxy
- frontend static content

#### dev

```
make infra-up/dev
make deploy/dev
```

`dev` is local vagrant environment which fires up a VM and deploy the app to it.  
It deploys `minio` as a local s3 storage but skips `letsencrypt` certificate.  
`secrets.yml` file, which contains all the secrets, is not encrypted on purpose to show its structure.

### How to build

Github CI in the repo: https://github.com/AccessHasBeenDenied/project-devops-deploy

#### Artifacts

`frontend` -> https://www.npmjs.com/package/@_accesshasbeendenied/project-devops-deploy-frontend
`backend`  -> https://github.com/AccessHasBeenDenied/project-devops-deploy/pkgs/container/project-devops-deploy

#### Details

- `backend` created as a docker image
- `frontend` created as npm package with `dist` included. And `dist` is used during deployment