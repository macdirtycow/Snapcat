#!/bin/bash

mkdir -p Sources/Snapcat/Core
mkdir -p Sources/Snapcat/Hotkeys
mkdir -p Sources/Snapcat/UI
mkdir -p Sources/Snapcat/Recording
mkdir -p Sources/Snapcat/Annotation

touch Package.swift

for i in {1..40}
do
  FILE="Sources/Snapcat/Core/CoreModule$i.swift"
  echo "import Foundation" > $FILE

  for j in {1..100}
  do
     echo "func coreFunction_${i}_${j}() { print(\"core $i $j\") }" >> $FILE
  done
done
