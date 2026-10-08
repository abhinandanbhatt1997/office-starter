# System Architecture: [Project Name]

*(Paste the Enterprise Header Here)*

## 1. Executive Summary
[1-2 paragraphs explaining what this system does and the primary business value.]

## 2. Architectural Diagram
*(Link to diagram or embed image. Must show VNet boundaries, Private Endpoints, and Identity flows.)*

## 3. Core Components
| Azure Service | Purpose | SKU/Tier | Justification |
|---|---|---|---|
| Azure OpenAI | LLM Inference | PTU / Pay-as-you-go | [Why this tier?] |
| Azure AI Search | Vector DB / RAG | Standard | [Why this tier?] |
| Container Apps | Agent Runtime | Consumption | [Why not Functions?] |

## 4. Data Flow
1. User sends request to APIM.
2. APIM authenticates via Entra ID and routes to Container App.
3. Container App uses Managed Identity to fetch secrets from Key Vault.
4. Container App queries AI Search (Private Endpoint).
5. Container App sends grounded prompt to Azure OpenAI (Private Endpoint).

## 5. Security & Compliance Posture
- **Data Residency:** [e.g., West Europe]
- **Encryption:** [e.g., CMK via Key Vault]
- **Network:** [e.g., Fully private, no public IP]
