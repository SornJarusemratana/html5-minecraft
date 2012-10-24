attribute vec3 aVertPos;

uniform mat4 umModelView;
uniform mat4 umProjection;

void main(void) {
   gl_Position = umProjection * umModelView * vec4(aVertPos, 1.0);
}
