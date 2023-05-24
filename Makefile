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
