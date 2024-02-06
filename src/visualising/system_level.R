
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
       x = "Arrival Hour",
       y = "Number of attendances") +
  selected_theme(hex_col = palette_tu[1])  


# Activity by in hours and out of hours -----------------------------------

plot_act_system_in_out <-ggplot(System_Attendances_Monthly_Hours, aes(x = Month, y = Total_attendances, fill = In_hours)) +
  geom_area(alpha = 0.5) + 
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b") +
  scale_y_continuous(breaks = seq(0, 450, 50)) +
  labs(title = "Paediatric Mental Health attendances to ED",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  scale_fill_manual(values = c(palette_tu[1],
                               palette_tu[5]),
                    name = "In vs Out of hours") +
  selected_theme(hex_col = palette_tu[1])


# Weekly distribution of attendance by hour by FY -------------------------------

# Weekly distribution of attendance by hour (19-20)

plot_act_profile_dh_1920 <-ggplot(System_Attendances_Weekly_19, aes(x = hour_of_day, y = Total_attendances)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED in 2019/20",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Arrival Hour") +
  selected_theme(hex_col = palette_tu[1])

# Weekly distribution of attendance by hour (20-21)

plot_act_profile_dh_2021 <-ggplot(System_Attendances_Weekly_20, aes(x = hour_of_day, y = Total_attendances)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED in 2020/21",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Arrival Hour") +
  selected_theme(hex_col = palette_tu[1])

# Weekly distribution of attendance by hour (21-22)

plot_act_profile_dh_2122 <-ggplot(System_Attendances_Weekly_21, aes(x = hour_of_day, y = Total_attendances)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED in 2021/22",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Arrival Hour") +
  selected_theme(hex_col = palette_tu[1])

# Weekly distribution of attendance by hour (22-23)

plot_act_profile_dh_2223 <-ggplot(System_Attendances_Weekly_22, aes(x = hour_of_day, y = Total_attendances)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED in 2022/23",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Arrival Hour") +
  selected_theme(hex_col = palette_tu[1])

# Weekly distribution of attendance by hour (23-24)

plot_act_profile_dh_2324 <-ggplot(System_Attendances_Weekly_23, aes(x = hour_of_day, y = Total_attendances)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED in 2023/24",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Arrival Hour") +
  selected_theme(hex_col = palette_tu[1])
