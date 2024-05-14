
.PHONY: format
format:
	npm run format
	npm run lint-fix

.PHONY: lint
lint:
	npm run lint
	npm run format-check
