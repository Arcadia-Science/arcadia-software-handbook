
.PHONY: format
format:
	npm run format-md-fix
	npm run lint-md-fix

.PHONY: lint
lint:
	npm run lint-md
	npm run format-md-check