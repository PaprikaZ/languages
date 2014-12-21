#ifndef NODE_HELLO_H_
#define NODE_HELLO_H_
#include <v8.h>

namespace node {
    //Predefine Method
    v8::Handle<v8::Value> SayHello(const v8::Arguments& args);
}
#endif
