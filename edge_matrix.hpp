#pragma once

#include "matrix.hpp"
#include "parametric.hpp"
class edge_matrix : public matrix {
    private:
        /**
         * Given tuple (x, y, z), appends x, y, z, and 1 to the end of each row in the edge matrix.
         **/
        void add_point(const std::tuple<double, double, double>& point);
    public:
        edge_matrix();

        /**
         * Adds points a and b to the end of the matrix.
         **/
        void add_edge(const std::tuple<double, double, double>& a, const std::tuple<double, double, double>& b);

        /**
         * Takes three parametric functions for x, y, and z, and plots them evaluated at 0 to 1 lerping over num_points points.
         **/
        void add_parametric(const parametric_func& x, const parametric_func& y, const parametric_func& z, int num_points);
        using matrix::operator=;
};