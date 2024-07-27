#include <emscripten/bind.h>
#include <unordered_map>
#include <iostream>

struct Node {
    int key;
    int value;
    Node *next;
    Node *prev;
    Node(int key, int value)
        : key(key), value(value), next(nullptr), prev(nullptr) {};
};

class LRU {
public:
    int capacity;
    int size;
    std::unordered_map<int, Node*> map;
    Node *head = new Node(-1,-1);
    Node *tail = new Node(-1,-1);

    LRU(int capacity) : capacity(capacity), size(0) {
        head->next = tail;
        tail->prev = head;
    }
    
    int get(int key) {
        if (map.find(key) == map.end()) return -1;

        Node *node = map[key];
        remove(node);
        add(node);
        return node->value;
    }
    
    void put(int key, int value) {
        if (map.find(key) != map.end()) {
            Node *node = map[key];
            map[key]->value = value;
            remove(node);
            add(node);
            return;
        }

        if (map.size() == capacity) {
            Node *to_delete = head->next;
            remove(to_delete);
            map.erase(to_delete->key);
        }

        Node *node = new Node(key, value);
        map[key] = node;
        add(node);
        this->size++;
    }

    std::string print() {
        std::string result = "LRU> ";
        int count = this->size;
        Node* temp = head->next;
        while (count > 0) {
            result += "[k" + std::to_string(temp->key) + ":v" + std::to_string(temp->value) + "]";
            temp = temp->next;
            count--;
        }
        return result + " <MRU";
    }

private:
    void add(Node* node) {
        Node *lastNode = tail->prev;
        lastNode->next = node;
        node->prev = lastNode;
        tail->prev = node;
        node->next = tail;
    }

    void remove(Node* node) {
        node->prev->next = node->next;
        node->next->prev = node->prev;
    }
};

EMSCRIPTEN_BINDINGS(class_lru) {
    emscripten::class_<LRU>("LRU")
        .constructor<int>()
        .function("get", &LRU::get, emscripten::allow_raw_pointers())
        .function("put", &LRU::put, emscripten::allow_raw_pointers())
        .function("print", &LRU::print, emscripten::allow_raw_pointers());
}