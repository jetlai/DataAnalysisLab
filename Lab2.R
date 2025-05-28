a<-10
b=20
assign('c',30)

a=TRUE
b=FALSE
c=2.5
d=as.integer(2)
e='this is a character data type'


# numeric
x <- 10.5
class(x)
is.numeric(x)

# integer
x <- 1000L
class(x)
is.integer(x)

# complex
x <- 9i + 3
class(x)
is.complex(x)

# character/string
x <- "R is exciting"
class(x)
is.character(x)

# logical/boolean
x <- TRUE
class(x)
is.logical(x)


# Complex example 
z <- 3 + 5i 
w <- 1 - 2i 

result_complex <- z * w 
print(result_complex)  

result_complex <- w * z
print(result_complex)  

#vector operation

test_marks = c(25,10,5,20,25)
test_marks

exam_marks = c(60,25,0,50,60)
exam_marks

total_marks = test_marks + exam_marks
total_marks
print(total_marks)

min(total_marks)
max(total_marks)
mean(total_marks)
median(total_marks)

pass = total_marks >= 50
pass
print(pass)

names(total_marks)<-c('ali','bee','charles','diana','elli')
print(total_marks)
cat(total_marks)

a=length(total_marks)

p=round(547.8)
sqrt(9)
myvar=substr("calvin hosea", 3,8)

mycar=paste(substr("calvin hosea", 3,3),substr("calvin hosea", 8,8))
mycar


myvar
strsplit("hello world how r u", " ")
paste("welcome to”, “PFDA")
nchar("hello world")




