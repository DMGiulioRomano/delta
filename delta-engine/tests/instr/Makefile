CSD ?= test_behaviorGenerator.csd
.PHONY = clean test

clean:
	rm -rf ./sco ./docs/*.csv 

cs: 
	csound $(CSD) -m128 --logfile=../log.log