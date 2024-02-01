# Create Trust tables

Trust_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         Provider_Name,
         ,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = as.Date(Der_EC_Arrival_Date_Time)) %>%
  group_by(Month = format(Der_EC_Arrival_Date_Time, "%Y-%m"),Provider_Name) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Create Site tables

Site_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         Provider_Site,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = as.Date(Der_EC_Arrival_Date_Time)) %>%
  group_by(Month = format(Der_EC_Arrival_Date_Time, "%Y-%m"),Provider_Site) %>%
  summarise(Total_attendances = sum(MH_Flag))