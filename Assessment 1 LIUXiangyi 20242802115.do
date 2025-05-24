* 设置工作路径
cd "D:\APP"

* 1. 使用stata导入test.xls
import excel "test.xls", sheet("Sheet1") firstrow clear

* 2. 对变量进行描述性统计，并将描述性统计结果导出至 "描述性统计结果.doc"
sum, detail
asdoc sum, save(DescriptiveStatistics.doc)

* 3. 将pop变量重命名为population，并添加标签"人口数量"
rename pop population
label var population "人口数量"

* 4. 生成新变量pop_over，若pop大于pop的均值，pop_over取值为1，否则为0
sum population
gen pop_over = (population > r(mean))

* 5. 生成新的数据集test1，仅包含变量state state2 region pop poplt5 pop5_17 pop18p pop65p
keep state state2 region pop poplt5 pop5_17 pop18p pop65p
save "test1.dta", replace

* 6. 生成新的数据集test2，仅包含变量state popurban medage death marriage divorce
use "test.xls", clear
import excel "test.xls", sheet("Sheet1") firstrow clear
keep state popurban medage death marriage divorce
save "test2.dta", replace

* 7. 将test1和test2合并，合并后的数据集命名为test3
use "test1.dta", clear
merge 1:1 state using "test2.dta"
save "test3.dta", replace

* 8. 基于利用ols，研究结婚人数（marriage）对人口数量（pop）的影响
use "test3.dta", clear
reg marriage population

* 9. 利用forvalues循环，计算1^2 2^2 ... 100^2
forvalues i = 1/100 {
    display "`i'^2 = " =`i'^2
}
