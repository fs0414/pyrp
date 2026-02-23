import polars as pl


def greet(name: str) -> str:
    return f"Hello, {name}!"

def stats(data: list[float]) -> dict[str, float]:
    df = pl.DataFrame({"value": data})
    summary = df.select(
        pl.col("value").mean().alias("mean"),
        pl.col("value").std().alias("std"),
        pl.col("value").min().alias("min"),
        pl.col("value").max().alias("max"),
    )
    print(df)
    print("🩵")
    print(summary)
    return {
        k: float(v[0]) if v[0] is not None else 0.0
        for k, v in summary.to_dict().items()
    }


def main():
    print(greet("pyrp"))

    scores = [85, 90, 78, 92, 88, 76, 95, 89]
    result = stats(scores)
    for key, value in result.items():
        print(f"  {key}: {value:.2f}")


if __name__ == "__main__":
    main()
