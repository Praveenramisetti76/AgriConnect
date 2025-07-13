# API Test Script
Write-Host "Testing Agri-Connect API Endpoints..." -ForegroundColor Cyan

$baseUrl = "https://agri-connect-1-1ubj.onrender.com"

# Test 1: Health check
Write-Host "`n1. Testing API Health..." -ForegroundColor Yellow
try {
    $healthResponse = Invoke-WebRequest -Uri "$baseUrl/" -Method GET -ErrorAction Stop
    Write-Host "API is responding! Status: $($healthResponse.StatusCode)" -ForegroundColor Green
} catch {
    Write-Host "API health check failed: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 2: Register endpoint
Write-Host "`n2. Testing Register Endpoint..." -ForegroundColor Yellow
$testUser = @{
    name = "Test User"
    email = "test@example.com"
    password = "testpass123"
    role = "buyer"
    location = "Test City"
    phone = "1234567890"
} | ConvertTo-Json

try {
    $registerResponse = Invoke-WebRequest -Uri "$baseUrl/api/auth/register" -Method POST -Body $testUser -ContentType "application/json" -ErrorAction Stop
    Write-Host "Register endpoint responded! Status: $($registerResponse.StatusCode)" -ForegroundColor Green
} catch {
    Write-Host "Register endpoint error (may be expected):" -ForegroundColor Yellow
    Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Yellow
}

Write-Host "`nAPI testing complete." -ForegroundColor Magenta
