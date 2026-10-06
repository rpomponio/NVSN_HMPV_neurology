# Executive Summary: Multisite Analysis of Neurologic Disease and HMPV

## Overview

We propose to expand our single-site (Pittsburgh) analysis to the full multisite NVSN cohort to investigate whether children with neurologic/neuromuscular disease experience disproportionately higher risk of human metapneumovirus (HMPV) infection and disease severity.

**Data:** 136,000+ cases across 7 sites, 10+ years (2016–2026)

### Previous Findings (Pittsburgh, 2024)

- **HMPV infection risk:** Neurologic disease → **1.75× higher odds** (95% CI: 1.19, 2.56)
- **HMPV severity:** Neurologic disease → **4.80× higher odds** of elevated severity (95% CI: 2.01, 11.47)

## Research Questions

**Primary:** Is neurologic/neuromuscular disease associated with increased HMPV infection risk in a multisite cohort (adjusting for demographics, comorbidities, site)?

**Secondary:** Among HMPV-positive children, is neurologic disease associated with elevated disease severity (5-level ordinal outcome)?

## Study Population & Methods

**Inclusion:** All pediatric ARI cases with valid HMPV test results (2016–2026, 7 sites)\
**Analysis Methods:** - **Infection risk:** Logistic regression with multiple imputation (m=5) for missing covariates - **Severity:** Proportional odds (ordinal logistic) regression - **Adjustment:** Age, sex, race/ethnicity, insurance, respiratory/cardiovascular/immunosuppressive conditions, study year, and **site** (new)

## Key Changes from 2024 Pittsburgh Analysis

1.  **Site Adjustment:** All models now include study site to control for geographic variation
2.  **Missing Data:** Primary analysis uses multiple imputation; complete-case sensitivity check provided
3.  **Clustering:** GLM approach (simpler than GEE); repeater-level clustering deferred to sensitivity if warranted

## Expected Deliverables

**Tables:**

  1. Overall cohort characteristics by HMPV status with unadjusted/adjusted ORs
  2. HMPV-positive case characteristics by severity level with adjusted ORs

**Figures:**

  1. Illness severity distribution by neurologic status
  2. HMPV infection rates by neurologic status and site

**Key Comparisons:** - Do multisite ORs align with single-site findings (1.75× and 4.80×)? - Is there substantial heterogeneity across sites?

## Sensitivity Analyses

- Complete-case analysis (vs. multiple imputation)
- Models excluding site/year adjustments
- Dichotomous severity outcome

## Timeline & Resources

**Effort:** 1–2 hours (data prep, modeling, tables/figures)\
**Deliverable:** Quarto report with embedded R code (similar to mBio analysis)\
**Estimated completion:** Within 1 week of approval

## Approval Status

**Next step:** Upon your approval, we will implement data preparation, fit models, and generate descriptive tables/figures.
