
#Question 1
#ifelse

data <-c(1,2,2,0,1,2,0,1,2)
data

data1 <- ifelse(data==0,"Low",ifelse(data==1,"Medium","High"))
data1

cat(data1)
print(data1)

#factor
a <-c(1,2,2,0,1,2,0,1,2)
a

b = factor(a)
b

c = factor(a,labels=c("Low","Medium","High"))
c



#question 2

data <-c(1,2,2,0,1,2,0,1,2)
data

a=matrix(data,3,3)
b=matrix(data,3,3,TRUE)
c=matrix(data,3,3,FALSE)

print(data)
print(b)
print(c)

#question 3
rown <- c("row_1", "row_2", "row_3")
coln <- c("col_1", "col_2", "col_3")
d=matrix(data,3,3,FALSE,dimnames = list(rown, coln))
d
print(d)
class(d)






v1 = c(10,20,30,40,50,60,40,50,60)
v1

v2 = c(5,10,15,20,25,30)
v2

matrix1=matrix(v1,3,3)
matrix1

matrix2=matrix(v2,2,3)
matrix2

madd = matrix1+matrix2
madd
msub = matrix1-matrix2
msub
mmul = matrix1*matrix2
mmul
mdiv = matrix1/matrix2
mdiv


v1 = c(10,20,30,40,50,60,5,10,15,20,25,30,15,20,25,30)

matrix1=matrix(v1,4,4)
matrix1

max(matrix1)
min(matrix1)

matrix1[2,3]
matrix1[3,]
matrix1[,4]

matrix1[2,3]*matrix1[1,2]

#question 7 
matrix1 <- matrix(c(1,2,3),1,3)
matrix1
matrix2 <- matrix(c(1,2,3,4,5,6),2,3)
matrix2
matconcat = c(matrix1,matrix2)
matconcat

#question 8
matrix1 <- matrix(c(1,2,3),1,3)
matrix1
matrix2 <- matrix(c(1,2,3,4),1,4)
matrix2
matconcat = c(matrix1,matrix2)
matconcat

v3 = c(10,20,30,40)
 append(v3,v3)



#question 9 and 10
v1 = c(10,20,30,40,50,60,5,10,15,20,25,30,15,20,25,60)

matrix1=matrix(v1,4,4)
matrix1
cat(matrix1)
print(matrix1)

max(matrix1)
min(matrix1)

which(matrix1 == max(matrix1), arr.ind = TRUE)
which(matrix1 == min(matrix1), arr.ind = TRUE)
which(matrix1 == min(matrix1), arr.ind = FALSE)


#q11
matrix1 <- matrix(c(1,2,4,7,6,3,4,5,9),3,3)
matrix1
matrix2 <- matrix(c(1,4,5,6,2,3,4,8,4),3,3)
matrix2

c.names = c ("col1","col2","col3")
r.names = c ("row1","row2","row3")
m.names = c ("mat1", "mat2","mat3", "mat4")

final = array (c(matrix1, matrix2),dim=c(3,3,4),dimnames = list(r.names,c.names,m.names))
final


#q12
print(final[2,,2])
print(final[3,3,1])

#q13

threedarray = array (c(1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8),dim=c(2,4,3))
threedarray

#q14, #q15, #q16, #q17
studentid=c(10,20,30, 40)
studentid
studentname= c("June", "Samy", "Nila","Ali")
studentname
studentstatus=c(TRUE,TRUE,FALSE,FALSE)
studentstatus
cgpa=c(3.5,2.9,3.1,3.6)
cgpa
df <- data.frame(studentid,studentname,studentstatus,cgpa)
df

v2= c("June", "Samy", "Nila","Ali")
v3 = c("female","male","female","male")
v4 = c("computing","engineering","computing","language")
df <- data.frame(v1,v2,v3,v4)
df
df$studentname

df[2:4,]


df$location = c("penang","kl","jb","sabah")
df

#q18

studentid=c(50)
studentid
studentname= c("Chong")
studentname
studentstatus=c(TRUE)
studentstatus
cgpa=c(3.5)
cgpa
location = c("indonesia")
df2 <- data.frame(studentid,studentname,studentstatus,cgpa,location)
df2

df=rbind(df,df2)
df



v1= 50
v2= c("John")
v3 = c("male")
v4 = c("computing")
v5 = c("melaka")
df1 <- data.frame(v1,v2,v3,v4,v5)
df1

df=rbind(df,df1)
df

#q19

newdf = subset(df, select = -c(studentstatus) ) 
newdf

#q20
l1 = list(c(1,2,3,4,5))
l1
v6=c("i","am","hungry")

#q21
mylist = list(element1 =l1,element2=v6,element3=df)
mylist

mylist$element1
mylist$element2
mylist$element3







