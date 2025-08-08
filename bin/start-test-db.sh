#!/bin/bash

# Script to start PostgreSQL server for tests using Docker
# Compatible with measurehub test configuration

set -e

CONTAINER_NAME="dev-db"
POSTGRES_VERSION="17"
POSTGRES_DB="dev-db"
POSTGRES_USER="postgres"
POSTGRES_PASSWORD="postgres"
PORT="5432"

echo "Starting PostgreSQL server for tests..."

# Check if container already exists
if docker ps -a --format "table {{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
    echo "Container ${CONTAINER_NAME} already exists."
    
    # Check if it's running
    if docker ps --format "table {{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
        echo "Container is already running."
    else
        echo "Starting existing container..."
        docker start ${CONTAINER_NAME}
    fi
else
    echo "Creating and starting new PostgreSQL container..."
    docker run -d \
        --name ${CONTAINER_NAME} \
        -e POSTGRES_DB=${POSTGRES_DB} \
        -e POSTGRES_USER=${POSTGRES_USER} \
        -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
        -p ${PORT}:5432 \
        postgres:${POSTGRES_VERSION}
fi

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to be ready..."
until docker exec ${CONTAINER_NAME} pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB} > /dev/null 2>&1; do
    sleep 1
done

echo "PostgreSQL is ready!"
echo "Connection details:"
echo "  Host: localhost"
echo "  Port: ${PORT}"
echo "  Database: ${POSTGRES_DB}"
echo "  Username: ${POSTGRES_USER}"
echo "  Password: ${POSTGRES_PASSWORD}"
echo ""
echo "To stop the container: docker stop ${CONTAINER_NAME}"
echo "To remove the container: docker rm ${CONTAINER_NAME}"
