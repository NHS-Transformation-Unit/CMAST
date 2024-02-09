# Load in the ECDS data extracted using SQL

ECDS_MH_attendances <- read.csv(paste0(here(),"/data/ECDS_MH_Attendance.csv"))

# Load ECDS data quality check csv

ECDS_DQ <- read.csv(paste0(here(),"/data/ECDS_DQ.csv"))
