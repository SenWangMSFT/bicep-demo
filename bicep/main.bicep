@description('The name for the Storage Account.')
param storageAccountName string

@description('The location where resources will be deployed.')
param location string = resourceGroup().location

@description('Storage SKU')
param storageSku string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}
