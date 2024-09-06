BUILD_CACHE_ENTRY="caches/build-cache-1"
TRANSFORM_CACHE_ENTRY="caches/**/transforms"
MODULES_CACHE_ENTRY="caches/modules-*/*"
JAR_CACHE_ENTRY="caches/jars-*/*"
echo "sldslldsldls"
if [[ "${{ inputs.mode }}" == "dependencies cache" ]]; then
    echo "GRADLE_HOME_CACHE_EXCLUDES=$BUILD_CACHE_ENTRY" >> $GITHUB_ENV
elif [[ "${{ inputs.mode }}" == "dependencies cache - trasnforms cache" ]]; then
    echo "GRADLE_HOME_CACHE_EXCLUDES=$TRANSFORM_CACHE_ENTRY" >> $GITHUB_ENV
elif [[ "${{ inputs.mode }}" == "remote task cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $BUILD_CACHE_ENTRY >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV                     
elif [[ "${{ inputs.mode }}" == "local task cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV                     
elif [[ "${{ inputs.mode }}" == "local task cache + dependencies cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES=''" >> $GITHUB_ENV
elif [[ "${{ inputs.mode }}" == "remote task cache + dependencies cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES='$BUILD_CACHE_ENTRY'" >> $GITHUB_ENV
elif [[ "${{ inputs.mode }}" == "remote task cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $BUILD_CACHE_ENTRY >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV                     
elif [[ "${{ inputs.mode }}" == "local task cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV                     
elif [[ "${{ inputs.mode }}" == "local task cache + dependencies cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV                     
elif [[ "${{ inputs.mode }}" == "remote task cache + dependencies cache - transforms cache" ]]; then  
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $BUILD_CACHE_ENTRY >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
else
    echo "Unknown mode: ${{ inputs.mode }}"
    exit 1
fi