ROOT_DIR=$(shell git rev-parse --show-superproject-working-tree --show-toplevel | head -1)

setup:
	(find . -name '.env.example' -exec bash -c 'cp "$$1" "$${1%.example}"' _ {} \;)
	(docker compose pull && docker compose build)

up:
	(docker compose up -d)

seed-up:
	(migrate.sh && docker compose up -d)

up-verbose:
	(docker compose up)

down:
	(docker compose down)

destroy:
	(docker compose down -v)
