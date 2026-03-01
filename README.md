### Hexlet tests and linter status:
[![Actions Status](https://github.com/AccessHasBeenDenied/devops-engineer-from-scratch-project-315/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AccessHasBeenDenied/devops-engineer-from-scratch-project-315/actions)


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

Guithub CI in the repo: https://github.com/AccessHasBeenDenied/project-devops-deploy

#### Artifacts

`frontend` -> https://www.npmjs.com/package/@_accesshasbeendenied/project-devops-deploy-frontend
`backend`  -> https://github.com/AccessHasBeenDenied/project-devops-deploy/pkgs/container/project-devops-deploy

#### Details

- `backend` created as a docker image
- `frontend` created as npm package with `dist` included. And `dist` is used during deployment