# Networking Standard

**Document ID:** ENT-003 | **Status:** ACTIVE | **Owner:** Network / Platform Team

## 1. Private Endpoints (Private Link)
- All PaaS services holding sensitive data or AI models **MUST** be accessed via Private Endpoints.
- Public network access must be disabled on the PaaS resource firewall.

## 2. DNS Resolution
- Private Endpoints must be linked to centralized Private DNS Zones (e.g., `privatelink.openai.azure.com`).
- Application code must use the standard public FQDN; the Private DNS Zone will intercept and route it to the private IP.

## 3. Egress Filtering
- AI workloads must not have unrestricted internet egress.
- Use Azure Firewall or VNet NAT Gateways with strict FQDN allow-listing for required external API calls.
