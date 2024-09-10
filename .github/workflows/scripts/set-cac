#!/bin/bash

BUILD_CACHE_ENTRY="caches/build-cache-1"
TRANSFORM_CACHE_ENTRY="caches/**/transforms"
MODULES_CACHE_ENTRY="caches/modules-*/*"
JAR_CACHE_ENTRY="caches/jars-*/*"

case "${1}" in
  "dependencies cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES=$BUILD_CACHE_ENTRY" >> $GITHUB_ENV
    ;;
  "dependencies cache - transforms cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES=$TRANSFORM_CACHE_ENTRY" >> $GITHUB_ENV
    ;;
  "remote task cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $BUILD_CACHE_ENTRY >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV
    ;;
  "local task cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV
    ;;
  "local task cache + dependencies cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES=''" >> $GITHUB_ENV
    ;;
  "remote task cache + dependencies cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES='$BUILD_CACHE_ENTRY'" >> $GITHUB_ENV
    ;;
  "remote task cache - transforms cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $BUILD_CACHE_ENTRY >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV
    ;;
  "local task cache - transforms cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
    echo $MODULES_CACHE_ENTRY >> $GITHUB_ENV
    echo $JAR_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV
    ;;
  "local task cache + dependencies cache - transforms cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV
    ;;
  "remote task cache + dependencies cache - transforms cache")
    echo "GRADLE_HOME_CACHE_EXCLUDES<<EOF" >> $GITHUB_ENV
    echo $BUILD_CACHE_ENTRY >> $GITHUB_ENV
    echo $TRANSFORM_CACHE_ENTRY >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV
    ;;
  *)
    echo "Unknown mode: ${1}"
    exit 1
    ;;
esac