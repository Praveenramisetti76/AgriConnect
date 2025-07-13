# PowerShell script for setting up client environment variables

Write-Host "🚀 Setting up Client Environment Variables" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green

Write-Host ""
Write-Host "📁 Your client/.env file is ready to edit at:" -ForegroundColor Yellow
Write-Host "   client\.env" -ForegroundColor White

Write-Host ""
Write-Host "🔑 Required API Keys to get:" -ForegroundColor Yellow
Write-Host ""

Write-Host "1. 🆓 GitHub Personal Access Token (Free OpenAI alternative):" -ForegroundColor Cyan
Write-Host "   → Go to: https://github.com/settings/tokens" -ForegroundColor White
Write-Host "   → Generate new token (classic)" -ForegroundColor White
Write-Host "   → Select: read:user, user:email" -ForegroundColor White
Write-Host "   → Add to: REACT_APP_OPENAI_API_KEY" -ForegroundColor Green
Write-Host ""

Write-Host "2. 🆓 AssemblyAI API Key (Free speech-to-text):" -ForegroundColor Cyan
Write-Host "   → Go to: https://www.assemblyai.com" -ForegroundColor White
Write-Host "   → Sign up and verify email" -ForegroundColor White
Write-Host "   → Copy API key from dashboard" -ForegroundColor White
Write-Host "   → Add to: REACT_APP_ASSEMBLYAI_API_KEY" -ForegroundColor Green
Write-Host ""

Write-Host "3. 🆓 ElevenLabs API Key (Free text-to-speech):" -ForegroundColor Cyan
Write-Host "   → Go to: https://elevenlabs.io" -ForegroundColor White
Write-Host "   → Sign up for free account" -ForegroundColor White
Write-Host "   → Profile → API Keys → Generate new" -ForegroundColor White
Write-Host "   → Add to: REACT_APP_ELEVENLABS_API_KEY" -ForegroundColor Green
Write-Host ""

Write-Host "4. 📍 Backend URL (Already set for local development):" -ForegroundColor Cyan
Write-Host "   → REACT_APP_API_URL=http://localhost:5000" -ForegroundColor Green
Write-Host "   → Change this when deploying to production" -ForegroundColor White
Write-Host ""

Write-Host "💡 Optional (can skip initially):" -ForegroundColor Magenta
Write-Host "   → REACT_APP_NEBIUS_API_KEY (leave empty for now)" -ForegroundColor White
Write-Host ""

Write-Host "✅ After getting the API keys:" -ForegroundColor Green
Write-Host "   1. Open client\.env in your editor" -ForegroundColor White
Write-Host "   2. Replace the placeholder values with your real API keys" -ForegroundColor White
Write-Host "   3. Save the file" -ForegroundColor White
Write-Host "   4. Start your React app: npm start" -ForegroundColor White

Write-Host ""
Write-Host "🔒 Security Reminder:" -ForegroundColor Red
Write-Host "   → Never commit .env files to Git" -ForegroundColor White
Write-Host "   → Keep your API keys private" -ForegroundColor White
Write-Host "   → The .env file is already in .gitignore" -ForegroundColor White

Write-Host ""
Write-Host "Press any key to open client/.env file..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
notepad "client\.env"
