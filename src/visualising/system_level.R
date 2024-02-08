
# Activity Time Series ----------------------------------------------------

plot_act_ts_system <-ggplot(System_Attendances_Monthly, aes(x = Month)) +
  geom_line(aes(y = Total_attendances, color = "1.Total_attendances", linetype = "1.Total_attendances")) + 
  geom_line(aes(y = Attendances_Rolling_12, color = "2.Rolling 12 months", linetype = "2.Rolling 12 months")) +
  scale_y_continuous(breaks = seq(0, 450, 50)) +
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  geom_vline(xintercept = as.Date("2020-03-15"), linetype = "dashed") +
  annotate(geom = "label",
           x = as.Date("2020-03-01"),
           y = 375,
           label = "Start of pandemic",
           hjust = 1,
           vjust = 1,
           size = 3) +
  scale_colour_manual(name = "", values = c(palette_tu[4], palette_tu[7]), labels = c("Total Attendances", "Rolling 12 Month Average")) +
  scale_linetype_manual(name = "", values = c("solid", "dashed"), labels = c("Total Attendances", "Rolling 12 Month Average")) +
  labs(title = "Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total Attendances") +
  selected_theme(hex_col = palette_tu[1])

plot_act_ts_system

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
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 450, 50)) +
  geom_vline(xintercept = as.Date("2020-03-15"), linetype = "dashed") +
  annotate(geom = "label",
           x = as.Date("2020-02-01"),
           y = 375,
           label = "Start of pandemic",
           hjust = 1,
           vjust = 1) +
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

plot_act_system_out <-ggplot(System_Attendances_Monthly_percent, aes(x = Month, y = Percent_out)) +
  geom_area(col = palette_tu[5], fill = palette_tu[5], alpha = 0.5) + 
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(label = percent) +
  geom_vline(xintercept = as.Date("2020-03-15"), linetype = "dashed") +
  annotate(geom = "label",
           x = as.Date("2020-02-01"),
           y = 0.5,
           label = "Start of pandemic",
           hjust = 1,
           vjust = 1) +
  labs(title = "Paediatric Mental Health attendances to ED",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Proportion of attendances occuring out of hours") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
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



# Waiting times in ED -----------------------------------------------------

plot_act_wait_ts <-ggplot(System_Attendances_Monthly,aes(x = Month)) +
  geom_ribbon(aes(ymin = P10_wait_time, ymax = P90_wait_time, fill = "10th - 90th Percentile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.2)+
  geom_ribbon(aes(ymin = P25_wait_time, ymax = P75_wait_time, fill = "Interquartile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.2)+
  geom_line(aes(y = P50_wait_time, col = "Median Waiting Time"), linewidth = 1.2) + 
  scale_color_manual("", values = "black") +
  scale_fill_manual("", values = c(palette_tu[4], palette_tu[2])) +
  geom_hline(yintercept = 240, linetype = "dashed") +
  scale_y_continuous(breaks = seq(0, 700, 50)) +
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  labs(title = "Waiting Times of Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total minutes spent in department") +
  selected_theme(hex_col = palette_tu[1]) 

plot_act_wait_out_ts <-ggplot(System_Attendances_Monthly_out,aes(x = Month)) +
  geom_ribbon(aes(ymin = P10_wait_time, ymax = P90_wait_time, fill = "10th - 90th Percentile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.2)+
  geom_ribbon(aes(ymin = P25_wait_time, ymax = P75_wait_time, fill = "Interquartile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.2)+
  geom_line(aes(y = P50_wait_time, col = "Median Waiting Time"), linewidth = 1.2) + 
  scale_color_manual("", values = "black") +
  scale_fill_manual("", values = c(palette_tu[4], palette_tu[2])) +
  geom_hline(yintercept = 240, linetype = "dashed") +
  scale_y_continuous(breaks = seq(0, 700, 50)) +
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  labs(title = "Waiting Times of Paediatric Mental Health attendances to ED (out of hours)",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total minutes spent in department") +
  selected_theme(hex_col = palette_tu[1]) 

# Data Quality Time Series ------------------------------------------------------------

plot_diagnosis_dq_ts <-ggplot(System_Data_Quality_ts, aes(x = Month, y = Total_attendances, fill = Trigger)) +
  geom_area(alpha = 0.5) + 
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 450, 50)) +
  geom_vline(xintercept = as.Date("2020-03-15"), linetype = "dashed") +
  annotate(geom = "label",
           x = as.Date("2020-02-01"),
           y = 375,
           label = "Start of pandemic",
           hjust = 1,
           vjust = 1) +
  labs(title = "Method of flagging the attendance as Mental Health",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  scale_fill_manual(values = c(palette_tu[1],
                               palette_tu[5],
                               palette_tu[7]),
                    name = "Method of flagging") +
  selected_theme(hex_col = palette_tu[1])


# Data Quality ------------------------------------------------------------

plot_diagnosis_dq <-ggplot(System_Data_Quality, aes(x = "", y = Total_attendances, fill = Trigger)) +
  geom_bar(stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  theme(legend.position = "right") +
  labs(title = "Method of flagging the attendance as Mental Health",
       caption = "Source: SUS ECDS") +
  selected_theme(hex_col = palette_tu[1])


# ED Outcomes Time Series -------------------------------------------------

plot_act_system_outcomes_ts <-ggplot(System_ED_Outcome_ts, aes(x = Month, y = Total_attendances, fill = onward_destination)) +
  geom_area(alpha = 0.5) + 
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 450, 50)) +
  geom_vline(xintercept = as.Date("2020-03-15"), linetype = "dashed") +
  annotate(geom = "label",
           x = as.Date("2020-02-01"),
           y = 375,
           label = "Start of pandemic",
           hjust = 1,
           vjust = 1) +
  labs(title = "Outcome of a Paediatric Mental Health attendance at ED",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  scale_fill_manual(values = c(palette_tu[1],
                               palette_tu[3],
                               palette_tu[5],
                               palette_tu[7],
                               palette_tu[2]),
                    name = "Onward destination") +
  selected_theme(hex_col = palette_tu[1])

plot_act_system_outcomes_ts_admit <-ggplot(System_ED_Outcomes_ts_admit, aes(x = Month, y = Percent_admit)) +
  geom_area(col = palette_tu[5], fill = palette_tu[5],alpha = 0.5) + 
  scale_x_date(date_breaks = "3 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(label = percent) +
  geom_vline(xintercept = as.Date("2020-03-15"), linetype = "dashed") +
  annotate(geom = "label",
           x = as.Date("2020-02-01"),
           y = 0.5,
           label = "Start of pandemic",
           hjust = 1,
           vjust = 1) +
  labs(title = "Paediatric Mental Health attendance at ED that are admitted",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Proportion admitted to acute hospital") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  selected_theme(hex_col = palette_tu[1])


# ED Outcome day of week --------------------------------------------------

plot_outcome_profile_d <-ggplot(System_ED_Outcome_d, aes(x = day_of_week, y = Total_attendances, fill = day_of_week)) +
  geom_bar(stat = "identity") + 
  facet_wrap(~onward_destination, scales = "free_x") +
  labs(title = "Outcome of a Paediatric Mental Health attendance at ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Day of the week",
       y = "Number of attendances") +
  scale_fill_manual(values = c(palette_tu[1],
                               palette_tu[2],
                               palette_tu[3],
                               palette_tu[4],
                               palette_tu[5],
                               palette_tu[6],
                               palette_tu[7])) +
  selected_theme(hex_col = palette_tu[1]) +
  theme(legend.position = "none")

# ED Outcome hour of day --------------------------------------------------

plot_outcome_profile_h <-ggplot(System_ED_Outcome_h, aes(x = hour_of_day, y = Total_attendances)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~onward_destination, scales = "free_x") +
  labs(title = "Outcome of a Paediatric Mental Health attendance at ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Hour of the day",
       y = "Number of attendances") +
  selected_theme(hex_col = palette_tu[1]) +
  theme(legend.position = "none")
