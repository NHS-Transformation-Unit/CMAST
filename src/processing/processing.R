
# Cleaning Extract --------------------------------------------------------

ECDS_MH_attendances_clean <- ECDS_MH_attendances %>%
  mutate(Der_EC_Arrival_Date_Time = as.POSIXct(Der_EC_Arrival_Date_Time, format = "%d/%m/%Y %H:%M"))


# Filter Parameters -------------------------------------------------------

SD_19_20 <- ymd("2019-04-01") # start date for FY 2019-20
ED_19_20 <- ymd("2020-04-01") # end date for FY 2019-20
SD_20_21 <- ymd("2020-04-01") # start date for FY 2020-21
ED_20_21 <- ymd("2021-04-01") # end date for FY 2020-21
SD_21_22 <- ymd("2021-04-01") # start date for FY 2021-22
ED_21_22 <- ymd("2022-04-01") # end date for FY 2021-22
SD_22_23 <- ymd("2022-04-01") # start date for FY 2022-23
ED_22_23 <- ymd("2023-04-01") # end date for FY 2022-23
SD_23_24 <- ymd("2023-04-01") # start date for FY 2023-24
ED_23_24 <- ymd("2024-04-01") # end date for FY 2023-24

# System level metrics ----------------------------------------------------

System_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         EC_Conclusion_Time_Since_Arrival,
         MH_Flag) %>%
  mutate(Der_EC_Arrival_Date_Time = ymd_hms(Der_EC_Arrival_Date_Time),
         "day_of_week" = wday(Der_EC_Arrival_Date_Time, label = TRUE),
         "hour_of_day" = hour(Der_EC_Arrival_Date_Time),
         "In_hours" = ifelse(hour_of_day < 8 | hour_of_day > 18, "Out of hours", "In hours"))

# System monthly attendances

System_Attendances_Monthly <- System_Attendances %>%
  group_by(Month = floor_date(Der_EC_Arrival_Date_Time, "month")) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System monthly attendances in vs out

System_Attendances_Monthly_Hours <- System_Attendances %>%
  group_by(Month = floor_date(Der_EC_Arrival_Date_Time, "month"),
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week

System_Attendances_Weekly <- System_Attendances %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr19 to Mar20)

System_Attendances_Weekly_19 <- System_Attendances %>%
  filter(Der_EC_Arrival_Date_Time >= SD_19_20 & Der_EC_Arrival_Date_Time < ED_19_20) %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr20 to Mar21)

System_Attendances_Weekly_20 <- System_Attendances %>%
  filter(Der_EC_Arrival_Date_Time >= SD_20_21 & Der_EC_Arrival_Date_Time < ED_20_21) %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr21 to Mar22)

System_Attendances_Weekly_21 <- System_Attendances %>%
  filter(Der_EC_Arrival_Date_Time >= SD_21_22 & Der_EC_Arrival_Date_Time < ED_21_22) %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr22 to Mar23)

System_Attendances_Weekly_22 <- System_Attendances %>%
  filter(Der_EC_Arrival_Date_Time >= SD_22_23 & Der_EC_Arrival_Date_Time < ED_22_23) %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr23 to Mar24)

System_Attendances_Weekly_23 <- System_Attendances %>%
  filter(Der_EC_Arrival_Date_Time >= SD_23_24 & Der_EC_Arrival_Date_Time < ED_23_24) %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Trust level metrics -----------------------------------------------------

Trust_Attendances <- ECDS_MH_attendances %>%
  select(Der_EC_Arrival_Date_Time,
         Provider_Name,
         Der_Provider_Code,
         EC_Conclusion_Time_Since_Arrival,
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
         EC_Conclusion_Time_Since_Arrival,
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