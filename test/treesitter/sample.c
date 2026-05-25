/* C sample */
#include <stdio.h>

int greet(const char *name) {
  printf("Hello, %s\n", name);
  return 0;
}

int main(void) {
  return greet("world");
}
