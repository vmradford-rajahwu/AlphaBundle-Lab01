$LogPath = "docs\verification\LAB-02-SIGNATURE.log"
Write-Host "🔍 [SIRA ENGINE] Testing local transport loopback..." -ForegroundColor Green

try {
    $Response = Invoke-WebRequest -Uri "http://127.0.0.1:8000/data.json" -UseBasicParsing
    Write-Host "✅ Network Response Verified: Status Code $($Response.StatusCode)" -ForegroundColor Green
    
    # Export full raw network headers to verification logs
    $Response.RawContent | Out-File -FilePath $LogPath -Encoding utf8
    Write-Host "💾 Verification payload stamped to: $LogPath" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Transport Layer Failure. Ensure http-server is active on Port 8000." -ForegroundColor Red
}
