
# Provider DQ -------------------------------------------------------------

ecds_dq_pro <- ECDS_DQ %>%
  filter(Der_Provider_Code != "REM") %>%
  spread(MH_Flag, Attendances) %>%
  mutate(Missing_Rate = Missing/(MH + Missing + Physical))
