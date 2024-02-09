
# Provider DQ -------------------------------------------------------------

ecds_dq_pro <- ECDS_DQ %>%
  spread(MH_Flag, Attendances) %>%
  mutate(Missing_Rate = Missing/(MH + Missing + Physical))
