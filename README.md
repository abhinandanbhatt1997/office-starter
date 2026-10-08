# New Office Starter Packs

This repository is a practical starter kit for transitioning into a new engineering office and getting oriented to Azure AI project delivery. It gives you prompts, checklists, standards, examples, and reusable templates for aligning with your manager, checking access, planning and evaluating work, and delivering projects with Azure DevOps and Azure.

It supports your professional and project transition; it does not replace your employer's HR, security, IT, or onboarding instructions. Confirm local policies, owners, and approval paths with your manager.

## Start here

1. **Align on the role and first outcomes.** Review [Pack 0: Governance](pack_0/MANAGER_ALIGNMENT.md.md) with your manager. Agree on responsibilities, the meaning of r0, priorities, and how to raise blockers.
2. **Learn the access and environment setup.** Read [Pack 1: Pre-flight](pack_1/docs/checklists/PREFLIGHT_MASTER_CHECKLIST.md) and ask the relevant platform team which checks apply before running scripts.
3. **Follow the project lifecycle.** Use the [Accelerator Playbook](ACCELERATOR_PLAYBOOK.md) as a map across Packs 0–7.
4. **For a new project, create a working copy.** From the repository root, run:

   ```bash
   bash pack_3/scripts/project/instantiate-project.sh my-project
   ```

   This creates `pack_3/projects/my-project`. Review generated files and replace examples before treating them as project records.

## Pack map

| Pack | Use it for | Main entry point |
|---|---|---|
| 0 | Manager alignment, decisions, assumptions, risks, and communication | [Manager alignment](pack_0/MANAGER_ALIGNMENT.md.md) |
| 1 | Azure and Azure DevOps access readiness | [Pre-flight checklist](pack_1/docs/checklists/PREFLIGHT_MASTER_CHECKLIST.md) |
| 2 | AI evaluation and experiment practices | [Evaluation README](pack_2/eval/README.md) |
| 3 | Project repository scaffold and instantiation | [Pack README](pack_3/README.md) |
| 4 | Coding-agent context and rules | [Agent pack README](pack_4/agents/README.md) |
| 5 | Azure DevOps pipelines and infrastructure standards/examples | [Pipeline README](pack_5/pipelines/azure-devops/README.md) |
| 6 | Architecture, runbooks, limitations, and enterprise standards | [Templates](pack_6/docs/templates/) |
| 7 | Operations, security, release evidence, and handover | [Operations guide](pack_7/docs/operations/INCIDENT_RESPONSE.md) |

## Working principles

- Treat templates and sample values as examples until you replace them with verified project information.
- Follow your organization's access, security, privacy, and approval policies; ask the named owner when a local process is unclear.
- Do not put credentials, customer data, or unapproved internal information in this repository.
- Run scripts only after checking their prerequisites and confirming that you have the required access. Read-only preflight checks may still make authenticated requests to your organization's services.
- Infrastructure examples are starting points. Review plans and obtain the required approvals before applying changes.

## Repository status

Packs 0–7 are present. They contain a mixture of guidance, templates, scripts, pipeline examples, and starter scaffolding; not every pack is a complete, production-ready implementation. See each pack's README or entry document for its scope and limitations.
