#!/bin/bash

# Install gitleaks pre-commit hook
# This script can be copied to any git repository to install the same pre-commit hook

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔧 Installing gitleaks pre-commit hook...${NC}"

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Error: Not in a git repository${NC}"
    echo -e "${YELLOW}Please run this script from the root of a git repository${NC}"
    exit 1
fi

# Check if gitleaks is installed
if ! command -v gitleaks &> /dev/null; then
    echo -e "${YELLOW}⚠️  gitleaks is not installed${NC}"
    echo -e "${YELLOW}Installing with Homebrew...${NC}"
    
    if command -v brew &> /dev/null; then
        brew install gitleaks
    else
        echo -e "${RED}❌ Homebrew not found${NC}"
        echo -e "${YELLOW}Please install gitleaks manually:${NC}"
        echo -e "  • macOS: brew install gitleaks"
        echo -e "  • Or visit: https://github.com/gitleaks/gitleaks"
        exit 1
    fi
fi

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

# Check if pre-commit hook already exists
if [ -f ".git/hooks/pre-commit" ]; then
    echo -e "${YELLOW}⚠️  pre-commit hook already exists${NC}"
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Installation cancelled${NC}"
        exit 0
    fi
fi

# Create the pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash

# Git pre-commit hook to prevent secrets from being committed
# Uses gitleaks to scan for secrets in staged files

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🔍 Scanning for secrets with gitleaks...${NC}"

# Check if gitleaks is installed
if ! command -v gitleaks &> /dev/null; then
    echo -e "${RED}❌ Error: gitleaks is not installed${NC}"
    echo -e "${YELLOW}Install with: brew install gitleaks${NC}"
    echo -e "${YELLOW}Or visit: https://github.com/gitleaks/gitleaks${NC}"
    exit 1
fi

# Run gitleaks on git staged files using pipes
if git diff --cached | gitleaks detect --pipe --verbose --no-banner; then
    echo -e "${GREEN}✅ No secrets detected - commit allowed${NC}"
    exit 0
else
    echo -e "${RED}❌ Secrets detected in staged files!${NC}"
    echo -e "${YELLOW}💡 To fix:${NC}"
    echo -e "  1. Remove the secrets from your files"
    echo -e "  2. Use environment variables or Bruno's secret variables instead"
    echo -e "  3. Stage your changes again and retry the commit"
    echo -e ""
    echo -e "${YELLOW}💡 For Bruno collections:${NC}"
    echo -e "  - Mark sensitive values as 'Secret' in Bruno environments"
    echo -e "  - Use {{variableName}} syntax for sensitive data"
    echo -e ""
    echo -e "${RED}Commit aborted to prevent secrets from being committed${NC}"
    exit 1
fi
EOF

# Make the hook executable
chmod +x .git/hooks/pre-commit

echo -e "${GREEN}✅ Gitleaks pre-commit hook installed successfully!${NC}"
echo -e "${BLUE}📝 The hook will now scan for secrets before each commit${NC}"
echo -e ""
echo -e "${YELLOW}💡 To use this hook in other repositories:${NC}"
echo -e "  1. Copy this script to the target repository"
echo -e "  2. Run: ./install-gitleaks-hook.sh"
echo -e ""
echo -e "${YELLOW}🧪 To test the hook, try committing a file with a fake API key${NC}"