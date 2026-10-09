# Multisite Analysis Update Summary

## Date: October 9, 2026

## Changes Implemented

### 1. Table 1 - Complete Integration of Inference Results ✓

**Previous state:** Table 1 showed only descriptive statistics (n, %) by HMPV status.

**Current state:** Table 1 now merges three components using `tbl_merge()`:
- **Descriptive Summary:** Case counts and percentages by HMPV status
- **Univariate ORs:** Unadjusted odds ratios with 95% CI and p-values for ALL exposures
- **Adjusted ORs:** Multivariable-adjusted odds ratios with 95% CI and p-values for ALL exposures

**Technical details:**
- All ORs derived from multiple imputation (m=5) using `mice::pool()`
- Uses `with()` and `pool()` functions for proper MI inference
- P-values < 0.05 are automatically bolded via `bold_p(t = 0.05)`
- Semantic variable labels applied throughout

---

### 2. RQ2 Analysis - Switch from Complete-Case to Multiple Imputation ✓

**Previous state:** RQ2 used complete-case analysis (`dat.rq2[complete.cases(dat.rq2)]`)

**Current state:** RQ2 now uses multiple imputation:
- Excludes only cases with missing **HMPV test results** (already done) and **severity outcome**
- Applies MI (m=5) to handle missingness in all covariates
- Fits proportional odds models across all imputed datasets
- Pools coefficients, SEs, and p-values using Rubin's rules

**Technical details:**
- Factor levels properly restored after imputation
- Manual pooling implemented for `lrm()` models
- Results presented in Table 2

---

### 3. Table 2 - Integration of Severity Descriptives with Model Inference ✓

**Previous state:** Table 2 showed only descriptive severity distributions by covariate.

**Current state:** Table 2 now merges two components:
- **Severity Distribution:** Descriptive statistics (n, %) stratified by 5-level ordinal severity
- **Adjusted ORs:** Proportional odds regression results with ORs, 95% CI, and p-values

**Technical details:**
- All inference results pooled from MI (m=5)
- ORs represent odds of being in a higher severity category
- P-values < 0.05 bolded
- Semantic labels for all variables

---

### 4. Proportional Odds Assumption Test - Moved to Appendix ✓

**Previous state:** Brant test and PO diagnostics were in the main RQ2 section.

**Current state:** 
- Main text briefly notes that PO assumption will be assessed in appendix
- New **Appendix S2** contains full PO assumption assessment
- Test runs on complete-case data as supplementary diagnostic
- Clear interpretation guidance provided

---

### 5. Document Structure Improvements ✓

**Changes:**
- Added research question summaries at start of RQ1 and RQ2 sections
- Updated section headers for clarity
- Set key code chunks to `echo: false` to reduce clutter
- Created comprehensive appendix with two sections:
  - **S1:** Complete-case sensitivity analysis for RQ1
  - **S2:** Proportional odds assumption assessment for RQ2
- Updated limitations section to reference appendix

---

## Key Statistical Improvements

1. **Consistent MI approach:** Both RQ1 and RQ2 now use multiple imputation
2. **Complete inference reporting:** Every exposure has OR, 95% CI, and p-value
3. **Proper MI pooling:** All results use Rubin's rules for combining estimates
4. **Clear presentation:** Merged tables show descriptive + inferential side-by-side

---

## Table Formatting Standards

All tables now follow these conventions:
- **Semantic variable labels** from `var.labels` list
- **OR with 95% CI** for every predictor
- **P-values bolded if < 0.05** using `bold_p()`
- **Tab spanners** clearly identify table sections
- **Consistent notation:** "Univariate OR", "Adjusted OR", etc.

---

## Files Modified

- `01-multisite_hmpv_neurology_analysis.qmd` (primary analysis document)

## Next Steps

1. Render the updated Qmd to HTML to verify table formatting
2. Review merged tables for any display issues
3. Confirm that all ORs, CIs, and p-values are correctly pooled
4. Review appendix for completeness

---

## Technical Notes

### Multiple Imputation Workflow

```r
# RQ1 (HMPV infection risk)
imputed.obj <- mice(mice.data, m = 5, method = "pmm", seed = 7429)
uv.models <- with(imputed.obj, glm(c_hmpv.pos ~ predictor, family = binomial))
uv.pooled <- pool(uv.models)

# RQ2 (Severity among HMPV-positive)
imputed.obj.rq2 <- mice(mice.data.rq2, m = 5, method = "pmm", seed = 7429)
# Manual pooling for lrm() models using Rubin's rules
```

### Table Merging Pattern

```r
tbl_merged <- tbl_merge(
  list(tbl_desc, tbl_uv, tbl_adj),
  tab_spanner = c("**Descriptive**", "**Univariate OR**", "**Adjusted OR**")
) |> bold_p(t = 0.05)
```
