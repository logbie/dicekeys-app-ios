// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from app.djinni

#pragma once

#include <memory>
#include <string>

namespace dicekeys {

class App {
public:
    virtual ~App() {}

    static std::shared_ptr<App> create();

    virtual std::string getHelloWorld() = 0;
};

}  // namespace dicekeys
