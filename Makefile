RUBY=C:/Ruby193/bin/ruby
DOT="C:/Program Files (x86)/Graphviz 2.28/bin/dot.exe"

test-org2dot: test_org2dot.rb
	${RUBY} test_org2dot.rb

start-pfd-sample2.gif: pfd-sample2.gif
	cygstart pfd-sample2.gif

pfd-sample2.gif: pfd-sample2.dot
	${DOT} -Tgif -o pfd-sample2.gif pfd-sample2.dot

pfd-sample2.dot: pfd-sample2.org.txt org2dot.rb
	${RUBY} org2dot.rb < pfd-sample2.org.txt > pfd-sample2.dot
	cat pfd-sample2.dot

pfd-sample1.gif: pfd-sample1.dot
	dot -Tgif -o pfd-sample1.gif pfd-sample1.dot && \
	cygstart pfd-sample1.gif
