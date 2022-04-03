SHELL = /bin/sh

PGPASSWORD = zyG2BnDrZ5yEyrlk
DBADMIN = upadmin
DBDEFAULT = defaultdb
DBURI = public-dev-pg-subzero-crepe-au-syd1-mmbmeooeaago.db.upclouddatabases.com
PORT = 11550

build:
	dotnet build
clean-db:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE funnyman WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE funnyman;"
redeploy:
	pwsh -File clean_db.ps1
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE funnyman WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE funnyman;"
	dotnet ef migrations add AddTablesDefault
	dotnet ef database update
	dotnet build
	dotnet run
simple-deploy:
	dotnet build
	dotnet run
rebuild-pgsql:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE funnyman WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE funnyman;"
	dotnet ef database update
