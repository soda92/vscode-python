all: build
.PHONY: build

prereq:
	npm install -g @vscode/vsce

build:
	npx gulp prePublishBundle
	npx gulp prePublishNonBundle
	npx gulp webpack
	npm run addExtensionPackDependencies
	npx vsce package --target win32-x64 --out ms-python-insiders.vsix --pre-release

update-libs:
	python -m pip install -t ./python_files/lib/jedilsp --no-cache-dir --implementation py --no-deps --require-hashes --only-binary :all: -r ./python_files/jedilsp_requirements/requirements.txt

update-libs-dev:
	python -m pip install -t ./python_files/lib/jedilsp --no-cache-dir --implementation py --no-deps --only-binary :all: -e C:/src/jedi-language-server --upgrade
