#include "edge_matrix.hpp"
#include <tuple>
edge_matrix::edge_matrix() : matrix(4, 0) {}

void edge_matrix::add_point(std::tuple<double, double, double> point) {
    double x, y, z;
    std::tie(x, y, z) = point;
    data[0].push_back(x);
    data[1].push_back(y);
    data[2].push_back(z);
    data[3].push_back(1);
}

void edge_matrix::add_edge(std::tuple<double, double, double> a, std::tuple<double, double, double> b) {
    add_point(a);
    add_point(b);
};

void edge_matrix::add_parametric(parametric_func& x, parametric_func& y, parametric_func& z, int num_points) {
    std::vector<double> xpoints = x.get_range(num_points);
    std::vector<double> ypoints = y.get_range(num_points);
    std::vector<double> zpoints = z.get_range(num_points);

    for(int i = 0; i < num_points - 1; ++i) {
        add_edge({xpoints[i], ypoints[i], zpoints[i]}, {xpoints[i + 1], ypoints[i + 1], zpoints[i + 1]});
    }
}