#include <math.h>

extern "C" float fun_el(float z)
{
	float f = 0;

	f = log(fabs(cos(z) + sin(z)));//ln(abs(cos(x) + sin(x)))

	return f;
}