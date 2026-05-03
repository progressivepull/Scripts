#!/bin/bash

# move_files_into_matching_folders.sh
# Test script for: loop.sh move

LOOP_SCRIPT="loop.sh"
TEST_DIR="test_move_files_into_matching_folders"

echo "Running test: move files into matching folders"
echo ""

# Reset test directory
rm -rf "$TEST_DIR"
mkdir "$TEST_DIR"
cd "$TEST_DIR" || exit

# ─────────────────────────────────────────────
# SETUP TEST STRUCTURE
# ─────────────────────────────────────────────
echo "Setting up test environment..."

# Matching folders
mkdir fileA fileB fileC

# Files that SHOULD be moved
echo "data" > fileA.txt
echo "data" > fileB.md
echo "data" > fileC.docx

# Files that should NOT be moved
echo "data" > unmatched.txt
mkdir random_folder

echo "Environment ready."
echo ""

# ─────────────────────────────────────────────
# RUN MOVE COMMAND
# ─────────────────────────────────────────────
echo "Running: loop.sh move"
$LOOP_SCRIPT move

echo ""
echo "Checking results..."
echo ""

PASS=true

# Check moved files
if [[ -f fileA/fileA.txt ]]; then
    echo "✔ PASS: fileA.txt moved correctly"
else
    echo "✘ FAIL: fileA.txt not moved"
    PASS=false
fi

if [[ -f fileB/fileB.md ]]; then
    echo "✔ PASS: fileB.md moved correctly"
else
    echo "✘ FAIL: fileB.md not moved"
    PASS=false
fi

if [[ -f fileC/fileC.docx ]]; then
    echo "✔ PASS: fileC.docx moved correctly"
else
    echo "✘ FAIL: fileC.docx not moved"
    PASS=false
fi

# Check files that should NOT be moved
if [[ -f unmatched.txt ]]; then
    echo "✔ PASS: unmatched.txt correctly left in place"
else
    echo "✘ FAIL: unmatched.txt was moved incorrectly"
    PASS=false
fi

echo ""

# ─────────────────────────────────────────────
# FINAL RESULT
# ─────────────────────────────────────────────
if [[ "$PASS" == true ]]; then
    echo "🎉 All move tests PASSED!"
else
    echo "❌ Some move tests FAILED."
fi

echo ""
echo "Test directory located at: $TEST_DIR/"
