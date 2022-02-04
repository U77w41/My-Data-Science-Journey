#python lists are heterogeneous
L3 = [True, "2", 3.0, 4]
[type(item) for item in L3]

#python arrays little better - provides more efficient storage but not efficient operations on them
import array
L = list(range(10))
A = array.array('i', L); A

#numpy arrays provide efficient array based storage as well as efficient operations - ufuncs, etc.
import numpy as np
my_arr = np.arange(1000000)
my_list = list(range(1000000))

#BAD---->>>>>using list.append
import time
start = time.time()
for _ in range(10):
    my_list2=[]
    for e in my_list:
        my_list2.append(e*2)
elapsed_time = (time.time() - start)
#my_list2
elapsed_time


#BETTER----->>>>>>using list comprehension
import time
start = time.time()
for _ in range(10): my_list2 = [x * 2 for x in my_list]
elapsed_time = (time.time() - start)
#my_list2
elapsed_time

#BEST--------->>>>>>>>>>>>>>using numpy array
import time
start = time.time()
for _ in range(10): my_arr2 = my_arr * 2
elapsed_time = (time.time() - start)
#my_arr2
elapsed_time

##########################################

arr = np.array([1, 4, 2, 5, 3]); arr

#list to ndarray
data1 = [6, 7.5, 8, 0, 1]
arr1 = np.array(data1); arr1

data1 = [6, 7.5, 8, 0, 1]
arr1 = np.array(data1,dtype=np.float128); arr1
arr1.itemsize

data1 = [6, 7.5, 8, 0, 1]
arr1 = np.array(data1,dtype='float64'); arr1
arr1.itemsize

#nested list to multidimensional ndarray
data2 = [[1, 2, 3, 4], [5, 6, 7, 8]]
arr2 = np.array(data2); arr2

data = np.random.randn(2, 3); data
data.shape
data.ndim
data.dtype
data.itemsize
data.size
data.nbytes

np.arange(10)
np.arange(2, 10, dtype=float)

#overflow and trucation errors
np.power(100, 8, dtype=np.int64)
np.power(100, 8, dtype=np.int32)
np.power(100, 100, dtype=np.int64)
np.power(100, 100, dtype=np.float64)
#truncation happens here - CAREFUL!!!
arr11 = np.array([1.3,2.5], dtype=np.int16)
arr11

#use of standard numpy functions to create arrays
np.zeros(10)
np.zeros((3, 6))
#uninitialized garbage values
np.empty((2, 3, 2))
#np.arange(15)
np.arange(3,10,2)
np.arange(3,10,2,dtype='float')
np.arange(3,10,2,dtype=np.float128)
arr14 = np.eye(3); arr14
arr22 = np.linspace(3,100,12); arr22
np.eye(3)


#indexing of arrays - single index, slicing, boolean indexing, fancy indexing, multi-dimensional subarrays
arr12 = np.array([[2,3,4],[3,5,3]]); arr12
#for multidimensional, dimensions are separated by commas
arr12[1,1]
arr12[1,1:]
arr12[:1, :2]
arr12[:,:2]
arr12[:1,:]    #alternatively arr12[:1]
data1 = [6, 7.5, 8, 0, 1]; arr1 = np.array(data1)
arr1[2:-1]
arr16 = arr1[2:4]; arr16

#array indexing is a no copy operation
arr16 = arr1[2:4]; arr16
arr16[0]=100; arr1
#getting a copy
arr16 = arr1[2:4].copy(); arr16
arr16[0]=1000; arr16
arr1

#array reshaping
#row major arrangement (C-style)
arr22 = np.linspace(3,100,12); arr22
arr22_reshaped = arr22.reshape(6,2); arr22_reshaped
#column major arrangement (Fortran style)
arr22_reshaped = arr22.reshape(6,2,order='F'); arr22_reshaped
arr22_reshaped[1:4:2,:]

x = np.array([1, 2, 3])
y = x.reshape((1, 3));y
y.shape
x.shape
y = x[np.newaxis, :];y
y.shape
y = x[:, np.newaxis];y
y.shape

#array concatenation & splitting
x = np.array([1, 2, 3])
y = np.array([3, 2, 1])
np.concatenate([x, y],axis=0)
np.concatenate([x[:,np.newaxis],y[:,np.newaxis]])
np.concatenate([x[:,np.newaxis],y[:,np.newaxis]],axis=1)
np.hstack([x,y])
np.vstack([x,y])

x=[1,2,3,99,99,3,2,1]
x1, x2, x3 = np.split(x, [3, 5])
print(x1, x2, x3) #also explore np.hsplit, np.vsplit

#boolean masks and boolean indexing
arr14 = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
arr14%2==0
arr14[arr14%2==0]
arr15 = np.array([True,False,True]); arr15
arr14[arr15]
arr16 = np.array([[True,False,True],[True, True,False],[False,False,True]])
arr14[arr16]
arr14[~arr14%2==0]
arr14[(arr14%2==0) | (arr14%9==0)]

#fancy indexing (index arrays using lists)
#fancy indexing results into COPYING
x = np.arange(10,1,-1); print(x)
print(x[[3, 3, 1, 8]])
x[[3,3,-3,8]]

arr = np.empty((8, 4))
for i in range(8):
    arr[i] = i
arr
#pass the array index as a list
arr[[4, 3, 0, 6]]

arr = np.arange(32).reshape((8, 4))
arr
#here the 1st, 5th, 7th and 2nd rows' 0th, 3rd, 1st and 2nd elements are selected respectively. 
#The result is an one-dimensional array
arr[[1, 5, 7, 2], [0, 3, 1, 2]]
arr[[1, 5, 7, 2], [0, 3, 1, 2]]=0
arr

#important note the differences and similarities
arr[1,2]
arr[(1,2)] #same as previous
arr[[1,2]] #not same as previous but example of fancy indexing


#UFUNCS
arr12 = np.array([[2,3,4],[3,5,3]]); arr12
arr12 + arr12
arr12 * arr12
arr12 * 3
arr12 ** 2
arr14 = np.eye(3); arr14
arr12 > arr12 * 2
arr15 = np.array([[1,3,4],[3,4,3]])
arr12<=arr15
arr16 = np.arange(15).reshape(3,5); arr16
np.sqrt(arr16)
x = np.random.randn(8); x
y = np.random.randn(8); y
np.maximum(x, y)
np.add(x,y)
arr17 = np.random.randn(7) * 5; arr17
remainder, whole_part = np.modf(arr17)
remainder
whole_part
#largest integer smaller than...
np.floor(arr17)
arr18 =np.array([np.nan,23,2.3]); arr18
np.isnan(np.nan)
np.isnan(np.inf)
np.isinf(np.inf)
np.isnan(arr18)
np.array([1])/0
np.dot(arr16,arr16.T)
np.log([-1, 1, 2])
np.mean(arr12) # alternatively arr12.mean()
arr12.sum()
arr12.mean(axis=1)
arr12.mean(axis=0)
np.mean(arr12,axis=0)
arr12.cumsum()
arr13 = np.array([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
#for each col
arr13.cumsum(axis=0)
#for each row
arr13.cumsum(axis=1)
#similarly we have std, var, min, max, argmin, argmax, cumprod
arr14 = np.array([[0, 2, 1], [5, 3, 5], [6, 7, 8]])
arr14.argmin(axis=1)
arr14.argmax(axis=1)
arr14.max(axis=1)
#boolean arrays
arr15 = np.random.randn(100)
(arr15 > 0).sum() #count of positive values as True has value 1 and False has 0
(arr15 > 0).any()
(arr15 > 0).all()

#sorting (with copy, w/o copy)
arr14.sort(axis=1)
#in place sorting: NO COPY made
#similar to the sort method of python list (as against sorted() available for any python iterable which makes copy)
arr14
arr15 = np.array([[2,4,3],[3,2,1],[5,2,2]]); arr15
#COPY made
np.sort(arr15,axis=1)
arr15


####Broadcasting#####
a = np.array([0, 1, 2]); a
M = np.ones((3, 3)); M
b = M+a; b
a.shape
M.shape
b.shape
#the broadcasting steps followed as below:
d = a[np.newaxis,:]; d. # Rule 1
d.shape
c = np.vstack([d,d,d]); c # Rule 2
c.shape
M+c #same as M+a a(3,0) --> d(1,3) --> c(3,3) now c is compatible in shape with M 



######LINEAR ALGEBRA#########
#transpose of array / matrix
arr16 = np.arange(15).reshape(3,5); arr16
arr16.T

x = np.array([[1., 2., 3.], [4., 5., 6.]])
y = np.array([[6., 23.], [-1, 7], [8, 9]])
x.dot(y)
np.dot(x,y)
np.dot(y,x)
np.ones(3)
np.dot(x,np.ones(3))

from numpy.linalg import inv, qr
X = np.random.randn(5, 5)
mat = X.T.dot(X); mat
inv(mat)
np.absolute(np.round(mat.dot(inv(mat))))
#QR decomposition where q is an orthogonal matrix and r is an upper triangular matrix
q, r = qr(mat)
#properties of orthogonal matrix
np.round(q.T-inv(q))
#properties of orthogonal matrix
np.round(np.dot(q,q.T))
#properties of orthogonal matrix
np.round(np.dot(q.T,q))

np.diag(q)
np.trace(q)
sum(np.diag(q))
np.diag(q).sum()
np.diag(q).cumsum()

#determinant: matrix must be square
np.linalg.det(X)
np.linalg.eig(X)
np.linalg.eigvals(X)

#SVD: Reconstruction based on full SVD: 
#refer: https://docs.scipy.org/doc/numpy-1.9.2/reference/generated/numpy.linalg.svd.html
a = np.random.randn(9, 6) + 1j*np.random.randn(9, 6)
U, s, V = np.linalg.svd(a, full_matrices=True)
U.shape, V.shape, s.shape
S = np.zeros((9, 6), dtype=complex); S
S[:6, :6] = np.diag(s); S
np.diag(s)
np.allclose(a, np.dot(U, np.dot(S, V)))
np.dot(U, np.dot(S, V))

#random numbers
np.random.seed(1234)
arr18 = np.random.normal(size=(4, 4)); arr18
np.random.binomial(10,0.33,size=15)
np.random.normal(5,2,10000).mean()
np.random.normal(5,2,10000).std()

#normal (0,1)
np.random.randn(10)
#uniform (0,1)
np.random.rand(10)
#uniform
np.random.uniform(3,5,10)
#poisson
np.random.poisson(4,10)

#random walk simulation
%matplotlib inline
import matplotlib.pyplot as plt
nsteps = 1000
draws = np.random.randint(0, 2, size=nsteps)
steps = np.where(draws > 0, 1, -1)
walk = steps.cumsum()
plt.plot(walk)