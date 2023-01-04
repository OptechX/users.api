SHELL = /bin/sh

PGPASSWORD = X
DBADMIN = X
DBDEFAULT = X
DBURI = X
PORT = X

build:
	dotnet build
clean-db:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE produsrdb1 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE produsrdb1;"
redeploy:
	pwsh -File clean_db.ps1
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE produserdb1 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE produserdb1;"
	dotnet ef migrations add AddTablesDefault
	dotnet ef database update
	dotnet build
	dotnet run
simple-deploy:
	dotnet build
	dotnet run
rebuild-pgsql:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE produserdb1 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE produserdb1;"
	dotnet ef database update
