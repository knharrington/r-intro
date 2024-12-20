# 01/08/2025

# This script will provide examples for some frequently used functions 
# Please note that this is not a complete tutorial for learning R

# For more information, see:
# https://r4np.com/ 
# https://bookdown.org/yih_huynh/Guide-to-R-Book/ 
# https://r4ds.hadley.nz/

# # # Tips and Tricks # # #
# Use "Ctrl" + "Enter" to evaluate lines/blocks of code
# Use "Ctrl" + "Z" to undo your last action
# Use "Ctrl" + "Shift" + "C" to comment out selected lines of code
# Your cursor doesn't have to be at the start of a line of code in order to execute it - it can be anywhere within the line

# When you first opened up this project, you entered a new session. Variables and other settings are not saved across sessions.
# Variables are session specific, NOT script specific.

# Loading libraries (you must do this for every new R session)
{                                                           # Using brackets lets you run/load all libraries at once
  library(tidyverse)                                        # Contains helpful libraries for cleaning, organizing, and visualizing data
  library(data.table)                                       # contains functions that deal with large data quickly
  library(MASS)                                             # Functions and datasets to support, "Modern Applied Statistics with S" (4th edition, 2002, Venables and Ripley)
}

# Working with directories
getwd()                                                     # get the path to your current working directory                                                     # set the path to a new working directory
setwd("..")                                                 # set your working directory one folder backwards from your current one
setwd("r-intro")                                            # set our working directory to the correct one (this project)

# Getting help for functions
?getwd()                                                    # use a ? before any function in your script or console to learn more about it

# Using paths to files
# it is recommended to use relative paths whenever possible
# relative file paths are paths relative to the current working directory, usually a R project
# they allow others running your script to use their own working directory
"./data/shark-data.csv"                                                     # this is a relative path ("./" is the working directory) 
"data/shark-data.csv"                                                       # this is also a relative path
"C:\\Users\\FishVid\\Documents\\R\\r-intro\\data\\shark-data.csv"           # this is an absolute path (both / or \\ work)

# R considers spaces as separate text and is case sensitive. Instead, consider labeling your objects like so:
ThisVariable
this.variable
this_variable
# And stick with a consistent naming convention you prefer
# I recommend not using the hyphen in variables so as not to confuse with minus (not: this-variable)

# You can use "=" every place you use "<-". The converse is not true. 
# I recommend using "<-" for assignment because "=" can be used for other things.

x <- 1                                                      # assigning an object a value (shortcut: "Alt" + "-")
x <- c(1, 2, 2, 3, 3, 4, 5)                                 # Creating a list (vector) by concatenation: "c()" and replacing the previous value stored

# Functions can be applied to variables and their results can be stored
mean(x)                                                     # calculate the mean of the values stored in x
avg_x <- mean(x)
range(x)                                                    # What is the max and min value
length(x)                                                   # How many items are in the object
unique(x)                                                   # What are the unique values
summary(x)                                                  # What are some summary statistics 

x <- 1:5                                                    # creating a list by ":"
x <- c(1,2,3,4,5)                                           # equivalent to above
x <- seq(1, 5, 1)                                           # equivalent to above

y = x                                                       # now y has the equivalent values of x
x + 1                                                       # you don't need to assign a value to evaluate it
x + y                                                       # objects can be variables with values
x == 2                                                      # translates to: retrieve Boolean values from the object labeled x that equal two
x > 2                                                       # translates to: retrieve Boolean values that are greater than two from the object labeled x
x >= 2                                                      # translates to: retrieve Boolean values that are greater than or equal to two from the object labeled x
x < 2                                                       # translates to: retrieve Boolean values that are less than two from the object labeled x
2 %in% c(2,3,4)                                             # translates to: Does the value on the left match anything in the vector on the right? 
c(2,3,4) %in% 2                                             # translates to: Does the vector on the left match the value on the right?

# A more complex example creating a data frame
x <- data.frame(
  A = c(4, 5, 6, 5, 8),
  B = c(TRUE, FALSE, FALSE, TRUE, FALSE),
  C = c("blue", "green", "red", "blue", "blue")
)
class(x)                                                    # what kind of object is x
x$A > 5 | x$B == TRUE                                       # translates to: retrieve values where x column A is greater than five or where the values of x column B are TRUE.
x$A > 5 & x$C == "blue"                                     # translates to: retrieve values where x column A is greater than five and where the values of x column C equal “blue”

# subsetting a data frame
df <- data.frame(col_a = rnorm(10, 10), 
                 col_b = letters[1:10], 
                 col_c = LETTERS[1:2],
                 col_d = seq(10, 100, 10))
df[1:3]                                                     # first 3 columns
df[, 1:3]                                                   # first 3 columns
df[1:3 ,]                                                   # first 3 rows
df[1:3, 1]                                                  # first 3 rows and first column
df[df$col_d > 50,]                                          # rows where column d is greater than 50
df[df$col_d > 50 & df$col_c == "B",]                        # rows where column d is greater than 50 and column c is equal to B

# R does not care how you indent your code like some other languages. The following all work:
a = 1

z                 =                  a

z=a

z =
  a

# package/function syntax
data.table::fread()                                         # This syntax is package::function (good for overlapping packages/functions)
fread()                                                     # This is the same function as above; both work

