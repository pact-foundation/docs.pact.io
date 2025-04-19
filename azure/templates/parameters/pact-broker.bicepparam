using '../pact-broker.bicep'

param environment = 'dev'
param location = 'eastus2'
param envTags = {
  'Date Created': '20240926'
}
param postgresPassword = 'Password'
param serverEdition = 'GeneralPurpose'
param dbInstanceType = 'Standard_D4ds_v4'
param version = '13'
param skuSizeGB = 128
param pactBrokerImageVersion = '2.107.0.1'
param administratorLogin = 'pactbroker'
