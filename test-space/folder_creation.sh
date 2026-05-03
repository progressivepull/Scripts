#!/bin/bash

# folder_create.sh
# Test script for: loop.sh create -f <start> <end> '<pattern>'

TEST_DIR="test_folder_creation"
LOOP_SCRIPT="loop.sh"

echo "Running folder creation test..."
echo ""

# Create a clean test directory
rm -rf "$TEST_DIR"
mkdir "$TEST_DIR"
cd "$TEST_DIR" || exit

# Run the folder creation command
echo "Creating folders PROBLEM_1 to PROBLEM_5..."
$LOOP_SCRIPT create -f 1 5 "PROBLEM_*"

echo ""
echo "Checking results..."
echo ""

# Track results
PASS=true

for i in {1..5}; do
    folder="PROBLEM_$i"
    if [[ -d "$folder" ]]; then
        echo "✔ PASS: $folder exists"
    else
        echo "✘ FAIL: $folder missing"
        PASS=false
    fi
done

echo ""
if [[ "$PASS" == true ]]; then
    echo "🎉 All folder creation tests PASSED!"
else
    echo "❌ Some folder creation tests FAILED."
fi

echo ""
echo "Test directory located at: $TEST_DIR/"
