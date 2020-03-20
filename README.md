# Metabase buildout

This buildout configuration downloads the metabase.jar and sets up a supervisor to run it.

## Installation

Create a buildout.cfg, adapting the [settings] section to your environment:

```
[buildout]
extends = base.cfg

[settings]
metabase-host = localhost
metabase-port = 3000
database-type = postgres
database-name = metabase
database-host = localhost
database-port = 5432
database-user = metabase
database-password = metabase
```

Initialize and run buildout:

```
python3 -m venv .
bin/pip install -r requirements.txt
bin/buildout
```

Run supervisor:

```
bin/supervisord
```

Point your browser at http://localhost:3000/ (or whatever host and port you've configured).
