#!/bin/bash

# project_status.sh
# Test script for: loop.sh status

LOOP_SCRIPT="../loop.sh"
TEST_DIR="test_project_status"

echo "Running test: project status"
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
# RUN STATUS COMMAND
# ─────────────────────────────────────────────
echo "Running: loop.sh status"
STATUS_OUTPUT=$($LOOP_SCRIPT status)

echo ""
echo "Checking results..."
echo ""

PASS=true

# Check .md files
if echo "$STATUS_OUTPUT" | grep -q "A/file1.md"; then
    echo "✔ PASS: A/file1.md detected"
else
    echo "✘ FAIL: A/file1.md missing from status output"
    PASS=false
fi

if echo "$STATUS_OUTPUT" | grep -q "B/file2.md"; then
    echo "✔ PASS: B/file2.md detected"
else
    echo "✘ FAIL: B/file2.md missing from status output"
    PASS=false
fi

# Check _media folders
if echo "$STATUS_OUTPUT" | grep -q "A/file1_media"; then
    echo "✔ PASS: A/file1_media detected"
else
    echo "✘ FAIL: A/file1_media missing from status output"
    PASS=false
fi

if echo "$STATUS_OUTPUT" | grep -q "C/extra_media"; then
    echo "✔ PASS: C/extra_media detected"
else
    echo "✘ FAIL: C/extra_media missing from status output"
    PASS=false
fi

echo ""
if [[ "$PASS" == true ]]; then
    echo "🎉 All project status tests PASSED!"
else
    echo "❌ Some project status tests FAILED."
fi

echo ""
echo "Test directory located at: $TEST_DIR/"
