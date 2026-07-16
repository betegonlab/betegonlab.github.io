#!/usr/bin/env bash
# Download all images, PDFs and STL files from the current Squarespace site
# into the repo, so the GitHub-hosted site is fully self-contained.
#
# Run this ONCE, from the repo root, WHILE the Squarespace site is still live:
#     bash fetch_assets.sh
#
# Requires curl (preinstalled on macOS and most Linux systems).

set -euo pipefail

CDN="https://images.squarespace-cdn.com/content/v1/625d8a67944fcf0a9c8daa48"
S="https://betegonlab.science/s"

mkdir -p assets/img assets/people assets/research assets/files

get () { # get <url> <dest>
  echo "  -> $2"
  curl -fsSL "$1" -o "$2"
}

echo "Logo + site image"
get "$CDN/506c59c3-9f2d-40f6-8f73-fc1d937005eb/Screen+Shot+2022-06-07+at+15.17.18.png?format=1500w" "assets/img/logo.png"
get "$CDN/a738b4e0-ee35-4a0f-b558-bb8b3f0e05b3/vision_institute.jpg" "assets/img/vision_institute.jpg"

echo "Research figures"
get "$CDN/3b0a4f47-14c5-42b3-810b-6095aeb20b3c/AAV_packaging.001.png" "assets/research/aav_packaging.png"
get "$CDN/64c76742-e182-42a5-8b36-c8774706633b/photoreceptor_proteostasis.png" "assets/research/photoreceptor_proteostasis.png"

echo "People photos"
get "$CDN/817a50ee-0b02-4734-998b-f180446ab042/Miguel.jpeg"         "assets/people/miguel.jpeg"
get "$CDN/a7ea1692-be1b-484c-ab22-6c35121f8789/Tommy.jpeg"          "assets/people/tommy.jpeg"
get "$CDN/67a240fb-6337-48b9-bac6-4bd18e490705/ThomasTugwell.jpg"   "assets/people/thomas.jpg"
get "$CDN/0feef039-cd04-4239-8f11-2555cea2afbd/Rhea.jpg"            "assets/people/rhea.jpg"
get "$CDN/6dc0b000-facd-4fe8-a211-16ed31e518fd/Samantha.jpeg"       "assets/people/samantha.jpeg"
get "$CDN/1760174b-fd66-4ec3-a492-c311f77b55a7/FolkweinHeather.jpg" "assets/people/heather.jpg"

echo "3D printable files"
get "$S/Conical_holder.stl" "assets/files/Conical_holder.stl"
get "$S/Gel_comb_wide.stl"  "assets/files/Gel_comb_wide.stl"
get "$S/aavstl.zip"         "assets/files/aavstl.zip"

echo "Publication PDFs"
get "$S/s41556-020-0476-1.pdf"              "assets/files/s41556-020-0476-1.pdf"
get "$S/1-s20-S1047847719302667-main.pdf"   "assets/files/1-s20-S1047847719302667-main.pdf"
get "$S/s41467-018-07012-4.pdf"             "assets/files/s41467-018-07012-4.pdf"
get "$S/1-s20-S1047847718301655-main.pdf"   "assets/files/1-s20-S1047847718301655-main.pdf"
get "$S/elife-25235-v2.pdf"                 "assets/files/elife-25235-v2.pdf"
get "$S/elife-04106-v1.pdf"                 "assets/files/elife-04106-v1.pdf"
get "$S/mBio00098-13.pdf"                   "assets/files/mBio00098-13.pdf"
get "$S/JVI06778-11.pdf"                    "assets/files/JVI06778-11.pdf"
get "$S/Genome-Res-2011-Earl-2224-41.pdf"   "assets/files/Genome-Res-2011-Earl-2224-41.pdf"

echo
echo "Done. All assets downloaded into ./assets/"
echo "Commit them:  git add assets && git commit -m 'Add site assets'"
