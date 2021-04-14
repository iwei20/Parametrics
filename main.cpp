#include "parser.hpp"
#include "screen.hpp"
#include <fstream>
#include <iostream>

int main(int argc, char** argv) {
    if(argc <= 0) {
        std::cout << "Usage: "
    }
    std::ifstream fin(argv[1]);
    if(fin.fail()) {
        std::cout << "Could not read file\n";
        return 0;
    }
    screen s(500, 500);
    parser p;
    p.parse(s, fin);
    fin.close();
}