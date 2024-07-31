.PHONY: help
.DEFAULT_GOAL := help

help: ## Show commands of the makefile (and any included files)
	@awk 'BEGIN {FS = ":.*?## "}; /^[0-9a-zA-Z_.-]+:.*?## .*/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## Run the website in development
	bundle exec jekyll serve --livereload

add_images: ## Run code to add images from scaleway
	rm -rf _posts/
	mkdir _posts
	cd build_post; poetry run python3 build_post.py

get_images: ## Run code to download all images from scaleway
	rm -rf _imgs/
	mkdir _imgs
	cd build_post; poetry run python3 save_images.py