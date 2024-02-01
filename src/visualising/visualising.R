# Visualising Sites

ggplot(Site_Attendances, aes(x = Month, y = Total_attendances, fill = Provider_Site, group = Provider_Site)) +
  geom_line(stat = "identity") + 
  labs(title = "Age profile per site",
       caption = "Source: ERIC Publication",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  scale_fill_viridis_d()

# Visualising Trusts

ggplot(Trust_Attendances, aes(x = Month, y = Total_attendances, fill = Provider_Name, group = Provider_Name)) +
  geom_line(stat = "identity") + 
  labs(title = "Age profile per site",
       caption = "Source: ERIC Publication",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  scale_fill_viridis_d()
