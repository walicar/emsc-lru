main:
	em++ app/src/lru.cxx -o web/assets/out.js -lembind 

clean:
	rm -f web/assets/out* test/index*