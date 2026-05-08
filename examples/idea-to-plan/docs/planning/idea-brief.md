# Idea Brief

Status: draft
Last updated: 2026-05-09

## One-Sentence Idea

A local-first habit tracker for solo builders who want lightweight daily
momentum tracking without accounts or cloud sync.

## Problem

Solo builders often want a simple way to notice whether they are keeping
momentum on a few important habits, but many trackers are too social,
cloud-centered, or overloaded.

## Audience

Primary audience: solo builders, makers, and learners.

Secondary audience: people who prefer local tools and simple records.

## Desired Outcome

A user can define a small set of habits, mark daily progress, and see a simple
recent history without creating an account.

## Non-Goals

- No cloud sync in the first version.
- No social sharing.
- No notifications.
- No mobile app.
- No analytics beyond simple local history.

## Constraints

- Time: first useful version should be small.
- Budget: no paid services required.
- Skills: simple web or CLI implementation should be enough.
- Platform: local machine first.
- Legal/security/privacy: avoid collecting personal data outside the local
  project directory.

## Success Signals

- A user can create habits.
- A user can mark today's progress.
- A user can view the last seven days.
- Data persists locally.
- The app can be validated with one local command.

## Unknowns

- Should the first version be a CLI or a tiny web app?
- What local storage format is best for the first version?
- Is editing/deleting habits needed in the first slice?

## First Safe Step

Create a minimal local data model and validation around creating/listing habits
without building the full UI.

