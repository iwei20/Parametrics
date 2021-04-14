#include "src/parser.hpp"
#include "src/screen.hpp"
#include <fstream>
#include <iostream>

int main(int argc, char** argv) {
    if(argc != 4) {
        std::cout << "Usage: ./main.out [scriptname] [width] [height]\n";
    } else {
        std::ifstream fin(argv[1]);
        if(fin.fail()) {
            std::cout << "Could not read file\n";
        } else {
            screen s(std::stoi(argv[2]), std::stoi(argv[3]));
            parser p;
            p.parse(s, fin);
            fin.close();
        }
    }
}