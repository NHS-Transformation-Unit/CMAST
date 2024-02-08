
# Activity Time Series ----------------------------------------------------

plot_act_ts_trust <-ggplot(Trust_Attendances_Monthly, aes(x = Month)) +
  geom_line(aes(y = Total_attendances, color = "1.Total_attendances", linetype = "1.Total_attendances")) + 
  geom_line(aes(y = Attendances_Rolling_12, color = "2.Rolling 12 months", linetype = "2.Rolling 12 months")) +
  scale_x_date(date_breaks = "12 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_colour_manual(name = "", values = c(palette_tu[4], palette_tu[7]), labels = c("Total Attendances", "Rolling 12 Month Average")) +
  scale_linetype_manual(name = "", values = c("solid", "dashed"), labels = c("Total Attendances", "Rolling 12 Month Average")) +
  facet_wrap(~Provider_Name_Chart, scales = "free", ncol = 4) +
  labs(title = "Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total Attendances") +
  theme_tu_white_facet(hex_col = palette_tu[1])

plot_act_ts_trust

# Activity Profile --------------------------------------------------------

plot_act_trust_h <-ggplot(Trust_Attendances_hour, aes(x = hour_of_day, y = Total_attendances, group = Provider_Name)) +
  geom_area(col = palette_tu[4], fill = palette_tu[4], alpha = 0.5) + 
  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
  facet_wrap(~Provider_Name, scales = "free_x") +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Arrival Hour",
       y = "Number of attendances") +
  selected_theme(hex_col = palette_tu[1])

plot_act_trust_d <-ggplot(Trust_Attendances_day, aes(x = day_of_week, y = Total_attendances, group = Provider_Name)) +
  geom_bar(stat = "identity", fill = palette_tu[4]) + 
  facet_wrap(~Provider_Name) +
  labs(title = "Arrival Profile of Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Day of week",
       y = "Number of attendances") +
  selected_theme(hex_col = palette_tu[1])


# Activity by in hours and out of hours -----------------------------------

plot_act_trust_pout <- ggplot(Trust_Attendances_Monthly_percent, aes(x = Month, y = Percent_out, group = Provider_Name)) +
  geom_area(col = palette_tu[5], fill = palette_tu[5], alpha = 0.5) + 
  scale_x_date(date_breaks = "6 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(label = percent) +
  facet_wrap(~Provider_Name) +
  labs(title = "Paediatric Mental Health attendances to ED (in hours)",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Proportion of attendances occuring out of hours") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  selected_theme(hex_col = palette_tu[1])

# Waiting times in ED -----------------------------------------------------

plot_act_wait_trust_ts <-ggplot(Trust_Attendances_Monthly,aes(x = Month, group = Provider_Name)) +
  geom_ribbon(aes(ymin = P10_wait_time, ymax = P90_wait_time, fill = "10th - 90th Percentile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.1)+
  geom_ribbon(aes(ymin = P25_wait_time, ymax = P75_wait_time, fill = "Interquartile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.1)+
  geom_line(aes(y = P50_wait_time, col = "Median Waiting Time"), linewidth = 0.5) + 
  scale_color_manual("", values = "black") +
  scale_fill_manual("", values = c(palette_tu[4], palette_tu[2])) +
  scale_y_continuous(breaks = seq(0, 800, 200)) +
  scale_x_date(date_breaks = "6 months", date_labels = "%Y-%b", expand = c(0,0)) +
  facet_wrap(~Provider_Name) +
  labs(title = "Waiting Times of Paediatric Mental Health attendances to ED",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total minutes spent in department") +
  selected_theme(hex_col = palette_tu[1]) 

plot_act_wait_out_trust_ts <-ggplot(Trust_Attendances_Monthly_out,aes(x = Month, group = Provider_Name)) +
  geom_ribbon(aes(ymin = P10_wait_time, ymax = P90_wait_time, fill = "10th - 90th Percentile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.1)+
  geom_ribbon(aes(ymin = P25_wait_time, ymax = P75_wait_time, fill = "Interquartile Range"), col = "#ffffff", alpha = 0.5, linewidth = 0.1)+
  geom_line(aes(y = P50_wait_time, col = "Median Waiting Time"), linewidth = 0.5) + 
  scale_color_manual("", values = "black") +
  scale_fill_manual("", values = c(palette_tu[4], palette_tu[2])) +
  scale_y_continuous(breaks = seq(0, 800, 200)) +
  scale_x_date(date_breaks = "6 months", date_labels = "%Y-%b", expand = c(0,0)) +
  facet_wrap(~Provider_Name) +
  labs(title = "Waiting Times of Paediatric Mental Health attendances to ED (out of hours)",
       subtitle = "CMAST Providers",
       caption = "Source: SUS ECDS",
       x = "Month",
       y = "Total minutes spent in department") +
  selected_theme(hex_col = palette_tu[1]) 


# Data Quality Time Series ------------------------------------------------------------

plot_diagnosis_dq_trust_ts <-ggplot(Trust_Data_Quality_ts, aes(x = Month, y = Total_attendances, fill = Trigger, group = Provider_Name)) +
  geom_area(alpha = 0.5) + 
  scale_x_date(date_breaks = "6 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 200, 50)) +
  facet_wrap(~Provider_Name)
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

plot_diagnosis_dq_trust <-ggplot(Trust_Data_Quality, aes(x = "", y = Total_attendances, fill = Trigger, group = Provider_Name)) +
  geom_bar(stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  facet_wrap(~Provider_Name)
  theme(legend.position = "right") +
  labs(title = "Method of flagging the attendance as Mental Health",
       caption = "Source: SUS ECDS") +
  selected_theme(hex_col = palette_tu[1])


# ED Outcomes Time Series -------------------------------------------------

plot_act_trust_outcomes_ts <-ggplot(Trust_ED_Outcome_ts, aes(x = Month, y = Total_attendances, fill = onward_destination, group = Provider_Name)) +
  geom_area(alpha = 0.5) + 
  scale_x_date(date_breaks = "6 months", date_labels = "%Y-%b", expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 200, 50)) +
  facet_wrap(~Provider_Name, scale = "free_x")
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


# ED Outcome day of week --------------------------------------------------

#plot_outcome_profile_d <-ggplot(Trust_ED_Outcome_d, aes(x = day_of_week, y = Total_attendances, fill = day_of_week, group = Provider_Name)) +
#  geom_bar(stat = "identity") + 
#  facet_wrap(~onward_destination) +
#  labs(title = "Outcome of a Paediatric Mental Health attendance at ED",
#       subtitle = "CMAST Providers",
#       caption = "Source: SUS ECDS",
#       x = "Day of the week",
#       y = "Number of attendances") +
#  scale_fill_manual(values = c(palette_tu[1],
#                               palette_tu[2],
#                               palette_tu[3],
#                               palette_tu[4],
#                               palette_tu[5],
#                               palette_tu[6],
#                               palette_tu[7])) +
#  selected_theme(hex_col = palette_tu[1]) +
#  theme(legend.position = "none")

# ED Outcome hour of day --------------------------------------------------

#plot_outcome_profile_h <-ggplot(trust_ED_Outcome_h, aes(x = hour_of_day, y = Total_attendances)) +
#  geom_bar(stat = "identity") + 
#  scale_x_continuous(breaks = seq(0, 24, 2), expand = c(0,0)) +
#  facet_wrap(~onward_destination) +
#  labs(title = "Outcome of a Paediatric Mental Health attendance at ED",
#       subtitle = "CMAST Providers",
#       caption = "Source: SUS ECDS",
#       x = "Hour of the day",
#       y = "Number of attendances") +
#  selected_theme(hex_col = palette_tu[1]) +
#  theme(legend.position = "none")
