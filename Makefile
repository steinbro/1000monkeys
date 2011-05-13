CMUDICT=cmudict
ANTHOLOGY=dickinson

RHYMEDB=rhymedb.txt
ANALYZED=analysis.txt
COUPLETS=couplets.txt

MONKEYS=2000

.PHONY: rhyming-dictionary anthology-analysis couplets couplet-rankings

rhyming-dictionary:
	cat $(CMUDICT) | rhyme/map.rb | sort | rhyme/reduce.rb | sort -d > $(RHYMEDB)

anthology-analysis:
	cat $(ANTHOLOGY) | read/map.rb | sort | read/reduce.rb > $(ANALYZED)

couplets:
	ruby -e "$(MONKEYS).times { puts }" | write/map.rb $(RHYMEDB) $(ANALYZED) | sort | write/reduce.rb > $(COUPLETS)

couplet-rankings:
	cat $(COUPLETS) | judge/map.rb $(RHYMEDB) | sort -n | judge/reduce.rb

clean:
	rm -f $(RHYMEDB) $(ANALYZED) $(COUPLETS)

poem: couplets couplet-rankings

all: rhyming-dictionary anthology-analysis couplets couplet-rankings

