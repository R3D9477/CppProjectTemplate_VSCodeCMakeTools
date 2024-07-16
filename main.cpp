#include "somelib.hpp"

#include <iostream>
#include <utility>

template <typename T>
class refcnt_info;

template<typename T> struct refcnt_handle
{
};

template<typename T> class refcntptr {
    refcnt_info<T> info;
    T* ptr;
public:
    refcntptr(T*obj) {
        this->ptr = obj;
        this->info = new refcnt_handle<T>();
        this->info->count = 1;
    }
};
template<typename T> class refcnt_info {
    T* ptr; // perhaps not necessary, but useful.
    int count;
    friend refcntptr<T>;
};

int main()
{
    std::cout << "Hi." << std::endl;

    refcnt_info<int> k;
    static_cast<void>(k);

    return 0;
}