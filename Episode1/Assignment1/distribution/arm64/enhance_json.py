#!/usr/bin/env python3
"""
JSON Enhancement Script - Adds Statistics to pytest JSON Report
Calculates validation marks and percentage from pytest results
"""

import json
from pathlib import Path


def enhance_json_report():
    """
    Read pytest JSON report and add statistics
    """
    report_file = Path("/tmp/validation_results/report.json")
    
    if not report_file.exists():
        print("Error: No validation results found", file=__import__('sys').stderr)
        return
    
    try:
        with open(report_file, 'r') as f:
            data = json.load(f)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=__import__('sys').stderr)
        return
    
    # Extract test results
    tests = data.get('tests', [])
    
    # Calculate statistics
    total_tests = len(tests)
    passed_tests = sum(1 for t in tests if t.get('outcome') == 'passed')
    failed_tests = total_tests - passed_tests
    
    # Calculate marks (0.0 to 1.0) and percentage (0 to 100)
    marks = (passed_tests / total_tests) if total_tests > 0 else 0.0
    percentage = marks * 100
    
    # Add statistics to report
    data['statistics'] = {
        'total_checks': total_tests,
        'passed': passed_tests,
        'failed': failed_tests,
        'marks': round(marks, 2),
        'percentage': round(percentage, 2)
    }
    
    # Save enhanced report
    with open(report_file, 'w') as f:
        json.dump(data, f, indent=2)
    
    # Output complete JSON to stdout
    print(json.dumps(data, indent=2))


if __name__ == "__main__":
    enhance_json_report()
