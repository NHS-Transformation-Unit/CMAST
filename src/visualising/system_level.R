
# Activity Time Series ----------------------------------------------------

plot_act_ts_system <-ggplot(System_Attendances_Monthly, aes(x = Month, y = Total_attendances)) +
  geom_line(col = palette_tu[4]) + 
  scale_y_continuous(breaks = seq(0, 450, 50)) +
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b") +
  geom_vline(xintercept = as.Date("2020-03-15"), linetype = "dashed") +
  annotate(geom = "label",
           x = as.Date("2020-02-01"),
           y = 375,
           label = "Start of pandemic",
           hjust = 1) +
  labs(title = "Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total Attendances") +
  selected_theme(hex_col = palette_tu[1])


# Activity Profile --------------------------------------------------------

plot_act_profile_dh <-ggplot(System_Attendances_day_hour, aes(x = hour_of_day, y = Total_attendances)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Arrival Hour") +
  selected_theme(hex_col = palette_tu[1])  
