library(tidyverse)
library(here)

cnames <- c('PresentSimulationRunTime', 'PresentSimulationStartTime', 'ScenarioGameTime', 'ScenarionTriggerTime',
            'DistanceSinceFirstContact', 'NumberOfContacts', 'PoseX', 'PoseY', 'PoseZ',
            'UpX', 'UpY', 'UpZ', 'GearForceX', 'GearForceY', 'GearForceZ', 'RopeTension')

scenario_01 <- read_csv(here::here('data', 'scenario_01.csv'), col_names = cnames) %>% 
  mutate(scenario = '01')

scenario_02 <- read_csv(here::here('data', 'scenario_02.csv'), col_names = cnames) %>% 
  mutate(scenario = '02')

scenario_03 <- read_csv(here::here('data', 'scenario_03.csv'), col_names = cnames) %>% 
  mutate(scenario = '03')

scenario_04 <- read_csv(here::here('data', 'scenario_04.csv'), col_names = cnames) %>% 
  mutate(scenario = '04')

# Test impact of water column depth
water_col <- bind_rows(scenario_01, scenario_02, scenario_03)

# Test impact of when the whale detects the gear
roll <- bind_rows(scenario_01, scenario_04)

ggplot(data = water_col, aes(x = PresentSimulationRunTime, y = RopeTension))+
  geom_line(alpha = 0.25)+
  geom_smooth(aes(color = scenario))

ggplot(data = roll, aes(x = PresentSimulationRunTime, y = RopeTension))+
  geom_line(alpha = 0.25)+
  geom_smooth(aes(color = scenario))
