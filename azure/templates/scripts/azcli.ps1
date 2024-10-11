## Command to connect to your azure subscription
az login

## Command to set your subscription
#### NOTE, this is needed only if you have 
#### more than one subscription available to your account.
az account set --subscription '{Insert subscription name or ID here}' 

## Command to run a What-If deployment at the scope of the bicep template
#### NOTE, the templates are as a subscription level, which is why
#### the commands above are needed.
az deployment sub what-if --location '{Insert deployment locations here}' --template-file .\pact-broker.bicep --parmeters .\parameters\pact-broker.bicepparam

## Command to run a Create deployment at the scope of the bicep template
#### NOTE, the templates are as a subscription level, which is why
#### the commands above are needed.

az deployment sub create --location '{Insert deployment locations here}' --template-file .\pact-broker.bicep --parmeters .\parameters\pact-broker.bicepparam