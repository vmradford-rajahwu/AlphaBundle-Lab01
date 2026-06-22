Write-Host "📡 [SIRA ENGINE] Checking environmental prerequisites..." -ForegroundColor Green
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
    Write-Error "Node.js/npx is not detected in the current environment path."
    Exit
}

Write-Host "🚀 Launching local HTTP Server daemon on Port 8000..." -ForegroundColor Cyan
Write-Host "🌐 Access Client at: http://127.0.0.1:8000" -ForegroundColor Cyan
npx http-server -p 8000
