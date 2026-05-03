#!/bin/bash

# converting_documents.sh
# Test script for: loop.sh convert -s and -m

LOOP_SCRIPT="../loop.sh"
TEST_DIR="test_converting_documents"

echo "Running test: converting documents"
echo ""

# Reset test directory
rm -rf "$TEST_DIR"
mkdir "$TEST_DIR"
cd "$TEST_DIR" || exit

# ─────────────────────────────────────────────
# SETUP TEST STRUCTURE
# ─────────────────────────────────────────────
echo "Setting up test environment..."

mkdir A B

# Create fake .docx files (pandoc requires real files, so we create minimal valid ZIP containers)
echo "PK" > A/sample.docx
echo "PK" > B/another.docx

echo "Environment ready."
echo ""

# ─────────────────────────────────────────────
# TEST 1: convert -s sample
# ─────────────────────────────────────────────
echo "TEST 1: convert -s sample"
$LOOP_SCRIPT convert -s A/sample

echo ""
echo "Checking results..."

PASS=true

if [[ -f A/sample.md ]]; then
    echo "✔ PASS: sample.md created"
else
    echo "✘ FAIL: sample.md missing"
    PASS=false
fi

if [[ -d A/sample_media ]]; then
    echo "✔ PASS: sample_media folder created"
else
    echo "✘ FAIL: sample_media missing"
    PASS=false
fi

echo ""

# ─────────────────────────────────────────────
# TEST 2: convert -m (recursive)
# ─────────────────────────────────────────────
echo "TEST 2: convert -m"
$LOOP_SCRIPT convert -m

echo ""
echo "Checking results..."

if [[ -f B/another.md ]]; then
    echo "✔ PASS: another.md created"
else
    echo "✘ FAIL: another.md missing"
    PASS=false
fi

if [[ -d B/another_media ]]; then
    echo "✔ PASS: another_media folder created"
else
    echo "✘ FAIL: another_media missing"
    PASS=false
fi

echo ""

# ─────────────────────────────────────────────
# FINAL RESULT
# ─────────────────────────────────────────────
if [[ "$PASS" == true ]]; then
    echo "🎉 All convert tests PASSED!"
else
    echo "❌ Some convert tests FAILED."
fi

echo ""
echo "Test directory located at: $TEST_DIR/"
