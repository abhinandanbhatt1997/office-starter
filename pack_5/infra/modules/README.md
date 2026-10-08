Terraform Modules
This folder will contain reusable Terraform modules.
Planned Modules
Module
Purpose
networking
VNet, subnets, private endpoints, DNS
identity
Managed identities and RBAC assignments
storage
Storage accounts and containers
keyvault
Key Vault and access policies/RBAC
ai
Azure OpenAI / AI Foundry / AI Search
monitoring
Log Analytics, Application Insights, alerts
queue
Service Bus, storage queues, DLQ
security
Security controls and policy assignments
 Module Rules


1. Modules must not contain environment-specific values.
2. Modules must expose clear variables.
3. Modules must expose useful outputs.
4. Modules must include README documentation.
5. Modules must avoid hardcoded secrets.
6. Modules must support tags.
7. Modules must support private networking where relevant.
