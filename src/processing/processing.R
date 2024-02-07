
# Cleaning Extract --------------------------------------------------------

ECDS_MH_attendances_clean <- ECDS_MH_attendances %>%
  mutate(Der_EC_Arrival_Date_Time = as.POSIXct(Der_EC_Arrival_Date_Time, format = "%Y-%m-%d %H:%M"),
         EC_Departure_Time_Since_Arrival = as.numeric(EC_Departure_Time_Since_Arrival),
         Month = as.Date(trunc(Der_EC_Arrival_Date_Time, "month")),
         "day_of_week" = wday(Der_EC_Arrival_Date_Time, label = TRUE),
         "hour_of_day" = hour(Der_EC_Arrival_Date_Time),
         "In_hours" = ifelse(hour_of_day < 8 | hour_of_day >= 18, "Out of hours", "In hours"),
         "FYear" = case_when(Month >= as.Date("2019-04-01") & Month <= as.Date("2020-03-31") ~ "2019/20",
                             Month >= as.Date("2020-04-01") & Month <= as.Date("2021-03-31") ~ "2020/21",
                             Month >= as.Date("2021-04-01") & Month <= as.Date("2022-03-31") ~ "2021/22",
                             Month >= as.Date("2022-04-01") & Month <= as.Date("2023-03-31") ~ "2022/23",
                             Month >= as.Date("2023-04-01") & Month <= as.Date("2024-03-31") ~ "2023/24"),
         "Trigger" = case_when(EC_Chief_Complaint_SNOMED_CT %in% c("248062006", 
                                                                   "272022009", 
                                                                   "48694002",
                                                                   "248020004",
                                                                   "6471006",
                                                                   "7011001") & 
                                 EC_Injury_Intent_SNOMED_CT == "276853009" ~ "Chief Complaint with Injury Intent",
                               EC_Injury_Intent_SNOMED_CT == "1234321" ~ "Injury Intent",
                               EC_Chief_Complaint_SNOMED_CT %in% c("248062006", 
                                               "272022009", 
                                               "48694002",
                                               "248020004",
                                               "6471006",
                                               "7011001") ~ "Chief Complaint",
                               TRUE ~ "EC Diagnosis"),
         "onward_destination" = case_when(DischargeDestinationDescription %in% c("Discharge to home (procedure)",
                                                                                 "Discharge to nursing home (procedure)",
                                                                                 "Discharge to police custody (procedure)",
                                                                                 "Discharge to residential home (procedure)",
                                                                                 "Patient discharged, to legal custody (procedure)") ~ "Discharged",
                                          DischargeDestinationDescription %in% c("Emergency department discharge to ambulatory emergency care service (procedure)",
                                                                                 "Emergency department discharge to emergency department short stay ward (procedure)") ~ "ED admission",
                                          DischargeDestinationDescription %in% c("Emergency department discharge to high dependency unit (procedure)",
                                                                                 "Emergency department discharge to intensive care unit (procedure)",
                                                                                 "Discharge to ward (procedure)") ~ "Hospital admission",
                                          DischargeDestinationDescription == "Patient transfer, to another health care facility (procedure)" ~ "Provider transfer",
                                          DischargeDestinationDescription == "NULL" ~ "Unknown",
                                          is.na(DischargeDestinationDescription) ~ "Unknown")) %>%
  mutate(day_of_week = factor(day_of_week, levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")))


# System level metrics ----------------------------------------------------

# System monthly attendances

System_Attendances_Monthly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Month) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Combined attendances week and hour

System_Attendances_day_hour <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(day_of_week, hour_of_day) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# System monthly attendances in vs out

System_Attendances_Monthly_Hours <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Month, In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# System day of week

System_Attendances_Weekly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# System day of week (Apr19 to Mar20)

System_Attendances_Weekly_19 <- ECDS_MH_attendances_clean %>%
  filter(FYear == "2019/20") %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr20 to Mar21)

System_Attendances_Weekly_20 <- ECDS_MH_attendances_clean %>%
  filter(FYear == "2020/21") %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr21 to Mar22)

System_Attendances_Weekly_21 <- ECDS_MH_attendances_clean %>%
  filter(FYear == "2021/22") %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr22 to Mar23)

System_Attendances_Weekly_22 <- ECDS_MH_attendances_clean %>%
  filter(FYear == "2022/23") %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System day of week (Apr23 to Mar24)

System_Attendances_Weekly_23 <- ECDS_MH_attendances_clean %>%
  filter(FYear == "2023/24") %>%
  group_by(day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System data quality time series

System_Data_Quality_ts <- ECDS_MH_attendances_clean %>%
  group_by(Month,
           Trigger) %>%
  summarise(Total_attendances = sum(MH_Flag))

# System data quality total

System_Data_Quality <- ECDS_MH_attendances_clean %>%
  group_by(Trigger) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Onward Destination Time Series

System_ED_Outcome_ts <- ECDS_MH_attendances_clean %>%
  group_by(Month,
           onward_destination) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Onward Destination day of week

System_ED_Outcome_d <- ECDS_MH_attendances_clean %>%
  group_by(day_of_week,
           onward_destination) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Onward Destination hour of day

System_ED_Outcome_h <- ECDS_MH_attendances_clean %>%
  group_by(hour_of_day,
           onward_destination) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Trust level metrics -----------------------------------------------------

# Trust monthly attendances

Trust_Attendances_Monthly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Provider_Name,
           Month) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))


# Combined attendances week and hour

Trust_Attendances_hour <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Provider_Name,
           hour_of_day) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

Trust_Attendances_day <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Provider_Name,
           day_of_week) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Trust monthly attendances in vs out

Trust_Attendances_Monthly_Hours <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Provider_Name,
           Month,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Trust day of week

Trust_Attendances_Weekly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Provider_Name,
           day_of_week,
           hour_of_day,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Trust data quality time series

Trust_Data_Quality_ts <- ECDS_MH_attendances_clean %>%
  group_by(Provider_Name,
           Month,
           Trigger) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Trust data quality total

Trust_Data_Quality <- ECDS_MH_attendances_clean %>%
  group_by(Provider_Name,
           Trigger) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Onward Destination Time Series

Trust_ED_Outcome_ts <- ECDS_MH_attendances_clean %>%
  group_by(Provider_Name,
           Month,
           onward_destination) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Onward Destination day of week

Trust_ED_Outcome_d <- ECDS_MH_attendances_clean %>%
  group_by(Provider_Name,
           day_of_week,
           onward_destination) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Onward Destination hour of day

Trust_ED_Outcome_h <- ECDS_MH_attendances_clean %>%
  group_by(Provider_Name,
           hour_of_day,
           onward_destination) %>%
  summarise(Total_attendances = sum(MH_Flag))

# Site level metrics ------------------------------------------------------

# Site monthly attendances

Site_Attendances_Monthly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Month,
           Provider_Site,
           Der_Provider_Site_Code,
           EC_Department_Type) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Site day of week

Site_Attendances_Weekly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(day_of_week,
           Provider_Site,
           Der_Provider_Site_Code,
           EC_Department_Type,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Site hour of day

Site_Attendances_Hourly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(hour_of_day,
           Provider_Site,
           Der_Provider_Site_Code,
           EC_Department_Type) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))
