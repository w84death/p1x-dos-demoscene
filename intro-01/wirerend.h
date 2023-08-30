#ifndef _WIRE_REND_H_
#define _WIRE_REND_H_

struct Vertex {
    float x, y, z;
};

struct Line {
    int v1, v2;
};

struct Polygon {
    int v1, v2, v3;
};

struct Point2D {
    float x, y;
};

class WireRend {
public:
    WireRend();

    Point2D project(const Vertex& v);

    Vertex rotateX(Vertex v, float angle);
    Vertex rotateY(Vertex v, float angle);
    Vertex rotateZ(Vertex v, float angle);
    Vertex translate(Vertex v, float dx, float dy, float dz);

    void drawLine(Point2D p1, Point2D p2, unsigned char* buffer, int width, int height);
    void render(const Vertex* vertices, int vertexCount, const Polygon* polygons, int polygonCount, unsigned char* buffer, int width, int height);
    void drawTriangle(const Polygon& poly, const Vertex* vertices, unsigned char* buffer, int width, int height);

    Vertex calculateNormal(const Polygon& poly, const Vertex* vertices);
    bool isBackface(const Polygon& poly, const Vertex* vertices);
    bool compareZ(const Vertex& v1, const Vertex& v2)
    void sortVerticesByZ(Vertex* vertices, int vertexCount);
};

#endif
