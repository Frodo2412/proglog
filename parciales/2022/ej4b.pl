
s-->
	a(N), 
	b(M), 
	{C is N + M, D is N*M}, 
	c(C), 
	d(D).
a(0)-->
	[].
a(N)-->
	[X], 
	{N is X + 1}.
b(0)-->
	[].
b(N)-->
	[X], 
	{N is X + 2}.
c(0)-->
	[].
c(N)-->
	[X], 
	{N is X + 3}.
d(0)-->
	[].
d(N)-->
	[X], 
	{N is X + 4}.
