#!/bin/bash

# Prompt the user for variables
read -p "Enter the resource group name: " RESOURCE_GROUP
read -p "Enter the location: " LOCATION
read -p "Enter the storage account name: " STORAGE_ACCOUNT_NAME
read -p "Enter the data factory name: " DATA_FACTORY_NAME

# Create Resource Group
echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create Storage Account
echo "Creating storage account..."
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --location $LOCATION --sku Standard_LRS --kind StorageV2 --hierarchical-namespace true

# Get Storage Account Key
STORAGE_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' --output tsv)

# Create Containers
echo "Creating containers..."
az storage container create --account-name $STORAGE_ACCOUNT_NAME --account-key $STORAGE_KEY --name bronze
az storage container create --account-name $STORAGE_ACCOUNT_NAME --account-key $STORAGE_KEY --name silver
az storage container create --account-name $STORAGE_ACCOUNT_NAME --account-key $STORAGE_KEY --name gold

# Create Data Factory
echo "Creating data factory..."
az datafactory create --resource-group $RESOURCE_GROUP --factory-name $DATA_FACTORY_NAME --location $LOCATION

# Output Information
echo "Storage Account Name: $STORAGE_ACCOUNT_NAME"
echo "Storage Account Key: $STORAGE_KEY"
echo "Containers: bronze, silver, gold"
echo "Data Factory Name: $DATA_FACTORY_NAME"
