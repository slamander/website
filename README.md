# Hugo Academic to Hugo Blox Migration Guide

This README explains the migration from Hugo Academic theme to Hugo Blox (formerly Wowchemy) using Hugo Modules instead of Git submodules.

## What Changed

### 1. Theme Evolution
- **Hugo Academic** → **Wowchemy** (Oct 2020) → **Hugo Blox** (2023)
- The theme is now distributed as Hugo Modules instead of a Git submodule
- Configuration has moved from TOML to YAML format
- Many widgets and shortcodes have been updated

### 2. Technical Changes
- **Git Submodules** → **Hugo Modules** (requires Go)
- **TOML config** → **YAML config**
- **Hugo 0.74.3** → **Hugo 0.124.1+**
- **No Go requirement** → **Go 1.21+ required**

## Files to Update/Replace

### New Files to Create
1. **`go.mod`** - Defines Hugo modules (replaces git submodule)
2. **`config/_default/hugo.yaml`** - Main Hugo configuration (replaces `config.toml`)
3. **`config/_default/params.yaml`** - Site parameters (replaces `params.toml`)
4. **`config/_default/menus.yaml`** - Navigation menus (replaces `menus.toml`)

### Files to Remove
1. **`.gitmodules`** - No longer needed with Hugo modules
2. **`themes/` directory** - Theme files are now handled by Hugo modules
3. **`config/_default/config.toml`** - Replaced by `hugo.yaml`
4. **`config/_default/params.toml`** - Replaced by `params.yaml`
5. **`config/_default/menus.toml`** - Replaced by `menus.yaml`
6. **`config/_default/languages.toml`** - Can be removed if only using English

### Files to Update
1. **`netlify.toml`** - Updated Hugo/Go versions and build settings
2. **`README.md`** - Update links and documentation

## Migration Steps

### Step 1: Clean Up Old Files
```bash
# Remove git submodule
git submodule deinit themes/academic
git rm themes/academic
rm -rf .git/modules/themes/academic
rm .gitmodules

# Remove old config files
rm config/_default/config.toml
rm config/_default/params.toml  
rm config/_default/menus.toml
rm config/_default/languages.toml  # if present
```

### Step 2: Add New Files
Copy the new configuration files to your repository:
- `go.mod` → root directory
- `config/_default/hugo.yaml`
- `config/_default/params.yaml`
- `config/_default/menus.yaml`
- Update `netlify.toml`

### Step 3: Initialize Hugo Modules
```bash
# Initialize as Hugo module
hugo mod init github.com/yourusername/your-repo-name

# Download module dependencies
hugo mod get -u
```

### Step 4: Test Locally
```bash
# Install Hugo extended version (0.124.1+)
# Install Go (1.21+)

# Test the site
hugo server --buildDrafts
```

### Step 5: Deploy
1. Update your repository with the new files
2. Remove old files from git
3. Push to GitHub
4. Netlify should automatically detect the new configuration

## Key Configuration Changes

### Hugo Modules
The new `go.mod` file replaces the git submodule approach:
```go
module github.com/slamander/alexbaecher-website

go 1.21

require (
    github.com/HugoBlox/hugo-blox-builder/modules/blox-plugin-netlify v1.1.2-0.20231108143325-448ed0e3bd2b
    github.com/HugoBlox/hugo-blox-builder/modules/blox-tailwind v0.2.1-0.20240602131307-11c94a319c59
)
```

### YAML vs TOML
Configuration is now in YAML format, which is more readable:
```yaml
# YAML (new)
title: 'Baecher Research'
baseURL: 'https://alexbaecher.com'
```

Instead of:
```toml
# TOML (old)  
title = "Baecher Research"
baseurl = "https://alexbaecher.com"
```

### Widget Updates
Some widgets may need updating. Common changes:
- `hero.md` → `slider.md` 
- Some widget parameters have changed
- Check Hugo Blox documentation for current widget syntax

## Troubleshooting

### Common Issues
1. **"module not found"** → Run `hugo mod get -u`
2. **"template not found"** → Widget syntax may have changed
3. **CSS not loading** → Check if Tailwind module is included
4. **Build fails** → Ensure Hugo Extended version is installed

### Content Migration
Your content files (publications, posts, etc.) should work with minimal changes, but you may need to update:
- Front matter parameters that have changed
- Widget configurations in `content/home/`
- Shortcode syntax that has been updated

### Getting Help
- [Hugo Blox Documentation](https://docs.hugoblox.com/)
- [Hugo Blox GitHub](https://github.com/HugoBlox/hugo-blox-builder)
- [Hugo Modules Documentation](https://gohugo.io/hugo-modules/)

## Next Steps After Migration

1. **Review widgets** - Check `content/home/` files for any deprecated parameters
2. **Update content** - Review publications, posts, and projects for any formatting issues
3. **Test features** - Verify search, comments, and other interactive features work
4. **Customize theme** - Use the new Hugo Blox theming system if needed
5. **Performance** - The new system should be faster and more maintainable

## Backup Recommendation

Before making these changes, create a backup branch:
```bash
git checkout -b backup-before-migration
git push origin backup-before-migration
git checkout main
```

This allows you to revert if needed while working through the migration.
