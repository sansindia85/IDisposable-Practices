# Demo 1 - IDisposable Basics

We'll use a simple set of unit tests to see how IDisposable works with the SqlConnection class.

## Pre-reqs

The demo uses a SQL Server database. The easiest way to run it is using [Docker Desktop]().

## Setup 

Start the database:

```
<!-- docker run -d -p 1433:1433 psdispose/sql-server:2019 -->
docker run -d -p 1433:1433mcr.microsoft.com/mssql/server:2019-latest
```

Check it's running:

```
docker ps
```

## Run the tests

> Open the SqlConsumer solution in Visual Studio and walk through the tests


