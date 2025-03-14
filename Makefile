all: build
.PHONY: build

prereq:
	npm install -g @vscode/vsce
build:
    npx gulp prePublishNonBundle
    npx gulp webpack
	vsce package --no-yarn