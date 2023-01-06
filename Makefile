SHELL = /bin/sh

PGPASSWORD = pass123word!
DBADMIN = admin
DBDEFAULT = db1
DBURI = db-oracle
PORT = 12345

build:
	dotnet build
clean-db:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE db2 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE db2;"
redeploy:
	pwsh -File clean_db.ps1
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE db2 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE db2;"
	dotnet ef migrations add AddTablesDefault
	dotnet ef database update
	dotnet build
	dotnet run
simple-deploy:
	dotnet build
	dotnet run
rebuild-pgsql:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE db2 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE db2;"
	dotnet ef database update
