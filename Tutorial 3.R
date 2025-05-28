#Tutorial 3 

#Q1
data <- c(1,2,2,0,1,2,0,1,2)
data

data1 <- ifelse(data==0,"Low",ifelse(data==1,"Medium","High"))
data1 

#factor 
data1 <-c(1,2,2,0,1,2,0,1,2)
data1 

fdata1 = factor(data1)
fdata1

rdata1 = factor(data1,labels=c("Low","Medium","High"))
rdata1


#Q2
data <- c(1,2,2,0,1,2,0,1,2)
data

a=matrix(data,3,3)
b=matrix(data,3,3,TRUE)
c=matrix(data,3,3,FALSE)
a
cat(a)
print(a)


#Q3
data <- c(1,2,2,0,1,2,0,1,2)
data

rown <- c("row_1","row_2","row_3")
coln <- c("col_1","col_2","col_3")
d=matrix(data,3,3,FALSE,dimnames = list(rown, coln))
d
print(d)


#Q4
v1 = c(10,20,30,40,50,60)
v1

v2 = c(5,10,15,20,25,30)
v2 

matrix1 = matrix(v1,2,3)
matrix1

matrix2 = matrix(v2,2,3)
matrix2

madd = matrix1 + matrix2
madd

msub = matrix1 - matrix2
msub

mmul = matrix1 * matrix2
mmul

mdiv = matrix1 / matrix2
mdiv


#Q5
v1 = c(10,20,30,40,50,60,5,10,15,20,25,30,15,20,25,30)

matrix1 = matrix(v1,4,4)
matrix1

max(matrix1)
min(matrix1)

matrix1[2,3]
matrix1[3,]
matrix1[,4]



#Q6
matrix1[2,3] * matrix1[1,2]


#Q7
matrix1 <- matrix(c(1,2,3),1,3)
matrix1
matrix2 <- matrix(c(1,2,3,4,5,6),2,3)
matrix2
#Q8
matconcat = c(matrix1,matrix2)
matconcat
matconcat2 = c(matrix2,matrix1)
matconcat2



#Q9
v1 = c(10,20,30,40,50,60,5,10,15,20,25,30,15,20,25,60)
matrix1 = matrix(v1,4,4)
matrix1
cat(matrix1)
print(matrix1)

max(matrix1)
min(matrix1)

#Q10
which(matrix1 == max(matrix1), arr.ind = TRUE)
which(matrix1 == min(matrix1), arr.ind = TRUE)

#Q11
matrix1 <- matrix(c(1,2,4,7,6,3,4,5,9),3,3)
matrix1
matrix2 <- matrix(c(1,4,5,6,2,3,4,8,4),3,3)
matrix2

c.names = c("col1","col2","col3")
r.names = c("row1","row2","row3")
m.names = c("mat1","mat2","mat3","mat4")

final = array (c(matrix1, matrix2), dim=c(3,3,4), dimnames = list(r.names, c.names, m.names))
final

#Q12
print(final[2,,2])
print(final[3,3,1])

#Q13
threedarray = array (c(1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8), dim = c(2,4,3))
threedarray

#Q14
studentid = c(10, 20, 30, 40)
studentid
studentname = c ("June", "Samy", "Nila", "Ali")
studentname
studentstatus= c (TRUE,TRUE,FALSE,FALSE)
studentstatus 
cgpa = c (3.5,2.9,3.1,3.6)
cgpa
df <- data.frame(studentid, studentname, studentstatus, cgpa)
df

#Q15
df$studentname

#Q16
df[2:4,]


#Q17
df$location = c("penang", "kl", "JB", "Melaka")
df

#Q18
studentid = c(50)
studentid
studentname = c ("CHONG")
studentname
studentstatus= c (TRUE)
studentstatus 
cgpa = c (3.5)
cgpa
location = c("indonesia")
df2 <- data.frame(studentid, studentname, studentstatus, cgpa, location)
df2

df = rbind(df, df2)
df

#Q19
newdf = subset(df, select = -c(studentstatus))
newdf

#Q20
l1 = list(c(1,2,3,4,5))
l1 
v6 = c("i","am","hungry")

#Q21
mylist = list(element1 = l1, element2 = v6, element3 = df)
mylist

mylist$element1
mylist$element2
mylist$element3
