infra_path = infra/
tf_cmd = terraform -chdir=$(infra_path)

init:
	$(tf_cmd) init

deploy:
	$(tf_cmd) fmt
	$(tf_cmd) validate
	$(tf_cmd) apply

clean:
	find . | grep -E "(__pycache__|.pytest_cache)$$" | xargs rm -rf
	rm -rf out/code.zip

destroy:
	$(tf_cmd) destroy
