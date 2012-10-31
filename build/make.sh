# --------------------------
#  RokkoGL Build Script
#  @author Rodrigo Silveira
# --------------------------

# --------------------------
# Globals
# --------------------------

ROOT_DIR="../"
CSS_DIR="${ROOT_DIR}css/"
JS_DIR="${ROOT_DIR}js/"

DEPLOY_DIR="../deploy/"
DEPLOY_CSS_DIR="${DEPLOY_DIR}css/"
DEPLOY_JS_DIR="${DEPLOY_DIR}js/"

# --------------------------
# Join Javascript files
# - js/lib/* (no particular order)
# - js/rokkogl/rokkogl.js
# - js/main.js
# --------------------------

echo "Joining Javascript Files"

OUT_JS="${DEPLOY_JS_DIR}html5-minecraft.js"
TEMP_JS="${DEPLOY_JS_DIR}lib.js"

touch ${TEMP_JS}
touch ${OUT_JS}

echo "" > ${TEMP_JS}
echo "" > ${OUT_JS}

cat ${JS_DIR}lib/*.js > ${TEMP_JS}
echo "" >> ${TEMP_JS}
echo "" >> ${TEMP_JS}
cat ${JS_DIR}rokkogl/rokkogl.js ${JS_DIR}main.js >> ${TEMP_JS}


# --------------------------
# Removing Javascript logs
# - remove calls to console.log(...)
# --------------------------

echo "Removing Javascript logs"
cat ${TEMP_JS} | grep -v "console.log(" > ${OUT_JS}

# --------------------------
# Copying static files
# - css/*
# --------------------------

echo "Copying static files"
cp ${CSS_DIR}* ${DEPLOY_CSS_DIR}

# --------------------------
# Cleaning up
# - remove temp files
# --------------------------

echo "Cleaning up"

rm ${TEMP_JS}


echo "Done!"
