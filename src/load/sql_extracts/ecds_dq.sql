SELECT ECDS.[Der_Provider_Code]
	  ,ORGPRO.[Organisation_Name] as [Provider_Name]
	  ,ORGPRO.[STP_Code] as [Provider_ICB_Code]
	  ,ORGPRO.[STP_Name] as [Provider_ICB_Name]
	  ,ORGPRO.[Region_Code] as [Provider_Region_Code]
	  ,ORGPRO.[Region_Name] as [Provider_Region_Name]
	  ,CASE WHEN ECDS.[EC_Chief_Complaint_SNOMED_CT] IN 
				('248062006' --- self harm
				,'272022009' --- depressive feelings 
				,'48694002' --- feeling anxious 
				,'248020004' --- behaviour: unsual 
				,'6471006' -- feeling suicidal
				,'7011001') THEN 'MH'  --- hallucinations/delusions 
			WHEN ECDS.[EC_Injury_Intent_SNOMED_CT] = '276853009' THEN 'MH' --- self inflicted injury 
			WHEN COALESCE(LEFT(ECDS.[Der_EC_Diagnosis_All], NULLIF(CHARINDEX(',',ECDS.[Der_EC_Diagnosis_All]),0)-1),ECDS.[Der_EC_Diagnosis_All]) 
				IN ('52448006' --- dementia
				,'2776000' --- delirium 
				,'33449004' --- personality disorder
				,'72366004' --- eating disorder
				,'197480006' --- anxiety disorder
				,'35489007' --- depressive disorder
				,'13746004' --- bipolar affective disorder
				,'58214004' --- schizophrenia
				,'69322001' --- psychotic disorder
				,'397923000' --- somatisation disorder
				,'30077003' --- somatoform pain disorder
				,'44376007' --- dissociative disorder
				,'17226007' ---- adjustment disorder
				,'50705009') THEN 'MH' ---- factitious disorder
			WHEN ECDS.[EC_Chief_Complaint_SNOMED_CT] IS NULL AND ECDS.[EC_Injury_Intent_SNOMED_CT] IS NULL AND ECDS.[Der_EC_Diagnosis_All] IS NULL THEN 'Missing'
		
		
		ELSE 'Physical' 
		END as [MH_Flag] 
	,COUNT(*) AS 'Attendances'

  FROM [NHSE_SUSPlus_Live].[dbo].[tbl_Data_SUS_EC] AS [ECDS]

  

  LEFT JOIN [NHSE_Reference].[dbo].[tbl_Ref_ODS_Provider_Hierarchies] as [ORGPRO]
  ON ECDS.[Der_Provider_Code] = ORGPRO.[Organisation_Code]

  LEFT JOIN [NHSE_Reference].[dbo].[tbl_Ref_ODS_Commissioner_Hierarchies] as [ORGCOMM]
  ON ECDS.[Der_Commissioner_Code] = ORGCOMM.[Organisation_Code]

 
  WHERE ECDS.Der_Provider_Code IN ('RBS', 'RJN', 'RWW', 'RBT', 'RJR', 'RBL', 'REM', 'RBN')
  AND ECDS.[Arrival_Date] BETWEEN '2019-04-01' AND '2023-12-31'
  AND ECDS.[Der_Dupe_Flag] = 0
  AND ECDS.[Arrival_Planned] = 'FALSE'
  AND ECDS.[Der_Age_At_CDS_Activity_Date] < 18


  GROUP BY ECDS.[Der_Provider_Code]
	  ,ORGPRO.[Organisation_Name]
	  ,ORGPRO.[STP_Code]
	  ,ORGPRO.[STP_Name]
	  ,ORGPRO.[Region_Code]
	  ,ORGPRO.[Region_Name]
	  ,CASE WHEN ECDS.[EC_Chief_Complaint_SNOMED_CT] IN 
				('248062006' --- self harm
				,'272022009' --- depressive feelings 
				,'48694002' --- feeling anxious 
				,'248020004' --- behaviour: unsual 
				,'6471006' -- feeling suicidal
				,'7011001') THEN 'MH'  --- hallucinations/delusions 
			WHEN ECDS.[EC_Injury_Intent_SNOMED_CT] = '276853009' THEN 'MH' --- self inflicted injury 
			WHEN COALESCE(LEFT(ECDS.[Der_EC_Diagnosis_All], NULLIF(CHARINDEX(',',ECDS.[Der_EC_Diagnosis_All]),0)-1),ECDS.[Der_EC_Diagnosis_All]) 
				IN ('52448006' --- dementia
				,'2776000' --- delirium 
				,'33449004' --- personality disorder
				,'72366004' --- eating disorder
				,'197480006' --- anxiety disorder
				,'35489007' --- depressive disorder
				,'13746004' --- bipolar affective disorder
				,'58214004' --- schizophrenia
				,'69322001' --- psychotic disorder
				,'397923000' --- somatisation disorder
				,'30077003' --- somatoform pain disorder
				,'44376007' --- dissociative disorder
				,'17226007' ---- adjustment disorder
				,'50705009') THEN 'MH' ---- factitious disorder
			WHEN ECDS.[EC_Chief_Complaint_SNOMED_CT] IS NULL AND ECDS.[EC_Injury_Intent_SNOMED_CT] IS NULL AND ECDS.[Der_EC_Diagnosis_All] IS NULL THEN 'Missing'
		
		
		ELSE 'Physical' 
		END