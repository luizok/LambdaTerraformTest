infra_path = infra/

init:
	terraform -chdir=$(infra_path) init

deploy:
	terraform -chdir=$(infra_path) fmt
	terraform -chdir=$(infra_path) validate
	terraform -chdir=$(infra_path) apply

clean:
	find . | grep -E "(__pycache__|.pytest_cache)$$" | xargs rm -rf
	rm -rf out/code.zip

destroy:
	terraform -chdir=$(infra_path) destroy
