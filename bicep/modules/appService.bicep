@description('The name of the App Service Plan')
param appServicePlanName string

@description('The SKU for the App Service Plan')
param appServicePlanSkuName string = 'S1'

@description('The tier for the App Service Plan (e.g., Free, Basic, Standard, Premium)')
param appServicePlanSkuTier string = 'Standard'

@description('The name of the Web App')
param webAppName string

@description('The location where resources will be deployed')
param location string = resourceGroup().location

// Create App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
    tier: appServicePlanSkuTier
  }
}

// Create Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}
