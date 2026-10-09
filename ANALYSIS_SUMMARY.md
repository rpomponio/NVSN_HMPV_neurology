# HMPV and Neurologic Disease Analysis - Summary

## Analysis Completed: October 9, 2026

### Study Overview
- **Objective:** Investigate whether children with neurologic/neuromuscular disease have increased risk of HMPV infection and disease severity
- **Design:** Complete case analysis across 7 NVSN sites (2016-2026)
- **Comparison:** Multisite replication of Pittsburgh single-site findings (2024)

### Data
- **Source:** `Data/Pitt_Anna_HMPV_SEP26.csv`
- **Original cases:** ~136,000 ARI episodes
- **Complete cases:** Cases with valid HMPV test results and complete covariate data
- **Follow-up analysis:** Check the rendered HTML report for exact sample sizes

### Key Variables

#### Exposure
- **Neurologic/neuromuscular disease** (`c_unuerologic`)
  - Explicit TRUE/FALSE/NA encoding (no defaults)
  
#### Primary Outcome
- **HMPV infection** (`tmpv == 1`)

#### Secondary Outcome
- **Illness severity** (5-level ordinal):
  1. ED discharge
  2. Admitted - no support
  3. Admitted - O2/respiratory support
  4. ICU admission
  5. Mechanical ventilation/ECMO

#### Covariates (adjusted models)
- Age, sex, race/ethnicity, insurance
- Respiratory, cardiovascular, immunocompromised, prematurity conditions
- Study site, season

### Statistical Approach

1. **Infection Risk:** Logistic regression
   - Unadjusted OR
   - Adjusted OR (demographics + comorbidities + site + season)

2. **Disease Severity:** Proportional odds model (ordinal logistic regression)
   - Among HMPV-positive cases only
   - Adjusted for same covariates

3. **Complete Case Analysis:** No imputation; cases excluded if missing any required variable

### Expected Findings (Based on Pittsburgh 2024)
- **Infection risk:** OR ≈ 1.75 (95% CI: 1.19, 2.56)
- **Severity:** OR ≈ 4.80 (95% CI: 2.01, 11.47)

### Output Files
1. **`analysis.qmd`** - Quarto source document
2. **`HMPV_Neurology_Analysis.html`** - Rendered HTML report with all results
3. **`wald_function.R`** - Helper function for Wald-based inference

### Key Results
See the rendered HTML report (`HMPV_Neurology_Analysis.html`) for:
- Table 1: HMPV infection risk analysis
- Figure 1: HMPV rates by site and neurologic status
- Table 2: Severity analysis among HMPV+ cases
- Figure 2: Severity distribution
- Sensitivity analyses (appendix)
- Comparison to Pittsburgh 2024 findings

### Interpretation Notes

1. **Site heterogeneity:** Figure 1 shows variation in HMPV rates across sites
2. **Replication:** Compare multisite ORs to single-site estimates
3. **Severity gradient:** Figure 2 illustrates severity distribution differences
4. **Complete case limitation:** Document which variables had most missing data

### Next Steps
1. Review rendered HTML report for complete results
2. Check if multisite ORs replicate Pittsburgh findings
3. Assess site-level heterogeneity
4. Consider sensitivity analyses if needed
5. Draft manuscript text based on findings

### Code Style
Analysis follows Ray's coding preferences:
- Dot notation for variables (e.g., `neuro.status`, `hmpv.pos`)
- `data.table` over tidyverse
- Base R pipe `|>`
- Explicit missing data handling (no defaults)
- `tbl_merge()` for side-by-side descriptive + inference tables

---

**Analysis by:** Posit Assistant  
**Date:** October 9, 2026  
**Document:** Complete case analysis, multisite HMPV study
