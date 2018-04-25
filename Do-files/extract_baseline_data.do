/***************************************************
 _____ _____ _____ ____  
|   __|   __|   __|    \ 
|__   |   __|   __|  |  |
|_____|_____|_____|____/ 
                         
** Main endline regressions of economic outcomes
** By: David Contreras Loya
** Date modified: 19 Mar 2017
***************************************************/

global output_box "~/Box Sync/SEED/500 - ANALYSIS/520 - OUTPUT"

use "$output_box/Economic data/SEED_endline_analysis.dta", clear

*drop if D_revenue_1==1 | D_profit_1==1

keep ever_self_employed gender age Cur_self_employed profit revenue ///
	 log_revenue log_profit q06_dayorboarding q25_family_business ///
	 q25a_wk_family_bus timeprefs_patience riskbehavior mathbusiness leadership perceivedcontrol ///
	 timeprefs_delta timeprefs_beta prosocialbehavior anxiety selfconfidence big5extroversion ///
	 big5emostability big5openness big5conscientious big5agreeable schoolacceptance currfamwealthstep ///
	 tenyrwealthstep takingriskstep ravenscore father_educ father_income ///
	 mother_income type_house q13_olevelscore1 q13_olevelscore2 q13_olevelscore34  ///
	 treated att_cat_pooled log_tot
	 
	 *total_attendance dist_home att_cat_pooled
	 
foreach var of varlist father_educ father_income mother_income{
	tab `var', gen(`var')
}

drop father_educ father_income mother_income
	 
ren att_cat_pooled full_attendance
label var full_attendance "=1 if full attendance to training"

replace ever_self_employed = Cur_self_employed if ever_self_employed==.
	 
cd "~/Dropbox/Causal_David/Data"

saveold SEED_endline_analysis.dta, replace version(12)
