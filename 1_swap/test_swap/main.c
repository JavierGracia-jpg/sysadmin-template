#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int main(void) {
    size_t size = 5L * 1024 * 1024 * 1024;
    char *memory = malloc(size);

    memset(memory, 1, size);

    free(memory);
    return 0;
}
