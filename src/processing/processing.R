
# Trust level metrics -----------------------------------------------------

Trust_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         Provider_Name,
         Der_Provider_Code,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = ymd_hms(Der_EC_Arrival_Date_Time),
         "day_of_week" = wday(Der_EC_Arrival_Date_Time, label = TRUE),
         "hour_of_day" = hour(Der_EC_Arrival_Date_Time),
         "In_hours" = ifelse(hour_of_day < 8 | hour_of_day > 18, "Out of hours", "In hours"))

# Trust monthly attendances

Trust_Attendances_Monthly <- Trust_Attendances %>%
  group_by(Month = format(Der_EC_Arrival_Date_Time, "%Y-%m"),
           Provider_Name,
           Der_Provider_Code) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Trust day of week

Trust_Attendances_Weekly <- Trust_Attendances %>%
  group_by(day_of_week,
           Provider_Name,
           Der_Provider_Code,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Trust hour of day

Trust_Attendances_Hourly <- Trust_Attendances %>%
    group_by(hour_of_day,
           Provider_Name,
           Der_Provider_Code) %>%
  summarise(Total_attendances = sum(MH_Flag))


# Site level metrics ------------------------------------------------------

Site_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         Provider_Site,
         Der_Provider_Site_Code,
         EC_Department_Type,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = ymd_hms(Der_EC_Arrival_Date_Time),
         "day_of_week" = wday(Der_EC_Arrival_Date_Time, label = TRUE),
         "hour_of_day" = hour(Der_EC_Arrival_Date_Time),
         "In_hours" = ifelse(hour_of_day < 8 | hour_of_day > 18, "Out of hours", "In hours"))

# Site monthly attendances

Site_Attendances_Monthly <- Site_Attendances %>%
  group_by(Month_1 = format(Der_EC_Arrival_Date_Time, "%Y-%m"),
           Provider_Site,
           Der_Provider_Site_Code,
           EC_Department_Type) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Site day of week

Site_Attendances_Weekly <- Site_Attendances %>%
  group_by(day_of_week,
           Provider_Site,
           Der_Provider_Site_Code,
           EC_Department_Type,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Site hour of day

Site_Attendances_Hourly <- Site_Attendances %>%
  group_by(hour_of_day,
           Provider_Site,
           Der_Provider_Site_Code,
           EC_Department_Type) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System level metrics ----------------------------------------------------

System_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = ymd_hms(Der_EC_Arrival_Date_Time),
         "day_of_week" = wday(Der_EC_Arrival_Date_Time, label = TRUE),
         "hour_of_day" = hour(Der_EC_Arrival_Date_Time),
         "In_hours" = ifelse(hour_of_day < 8 | hour_of_day > 18, "Out of hours", "In hours"))

# System monthly attendances

System_Attendances_Monthly <- System_Attendances %>%
  group_by(Month = floor_date(Der_EC_Arrival_Date_Time, "month")) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Trust day of week

System_Attendances_Weekly <- System_Attendances %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))
