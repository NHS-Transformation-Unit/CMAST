# Trust time series

Trust_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         Provider_Name,
         Der_Provider_Code,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = ymd_hms(Der_EC_Arrival_Date_Time),
         "day_of_week" = wday(Der_EC_Arrival_Date_Time, label = TRUE),
         "hour_of_day" = hour(Der_EC_Arrival_Date_Time)) %>%
  group_by(Month = format(Der_EC_Arrival_Date_Time, "%Y-%m"),
           day_of_week,
           hour_of_day,
           Provider_Name,
           Der_Provider_Code) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Site time series

Site_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         Provider_Site,
         Der_Provider_Site_Code,
         EC_Department_Type,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = ymd_hms(Der_EC_Arrival_Date_Time),
         "day_of_week" = wday(Der_EC_Arrival_Date_Time, label = TRUE),
         "hour_of_day" = hour(Der_EC_Arrival_Date_Time)) %>%
  group_by(Month = format(Der_EC_Arrival_Date_Time, "%Y-%m"),
           day_of_week,
           hour_of_day,
           Provider_Site,
           Der_Provider_Site_Code,
           EC_Department_Type) %>%
  summarise(Total_attendances = sum(MH_Flag))
