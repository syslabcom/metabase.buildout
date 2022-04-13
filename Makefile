PSQL_USER = postgres

.PHONY: all buildout restart

all: .installed.cfg

bin/pip:
	python3 -m venv . || virtualenv -p python3 --no-site-packages --no-setuptools . || virtualenv -p python3 --no-setuptools .
	./bin/python3 -m pip install --upgrade pip

bin/buildout: bin/pip requirements.txt
	./bin/pip install -IUr requirements.txt

.installed.cfg: bin/buildout buildout.cfg base.cfg templates/*
	./bin/buildout

buildout: .installed.cfg

restart:
	./bin/supervisord || ( ./bin/supervisorctl reread && ./bin/supervisorctl restart all)
