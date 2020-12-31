# Documentation

Enter the following inputs:
- country: the country name. Note that the options are automatically populated using the covid19() function.
- type: the metric to use. One of c("confirmed", "tests", "recovered", "deaths"), but many others are avaibale. See here for the full list.
- level: granularity level (country - region - city).
- date: start and end dates.

After entering the reactive inputs in the UI, we connect such inputs to the covid19() function to fetch the data. This shows how to render an interactive plot that automatically updates when any of the input is changed.
