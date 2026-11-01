from pathlib import Path
import os
import time

def main():
    normal_path = Path("/tmp")
    tmpfs_path = Path("/mnt/tmpfs")

    print("=== DISCO NORMAL ===")
    normal_result = benchmark(normal_path)

    print("\n=== TMPFS ===")
    tmpfs_result = benchmark(tmpfs_path)

    relation_aspect(normal_result, tmpfs_result)


def benchmark(path):
    file = path / "test_benchmark.bin"
    data = b"0" * (1024 * 1024)
    size = 100

    # Medir escritura
    start = time.perf_counter()

    with open(file, "wb") as f:
        for i in range(size):
            f.write(data)
        f.flush()
        os.fsync(f.fileno())

    write_time = time.perf_counter() - start

    # Medir lectura
    start = time.perf_counter()

    with open(file, "rb") as f:
        while f.read(1024 * 1024):
            pass

    read_time = time.perf_counter() - start

    file.unlink()

    print(f"Escritura: {write_time:.4f} segundos")
    print(f"Lectura: {read_time:.4f} segundos")

    return write_time, read_time


def relation_aspect(normal_result, tmpfs_result):
    write_ratio = normal_result[0] / tmpfs_result[0]
    read_ratio = normal_result[1] / tmpfs_result[1]

    print("\n=== COMPARACION ===")
    print(f"Relacion escritura: {write_ratio:.2f}x")
    print(f"Relacion lectura: {read_ratio:.2f}x")

    return write_ratio


if __name__ == "__main__":
    main()
