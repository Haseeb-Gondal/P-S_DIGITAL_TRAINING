select 
"DFX Cycle",
"DFX Form",
"DFX Line",
"DFX Line Descr",
"DFX Column",
"DFX Column Descr",
"Metric Type",
"Metric Key",
"DFX Segment",
"DFX Segment Descr",
"DFX Target RU Name",
"DFX Target RU",
"KBOE",
"Month Vol / Day",
"Monthly_Variance",
"Dataflex Value",
"DFX Value YNY $M",
"Quarter Vol /Day",
"RG1: Medium Descr",
"RG1: Short Descr",
"TC Asset",
"TC Category",
"TC Code",
"YTD Vol / Day",
"Year/Month Text",
/////////////////////////////////////////Volume////////////////////////////////////////
case when 
"DFX Cycle" = 'UXM'
and "DFX Form" = '2020'
then "Month Vol / Day"
end as "Volume Monthly Actual",

case when "Metric Key" =
'UXM/2050/0130/02' then "Dataflex Value"
end as "Crude Monthly Actual",

case when "DFX Cycle" = 'UXM' AND "DFX Form" = '2050' 
and "DFX Line" = '130' 
and "DFX Column" = '2'
then "Dataflex Value"
end as "Crude YTD Actual",

case when 
"Metric Key"='UXM/2050/0320/01'
then "Dataflex Value"
end as "Gas Monthly Actual",

CASE WHEN
"Metric Key"='UXM/2050/0320/03'
THEN "Dataflex Value"
END AS "Gas YTD Actual",

case when 
"Metric Key"='USF/2020/0100/03'
then "Month Vol / Day"
end as "Gas Plan",

////////////////////////////////////////Cash Opex/////////////////////////////////////////

CASE WHEN "DFX Cycle" = 'UXM'
AND "DFX Form" = '2010'
AND "DFX Line" in('190','90')
AND "DFX Column" in ('1','2','3','4','5','6','7','8')
THEN "Monthly_Variance"
END AS "Cash Opex Monthly Actual",

case when "DFX Cycle" =
'UXM' and "DFX Form" = '2010' and "DFX Line" = '190' then
"Dataflex Value"
end as "Cash Opex YTD Actual",

CASE WHEN
"Metric Key" = 'USF/2080/0090/01'
THEN "Monthly_Variance"
END AS "Cash Opex Monthly Plan",

Case when 
"DFX Cycle" = 'USF' AND "DFX Form" = '2080'
AND "DFX Line" not in ('90', '100', '110') then "Dataflex Value"
end as "Cash Opex YTD Plan",

CASE WHEN "DFX Line" = '190'
THEN '10'
ELSE "DFX Line Descr"
END AS "Cash Opex DFX Line",

CASE WHEN "DFX Line" = 'USF' 
AND "DFX Form" = '2080' 
AND "DFX Column" = '1' 
THEN 'Plan' 
ELSE "DFX Column Descr" 
END AS "Cash Opex Waterfall Category",

CASE WHEN "DFX Cycle" = 'USF'
THEN "DFX Line Descr" 
WHEN "DFX Cycle" = 'UXM'
THEN "DFX Column Descr"
ELSE ''
END AS "Category_cash_opex",

////////////////////////////////////////Non Cash////////////////////////////////////

CASE WHEN "DFX Form" = '2010'
AND "DFX Column" = '10'
AND "DFX Line" = '190' THEN "Monthly_Variance"
END AS "Non Cash Monthly Actual",

CASE WHEN "DFX Form" = '2010'
AND "DFX Column" = '10'
AND "DFX Line" = '190' THEN "Dataflex Value"
END AS "Non Cash YTD Actual",

CASE WHEN "DFX Form" = '2080'
AND "DFX Column" = '1'
AND "DFX Line" = '100' THEN "Monthly_Variance"
END AS "Non Cash Monthly Plan",

CASE WHEN "DFX Form" = '2080'
AND "DFX Column" = '1'
AND "DFX Line" = '100' THEN "Dataflex Value"
END AS "Non Cash YTD Plan",

///////////////////////////////////////Earnings///////////////////////////////////////

CASE WHEN
"Metric Key" = 'UXM/2000/0110/01'
THEN "Monthly_Variance"
END AS "Op Earn Monthly Actual",

Case when "Metric Key" =
'UXM/2000/0110/02' then "Dataflex Value"
end as "Op Earn YTD Actual",

CASE WHEN
"Metric Key" = 'USF/1000/0010/01'
THEN "Monthly_Variance"
END AS "Op Earn Monthly Plan",

case when "Metric Key" =
'USF/1000/0010/01' then "Dataflex Value"
end as "Op Earn YTD Plan",

CASE WHEN "DFX Form" = '1000'
AND "DFX Cycle" = 'EXM'
AND "DFX Line" = 'Other Earnings Events' THEN "Monthly_Variance"
END AS "OEE Monthly Actual",

CASE WHEN "DFX Form" = '1000'
AND "DFX Cycle" = 'EXM'
AND "DFX Line" = 'Other Earnings Events' THEN "Dataflex Value"
END AS "OEE YTD Actual",

////////////////////////////////////Capex///////////////////////////////////////

CASE WHEN "DFX Cycle" = 'CBI'
AND "DFX Form" = '500'
AND "DFX Line Descr" <> 'Total'
AND "DFX Column" IN (1, 2, 3) THEN "Monthly_Variance"
END AS "Capex Monthly Actual",

CASE WHEN "DFX Cycle" = 'CBP'
AND "DFX Form" = '500'
AND "DFX Line Descr" <> 'Total'
AND "DFX Column" IN (1, 2, 3) THEN "Monthly_Variance"
END AS "Capex Monthly Plan",

CASE WHEN "DFX Cycle" = 'CBI'
AND "DFX Form" = '500'
AND "DFX Line Descr" <> 'Total'
AND "DFX Column" IN (1, 2, 3) THEN "Dataflex Value"
END AS "Capex YTD Actual",

CASE WHEN "DFX Cycle" = 'CBP'
AND "DFX Form" = '500'
AND "DFX Line Descr" <> 'Total'
AND "DFX Column" IN (1, 2, 3) THEN "Dataflex Value"
END AS "Capex YTD Plan",

CASE WHEN "DFX Cycle" = 'CBP'
AND "DFX Form" = '500'
AND "DFX Column" = '1'
AND "DFX Line Descr" = 'Uae Upper Zakum 1mbd'
AND "DFX Segment Descr" =  'Production - Obo - Non-U.S.'
THEN 'Uae Upper Zakum 750 Expansion'
ELSE "DFX Line Descr"
END AS "Capex Project DFX Line",

case when "DFX Cycle" = 'CBP'
and "DFX Form" = '500'
then 'Plan'
else "TC Category"
end as "Capex Waterfall Category",

/////////////////////////////////////////////////////////////////////////////////////////////


"Monthly_Variance" - LAG("Monthly_Variance", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code","UFO Data Source") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "Month VS Month",

"Dataflex Value" - LAG("Dataflex Value", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code","UFO Data Source") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "YTD VS YTD",

LAG("Monthly_Variance", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code","UFO Data Source") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "Previous Month",

LAG("Dataflex Value", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code","UFO Data Source") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "Previous YTD",


"Monthly_Variance" - LAG("Monthly_Variance", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "Non Cash Month VS Month",

"Dataflex Value" - LAG("Dataflex Value", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "Non Cash YTD VS YTD",

LAG("Monthly_Variance", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "Non Cash Previous Month",

LAG("Dataflex Value", 1, 0) OVER (PARTITION BY concat("Metric Key","DFX Target RU","RG1: Medium Descr","DFX Segment","TC Code") ORDER BY TO_DATE("Year/Month Text", 'MMMM yyyy'))  as "Non Cash Previous YTD",

case when "DFX Form" = '500'
and "DFX Column" in ('1' , '2' ,'3')
and "DFX Line Descr" <> 'Total'
then concat("Year/Month Text","DFX Target RU Name","Capex Project DFX Line","DFX Column")
end as "Capex Project Concat",

(CASE WHEN "DFX Cycle" = 'CBI'
AND "DFX Form" = '500'
AND "DFX Line Descr" <> 'Total'
AND "DFX Column" IN (1, 2, 3) THEN "Dataflex Value"
ELSE 0
END)
-
(CASE WHEN "DFX Cycle" = 'CBP'
AND "DFX Form" = '500'
AND "DFX Line Descr" <> 'Total'
AND "DFX Column" IN (1, 2, 3) THEN "Dataflex Value"
ELSE 0
END)
AS "Capex Waterfall YTD vs Plan"


/////////////////////////////////////////////////////////////////////////////////////////////

from UPST_PRD_ANLT_FIN.STEWARDSHIP_CONS.VW_UFO_REP
where ("DFX Memo STWD" = 'Y'
and "DFX Cycle" <> 'BXM'
and "DFX Cycle" <> 'CNY' 
and "DFX Cycle" <> 'GFS'
and "DFX Cycle" <> 'YNY'
and "Fiscal Year" in (2023,2024)
and "UFO Lvl2" IN ('CONVENTIONAL','HEAVY OIL')
and DATE_TRUNC('MONTH', CURRENT_DATE) = TO_DATE("Year/Month Text", 'MMMM yyyy')
AND "DFX Cycle" in ('CBP', 'USF'))
OR
("DFX Memo STWD" = 'Y'
and "DFX Cycle" <> 'BXM'
and "DFX Cycle" <> 'CNY' 
and "DFX Cycle" <> 'GFS'
and "DFX Cycle" <> 'YNY'
and "Fiscal Year" in (2023,2024)
and "UFO Lvl2" IN ('CONVENTIONAL','HEAVY OIL')
AND  DATE_TRUNC('MONTH', CURRENT_DATE) <> TO_DATE("Year/Month Text", 'MMMM yyyy'))