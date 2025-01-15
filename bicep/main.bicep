@description('The name for the Storage Account.')
param storageAccountName string

@description('The location where resources will be deployed.')
param location string = resourceGroup().location

@description('Storage SKU')
param storageSku string = 'Standard_LRS'

// New parameters for App Service Plan / Web App
@description('The name of the App Service Plan.')
param appServicePlanName string = 'myAppServicePlan'

@description('The SKU name for the App Service Plan.')
param appServicePlanSkuName string = 'S1'

@description('The SKU tier for the App Service Plan.')
param appServicePlanSkuTier string = 'Standard'

@description('The Web App name.')
param webAppName string = 'myWebApp'

// Deploy Storage Account
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}

module appServiceModule 'br:acrremotemodules.azurecr.io/modules/appservice:v1' = {
  name: 'appServiceModule'
  params: {
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    appServicePlanSkuTier: appServicePlanSkuTier
    webAppName: webAppName
    location: location
  }
}
