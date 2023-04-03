.PHONY: help
.DEFAULT_GOAL := help

help: ## Show commands of the makefile (and any included files)
	@awk 'BEGIN {FS = ":.*?## "}; /^[0-9a-zA-Z_.-]+:.*?## .*/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## Run the website in development
	bundle exec jekyll serve --livereload

add_images: ## Run code to add images from scaleway
	cd build_post; poetry run python3 build_post.py