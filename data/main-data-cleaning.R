#read in raw data

slider_data_raw <- read_csv("data\\slider-data-raw.csv")

# rename headers using first row
slider_data_main <- slider_data_raw %>%
  set_names(slider_data_raw[1,])

# make column names unique (needed to apply mutate)
names(slider_data_main) <- make.unique(names(slider_data_main))

slider_data_main <- slider_data_main[-1:-2, ] %>% # remove unnecessary rows (non-observations)
  mutate(across(where(is.character), str_squish)) %>% # remove whitespace
  select("task_per_min" : "treatment",
         "Duration (in seconds)" : "Did you study economics at the undergraduate level or higher?") %>% # selected desired columns
  rename("total_duration" = "Duration (in seconds)", "age" = "Age (in years)",
         "income" = "Annual household income (in USD)", "education" = "Educational level",
         "economics" = "Did you study economics at the undergraduate level or higher?") #rename columns
 
# decapitalise column names
names(slider_data_main) <- str_to_lower(names(slider_data_main))


# rearrange columns
slider_data_main <- slider_data_main %>%
  relocate(treatment) %>%
  relocate(task_total, .after = task_per_min) %>%
  relocate(task_duration, .before = total_duration)

# inspect data types
head(slider_data_main)

# convert to desired data types
slider_data_main <- slider_data_main %>%
  mutate(treatment = as.factor(treatment),
         task_per_min = as.numeric(task_per_min),
         task_total = as.numeric(task_total),
         mistake_total = as.numeric(mistake_total),
         task_duration = as.numeric(task_duration),
         total_duration = as.numeric(total_duration),
         finished = as.logical(finished),
         gender = as.factor(gender),
         age = as.numeric(age),
         income = as.factor(income),
         education = as.factor(education),
         economics = as.factor(economics))

# check order for relevant factor variables
attach(slider_data_main)
levels(treatment)
levels(income)
levels(education)

# reorder if required


#export cleaned data for main analysis
write_csv(slider_data_main, "data\\slider-data-main.csv")
