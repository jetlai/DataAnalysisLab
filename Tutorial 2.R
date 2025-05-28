#Q1
5+17
10-7
4*3*5
18/9
9%%4
(5*8)+(12-7)

#Q2
weeks <-4
weeks

hoursPerWeek =40
hoursPerWeek

assign('hourlyRate',50)
hourlyRate

rm(hourlyRate)


#Q3
# Define variables with different data types
var_numeric <- 10.5
var_integer <- 15L
var_character <- "Hello, World!"
var_logical <- TRUE

# Check data types
class(var_numeric)         # Output: "numeric"
is.numeric(var_numeric)    # Output: TRUE
is.integer(var_numeric)    # Output: FALSE
is.character(var_numeric)  # Output: FALSE
is.logical(var_numeric)    # Output: FALSE

class(var_integer)         # Output: "integer"
is.numeric(var_integer)    # Output: TRUE
is.integer(var_integer)    # Output: TRUE
is.character(var_integer)  # Output: FALSE
is.logical(var_integer)    # Output: FALSE

class(var_character)         # Output: "character"
is.numeric(var_character)    # Output: FALSE
is.integer(var_character)    # Output: FALSE
is.character(var_character)  # Output: TRUE
is.logical(var_character)    # Output: FALSE

class(var_logical)         # Output: "logical"
is.numeric(var_logical)    # Output: TRUE
is.integer(var_logical)    # Output: FALSE
is.character(var_logical)  # Output: FALSE
is.logical(var_logical)    # Output: TRUE



#Q4 vector operation 
test_Marks =c(10,20,23,30,17)
test_Marks

final_Marks =c(70,35,10,20,40)
final_Marks

total_Marks = test_Marks + final_Marks
total_Marks

pass = total_Marks >= 50
pass

min(total_Marks)
max(total_Marks)
mean(total_Marks)
median(total_Marks)


#Q5
names(total_Marks) <- c("Alice", "Bob", "Charlie", "David", "Eva")
total_Marks


#Q6
round(547.8)                 # Output: 548
length(total_Marks)          # Output: 5 (assuming total_Marks contains 5 elements)
subsqrt(9)                      # Output: 3
substr("abcd", 2, 4)         # Output: "bcd"
strsplit("hello world", " ") # Output: list("hello", "world")
paste("welcome to", "PFDA")  # Output: "welcome to PFDA"
nchar("hello")               # Output: 5





