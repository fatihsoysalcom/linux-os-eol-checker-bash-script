#!/bin/bash

# This script simulates checking your Linux distribution's End-of-Life (EOL) status.
# It highlights the importance of knowing EOL dates for server migration planning,
# especially in light of CentOS 7 and 8 reaching EOL.

echo "--- Linux OS EOL Status Checker ---"
echo "This script helps you understand the concept of OS End-of-Life (EOL),"
echo "a critical factor for server security and migration planning."
echo ""

# Attempt to identify the current operating system
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_NAME=${NAME}
    OS_VERSION=${VERSION_ID}
    OS_PRETTY_NAME=${PRETTY_NAME}
else
    echo "Error: Could not determine OS details from /etc/os-release."
    echo "This script is designed for Linux systems using systemd's os-release standard."
    exit 1
fi

echo "Detected OS: ${OS_PRETTY_NAME}"

# Simulate EOL check based on common distributions and the article's context
case "${OS_NAME}" in
    "CentOS Linux")
        if [[ "${OS_VERSION}" == "7" ]]; then
            # Illustrates the main point of the article: CentOS 7 EOL
            echo "WARNING: CentOS 7 reached End-of-Life (EOL) in June 2024. IMMEDIATE MIGRATION IS REQUIRED!"
            echo "  Continuing to use CentOS 7 poses significant security risks due to lack of updates."
            echo "  Consider migrating to alternatives like Rocky Linux, AlmaLinux, Red Hat Enterprise Linux (RHEL), or Ubuntu LTS."
        elif [[ "${OS_VERSION}" == "8" ]]; then
            # Illustrates the main point of the article: CentOS 8 EOL
            echo "WARNING: CentOS 8 reached End-of-Life (EOL) in December 2021. IMMEDIATE MIGRATION IS REQUIRED!"
            echo "  Continuing to use CentOS 8 poses significant security risks due to lack of updates."
            echo "  Consider migrating to alternatives like Rocky Linux, AlmaLinux, Red Hat Enterprise Linux (RHEL), or Ubuntu LTS."
        elif [[ "${OS_NAME}" == "CentOS Stream" ]]; then
            echo "INFO: You are running CentOS Stream ${OS_VERSION}. This is a rolling release, not traditional CentOS."
            echo "  CentOS Stream serves as an upstream for RHEL. Understand its development model for long-term planning."
        else
            echo "INFO: CentOS version detected, but not 7 or 8. Please check official CentOS documentation for specific EOL dates."
        fi
        ;;
    "Red Hat Enterprise Linux")
        echo "INFO: Red Hat Enterprise Linux (RHEL) detected. RHEL offers long-term support."
        echo "  Ensure your subscription is active and keep your system updated to receive security patches and support."
        ;;
    "Rocky Linux" | "AlmaLinux")
        echo "INFO: You are running a RHEL-compatible distribution (Rocky Linux/AlmaLinux)."
        echo "  These distributions are designed as binary-compatible replacements for CentOS and offer long-term support."
        echo "  Keep your system updated for security and stability."
        ;;
    "Ubuntu")
        if [[ "${OS_VERSION}" =~ ^(20.04|22.04) ]]; then # Check for common LTS versions
            echo "INFO: Ubuntu LTS (Long Term Support) detected. LTS versions offer extended support."
            echo "  Check official Ubuntu lifecycle for specific EOL dates and plan for future upgrades."
        else
            echo "INFO: Ubuntu (non-LTS or older LTS) detected. Non-LTS versions have shorter support cycles."
            echo "  It is critical to check official Ubuntu lifecycle for EOL dates and plan upgrades accordingly."
        fi
        ;;
    "Debian GNU/Linux")
        echo "INFO: Debian GNU/Linux detected. Debian offers stable releases with good community support."
        echo "  Check official Debian lifecycle for specific EOL dates for your release version."
        ;;
    *)
        echo "INFO: Detected OS '${OS_NAME} ${OS_VERSION}'. This script does not have specific EOL information for it."
        echo "  It is crucial to manually check the official End-of-Life dates for your operating system to ensure security and support."
        ;;
esac

echo "\n--- Remember: Proactive migration planning is essential for server security and business continuity! ---"
