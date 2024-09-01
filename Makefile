main:
	em++ app/lru.cc -o web/assets/out.js -lembind 

clean:
	rm -f web/assets/out* test/index*