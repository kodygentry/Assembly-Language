a2p2: a2p2.o
	g++ a2p2.o -o a2p2
a2p2.o: a2p2.cpp
	g++ -c a2p2.cpp

cleanall:
	@rm a2p2 *.o
test:
	./a2p2 < a2p2test.in > a2p2test.out
diff:
	diff a2p2test.out a2p2testBase.out

