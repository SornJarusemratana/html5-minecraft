attribute vec3 aVertPos;
attribute vec4 aVertColor;

uniform mat4 umModelView;
uniform mat4 umProjection;

varying vec4 vColor;

void main(void) {
   vColor = aVertColor;
   gl_Position = umProjection * umModelView * vec4(aVertPos, 1.0);
}
