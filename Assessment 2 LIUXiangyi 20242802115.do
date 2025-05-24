// ===========================================
// 静态面板作业 - Bruni
// 数据集：nlswork.dta
// 目标：面板回归、固定效应、随机效应、reghdfe、LSDV
// 日期：2025年5月
// ===========================================

clear all
set more off

// 加载数据
webuse nlswork.dta, clear
xtset idcode year

// 面板描述
xtdescribe
xtsum ln_wage grade age race msp nev_mar

// 固定效应模型
xtreg ln_wage grade age race msp nev_mar, fe
estimates store FE_pure

// 随机效应模型
xtreg ln_wage grade age race msp nev_mar, re
estimates store RE_pure

// Hausman 检验
hausman FE_pure RE_pure, sigmamore

// 固定效应模型
xtreg ln_wage grade age race msp nev_mar, fe robust

// 随机效应模型
xtreg ln_wage grade age race msp nev_mar, re robust

// reghdfe 固定效应
* cnssc install reghdfe, replace
reghdfe ln_wage grade age race msp nev_mar, absorb(idcode) vce(robust)

// LSDV 最小二乘虚拟变量法
reg ln_wage grade age race msp nev_mar i.idcode, robust

reg ln_wage grade age race msp nev_mar i.idcode, robust


display "你说什么我不知道这是刘香邑的作业"
xtline ln_wage if idcode < 50, overlay
