Rokkogl.prototype.renderer = function(width, height) {
   this.rokkogl = ROKKOGL;
   var that = this;

   (function init(){
      console.log("Setting up global GL context");

      that.rokkogl.canvas.width = width;
      that.rokkogl.canvas.height = height;
      that.gl = that.rokkogl.canvas.getContext("experimental-webgl") || that.rokkogl.canvas.getContext("experimental-webgl");

      ROKKOGL = that.rokkogl;
   })();
};
