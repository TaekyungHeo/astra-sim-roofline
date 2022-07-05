/******************************************************************************
This source code is licensed under the MIT license found in the
LICENSE file in the root directory of this source tree.
*******************************************************************************/

#include "astra-sim/system/Roofline.hh"

#include <algorithm>

using namespace std;
using namespace AstraSim;

Roofline::Roofline() {
  bandwidth = 0;
  neg_y_intercept = 0;
  peak_perf = 0;
}

void Roofline::set_bandwidth(double bandwidth) {
  this->bandwidth = bandwidth;
}

void Roofline::set_neg_y_intercept(double neg_y_intercept) {
  this->neg_y_intercept = neg_y_intercept;
}

void Roofline::set_peak_perf(double peak_perf) {
  this->peak_perf = peak_perf;
}

double Roofline::get_perf(double operational_intensity) {
  return min((bandwidth * operational_intensity) - neg_y_intercept,
             peak_perf);
}
