SHELL=/bin/bash
.PHONY: *

generate-php:
	docker-compose run --rm codegen generate -i /local/openapi.yml -l php -o /local/php

generate-js:
	docker-compose run --rm codegen generate -i /local/openapi.yml -l javascript -o /local/js

generate: generate-php generate-js

download-local:
	curl -fssL http://localhost/api/openapi.yml -o openapi.yml

build-local: download-local generate

download-web:
	curl -fssL https://demo.azuracast.com/api/openapi.yml -o openapi.yml

build-web: download-web generate
