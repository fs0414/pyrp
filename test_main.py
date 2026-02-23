from main import greet, stats


def test_greet():
    assert greet("world") == "Hello, world!"
    assert greet("pyrp") == "Hello, pyrp!"


def test_greet_empty():
    assert greet("") == "Hello, !"


def test_stats_basic():
    result = stats([1.0, 2.0, 3.0])
    assert result["mean"] == 2.0
    assert result["min"] == 1.0
    assert result["max"] == 3.0


def test_stats_single():
    result = stats([42.0])
    assert result["mean"] == 42.0
    assert result["std"] == 0.0
