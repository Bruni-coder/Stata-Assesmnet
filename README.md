# 📊 Stata Panel Data Analysis

This repository contains a Stata `.do` file for performing panel data analysis using the built-in `nlswork.dta` dataset. The objective is to explore how education level (measured by `grade`) affects wages (`ln_wage`) using various panel regression techniques.

## 🔍 Overview

This project demonstrates:

- Panel data setup using `xtset`
- Fixed effects (FE) model
- Random effects (RE) model
- Hausman test for model selection
- High-dimensional fixed effects via `reghdfe`
- Least Squares Dummy Variable (LSDV) regression

## 📁 Files

- `panel_assignment.do`: Main script containing all Stata commands

## 🧪 Methods

The analysis includes:

- `xtreg` for FE and RE estimation
- `hausman` test to choose between FE and RE
- `reghdfe` for high-dimensional fixed effects (requires installation)
- `reg` with individual dummies for LSDV

## 📦 Dataset

We use the `nlswork.dta` dataset provided in Stata via:
```stata
webuse nlswork.dta, clear
```

## 📝 Example Command
```stata
xtset idcode year
xtreg ln_wage grade age race msp nev_mar, fe
hausman FE RE, sigmamore
```

## 📌 Requirements
- Stata 15 or later
- `reghdfe` package (`ssc install reghdfe`)

## ✍️ Author
Bruni — for coursework and personal mastery of econometrics and applied Stata usage.
