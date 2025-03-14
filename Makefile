all: build
.PHONY: build

prereq:
	npm install -g @vscode/vsce

build:
	vsce package --no-yarn