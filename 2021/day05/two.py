from collections import defaultdict


def get_input():
    data = []
    with open("input") as f:
        data = f.readlines()
    return data


def get_points(p1, p2):
    points = set()
    x1, x2 = p1[0], p2[0]
    y1, y2 = p1[1], p2[1]

    x, y = x1, y1
    while (not x == x2) or (not y == y2):
        points.add((x, y))
        if x < x2:
            x += 1
        elif x > x2:
            x -= 1

        if y < y2:
            y += 1
        elif y > y2:
            y -= 1
    points.add((x2, y2))
    return list(points)


def clean_point(p):
    return list(map(int, p.split(",")))


def solve(data):

    d = defaultdict(int)
    for line in data:
        p1, p2 = line.split(" -> ")
        p1, p2 = clean_point(p1), clean_point(p2)
        for point in get_points(p1, p2):
            d[tuple(point)] += 1

    return len([d[point] for point in d if d[point] >= 2])


print(solve(get_input()))