# Docker Image for PostgreSQL with additions for CABLES service

## Backup Instructions

On the running postgres container do:

        docker exec -t <your-db-container> pg_dumpall -c -U <db-user> > dump_cables-postgres`date +%d-%m-%Y"_"%H_%M_%S`.sql

## Restore Instructions

Without any related containers running do:

        ./build-volume-postgres.sh

This will create data-only volumes and volume containers for restoring data.

Now, run a container mounting the recently create containers:

	docker run -d -P --volumes-from dockercablescomposed_cables-postgres-volume --name cables-restore -v $(pwd):/var/lib/postgresql/backup postgres:9.5.4

Bear in mind that you must use the same postgres image version. Otherwise,
postgres server will complain the versions are different on initialization

Finnaly restore the data by doing:

        cat dump_cables-postgres-<backup-date>.sql | docker exec -i cables-restore psql -U postgres

Cleanup temporary containers:

        docker stop cables-restore
        docker rm cables-restore

