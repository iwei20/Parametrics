#pragma once

#include <vector>
#include <ostream>

class matrix {
protected:
    std::vector<std::vector<double>> data;
public:
    /**
     * Initializes the matrix with the specified dimensions.
     **/
    matrix(int rows, int cols);

    matrix(const std::vector<std::vector<double>>& vec_2d);
    /**
     * Creates a size x size identity matrix
     **/
    static matrix& ident(int size);

    /**
     * Outputs contents of matrix, where spaces separate entries in a row and rows are separated by a space followed by a newline.
     **/
    friend std::ostream& operator<<(std::ostream& out, matrix& mat);

    /**
     * Performs matrix multiplication and returns the result.
     **/
    friend matrix& operator*(const matrix& a, const matrix& b);

    /**
     * Reference to matrix entry
     **/
    std::vector<double>& operator[](int index);

    /**
     * Returns matrix entry
     **/
    double get(int row, int col) const;

    /**
     * Sets matrix entry
     **/
    void set(int row, int col, double num);

    /**
     * Returns the width (number of columns) of this matrix
     **/
    int width() const;

    /**
     * Retursn the height (number of rows) of this matrix
     **/
    int height() const;
};
