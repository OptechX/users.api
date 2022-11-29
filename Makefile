SHELL = /bin/sh

PGPASSWORD = AVNS_PxGhH3eouQ-LOqkFyUB
DBADMIN = doadmin
DBDEFAULT = devusrdb1
DBURI = db-postgresql-nyc1-80872-do-user-9791434-0.b.db.ondigitalocean.com
PORT = 25060

build:
	dotnet build
clean-db:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE devusrdb1 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE devusrdb1;"
redeploy:
	pwsh -File clean_db.ps1
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE devusrdb1 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE devusrdb1;"
	dotnet ef migrations add AddTablesDefault
	dotnet ef database update
	dotnet build
	dotnet run
simple-deploy:
	dotnet build
	dotnet run
rebuild-pgsql:
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "DROP DATABASE devusrdb1 WITH ( FORCE );"
	docker run --rm -it -e PGPASSWORD=${PGPASSWORD} postgres psql -U ${DBADMIN} -d ${DBDEFAULT} -h ${DBURI} -p ${PORT} -c "CREATE DATABASE devusrdb1;"
	dotnet ef database update
