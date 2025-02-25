targetScope = 'subscription'

@description('Function to help automatically concatenate a deployment name with a character limit of 65.')
func deploymentName(baseName string) string => take('${baseName}-${uniqueString(string(deployment()))}', 64)

@description('Name of environment')
param environment string

@description('Resource/Resource Group location')
param location string

@description('The tags attached to the resource')
param envTags object = {}

@description('Administrator login for PostgreSQL')
param administratorLogin string

@secure()
@description('Administrator password for PostgreSQL')
param postgresPassword string

@description('PostgreSQL server edition')
param serverEdition string

@description('PostgreSQL instance type')
param dbInstanceType string

@description('PostgreSQL version')
param version string

@description('PostgreSQL SKU size in GB')
param skuSizeGB int

@description('Docker image for Pact Broker')
param pactBrokerImageVersion string

// Joins the standard tags for your context with any custom tags passed in via the parameter file.
var tags = union(envTags, {
  Owner: '{Inser Owner Here}'
  Environment: environment
})

var resourceGroupName = '${environment}-pactbroker-rg'
//An Azure App service is a public facing resource and must be unique. 
//Update the name as needed if you recieve an error that the name is already in use!
var pactBrokerAppName = '${environment}-pactbroker-app-01'
var pactBrokerAspName = '${environment}-pactbroker-asp-01'
var postgresName = '${environment}-pactbroker-postgres-01'
var urlHostName = '{Insert Custom URL here}'

// Creates the Resource Group for resources
module rg 'br:mcr.microsoft.com/bicep/avm/res/resources/resource-group:0.4.0' = {
  name: deploymentName('rg-${resourceGroupName}')
  scope: subscription()
  params: {
    name: resourceGroupName
    location: location
    tags: tags
  }
}

// Deploy PostgreSQL Server
module postgres 'br:mcr.microsoft.com/bicep/avm/res/db-for-postgre-sql/flexible-server:0.3.0' = {
  name: take('${postgresName}-${uniqueString(string(deployment()))}', 64)
  scope: resourceGroup(resourceGroupName)
  params: {
    location: location
    name: postgresName
    administratorLogin: administratorLogin
    administratorLoginPassword: postgresPassword
    tier: serverEdition
    skuName: dbInstanceType
    version: version
    storageSizeGB: skuSizeGB
    passwordAuth: 'Enabled'
    firewallRules: [
      // Added to allows Access from Azure resources and services
      {
      name: 'AllowAllAzureServicesAndResourcesWithinAzureIps'
      startIpAddress: '0.0.0.0'
      endIpAddress: '0.0.0.0'
      }
    ]
  }
  dependsOn: [
    rg
  ]
}

//Deploy App Service Plan
module asp 'br:mcr.microsoft.com/bicep/avm/res/web/serverfarm:0.2.2' = {
  name: take('${pactBrokerAspName}-${uniqueString(string(deployment()))}', 64)
  scope: resourceGroup(resourceGroupName)
  params: {
    name: pactBrokerAspName
    location: location
    skuCapacity: 2
    skuName: 'B1'
    kind: 'Linux'
  }
  dependsOn: [
    rg
  ]
}

//Deploy Linux Web App running PAct-Broker Container
module app 'br:mcr.microsoft.com/bicep/avm/res/web/site:0.9.0' = {
  name: take('${pactBrokerAppName}-${uniqueString(string(deployment()))}', 64)
  scope: resourceGroup(resourceGroupName)
  params: {
    name: pactBrokerAppName
    location: location
    kind: 'app,linux,container'
    serverFarmResourceId: asp.outputs.resourceId
    managedIdentities: {
      systemAssigned: true
    }
    siteConfig: {
      linuxFxVersion: 'DOCKER|pactfoundation/pact-broker:${pactBrokerImageVersion}'
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'PACT_BROKER_BASE_URL'
          value: urlHostName
        }
        {
          name: 'PACT_BROKER_DATABASE_ADAPTER'
          value: 'postgres'
        }
        {
          name: 'PACT_BROKER_DATABASE_HOST'
          value: postgres.outputs.fqdn
        }
        {
          name: 'PACT_BROKER_DATABASE_NAME'
          value: 'postgres'
        }
        {
          name: 'PACT_BROKER_DATABASE_PORT'
          value: 5432
        }
        {
          name: 'PACT_BROKER_DATABASE_USERNAME'
          value: administratorLogin
        }
        {
          name: 'PACT_BROKER_DATABASE_PASSWORD'
          value: postgresPassword
        }
        {
          name: 'PACT_BROKER_ENABLE_DIAGNOSTIC_ENDPOINTS'
          value: true
        }
        {
          name: 'PACT_BROKER_PORT'
          value: 9292
        }
        {
          name: 'PACT_BROKER_PUBLIC_HEARTBEAT'
          value: true
        }
        {
          name: 'WEBSITE_HEALTHCHECK_MAXPINGFAILURES'
          value: 2
        }
        {
          name: 'WEBSITE_HTTPLOGGING_RETENTION_DAYS'
          value: 2
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: false
        }
        {
          name: 'WEBSITES_PORT'
          value: 9292
        }
      ]
    }
  }
  dependsOn: [
    rg
  ]
}
