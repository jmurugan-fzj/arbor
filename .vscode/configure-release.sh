#!/usr/bin/env bash
# --------------------------------------------------------------
# configure‑release.sh
#   * removes an old build‑release folder (if any)
#   * creates a fresh folder
#   * runs CMake with Ninja in Release mode
# --------------------------------------------------------------

set -euo pipefail   # abort on errors, undefined vars, pipeline failures

# -----------------------------------------------------------------
# 1️⃣  Clean the old folder (if it exists)
# -----------------------------------------------------------------
BUILD_DIR="build-release"

if [ -d "${BUILD_DIR}" ]; then
    echo "🧹 Removing old '${BUILD_DIR}' folder …"
    rm -rf "${BUILD_DIR}"
fi

# -----------------------------------------------------------------
# 2️⃣  Create a fresh folder
# -----------------------------------------------------------------
echo "📁 Creating '${BUILD_DIR}' folder …"
mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"

# -----------------------------------------------------------------
# 3️⃣  Run CMake (Ninja generator, Release configuration)
# -----------------------------------------------------------------
echo "⚙️  Running CMake (Release, Ninja) …"
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DARB_WITH_PROFILING=ON ..

echo "✅  Configuration finished – you can now build with 'ninja' or press ⌃⇧B again."