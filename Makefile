infra_path = infra/
tf_cmd = dotenv run terraform -chdir=$(infra_path)

init:
	$(tf_cmd) init

reinit:
	$(tf_cmd) init -reconfigure

validate:
	$(tf_cmd) fmt
	$(tf_cmd) validate

plan:
	$(tf_cmd) plan

deploy:
	$(tf_cmd) apply

clean:
	find . | grep -E "(__pycache__|.pytest_cache)$$" | xargs rm -rf
	rm -rf out/code.zip

destroy:
	$(tf_cmd) destroy
