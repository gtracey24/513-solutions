Write-Host "🔧 Building Property Management site..."

# Path to PM repo (adjust if yours is different)
$pmRepo = "../513-property"

# Build PM site
Set-Location $pmRepo
php build/build.php

Write-Host "📦 Copying PM /dist into Solutions..."

# Back to Solutions repo
Set-Location "../513-solutions"

# Remove old PM build
Remove-Item -Recurse -Force "dist/property-management" -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path "dist/property-management" | Out-Null

# Copy new PM build
Copy-Item "$pmRepo/dist/*" "dist/property-management/" -Recurse

Write-Host "🚀 Building Solutions site..."
php build/build.php

Write-Host "✅ PM site imported and Solutions rebuilt."
Write-Host "👉 Now run: git add . ; git commit -m 'Update PM site' ; git push"
