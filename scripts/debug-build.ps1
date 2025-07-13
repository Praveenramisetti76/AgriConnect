# Debug Build Script - Test React App Build
Write-Host "🔍 Testing React App Build..." -ForegroundColor Cyan

# Navigate to client directory
Set-Location -Path "client"

# Set environment variables
$env:NODE_OPTIONS = "--openssl-legacy-provider"
$env:REACT_APP_API_URL = "https://agri-connect-1-1ubj.onrender.com"

Write-Host "🔧 Environment Variables Set:" -ForegroundColor Green
Write-Host "NODE_OPTIONS: $env:NODE_OPTIONS" -ForegroundColor Yellow
Write-Host "REACT_APP_API_URL: $env:REACT_APP_API_URL" -ForegroundColor Yellow

Write-Host "`n📦 Installing dependencies..." -ForegroundColor Cyan
npm install --legacy-peer-deps

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
    
    Write-Host "`n🔨 Building the application..." -ForegroundColor Cyan
    npm run build
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n✅ BUILD SUCCESSFUL!" -ForegroundColor Green
        Write-Host "📁 Build files are in: client/build/" -ForegroundColor Cyan
        
        # Test if critical files exist
        if (Test-Path "build/index.html") {
            Write-Host "✅ index.html exists" -ForegroundColor Green
        } else {
            Write-Host "❌ index.html missing!" -ForegroundColor Red
        }
        
        if (Test-Path "build/static") {
            Write-Host "✅ static folder exists" -ForegroundColor Green
        } else {
            Write-Host "❌ static folder missing!" -ForegroundColor Red
        }
        
        Write-Host "`n🚀 Ready for deployment!" -ForegroundColor Magenta
        Write-Host "📝 Key fixes applied:" -ForegroundColor White
        Write-Host "  - Fixed API URL to use Render backend" -ForegroundColor White
        Write-Host "  - Removed problematic homepage setting" -ForegroundColor White
        Write-Host "  - Fixed JSX comment syntax error" -ForegroundColor White
        Write-Host "  - Added SPA routing redirects" -ForegroundColor White
        
    } else {
        Write-Host "`n❌ Build failed!" -ForegroundColor Red
        Write-Host "Check the error messages above for details." -ForegroundColor Yellow
    }
} else {
    Write-Host "`n❌ Dependency installation failed!" -ForegroundColor Red
}

Write-Host "`n📖 Next steps if build succeeds:" -ForegroundColor Cyan
Write-Host "1. Deploy to Netlify (recommended)" -ForegroundColor White
Write-Host "2. Set REACT_APP_API_URL environment variable" -ForegroundColor White
Write-Host "3. Enable SPA redirects in deployment platform" -ForegroundColor White
