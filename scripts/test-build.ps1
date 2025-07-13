# Agri-Connect Frontend Deployment Test Script
# Run this to test if the frontend builds successfully before deployment

Write-Host "🚀 Testing Agri-Connect Frontend Build..." -ForegroundColor Green

# Navigate to client directory
Set-Location -Path "client"

# Set Node.js environment variable for OpenSSL compatibility
$env:NODE_OPTIONS = "--openssl-legacy-provider"
$env:NPM_CONFIG_LEGACY_PEER_DEPS = "true"

Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow
npm install --legacy-peer-deps

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
    
    Write-Host "🔨 Building frontend..." -ForegroundColor Yellow
    npm run build
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ BUILD SUCCESSFUL! Your app is ready for deployment!" -ForegroundColor Green
        Write-Host "📁 Build files created in: client/build/" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "🎯 Next Steps:" -ForegroundColor Magenta
        Write-Host "1. Deploy to Vercel with Root Directory: client" -ForegroundColor White
        Write-Host "2. Or try Netlify with Base Directory: client" -ForegroundColor White
        Write-Host "3. Set environment variables as documented" -ForegroundColor White
    } else {
        Write-Host "❌ Build failed! Check the error messages above." -ForegroundColor Red
        Write-Host "💡 Try running the commands manually to debug." -ForegroundColor Yellow
    }
} else {
    Write-Host "❌ Dependency installation failed!" -ForegroundColor Red
    Write-Host "💡 Try: npm cache clean --force" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "📖 For more help, see FINAL_DEPLOYMENT.md" -ForegroundColor Cyan
