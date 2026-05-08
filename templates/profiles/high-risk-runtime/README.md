# High-Risk Runtime Profile

Use this profile when changes can affect live runtime behavior, money,
infrastructure, user data, security boundaries, tenant isolation, or physical
operations.

## High-Risk Surfaces

Classify a slice as high risk when it touches:

- execution engines;
- external API connectors;
- scheduler or worker behavior;
- resource, capital, balance, or quota allocation;
- persisted runtime state;
- authentication or authorization;
- tenant or user boundaries;
- production configuration;
- deployment targets;
- database migrations;
- secrets or credential handling.

## Required Controls

High-risk slices should require:

- explicit scope and non-goals;
- path-based risk classification;
- required tests and smoke proof;
- rollback or recovery notes;
- independent risk review;
- human approval before deployment or production promotion.

## Fail-Closed Rule

When runtime truth cannot be proven, controls should fail closed or degrade
read-only. Do not invent healthy or actionable state from missing evidence.

