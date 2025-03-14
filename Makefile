all: build
.PHONY: build

prereq:
	npm install -g @vscode/vsce
build:
    npx gulp prePublishNonBundle
	vsce package --no-yarn