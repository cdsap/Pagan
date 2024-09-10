BUILD_CACHE_ENTRY="caches/build-cache-1"
TRANSFORM_CACHE_ENTRY="caches/**/transforms"
MODULES_CACHE_ENTRY="caches/modules-*/*"
JAR_CACHE_ENTRY="caches/jars-*/*"

if [[ "${{ inputs.mode }}" == "dependencies cache" ]]; then
    echo "GRADLE_HOME_CACHE_EXCLUDES=$BUILD_CACHE_ENTRY" 
elif [[ "${{ inputs.mode }}" == "dependencies cache - trasnforms cache" ]]; then
    echo "GRADLE_HOME_CACHE_EXCLUDES=$TRANSFORM_CACHE_ENTRY" 
elif [[ "${{ inputs.mode }}" == "remote task cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES" 
    echo "$BUILD_CACHE_ENTRY" 
    echo "$MODULES_CACHE_ENTRY" 
    echo "$JAR_CACHE_ENTRY" 
    echo "EOF" 
elif [[ "${{ inputs.mode }}" == "local task cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES" 
    echo "$MODULES_CACHE_ENTRY" 
    echo "$JAR_CACHE_ENTRY" 
    echo "EOF" 
elif [[ "${{ inputs.mode }}" == "local task cache + dependencies cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES=''" 
elif [[ "${{ inputs.mode }}" == "remote task cache + dependencies cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES='$BUILD_CACHE_ENTRY'" 
elif [[ "${{ inputs.mode }}" == "remote task cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES" 
    echo "$BUILD_CACHE_ENTRY" 
    echo "$MODULES_CACHE_ENTRY" 
    echo "$JAR_CACHE_ENTRY" 
    echo "$TRANSFORM_CACHE_ENTRY" 
    echo "EOF" 
elif [[ "${{ inputs.mode }}" == "local task cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES" 
    echo "$TRANSFORM_CACHE_ENTRY" 
    echo "$MODULES_CACHE_ENTRY" 
    echo "$JAR_CACHE_ENTRY" 
    echo "EOF" 
elif [[ "${{ inputs.mode }}" == "local task cache + dependencies cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES" 
    echo "$TRANSFORM_CACHE_ENTRY" 
    echo "EOF" 
elif [[ "${{ inputs.mode }}" == "remote task cache + dependencies cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES" 
    echo "$BUILD_CACHE_ENTRY" 
    echo "$TRANSFORM_CACHE_ENTRY" 
    echo "EOF" 
else
    echo "Unknown mode: ${{ inputs.mode }}"
    exit 1
fi
