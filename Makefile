infra_path = infra/

init:
	terraform -chdir=$(infra_path) init

build:
	terraform -chdir=$(infra_path) validate
	terraform -chdir=$(infra_path) apply

clean:
	find . | grep -E "(__pycache__|.pytest_cache)$$" | xargs rm -rf
	rm -rf out/code.zip