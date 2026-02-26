# infra
infra-up/dev:
	@echo "Starting dev environment..."
	vagrant up

infra-up/prod:
	@echo "Starting prod environment..."

# deploy
deploy/dev:
	@echo "Starting dev deployment..."
	ansible-playbook -i inventory/dev -u vagrant playbook.yml

deploy/prod:
	@echo "Starting prod deployment..."
	ansible-playbook -i inventory/prod playbook.yml