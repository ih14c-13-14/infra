ROOT_DIR=$(shell git rev-parse --show-superproject-working-tree --show-toplevel | head -1)

.PHONY: localstack-up
localstack-up:
	(cd ${ROOT_DIR}/utils/localstack && docker-compose up -d)

.PHONY: localstack-down
localstack-down:
	(cd ${ROOT_DIR}/utils/localstack && docker-compose down)

.PHONY: localstack-destroy
localstack-destroy:
	(cd ${ROOT_DIR}/utils/localstack && docker-compose down -v)

.PHONY: update-submodule
update-submodule:
	@make update-localstack

.PHONY: update-localstack
update-localstack:
	(cd ${ROOT_DIR}/utils/localstack && git fetch && git checkout origin/master)

.PHONY: fmt
fmt:
	terraform fmt -check -recursive

.PHONY: terragrunt
terragrunt-all:
	@if [ -z "$(CMD)" ]; then echo "Please provide CMD argument, e.g. make terragrunt CMD=validate"; exit 1; fi; \
	cd $(ROOT_DIR) ; \
	find . -name 'terragrunt.hcl' -print0 | while IFS= read -r -d '' file; do \
		dir=$$(dirname "$$file"); \
		cd "$$dir" || exit; \
		terragrunt $(CMD); \
		cd $(ROOT_DIR) || exit; \
	done

.PHONY: tflint
tflint:
	@cd $(ROOT_DIR) ; \
	find . -name '.tflint.hcl' -print0 | while IFS= read -r -d '' file; do \
		dir=$$(dirname "$$file"); \
		echo "Running tflint in $$dir"; \
		cd "$$dir" || exit; \
		tflint --init; \
		tflint; \
		cd $(ROOT_DIR) || exit; \
	done
