


Select x.* into BLS_16_20 from (
	select * from dbo.all_data_M_2016
	union all
	select [year]
      ,[area]
      ,[area_title]
      ,[area_type]
      ,[naics]
      ,[naics_title]
      --,[i_group]
      ,[own_code]
      ,[occ_code]
      ,[occ_title]
      ,[o_group]
      ,[tot_emp]
      ,[emp_prse]
      ,[jobs_1000]
      ,[loc_quotient]
      ,[pct_total]
      ,[h_mean]
      ,[ a_mean ]
      ,[mean_prse]
      ,[h_pct10]
      ,[h_pct25]
      ,[h_median]
      ,[h_pct75]
      ,[h_pct90]
      ,[ a_pct10 ]
      ,[ a_pct25 ]
      ,[ a_median ]
      ,[ a_pct75 ]
      ,[ a_pct90 ]
      ,[annual]
      ,[hourly] 
	from dbo.all_data_M_2017
	union all
	select [year]
      ,[area]
      ,[area_title]
      ,[area_type]
      ,[naics]
      ,[naics_title]
      --,[i_group]
      ,[own_code]
      ,[occ_code]
      ,[occ_title]
      ,[o_group]
      ,[tot_emp]
      ,[emp_prse]
      ,[jobs_1000]
      ,[loc_quotient]
      ,[pct_total]
      ,[h_mean]
      ,[a_mean]
      ,[mean_prse]
      ,[h_pct10]
      ,[h_pct25]
      ,[h_median]
      ,[h_pct75]
      ,[h_pct90]
      ,[a_pct10]
      ,[a_pct25]
      ,[a_median]
      ,[a_pct75]
      ,[a_pct90]
      ,[annual]
      ,[hourly] 
	from dbo.all_data_M_2018
	union all
	select [year]
      ,[area]
      ,[area_title]
      ,[area_type]
      ,[naics]
      ,[naics_title]
      --,[i_group]
      ,[own_code]
      ,[occ_code]
      ,[occ_title]
      ,[o_group]
      ,[tot_emp]
      ,[emp_prse]
      ,[jobs_1000_orig]
      ,[loc_quotient]
      ,[pct_total]
      ,[h_mean]
      ,[a_mean]
      ,[mean_prse]
      ,[h_pct10]
      ,[h_pct25]
      ,[h_median]
      ,[h_pct75]
      ,[h_pct90]
      ,[a_pct10]
      ,[a_pct25]
      ,[a_median]
      ,[a_pct75]
      ,[a_pct90]
      ,[annual]
      ,[hourly] 
	from dbo.all_data_M_2019
	union all
	select [year]
      ,[AREA]
      ,[AREA_TITLE]
      ,[AREA_TYPE]
      --,[PRIM_STATE]
      ,[NAICS]
      ,[NAICS_TITLE]
      --,[I_GROUP]
      ,[OWN_CODE]
      ,[OCC_CODE]
      ,[OCC_TITLE]
      ,[O_GROUP]
      ,[TOT_EMP]
      ,[EMP_PRSE]
      ,[JOBS_1000]
      ,[LOC_QUOTIENT]
      ,[PCT_TOTAL]
      ,[H_MEAN]
      ,[A_MEAN]
      ,[MEAN_PRSE]
      ,[H_PCT10]
      ,[H_PCT25]
      ,[H_MEDIAN]
      ,[H_PCT75]
      ,[H_PCT90]
      ,[A_PCT10]
      ,[A_PCT25]
      ,[A_MEDIAN]
      ,[A_PCT75]
      ,[A_PCT90]
      ,[ANNUAL]
      ,[HOURLY] 
	from dbo.all_data_M_2020 ) x

	--Remove quotes from description column
	UPDATE dbo.soc_2018_definitions
	SET [SOC Definition] = right([SOC Definition], LEN([SOC Definition])-1)
	WHERE LEFT([SOC Definition], 1) = '"'

	UPDATE dbo.soc_2018_definitions
	SET [SOC Definition] = left([SOC Definition], LEN([SOC Definition])-1)
	WHERE right([SOC Definition], 1) = '"'
	

	update dbo.BLS_16_20
	set [a_mean] = right([a_mean], len([a_mean])-1)
	where left([a_mean],1) = '"'

	update dbo.BLS_16_20
	set [a_mean] = left([a_mean], len([a_mean])-1)
	where right([a_mean],1) = '"'

	update dbo.BLS_16_20
	set [a_pct10] = right([a_pct10], len([a_pct10])-1)
	where left([a_pct10],1) = '"'

	update dbo.BLS_16_20
	set [a_pct10] = left([a_pct10], len([a_pct10])-1)
	where right([a_pct10],1) = '"'

	update dbo.BLS_16_20
	set [a_pct25] = right([a_pct25], len([a_pct25])-1)
	where left([a_pct25],1) = '"'

	update dbo.BLS_16_20
	set [a_pct25] = left([a_pct25], len([a_pct25])-1)
	where right([a_pct25],1) = '"'

	update dbo.BLS_16_20
	set [a_median] = right([a_median], len([a_median])-1)
	where left([a_median],1) = '"'

	update dbo.BLS_16_20
	set [a_median] = left([a_median], len([a_median])-1)
	where right([a_median],1) = '"'

	update dbo.BLS_16_20
	set [a_pct75] = right([a_pct75], len([a_pct75])-1)
	where left([a_pct75],1) = '"'

	update dbo.BLS_16_20
	set [a_pct75] = left([a_pct75], len([a_pct75])-1)
	where right([a_pct75],1) = '"'

	update dbo.BLS_16_20
	set [a_pct90] = right([a_pct90], len([a_pct90])-1)
	where left([a_pct90],1) = '"'

	update dbo.BLS_16_20
	set [a_pct90] = left([a_pct90], len([a_pct90])-1)
	where right([a_pct90],1) = '"'

	--remove dash from occupation code to align with soc 2018 table definitions
	update dbo.BLS_16_20
	set [occ code] = replace([occ code],'-','') 

	--Add job descriptions missing from 2018 list
	select a.* 
	into #tempTable
	from [soc_2010_definitions] a left join [soc_2018_definitions] b on a.[SOC Code] = b.[SOC Code]
	where b.[SOC Code] is null

	select * from #tempTable

	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	select [SOC Code], [SOC Title], [SOC Definition]
	from #tempTable

	select * from soc_2018_definitions where [SOC Code] in (152051, 152099, 152091)

	--Account for "Data Scientists and Mathematical Science Occupations, All Other"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (152098, 'Data Scientists and Mathematical Science Occupations, All Other', 'Develop and implement a set of techniques or analytics applications to transform raw data into meaningful information using data-oriented programming languages and visualization software. Apply data mining, data modeling, natural language processing, and machine learning to extract and analyze information from large structured and unstructured datasets. Visualize, interpret, and report data findings. May create dynamic data reports. Apply standardized mathematical formulas, principles, and methodology to technological problems in engineering and physical sciences in relation to specific industrial and research objectives, processes, equipment, and products.')

	select y.* into BLS_16_20_Extract from (


		select  [year]
      ,[area]
      ,[area_title]
      ,[area_type], c.areatype_code, c.state_code
      ,[naics]
      ,[naics_title]
      ,[own_code]
      ,[occ code], b.[SOC Definition]
      ,[occ title]
      ,[group]
      ,[tot_emp]
      ,[emp_prse]
      ,[jobs_1000]
      ,[loc_quotient]
      ,[pct_total]
      ,[h_mean]
      ,[a_mean]
      ,[mean_prse]
      ,[h_pct10]
      ,[h_pct25]
      ,[h_median]
      ,[h_pct75]
      ,[h_pct90]
      ,[a_pct10]
      ,[a_pct25]
      ,[a_median]
      ,[a_pct75]
      ,[a_pct90]
      ,[annual]
      ,[hourly]
	
	  from BLS_16_20 a left join soc_2018_definitions b on a.[occ code] = b.[SOC Code]
	  left join dbo.[oe.area] c on a.area = c.area_code

	) y
