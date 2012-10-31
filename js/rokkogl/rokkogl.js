var Rokkogl = function() {
   this.canvas = document.createElement("canvas");
   this.gl = null;
};

// Hold the global WebGL context that all modules can share
window.ROKKOGL = new Rokkogl();
