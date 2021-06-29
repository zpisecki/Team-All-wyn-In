

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

	--Account for "Project Management Specialists and Business Operations Specialists, All Other"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (131198, 'Project Management Specialists and Business Operations Specialists, All Other', 'Analyze and coordinate the schedule, timeline, procurement, staffing, and budget of a product or service on a per project basis. Lead and guide the work of technical staff. May serve as a point of contact for the client or customer.')
	
	--Account for "Aerospace Engineers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (172010,	'Aerospace Engineers','Perform engineering duties in designing, constructing, and testing aircraft, missiles, and spacecraft. May conduct basic and applied research to evaluate adaptability of materials and equipment to aircraft design and manufacture. May recommend improvements in testing equipment and techniques.')

	--Account for "Architectural and Engineering Managers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (119040,	'Architectural and Engineering Managers','Plan, direct, or coordinate activities in such fields as architecture and engineering or research and development in these fields.')

	--Account for "Bioengineers and Biomedical Engineers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (172030,	'Bioengineers and Biomedical Engineers','Apply knowledge of engineering, biology, chemistry, computer science, and biomechanical principles to the design, development, and evaluation of biological, agricultural, and health systems and products, such as artificial organs, prostheses, instrumentation, medical information systems, and health management and care delivery systems.')

	--Account for "Civil Engineers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (172050,	'Civil Engineers','Perform engineering duties in planning, designing, and overseeing construction and maintenance of building structures and facilities, such as roads, railroads, airports, bridges, harbors, channels, dams, irrigation projects, pipelines, power plants, and water and sewage systems. Includes architectural, structural, traffic, and geotechnical engineers. Excludes "Hydrologists" (19-2043).')

	--Account for "Computer and Information Systems Managers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (113020, 'Computer and Information Systems Managers', 'Plan, direct, or coordinate activities in such fields as electronic data processing, information systems, systems analysis, and computer programming. Excludes "Computer Occupations" (15-1211 through 15-1299).')

	--Account for "Computer Hardware Engineers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (172060,'Computer Hardware Engineers','Research, design, develop, or test computer or computer-related equipment for commercial, industrial, military, or scientific use. May supervise the manufacturing and installation of computer or computer-related equipment and components. Excludes "Software Developers" (15-1252) and "Web Developers" (15-1254).')

	--Account for "Database Administrators and Architects"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (151245,'Database Administrators and Architects','Administer, test, and implement computer databases, applying knowledge of database management systems. Coordinate changes to computer databases. Identify, investigate, and resolve database performance issues, database capacity, and database scalability. May plan, coordinate, and implement security measures to safeguard computer databases. Design strategies for enterprise databases, data warehouse systems, and multidimensional networks. Set standards for database operations, programming, query processes, and security. Model, design, and construct large relational databases or data warehouses. Create and optimize data models for warehouse infrastructure and workflow. Integrate new systems with existing warehouse structure and refine system performance and functionality.')

	--Account for "Management Analysts"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (131110,	'Management Analysts','Conduct organizational studies and evaluations, design systems and procedures, conduct work simplification and measurement studies, and prepare operations and procedures manuals to assist management in operating more efficiently and effectively. Includes program analysts and management consultants. Excludes "Computer Systems Analysts" (15-1211) and "Operations Research Analysts" (15-2031).')
	

	--Account for "Miscellaneous Business Operations Specialists"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (131190, 'Miscellaneous Business Operations Specialists', 'Analyze and coordinate the schedule, timeline, procurement, staffing, and budget of a product or service on a per project basis. Lead and guide the work of technical staff. May serve as a point of contact for the client or customer.')


	--Account for "Nuclear Engineers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (172160,	'Nuclear Engineers','Conduct research on nuclear engineering projects or apply principles and theory of nuclear science to problems concerned with release, control, and use of nuclear energy and nuclear waste disposal.')

	--Account for "Operations Research Analysts"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (152030, 'Operations Research Analysts', 'Formulate and apply mathematical modeling and other optimizing methods to develop and interpret information that assists management with decisionmaking, policy formulation, or other managerial functions. May collect and analyze data and develop decision support software, services, or products. May develop and supply optimal time, cost, or logistics networks for program evaluation, review, or implementation.')


	--Account for "Sales Engineers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (419030,'Sales Engineers','Sell business goods or services, the selling of which requires a technical background equivalent to a baccalaureate degree in engineering. Excludes "Engineers" (17-2011 through 17-2199) whose primary function is not marketing or sales.')


	--Account for "Software Developers and Software Quality Assurance Analysts and Testers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (151256,'Software Developers and Software Quality Assurance Analysts and Testers','Research, design, and develop computer and network software or specialized utility programs. Analyze user needs and develop software solutions, applying principles and techniques of computer science, engineering, and mathematical analysis. Update software or enhance existing software capabilities. Integrate hardware and software systems, and develop specifications and performance requirements. Maintain databases within an application area, working individually or coordinating database development as part of a team.Develop and execute software tests to identify software problems. Test system modifications to prepare for implementation. Document software and application defects using a bug tracking system and report defects to software or web developers. Create and maintain databases of known defects. Participate in software design reviews to provide input on functional requirements, operational characteristics, product designs, and schedules.')
	
	
	--Account for "Web Developers and Digital Interface Designers"
	insert into soc_2018_definitions ([SOC Code], [SOC Title], [SOC Definition])
	values (151257,	'Web Developers and Digital Interface Designers','Develop and implement websites, web applications, application databases, and interactive web interfaces.Evaluate code to ensure it is properly structured, meets industry standards, and is compatible with browsers and devices.Optimize website performance, scalability, and server-side code and processes.Develop website infrastructure integrate websites with other computer applications.Design digital user interfaces or websites.Develop test layouts interfaces functionality navigation menus to ensure compatibility and usability across browsers or devices.Use web framework applications and client-side code processes.Evaluate web design following web accessibility standards analyze web use metrics optimize websites for marketability search engine ranking.Design test interfaces facilitate human-computer interaction maximize the usability of digital devices, websites, software with a focus on aesthetics and design. Create graphics used in websites and manage website content and links.')


	--Account for other generic descriptions like business operations specialists
	update soc_2018_definitions
	set [SOC Title] = 'Business Operations Specialists', [SOC Definition] = 'Analyze and coordinate the schedule, timeline, procurement, staffing, and budget of a product or service on a per project basis. Lead and guide the work of technical staff. May serve as a point of contact for the client or customer.'
	where [SOC Code] = 131199

	--Clean up the quotes from the titles
	update soc_2018_definitions
	set [SOC Title] = REPLACE([SOC Title],'"','')

	--Trim leading and trailing spaces from job titles
	update soc_2018_definitions
	set [SOC Title] = TRIM([SOC Title])

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
