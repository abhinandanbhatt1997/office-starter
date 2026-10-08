# Known Limitations: [Project Name] r0

*(Paste the Enterprise Header Here)*

## Purpose
This document explicitly lists what the r0 release **cannot** do. This protects the engineering team from scope-creep and false bug reports.

## Limitations Register
| ID | Category | Limitation Description | Business Impact | Planned Mitigation (r1+) |
|---|---|---|---|---|
| L-01 | Scale | System is capped at 50 concurrent users due to OpenAI TPM limits. | Marketing cannot blast email to all users. | Implement queueing and PTU provisioning in r1. |
| L-02 | AI | Model hallucinates if source documents are > 50 pages. | Legal docs require manual review. | Implement chunking strategy and map-reduce in r1. |
| L-03 | UI | No streaming UI; users wait for full generation. | Poor UX for long responses. | Implement SSE (Server-Sent Events) in r1. |

## Sign-off
By approving the r0 release, Product Management acknowledges and accepts these limitations.
