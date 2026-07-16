# Betegon Lab website

Static [Jekyll](https://jekyllrb.com/) site for **betegonlab.science**, hosted free on GitHub Pages.

## One-time setup

1. **Download the assets** (images, PDFs, STL files) from the old Squarespace site
   while it is *still live*:

   ```bash
   bash fetch_assets.sh
   git add assets && git commit -m "Add site assets"
   ```

2. **Create a GitHub repo** and push this folder:

   ```bash
   git init
   git add .
   git commit -m "Initial site"
   git branch -M main
   git remote add origin https://github.com/<you>/<repo>.git
   git push -u origin main
   ```

3. **Turn on Pages**: repo → *Settings → Pages → Build and deployment →
   Source = **GitHub Actions***. The included workflow (`.github/workflows/deploy.yml`)
   builds and deploys on every push to `main`.

4. **Point your domain**: the `CNAME` file already sets `betegonlab.science`.
   At your DNS provider add these records (delete the old Squarespace ones):

   | Type  | Host  | Value                 |
   |-------|-------|-----------------------|
   | A     | @     | 185.199.108.153       |
   | A     | @     | 185.199.109.153       |
   | A     | @     | 185.199.110.153       |
   | A     | @     | 185.199.111.153       |
   | CNAME | www   | `<you>.github.io.`    |

   Then in *Settings → Pages*, confirm the custom domain and tick
   **Enforce HTTPS** (may take a few minutes to become available).

## Editing content

- **Pages**: `index.html`, `research.html`, `people.html`, `publications.html`,
  `contact.html`, `3d-printing.html`.
- **People**: edit `_data/people.yml` — no HTML needed.
- **Publications**: edit `_data/publications.yml` — add new entries at the top.
- **Styling**: `assets/css/style.css`.
- **Nav / site title**: `_config.yml`.

## Preview locally (optional)

```bash
bundle install
bundle exec jekyll serve
# open http://localhost:4000
```
