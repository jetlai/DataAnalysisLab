#Question 1 
max_val <- -Inf

for (i in 1:5){
  num <- as.integer(readline(prompt = paste("Enter the Number", i, ": ")))
  if (val >max_value){
    max_value <- val
  }
}
paste("The maximum number is", max_value)
2

#Question 2
product <- 1
for (i in 1:10){
  if (val > 0){
    product <- product = val 
  }
}
paste("Total product is", product)


#Question 3

writeLines("Please choose your favourite programming language:\n c\n2 Java\n3 VB.net")
option = as.integer(readline = prompt("Please enter number from 1 to 3: "))
language = switch(option, "c", "Java", "VB.Net")
paste("Your favourite programming language is", language)




