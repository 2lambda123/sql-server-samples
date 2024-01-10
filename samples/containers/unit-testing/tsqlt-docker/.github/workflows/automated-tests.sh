#!/bin/bash

# Set up the AdventureWorks database
./dtc1/db-init.sh

# Install tSQLt framework
docker exec -i dtc1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "your_password" -d AdventureWorks -i dtcinstall.sql

# Execute the unit tests
docker exec -i dtc1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "your_password" -d AdventureWorks -i dtctests.sql

# Teardown the AdventureWorks database
docker exec -i dtc1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "your_password" -d AdventureWorks -i dtcteardown.sql

# Clean up
./dtc1/entrypoint.sh
