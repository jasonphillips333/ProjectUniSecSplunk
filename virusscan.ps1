# ==================================================
# System Virus Scan Program
#
# Author: Jason Phillips
# Date Created: September 2024
#
# Description:
#   [Scan can be used alone or part of splunk triggers]
# ==================================================
# Run as administrator for full functionality
Start-MpScan -ScanType FullScan 
Start-MpScan -ScanType Custom -ScanPath C:\Users