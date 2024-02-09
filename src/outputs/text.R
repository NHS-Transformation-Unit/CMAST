
# Attendances Text --------------------------------------------------------

attends_system_rolling_latest <- System_Attendances_Monthly %>%
  filter(Month == max(Month))
