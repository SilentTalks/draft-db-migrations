default_target: help

.PHONY: help
help:
	@echo "Required: Docker-^24.0.4 and Compose-^2.20"
	@echo ""
	@echo "Makefile Targets:"
	@echo "... init (Initialisation project for development)"
	@echo "... run (Run docker compose in the foreground)"
	@echo "... run_d (Run docker compose in the background)"
	@echo "... stop (Stop docker compose)"

.PHONY: init
init:
	cp example.docker-compose.override.yml docker-compose.override.yml
	cp example.migrations.sql migrations.sql

.PHONY: run
run:
	docker compose down --volumes
	docker compose up

.PHONY: run_d
run_d:
	docker compose down --volumes
	docker compose up -d

.PHONY: stop
stop:
	docker compose stop
