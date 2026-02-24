### Hexlet tests and linter status:
[![Actions Status](https://github.com/AccessHasBeenDenied/devops-engineer-from-scratch-project-315/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AccessHasBeenDenied/devops-engineer-from-scratch-project-315/actions)


### Testing Playbook

```
vagrant up
docker run --rm -ti -v $(pwd):/workdir alpine/ansible bash
ansible-galaxy install -r workdir/roles/requirements.yml
eval `ssh-agent -s`
ssh-add id_rsa
ansible-playbook -i 192.168.56.10, -u vagrant workdir/playbook.yml
```