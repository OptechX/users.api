SHELL = /bin/sh

PGPASSWORD = zyG2BnDrZ5yEyrlk

build:
	dotnet build
clean-db:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U upadmin -d defaultdb -h public-dev-pg-subzero-crepe-au-syd1-mmbmeooeaago.db.upclouddatabases.com -p 11550  -c "DROP DATABASE funnyman WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U upadmin -d defaultdb -h public-dev-pg-subzero-crepe-au-syd1-mmbmeooeaago.db.upclouddatabases.com -p 11550  -c "CREATE DATABASE funnyman;"
redeploy:
	pwsh -File clean_db.ps1
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U upadmin -d defaultdb -h public-dev-pg-subzero-crepe-au-syd1-mmbmeooeaago.db.upclouddatabases.com -p 11550  -c "DROP DATABASE funnyman WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U upadmin -d defaultdb -h public-dev-pg-subzero-crepe-au-syd1-mmbmeooeaago.db.upclouddatabases.com -p 11550  -c "CREATE DATABASE funnyman;"
	dotnet ef migrations add AddTablesDefault
	dotnet ef database update
	dotnet build
	dotnet run
simple-deploy:
	dotnet build
	dotnet run
rebuild-pgsql:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U upadmin -d defaultdb -h public-dev-pg-subzero-crepe-au-syd1-mmbmeooeaago.db.upclouddatabases.com -p 11550  -c "DROP DATABASE funnyman WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U upadmin -d defaultdb -h public-dev-pg-subzero-crepe-au-syd1-mmbmeooeaago.db.upclouddatabases.com -p 11550  -c "CREATE DATABASE funnyman;"
	dotnet ef database update
