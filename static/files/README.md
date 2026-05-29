# J. Alex Baecher CV Templates

This repository contains code-based CV templates in both **Quarto (QMD)** and **RMarkdown (RMD)** formats, designed for easy editing in RStudio or Positron.

## Files Included

- `baecher_cv.qmd` - Quarto version (recommended for modern workflows)
- `baecher_cv.Rmd` - RMarkdown version (traditional approach)
- `cv-header.tex` - LaTeX header for PDF formatting
- `cv-style.css` - CSS styling for HTML output
- `README.md` - This file

## Prerequisites

### Required R Packages

```r
install.packages(c(
  "tidyverse",
  "knitr", 
  "kableExtra",
  "rmarkdown"
))
```

### For Quarto (QMD) - Recommended

```r
# Install Quarto from: https://quarto.org/docs/get-started/
# Or in RStudio: Tools > Install Quarto
```

### For LaTeX (PDF output)

**Option 1: TinyTeX (Recommended)**
```r
install.packages("tinytex")
tinytex::install_tinytex()
```

**Option 2: Full LaTeX Distribution**
- Mac: [MacTeX](https://tug.org/mactex/)
- Windows: [MiKTeX](https://miktex.org/)
- Linux: `sudo apt-get install texlive-full`

## Usage

### Using Quarto (QMD) - Recommended

1. Open `baecher_cv.qmd` in RStudio or Positron
2. Click the **Render** button (or press Cmd/Ctrl + Shift + K)
3. Choose output format:
   - PDF (default)
   - HTML
   - Both

**Command line:**
```bash
quarto render baecher_cv.qmd --to pdf
quarto render baecher_cv.qmd --to html
```

### Using RMarkdown (RMD)

1. Open `baecher_cv.Rmd` in RStudio
2. Click the **Knit** button (or press Cmd/Ctrl + Shift + K)
3. Choose output from dropdown:
   - Knit to PDF
   - Knit to HTML

**In R console:**
```r
rmarkdown::render("baecher_cv.Rmd", output_format = "pdf_document")
rmarkdown::render("baecher_cv.Rmd", output_format = "html_document")
```

## Customization Tips

### Adding Publications

The publications are numbered in reverse chronological order. To add new publications:

```markdown
16. **Baecher, JA**, Author2, Author3. 2026. Your new paper title. 
    *Journal Name* volume:pages [[HTML](url)] [[PDF](url)]
```

### Modifying the Funding Table

Edit the data frame in the R chunk:

```r
funding <- tribble(
  ~Amount, ~Organization, ~Fund, ~Year,
  "$150,000", "New Funding Agency", "Grant Name", "2026",
  # ... existing rows
)
```

### Changing Fonts (PDF)

In the YAML header, modify:

```yaml
format:
  pdf:
    mainfont: "Helvetica"  # or "Arial", "Georgia", etc.
    fontsize: 10pt          # or 11pt, 12pt
```

### Adjusting Margins

```yaml
format:
  pdf:
    geometry:
      - margin=1in        # change from 0.75in
```

### Customizing Colors (HTML)

Edit `cv-style.css`:

```css
a {
  color: #your-color-here;  /* Change link color */
}

h1 {
  border-bottom: 2px solid #your-color-here;  /* Change section line color */
}
```

## Features

### Dynamic Updates
- Auto-updates the "Last updated" date
- R code chunks for tables (easy to maintain)
- Conditional formatting for PDF vs HTML output

### Professional Styling
- Clean, academic layout
- Consistent spacing and typography
- Hyperlinked publications and resources
- Mobile-friendly HTML output

### Version Control Friendly
- Plain text files (easy to track changes with Git)
- No proprietary formats
- Reproducible output

## Troubleshooting

### "Package 'fontawesome5' not found"

Install the LaTeX package:
```r
tinytex::tlmgr_install("fontawesome5")
```

### PDF won't render

1. Check if LaTeX is installed:
```r
tinytex::is_tinytex()  # Should return TRUE
```

2. Install missing packages:
```r
tinytex::parse_install("baecher_cv.log")
```

### Table doesn't fit on page

Adjust the `scale_down` option in kable_styling:
```r
kable_styling(latex_options = c("scale_down", "HOLD_position"),
              font_size = 9)  # Reduce from 10
```

### Icons not showing

Make sure fontawesome5 is installed:
```r
tinytex::tlmgr_install("fontawesome5")
```

Or remove icon commands and use plain text:
```markdown
Email: jbaecher@gmail.com | Phone: 352-226-3983
```

## Advanced Customization

### Multiple CV Versions

Create variants for different purposes:

```r
# Academic version (full)
rmarkdown::render("baecher_cv.Rmd", 
                  output_file = "baecher_cv_academic.pdf")

# Industry version (condensed)
rmarkdown::render("baecher_cv_short.Rmd", 
                  output_file = "baecher_cv_industry.pdf")
```

### Automated Updates

Set up a script to automatically rebuild your CV:

```r
# auto_update_cv.R
library(rmarkdown)
render("baecher_cv.qmd", output_format = "all")
message("CV updated on: ", Sys.time())
```

### Git Integration

Track changes over time:

```bash
git init
git add baecher_cv.qmd cv-style.css
git commit -m "Initial CV commit"
```

## Why Use Code-Based CVs?

✅ **Version Control**: Track every change with Git  
✅ **Reproducibility**: Same source = same output  
✅ **Efficiency**: Update once, render to multiple formats  
✅ **Professional**: Clean, consistent formatting  
✅ **Maintainable**: Easy to update and reorganize  
✅ **No Software Lock-in**: Plain text, works anywhere  

## Recommended Workflow

1. **Edit** the .qmd or .Rmd file in RStudio/Positron
2. **Preview** frequently (render to HTML for speed)
3. **Commit** changes to Git regularly
4. **Render** final PDF when ready to share
5. **Update** dates and content as needed

## Resources

- [Quarto Documentation](https://quarto.org/docs/guide/)
- [RMarkdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)
- [kableExtra Guide](https://haozhu233.github.io/kableExtra/)
- [LaTeX Font Catalogue](https://tug.org/FontCatalogue/)

## Questions?

For questions about these templates, contact:
- Email: jbaecher@gmail.com
- Website: [alexbaecher.com](https://alexbaecher.com)

---

*Good luck with your code-based CV journey! 🎓*
