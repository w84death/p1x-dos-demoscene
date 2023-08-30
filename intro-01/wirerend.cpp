#include "wirerend.h"
#include <algorithm>
#include <cmath>

#define FOV 500

WireRend::WireRend() {
    // Constructor
}

Point2D WireRend::project(const Vertex& v) {
    Point2D p;
    p.x = v.x * FOV / (v.z + FOV);
    p.y = v.y * FOV / (v.z + FOV);
    return p;
}

Vertex WireRend::rotateX(Vertex v, float angle) {
    Vertex result;
    float cosine = cos(angle);
    float sine = sin(angle);
    result.x = v.x;
    result.y = v.y * cosine - v.z * sine;
    result.z = v.y * sine + v.z * cosine;
    return result;
}

Vertex WireRend::rotateY(Vertex v, float angle) {
    Vertex result;
    float cosine = cos(angle);
    float sine = sin(angle);
    result.x = v.x * cosine + v.z * sine;
    result.y = v.y;
    result.z = -v.x * sine + v.z * cosine;
    return result;
}

Vertex WireRend::rotateZ(Vertex v, float angle) {
    Vertex result;
    float cosine = cos(angle);
    float sine = sin(angle);
    result.x = v.x * cosine - v.y * sine;
    result.y = v.x * sine + v.y * cosine;
    result.z = v.z;
    return result;
}

Vertex WireRend::translate(Vertex v, float dx, float dy, float dz) {
    v.x += dx;
    v.y += dy;
    v.z += dz;
    return v;
}

void WireRend::drawLine(Point2D p1, Point2D p2, unsigned char* buffer, int width, int height) {
    int dx = abs(p2.x - p1.x);
    int dy = abs(p2.y - p1.y);
    int sx = (p1.x < p2.x) ? 1 : -1;
    int sy = (p1.y < p2.y) ? 1 : -1;
    int err = dx - dy;

    while (true) {
        if (p1.x >= 0 && p1.x < width && p1.y >= 0 && p1.y < height) {
            buffer[int(p1.y) * width + int(p1.x)] = 255;  // Set pixel
        }

        if (p1.x == p2.x && p1.y == p2.y) break;

        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            p1.x += sx;
        }
        if (e2 < dx) {
            err += dx;
            p1.y += sy;
        }
    }
}

Vertex WireRend::calculateNormal(const Polygon& poly, const Vertex* vertices) {
    Vertex normal;
    Vertex u = {vertices[poly.v2].x - vertices[poly.v1].x,
                vertices[poly.v2].y - vertices[poly.v1].y,
                vertices[poly.v2].z - vertices[poly.v1].z};

    Vertex v = {vertices[poly.v3].x - vertices[poly.v1].x,
                vertices[poly.v3].y - vertices[poly.v1].y,
                vertices[poly.v3].z - vertices[poly.v1].z};

    normal.x = u.y * v.z - u.z * v.y;
    normal.y = u.z * v.x - u.x * v.z;
    normal.z = u.x * v.y - u.y * v.x;

    return normal;
}

bool WireRend::isBackface(const Polygon& poly, const Vertex* vertices) {
    Vertex normal = calculateNormal(poly, vertices);
    return normal.z >= 0;
}

void WireRend::render(const Vertex* vertices, int vertexCount, const Polygon* polygons, int polygonCount, unsigned char* buffer, int width, int height) {
    for (int i = 0; i < polygonCount; i++) {
        if (!isBackface(polygons[i], vertices)) {
            drawTriangle(polygons[i], vertices, buffer, width, height);
        }
    }
}

void WireRend::drawTriangle(const Polygon& poly, const Vertex* vertices, unsigned char* buffer, int width, int height) {
    Point2D p1 = project(vertices[poly.v1]);
    Point2D p2 = project(vertices[poly.v2]);
    Point2D p3 = project(vertices[poly.v3]);
    drawLine(p1, p2, buffer, width, height);
    drawLine(p2, p3, buffer, width, height);
    drawLine(p1, p3, buffer, width, height);
}

bool WireRend::compareZ(const Vertex& v1, const Vertex& v2) {
    return v1.z < v2.z;
}

void WireRend::sortVerticesByZ(Vertex* vertices, int vertexCount) {
    std::sort(vertices, vertices + vertexCount, compareZ);
}
