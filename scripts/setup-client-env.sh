#!/bin/bash
# Quick setup script for client environment variables

echo "🚀 Setting up Client Environment Variables"
echo "=========================================="

echo ""
echo "📁 Your client/.env file is ready to edit at:"
echo "   /client/.env"

echo ""
echo "🔑 Required API Keys to get:"
echo ""

echo "1. 🆓 GitHub Personal Access Token (Free OpenAI alternative):"
echo "   → Go to: https://github.com/settings/tokens"
echo "   → Generate new token (classic)"
echo "   → Select: read:user, user:email"
echo "   → Add to: REACT_APP_OPENAI_API_KEY"
echo ""

echo "2. 🆓 AssemblyAI API Key (Free speech-to-text):"
echo "   → Go to: https://www.assemblyai.com"
echo "   → Sign up and verify email"
echo "   → Copy API key from dashboard"
echo "   → Add to: REACT_APP_ASSEMBLYAI_API_KEY"
echo ""

echo "3. 🆓 ElevenLabs API Key (Free text-to-speech):"
echo "   → Go to: https://elevenlabs.io" 
echo "   → Sign up for free account"
echo "   → Profile → API Keys → Generate new"
echo "   → Add to: REACT_APP_ELEVENLABS_API_KEY"
echo ""

echo "4. 📍 Backend URL (Already set for local development):"
echo "   → REACT_APP_API_URL=http://localhost:5000"
echo "   → Change this when deploying to production"
echo ""

echo "💡 Optional (can skip initially):"
echo "   → REACT_APP_NEBIUS_API_KEY (leave empty for now)"
echo ""

echo "✅ After getting the API keys:"
echo "   1. Open /client/.env in your editor"
echo "   2. Replace the placeholder values with your real API keys"
echo "   3. Save the file"
echo "   4. Start your React app: npm start"

echo ""
echo "🔒 Security Reminder:"
echo "   → Never commit .env files to Git"
echo "   → Keep your API keys private"
echo "   → The .env file is already in .gitignore"
