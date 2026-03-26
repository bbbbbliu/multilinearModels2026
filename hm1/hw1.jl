using Pkg
Pkg.activate("~/Documents/Classwork/Spring2026")
using LinearAlgebra, CSV, DataFrames
X = [1 2 3; 4 5 6]
Seishi = DataFrame(CSV.File("MultiLinear/hm1/Seishi.csv"))
Y = Matrix(select(Seishi, r"^y"))
X= Matrix(select(Seishi, r"^x"))

display(X)




