#!/bin/bash

# deleting_files_and_folders.sh
# Test script for: loop.sh delete -s, -m, -d (safe and isolated)

LOOP_SCRIPT="loop.sh"
TEST_DIR="test_deleting_files_and_folders"

echo "Running deletion tests..."
echo ""

# Reset test directory
rm -rf "$TEST_DIR"
mkdir "$TEST_DIR"
cd "$TEST_DIR" || exit

# ─────────────────────────────────────────────
# SETUP TEST STRUCTURE
# ─────────────────────────────────────────────
echo "Setting up test environment..."
mkdir PROBLEM_1 PROBLEM_2 OTHER_DIR

# Files for -s test
echo "sample" > PROBLEM_1/target.md
mkdir PROBLEM_1/target_media

echo "sample" > PROBLEM_2/target.md
mkdir PROBLEM_2/target_media

# Files for -m test
echo "sample" > PROBLEM_1/PROBLEM_1.md
mkdir PROBLEM_1/PROBLEM_1_media

echo "sample" > PROBLEM_2/PROBLEM_2.md
mkdir PROBLEM_2/PROBLEM_2_media

# Folder for -d test
mkdir DELETE_ME

echo "Environment ready."
echo ""

# ─────────────────────────────────────────────
# TEST 1: delete -s target
# ─────────────────────────────────────────────
echo "TEST 1: delete -s target"
$LOOP_SCRIPT delete -s target

echo ""
echo "Checking results..."

if [[ ! -f PROBLEM_1/target.md && ! -d PROBLEM_1/target_media ]]; then
    echo "✔ PASS: PROBLEM_1 target files removed"
else
    echo "✘ FAIL: PROBLEM_1 target files still exist"
fi

if [[ ! -f PROBLEM_2/target.md && ! -d PROBLEM_2/target_media ]]; then
    echo "✔ PASS: PROBLEM_2 target files removed"
else
    echo "✘ FAIL: PROBLEM_2 target files still exist"
fi

echo ""

# ─────────────────────────────────────────────
# TEST 2: delete -m (PROBLEM_X cleanup)
# ─────────────────────────────────────────────
echo "TEST 2: delete -m"
$LOOP_SCRIPT delete -m

echo ""
echo "Checking results..."

if [[ ! -f PROBLEM_1/PROBLEM_1.md && ! -d PROBLEM_1/PROBLEM_1_media ]]; then
    echo "✔ PASS: PROBLEM_1 cleaned"
else
    echo "✘ FAIL: PROBLEM_1 cleanup incomplete"
fi

if [[ ! -f PROBLEM_2/PROBLEM_2.md && ! -d PROBLEM_2/PROBLEM_2_media ]]; then
    echo "✔ PASS: PROBLEM_2 cleaned"
else
    echo "✘ FAIL: PROBLEM_2 cleanup incomplete"
fi

echo ""

# ─────────────────────────────────────────────
# TEST 3: delete -d DELETE_ME
# ─────────────────────────────────────────────
echo "TEST 3: delete -d DELETE_ME"
$LOOP_SCRIPT delete -d DELETE_ME

echo ""
echo "Checking results..."

if [[ ! -d DELETE_ME ]]; then
    echo "✔ PASS: DELETE_ME folder removed"
else
    echo "✘ FAIL: DELETE_ME folder still exists"
fi

echo ""

echo "All deletion tests completed."
echo "Test directory located at: $TEST_DIR/"
