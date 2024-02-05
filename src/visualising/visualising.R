
# System level visuals ----------------------------------------------------

# Visualising attendance time series

ggplot(System_Attendances_Monthly, aes(x = Month, y = Total_attendances, colour = "red")) +
  geom_line(stat = "identity") + 
  labs(title = "Mental Health attendances",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom")

# Visualising attendance by in hours

ggplot(System_Attendances_Monthly_Hours, aes(x = Month, y = Total_attendances, fill = In_hours)) +
  geom_bar(stat = "identity") + 
  labs(title = "Mental Health attendances",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom")

# Weekly distribution of attendance by hour

ggplot(System_Attendances_Weekly, aes(x = hour_of_day, y = Total_attendances, fill = day_of_week, group = day_of_week)) +
  geom_bar(stat = "identity") +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Mental Health attendances by day",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance by hour (19-20)

ggplot(System_Attendances_Weekly_19, aes(x = hour_of_day, y = Total_attendances, fill = day_of_week, group = day_of_week)) +
  geom_bar(stat = "identity") +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Mental Health attendances by day for the Financial Year 2019-20",
       caption = "Source: SUS Emergency Care data Apr-19 to Mar-20",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance by hour (20-21)

ggplot(System_Attendances_Weekly_20, aes(x = hour_of_day, y = Total_attendances, fill = day_of_week, group = day_of_week)) +
  geom_bar(stat = "identity") +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Mental Health attendances by day for the Financial Year 2020-21",
       caption = "Source: SUS Emergency Care data Apr-20 to Mar-21",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance by hour (21-22)

ggplot(System_Attendances_Weekly_21, aes(x = hour_of_day, y = Total_attendances, fill = day_of_week, group = day_of_week)) +
  geom_bar(stat = "identity") +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Mental Health attendances by day for the Financial Year 2021-22",
       caption = "Source: SUS Emergency Care data Apr-21 to Mar-22",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance by hour (22-23)

ggplot(System_Attendances_Weekly_22, aes(x = hour_of_day, y = Total_attendances, fill = day_of_week, group = day_of_week)) +
  geom_bar(stat = "identity") +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Mental Health attendances by day for the Financial Year 2022-23",
       caption = "Source: SUS Emergency Care data Apr-22 to Mar-23",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance by hour (23-24)

ggplot(System_Attendances_Weekly_23, aes(x = hour_of_day, y = Total_attendances, fill = day_of_week, group = day_of_week)) +
  geom_bar(stat = "identity") +
  facet_wrap(~day_of_week, scales = "free_x") +
  labs(title = "Mental Health attendances by day for the Financial Year 2023-24",
       caption = "Source: SUS Emergency Care data Apr-23 to Dec-23",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Trust level visuals -----------------------------------------------------

# Visualising Trusts in one line chart

ggplot(Trust_Attendances_Monthly, aes(x = Month, y = Total_attendances, colour = Der_Provider_Code, group = Provider_Name)) +
  geom_line(stat = "identity") + 
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom")

# Create small multiples of line charts

ggplot(Trust_Attendances_Monthly, aes(x = Month, y = Total_attendances, colour = Der_Provider_Code, group = Provider_Name)) +
  geom_line(stat = "identity") +
  facet_wrap(~Provider_Name, scales = "free_x") +
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Trust_Attendances_Weekly, aes(x = day_of_week, y = Total_attendances, fill = Der_Provider_Code, group = Provider_Name)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Name, scales = "free_x") +
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Day of the Week",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Trust_Attendances_Hourly, aes(x = hour_of_day, y = Total_attendances, fill = Der_Provider_Code, group = Provider_Name)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Name, scales = "free_x") +
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))


# Site level visuals ------------------------------------------------------

# Create small multiples of line charts

ggplot(Site_Attendances_Monthly, aes(x = Month, y = Total_attendances, colour = Provider_Site, group = Provider_Site)) +
  geom_line(stat = "identity") +
  facet_wrap(~Provider_Site, scales = "free_x") +
  labs(title = "Mental Health attendances by site",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Site_Attendances_Weekly, aes(x = day_of_week, y = Total_attendances, fill = In_hours, group = Provider_Site)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Site, scales = "free_x") +
  labs(title = "Mental Health attendances by site",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Day of the Week",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Site_Attendances_Hourly, aes(x = hour_of_day, y = Total_attendances, fill = Provider_Site, group = Provider_Site)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Site, scales = "free_x") +
  labs(title = "Mental Health attendances by site",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))
