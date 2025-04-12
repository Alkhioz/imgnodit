#!/bin/bash

TEST_DIR="./csrc/tests"
EXIT_CODE=0

echo "🔬 Running C tests in $TEST_DIR..."

for file in "$TEST_DIR"/*.c; do
  TEST_BIN="${file%.c}.out"
  echo "🔧 Compiling $file..."
  
  clang "$file" -o "$TEST_BIN" -I./csrc

  if [ $? -ne 0 ]; then
    echo "❌ Failed to compile $file"
    EXIT_CODE=1
    continue
  fi

  echo "🚀 Running $TEST_BIN..."
  ./"$TEST_BIN"

  if [ $? -ne 0 ]; then
    echo "❌ Test failed in $file"
    EXIT_CODE=1
  else
    echo "✅ Passed: $file"
  fi

  rm "$TEST_BIN"
done

exit $EXIT_CODE