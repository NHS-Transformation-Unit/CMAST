
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
                             Month >= as.Date("2023-04-01") & Month <= as.Date("2024-03-31") ~ "2023/24")) %>%
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

# Trust level metrics -----------------------------------------------------

# Trust monthly attendances

Trust_Attendances_Monthly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(Month,
           Provider_Name,
           Der_Provider_Code) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Trust day of week

Trust_Attendances_Weekly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
  group_by(day_of_week,
           Provider_Name,
           Der_Provider_Code,
           In_hours) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

# Trust hour of day

Trust_Attendances_Hourly <- ECDS_MH_attendances_clean %>%
  drop_na(EC_Departure_Time_Since_Arrival) %>%
    group_by(hour_of_day,
           Provider_Name,
           Der_Provider_Code) %>%
  summarise(Total_attendances = sum(MH_Flag),
            P10_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.10),
            P25_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.25),
            P50_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.50),
            P75_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.75),
            P90_wait_time = quantile(EC_Departure_Time_Since_Arrival, 0.90))

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
