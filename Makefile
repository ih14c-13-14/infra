ROOT_DIR=$(shell git rev-parse --show-superproject-working-tree --show-toplevel | head -1)

setup:
	(cd ${ROOT_DIR}/localIntegrate && docker compose pull && docker compose build)
	find ${ROOT_DIR}/localIntegrate -name '.env.example' -exec bash -c 'cp "$$1" "$${1%.example}"' _ {} \;

up:
	(cd ${ROOT_DIR}/localIntegrate && docker compose up -d)

up-verbose:
	(cd ${ROOT_DIR}/localIntegrate && docker compose up)

down:
	(cd ${ROOT_DIR}/localIntegrate && docker compose down)

destroy:
	(cd ${ROOT_DIR}/localIntegrate && docker compose down -v)
