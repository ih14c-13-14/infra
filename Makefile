ROOT_DIR=$(shell git rev-parse --show-superproject-working-tree --show-toplevel | head -1)

localstack-up:
	(cd ${ROOT_DIR}/utils/localstack && docker-compose up -d)

localstack-down:
	(cd ${ROOT_DIR}/utils/localstack && docker-compose down)

localstack-destroy:
	(cd ${ROOT_DIR}/utils/localstack && docker-compose down -v)

update-submodule:
	@make update-localstack

update-localstack:
	(cd ${ROOT_DIR}/utils/localstack && git fetch && git checkout origin/master)

fmt:
	terraform fmt -check -recursive

terragrunt-all:
	@if [ -z "$(CMD)" ]; then echo "Please provide CMD argument, e.g. make terragrunt CMD=validate"; exit 1; fi; \
	cd $(ROOT_DIR) ; \
	find . -name 'terragrunt.hcl' -print0 | while IFS= read -r -d '' file; do \
		dir=$$(dirname "$$file"); \
		cd "$$dir" || exit; \
		terragrunt $(CMD); \
		cd $(ROOT_DIR) || exit; \
	done
