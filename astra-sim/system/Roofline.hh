/******************************************************************************
This source code is licensed under the MIT license found in the
LICENSE file in the root directory of this source tree.
*******************************************************************************/

#ifndef __ROOFLINE_HH__
#define __ROOFLINE_HH__

#include <stdint.h>

namespace AstraSim {

class Roofline
{
public:
  Roofline();
  void set_bandwidth(double bandwidth);
  void set_neg_y_intercept(double neg_y_intercept);
  void set_peak_perf(double peak_perf);
  uint64_t get_perf(double operational_intensity);

private:
  double bandwidth;
  uint64_t neg_y_intercept;
  uint64_t peak_perf;
};

}

#endif /* __ROOFLINE_HH__ */
