#!/bin/bash

# clean_safe_mode.sh
# Test script for: loop.sh clean (SAFE MODE)

LOOP_SCRIPT="loop.sh"
TEST_DIR="test_clean_safe_mode"

echo "Running test: clean (safe mode)"
echo ""

# Reset test directory
rm -rf "$TEST_DIR"
mkdir "$TEST_DIR"
cd "$TEST_DIR" || exit

# ─────────────────────────────────────────────
# SETUP TEST STRUCTURE
# ─────────────────────────────────────────────
echo "Setting up test environment..."

mkdir A B C

# Create .md files
echo "sample" > A/file1.md
echo "sample" > B/file2.md

# Create _media folders
mkdir A/file1_media
mkdir C/extra_media

echo "Environment ready."
echo ""

# ─────────────────────────────────────────────
# RUN CLEAN COMMAND
# ─────────────────────────────────────────────
echo "Running: loop.sh clean"
CLEAN_OUTPUT=$($LOOP_SCRIPT clean)

echo ""
echo "Checking results..."
echo ""

PASS=true

# Check .md files appear in output
if echo "$CLEAN_OUTPUT" | grep -q "A/file1.md"; then
    echo "✔ PASS: A/file1.md listed"
else
    echo "✘ FAIL: A/file1.md missing from clean output"
    PASS=false
fi

if echo "$CLEAN_OUTPUT" | grep -q "B/file2.md"; then
    echo "✔ PASS: B/file2.md listed"
else
    echo "✘ FAIL: B/file2.md missing from clean output"
    PASS=false
fi

# Check _media folders appear in output
if echo "$CLEAN_OUTPUT" | grep -q "A/file1_media"; then
    echo "✔ PASS: A/file1_media listed"
else
    echo "✘ FAIL: A/file1_media missing from clean output"
    PASS=false
fi

if echo "$CLEAN_OUTPUT" | grep -q "C/extra_media"; then
    echo "✔ PASS: C/extra_media listed"
else
    echo "✘ FAIL: C/extra_media missing from clean output"
    PASS=false
fi

# Ensure nothing was actually deleted
if [[ -f A/file1.md && -f B/file2.md && -d A/file1_media && -d C/extra_media ]]; then
    echo "✔ PASS: No files were deleted (safe mode confirmed)"
else
    echo "✘ FAIL: Some files were unexpectedly deleted"
    PASS=false
fi

echo ""
if [[ "$PASS" == true ]]; then
    echo "🎉 All clean (safe mode) tests PASSED!"
else
    echo "❌ Some clean (safe mode) tests FAILED."
fi

echo ""
echo "Test directory located at: $TEST_DIR/"
