#read in raw data

slider_clean <- read_csv("data/slider-data-raw.csv")

#remove extra whitespaces for easier reference in cleaning and wrangling

slider_clean <- slider_clean %>%
  rename_with(str_squish) %>%
  mutate(across(where(is.character), str_squish))

# combine variables for time spent on instructions across treatment groups

slider_clean <- slider_clean %>%
  mutate(instruct_duration = coalesce(`Q2.1_Page Submit`, `Q3.1_Page Submit`, `Q4.1_Page Submit`, `Q5.1_Page Submit`)) %>%
  select(-`Q2.1_Page Submit`: -`Q5.1_Page Submit`)

# rename column headers and decapitalise them

slider_clean <- slider_clean %>%
  rename(date = RecordedDate,
         gender = Q10.1,
         race = Q10.2,
         race_other = Q10.2_7_TEXT,
         age = Q10.3,
         income = Q10.4,
         edu = Q10.5,
         econ = Q10.6,
         mouse = Q10.7,
         achieve_attempt = Q10.8,
         speed_goal = Q10.9,
         accuracy_goal = Q10.10,
         reason_noattempt = Q10.11,
         reason_noattempt_other = Q10.11_4_TEXT,
         explain_help = Q10.12,
         fix_5 = Q11.1_1,
         fix_7.5 = Q11.1_3,
         fix_10 = Q11.1_4,
         fix_12.5 = Q11.1_5,
         fix_15 = Q11.1_6,
         fix_17.5 = Q11.1_2,
         fix_20 = Q11.1_7,
         rand_5 = Q12.1_1,
         rand_7.5 = Q12.1_3,
         rand_10 = Q12.1_4,
         rand_12.5 = Q12.1_5,
         rand_15 = Q12.1_6,
         rand_17.5 = Q12.1_2,
         rand_20 = Q12.1_9) %>%
  rename_with(str_to_lower) %>%
  mutate(across(where(is.character), str_to_lower)) #also decapitalise character variable values


# rearrange columns

slider_clean <- slider_clean %>%
  relocate(instruct_duration, .before = task_duration)

# remove redundant rows

slider_clean <- slider_clean[-1:-2, ]

# Fill NA values for race_other with values from race

slider_clean <- slider_clean %>%
  mutate(race_other = coalesce(race_other, race))

# Fill NA values for reason_noattempt_other with values from reason_noattempt

slider_clean <- slider_clean %>%
  mutate(reason_noattempt_other = coalesce(reason_noattempt_other, reason_noattempt))
           
# inspect data types

str(slider_clean)

# convert to desired data types

slider_clean <- slider_clean %>%
  mutate(date = as.POSIXct(date, format = "%Y-%m-%d %H:%M:%S"),
         finished = factor(finished, levels = c("false", "true")),
         treatment = factor(treatment, levels = c("1", "2", "3", "4")),
         criterion = factor(criterion, levels = c("lenient", "strict")),
         instruct_duration = as.numeric(instruct_duration),
         task_duration = as.numeric(task_duration),
         task_per_min = as.numeric(task_per_min),
         task_total = as.numeric(task_total),
         mistake_total = as.numeric(mistake_total),
         gender = factor(gender, levels = c("male", "female", "non-binary", "prefer not to say")),
         race = factor(race, levels = c("white", "asian", "black", "hispanic", "native american", "other",
                                        "prefer not to say")),
         race_other = factor(race_other),
         age = as.numeric(age),
         income = factor(income, levels = c("0 - 24,999", "25,000 - 49,999", "50,000 - 74,999",
                                            "75,000 - 119,999", "120,000 - 199,999", "200,000 and over",
                                            "prefer not to say")),
         edu = factor(edu, levels = c("below high school diploma", "high school diploma",
                                      "college/ university degree and equivalent or above", "prefer not to say")),
         econ = factor(econ, levels = c("no", "yes", "prefer not to say")),
         mouse = factor(mouse, levels = c("no", "yes")),
         achieve_attempt = factor(achieve_attempt, levels = c("no for both targets",
                                                              "yes but only for accuracy target",
                                                              "yes but only for speed target",
                                                              "yes for both targets.")),
         speed_goal = factor(speed_goal, levels = c("below 8", "8", "9", "10", "above 10")),
         accuracy_goal = factor(accuracy_goal, levels = c("below 10%", "10%", "above 10% to below 25%",
                                                          "25% to below 40%", "40%", "above 40%")),
         reason_noattempt = factor(reason_noattempt, levels = c("did not care about target(s)",
                                                                "too difficult to understand/ recall target(s)",
                                                                "too difficult to achieve target(s)",
                                                                "other")),
         reason_noattempt_other = factor(reason_noattempt_other),
         explain_help = factor(explain_help, levels = c("no", "yes")))

slider_clean <- slider_clean %>%
  mutate_if(is.character, as.numeric)
#one observation's loss aversion data in the random payouts category was lost (coerced to NA) as subject calculated the EV of random payouts instead of indicating the number of the tasks they were willing to do under those payouts

#subset loss aversion data to another dataframe, and remove from main dataframe

loss_aversion <- select(slider_clean, fix_5:rand_20)

slider_main <- select(slider_clean, -fix_5:-rand_20)

