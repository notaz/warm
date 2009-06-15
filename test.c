#include <stdio.h>
#include "warm.h"

int main()
{
	warm_init();
	warm_cache_op_range(0, 0, 0);

	return 0;
}

