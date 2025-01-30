shader_type canvas_item;
render_mode unshaded;

uniform float circle_size = 0.1; // 圆的大小（适应全局坐标）
uniform float feather = 0.05;    // 过渡柔和度
uniform vec2 circle_position = vec2(960.0, 540.0); // 以像素为单位的全局坐标
uniform vec2 screen_size = vec2(1920.0, 1080.0);   // 屏幕分辨率

void fragment() {
    // 将全局坐标转换为 UV 空间（0~1）
    vec2 circle_uv = circle_position / screen_size;

    // 计算像素相对于 circle_position 的归一化位置
    float dist = distance(SCREEN_UV, circle_uv);

    // 计算透明度
    float edge_start = circle_size - feather;
    float edge_end = circle_size + feather;
    COLOR.a = smoothstep(edge_start, edge_end, dist);
}
