# Wiki Synchronization Guide

**Document ID:** WIKI-001 | **Status:** ACTIVE | **Owner:** AI Engineering

## The "Docs-as-Code" Principle
The Azure DevOps Git Repository is the **Single Source of Truth**. 
The Azure DevOps Wiki is merely a **read-only publishing layer**.

## Rules of Engagement
1. **Never edit directly in the Wiki UI.** Direct edits will be overwritten by the next pipeline sync and lost.
2. All updates must be made via Markdown files in the `/docs` folder of the repository.
3. Changes to docs must go through a Pull Request and review process, just like code.
4. Use the Azure DevOps "Publish Code as Wiki" feature to automatically map the `/docs` folder to the project Wiki.

## Why This Protects You
By forcing documentation through Git PRs, you create an immutable audit trail of who changed the documentation, when, and who approved it. This prevents stakeholders from claiming "you never told us about this limitation" after the fact.
