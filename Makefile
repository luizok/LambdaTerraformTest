infra_path = infra/
app_path = app/

tf_cmd = dotenv run terraform -chdir=$(infra_path)
test_cmd = dotenv run pytest -v --rootdir=$(app_path)

test:
	$(test_cmd)

coverage:
	$(test_cmd) --cov=. \
	--cov-report=html:out/htmlcov --cov-report=xml:out/coverage.xml \
	--cov-fail-under=90 \
	--cov-config=.coveragerc

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

show:
	$(tf_cmd) show

clean:
	find . | grep -E "(__pycache__|.pytest_cache)$$" | xargs rm -rf
	rm -rf out/code.zip

destroy:
	$(tf_cmd) destroy
