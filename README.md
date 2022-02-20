<img src="https://www.fatalerrors.org/images/blog/31f3de3f0d648286735ea05b863fdb98.jpg" width="60" height="60"> 

# Symmetric-matrices-and-tridiagonalization
Using co-variance matrices, which are symmetric,
<ul>
<li> Tri-diagonalize the covariance matrix using (1) Householder method, (2) Givens Method and (3) the Jacobi method.  Keep track of the number of iterations required for each method </li>
<li> Verify that values in the diagonal of the final Jacobi matrix are indeed the eigenvalues of the covariance matrix. </li>
<li> Are all the eigenvalues similar for all three methods? </li>
<li> Determine the total processing time for each method, and plot the required processing time versus dimension <strong>N </strong> of the N x N matrix  </li>
<li> Check for all three methods if the eigenvalues obtained are the same as those of the original covariance matrix, then see if the eigenvectors of the respective tridiagonalized matrices are related to those of the covariance matrix by the relation y<sub>i</sub>=T<sup>-1</sup>x<sub>i</sub>
</ul>

## Explanaion: 
The problem is approached by a symmetric covariance matrix given as,

![image](https://user-images.githubusercontent.com/98129458/154829730-2cea52cb-8b63-46f9-aa30-edb0934bf7a5.png)

### 1) Householder Method: 
The method tridiagonlize the matrix as given below. It took 2 iterations.

![image](https://user-images.githubusercontent.com/98129458/154829778-0490329b-7dfb-4744-abbf-7c892de233d4.png)

### 2) Givens Method: 
This method also took 2 iterations for the tridiagonalization

![image](https://user-images.githubusercontent.com/98129458/154829904-63f15221-6ba3-40c2-b9ae-b155cc0e15df.png)


### 3) Jacobi Method:
For Jacobi method another covariance matrix is considered

![image](https://user-images.githubusercontent.com/98129458/154829926-28cca5da-4b68-46ec-ba19-fb2ff85004c3.png)

It took five iterations to reach to the desired matrix. The tridiagonal matrix is given below

![image](https://user-images.githubusercontent.com/98129458/154830510-60799205-5599-4846-9fac-1ecb450b80c4.png)

### Verification about Jacobi Matrix: 
It can be noted that, eigenvalue for A matrix are the same as the diagonal values for the tridiagonal matrix.

![image](https://user-images.githubusercontent.com/98129458/154830548-411fe2bf-ae14-4f57-b9d7-7ce186427001.png)

### Checking Similar Eigenvalues: 
Householder and Givens provide same eigenvalues for the covariance matrix. However, Jacobi matrix yields different eigenvalue for the same covariance matrix. It might depend on the dimensions Jacobi method works on.

### Processing Time:

Householder Method: Elapsed time is 0.004550 seconds for 4x4 covariance matrix.
Givens Method: Elapsed time is 0.003773 seconds for 4x4 covariance matrix.
Jacobi Method: Elapsed time is 0.005897 seconds for 3x3 covariance symmetric matrix.
Total processing time can be calculated using the dimensions

![image](https://user-images.githubusercontent.com/98129458/154830650-ed86bcb3-3e84-4a97-b882-0930a42e9261.png)


### Verification of eigenvalues for each method: 
**Householder** method has the eigenvalues as the covariance matrix

![image](https://user-images.githubusercontent.com/98129458/154830668-47d3f372-9520-4905-b4f7-e8245b12d5da.png)

![image](https://user-images.githubusercontent.com/98129458/154830766-dca39467-b1ab-4d62-80f8-45bcb1943ab9.png)

**Givens** method has the same eigenvalues as the covariance matrix 

![image](https://user-images.githubusercontent.com/98129458/154830782-b14ffeea-f48c-469e-be31-335a77b019a7.png)

![image](https://user-images.githubusercontent.com/98129458/154830801-9d594b26-e6c5-43cf-81ef-defa78c4d47a.png)

**Jacobi** method has the same eigenvalues as the covariance matrix

![image](https://user-images.githubusercontent.com/98129458/154830918-202c2f6b-a086-455e-957e-d23ce8d009db.png)

![image](https://user-images.githubusercontent.com/98129458/154830922-532c2f82-af6c-43a2-8f73-1294a54edc18.png)





