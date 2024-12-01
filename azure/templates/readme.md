This folder containes a bicep template with the following resources.
```
1. Resource Group to hold all resource
2. Postgres SQL Database
3. App Service Plan for the Web App
4. Web App runing linux
```

Each module block in the template poing to the Microsoft Bicep Module Repo, and uses Azure Verified Modules.

In the script folder, the azcli.ps1 file will contain azcli commands to perform a What-if and Create deployment.