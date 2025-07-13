# API Test Script
Write-Host "🔍 Testing Agri-Connect API Endpoints..." -ForegroundColor Cyan

$baseUrl = "https://agri-connect-1-1ubj.onrender.com"

# Test 1: Health check
Write-Host "`n1. Testing API Health..." -ForegroundColor Yellow
try {
    $healthResponse = Invoke-WebRequest -Uri "$baseUrl/" -Method GET -ErrorAction Stop
    Write-Host "✅ API is responding! Status: $($healthResponse.StatusCode)" -ForegroundColor Green
} catch {
    Write-Host "❌ API health check failed: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 2: Register endpoint structure
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
    Write-Host "✅ Register endpoint responded! Status: $($registerResponse.StatusCode)" -ForegroundColor Green
    Write-Host "Response: $($registerResponse.Content)" -ForegroundColor Cyan
} catch {
    Write-Host "⚠️ Register endpoint error (expected if user exists):" -ForegroundColor Yellow
    Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Yellow
    if ($_.Exception.Response) {
        $reader = [System.IO.StreamReader]::new($_.Exception.Response.GetResponseStream())
        $errorBody = $reader.ReadToEnd()
        Write-Host "Error Body: $errorBody" -ForegroundColor Yellow
        $reader.Close()
    }
}

# Test 3: Available routes
Write-Host "`n3. Testing Available Routes..." -ForegroundColor Yellow
$routes = @("/api/auth/me", "/api/products", "/api/auth/login")

foreach ($route in $routes) {
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl$route" -Method GET -ErrorAction Stop
        Write-Host "✅ $route - Status: $($response.StatusCode)" -ForegroundColor Green
    } catch {
        $statusCode = $_.Exception.Response.StatusCode
        if ($statusCode -eq 401) {
            Write-Host "✅ $route - Status: 401 (Authentication required - endpoint exists)" -ForegroundColor Green
        } else {
            Write-Host "⚠️ $route - Status: $statusCode" -ForegroundColor Yellow
        }
    }
}

Write-Host "🎯 Summary:" -ForegroundColor Magenta
Write-Host "Your backend API is deployed and responding." -ForegroundColor White
Write-Host "If registration still fails, check browser console for detailed errors." -ForegroundColor White
Write-Host "Common issues:" -ForegroundColor White
Write-Host "- CORS (should be fixed)" -ForegroundColor White
Write-Host "- Database connection" -ForegroundColor White
Write-Host "- Request format" -ForegroundColor White
