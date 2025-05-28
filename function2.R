#Function 
display <- function(){
  print("Hello Welcome to PFDA Class")
}
display()

#Create two sum function 
two_sum <- function(x,y){
  z = x+y
  return(z)
}
two_sum(5,8)

#Create a two-sum function using local variables 
two_sum <- function(){
  x = 7 
  y = 8
  z =x + y
  return(z)
}
two_sum()
rm(x)
x
y

#Create a two-sum function to allow user to put inputs 
two_sum <- function(){
  x = as.integer(readline(prompt = "Enter your 1st number: "))
  y = as.integer(readline(prompt = "Enter your 2nd number: "))
  z = x + y 
  return(z)
}
5




two_sum <- function(x,y = 7){
  z = x + y
  return(z)
}
two_sum(4)
two_sum(5,9)
two_sum()



circle_calculation <- function() {
  radius = as.integer(readline(prompt = "Enter your radius for circle in cm: "))
  writelines("Calculation:\n(C)ircumference\n(D)iameter")
  option = toupper(readline(prompt = "Option"))
  
  if (option == "A"){
    area = round(pi * radius ** 2, 2)
    paste("The area of the circle in cm is", area)
  }else if (option == "c"){
    circumference = round(2 *pi*radius, 2)
    paste("The circumference of the circle in cm is", circumference)
  }else if (option == "D"){
    diameter = round(2 * radius, 2)
    paste("The diameter of the circle in cm is", diameter)
  }else{
    print("Unavailable ")
  }
}
circle_calculation()

