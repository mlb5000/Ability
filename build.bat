C:\Ruby19\bin\ruby.exe script/generate scaffold requirement_level name:string
C:\Ruby19\bin\ruby.exe script/generate scaffold requirement_type name:string
C:\Ruby19\bin\ruby.exe script/generate scaffold req_breakdown higher_level_id:integer lower_level_id:integer is_highest:boolean is_lowest:boolean
C:\Ruby19\bin\ruby.exe script/generate scaffold product name:string identifier:string req_breakdown_id:integer jira_defect_filter:string
C:\Ruby19\bin\ruby.exe script/generate scaffold requirement requirement_level_id:integer requirement_type_id:integer description:string rationale:string originator:string fit_criterion:string source_id:integer priority:integer satisfaction:integer dissatisfaction:integer
C:\Ruby19\bin\ruby.exe script/generate scaffold quality_risk product_id:integer risk_category_id:integer description:string mitigation_strategy_id:integer explanation:string likelihood:integer impact:integer