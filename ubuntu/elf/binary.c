#include <stdio.h>

extern char __start_bindata;
extern char __stop_bindata;

int main() {
  char *p;
  for (p = &__start_bindata; p < &__stop_bindata; p++) {
    putchar(*p);
  }
  return 0;
}
