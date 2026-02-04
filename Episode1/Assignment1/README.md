# Episode 1 - Assignment 1: Change Text Content

## Overview

Learn to modify Android XML layouts by changing TextView text content from "Hello World!" to "Hi Android" using ConstraintLayout.

---

## Assignment Objectives

- ✅ Understand XML structure in Android layouts
- ✅ Modify `android:text` attribute value
- ✅ Maintain ConstraintLayout constraints
- ✅ Ensure proper XML formatting

---

## What You Need to Do

### Task
Edit **activity_main.xml** and change the TextView's `android:text` attribute:
- **FROM:** `android:text="Hello World!"`
- **TO:** `android:text="Hi Android"`

### Rules
- Do NOT modify any other attributes
- Do NOT remove or change constraints
- Keep all ConstraintLayout attributes intact
- Maintain proper XML formatting

---

## File Structure

```
/Episode1/Assignment1/
├── activity_main.xml              (STARTER - You modify this)
├── activity_main_solution.xml      (Reference solution)
├── validate_xml.py                (Validation tests)
├── validator.sh                   (Execution script)
├── enhance_json.py                (Statistics generator)
├── docker-compose.yml             (Container orchestration)
├── Dockerfile                     (Container image definition)
├── starter_code.zip               (Starter template)
├── solution_code.zip              (Solution reference)
├── submission/                    (Place your files here)
├── x86/                           (x86_64 architecture)
└── arm64/                         (ARM64 architecture - TBD)
```

---

## Setup Instructions

### 1. Extract Starter Code
```bash
unzip starter_code.zip
```

This gives you:
- `activity_main.xml` - Template with "Hello World!" (modify this)
- `validate_xml.py` - Validation test suite

### 2. Create Submission Folder
```bash
mkdir -p submission
cp activity_main.xml submission/activity_main.xml
```

### 3. Edit Your File
Open `submission/activity_main.xml` and change:
```xml
<!-- BEFORE -->
android:text="Hello World!"

<!-- AFTER -->
android:text="Hi Android"
```

---

## Running Validation

### ⚡ Quick Start (Recommended)

**1. Load Docker image:**
```bash
docker load -i android-validator.tar
```

**2. Start container and run validation:**
```bash
docker-compose up -d
docker-compose exec -T assignment1_validator /validator/validator.sh
```

**3. View JSON report:**
The output shows validation results with statistics:
- `"passed"`: Number of tests passed (0-10)
- `"failed"`: Number of tests failed (0-10)
- `"marks"`: Score 0.0-1.0
- `"percentage"`: Score 0-100

**4. Stop container:**
```bash
docker-compose down
```

---

### Alternative: Using Docker Run (Manual Mounts)

If you prefer not to use docker-compose, mount paths manually:
```bash
docker run -it --rm \
  -v "$(pwd)/submission:/submission" \
  -v "$(pwd)/validate_xml.py:/validator/validate_xml.py" \
  -v "$(pwd)/enhance_json.py:/validator/enhance_json.py" \
  -v "$(pwd)/validator.sh:/validator/validator.sh" \
  -w /validator \
  android-validator:arm64 \
  bash /validator/validator.sh
```

---

### Troubleshooting

**Issue:** "activity_main.xml not found in submission folder"
- **Cause:** File not at correct path
- **Fix:** Ensure `submission/activity_main.xml` exists in current directory

**Issue:** Container name already in use
- **Cause:** Previous container still running
- **Fix:** Run `docker-compose down` first, then `docker-compose up -d`

---

## Understanding Test Results

The validator runs 10 tests on your XML:

| Test | Description | Pass Criteria |
|------|-------------|---------------|
| 1 | XML is valid | Parses without errors |
| 2 | Root is ConstraintLayout | Root element correct |
| 3 | Namespaces present | android, app, tools declared |
| 4 | TextView exists | Has TextView element |
| 5 | Has text attribute | TextView has android:text |
| 6 | Not "Hello World!" | Text has been changed |
| 7 | Text is "Hi Android" | Text exactly matches |
| 8 | Constraints preserved | All 4 constraints present |
| 9 | layout_width exists | android:layout_width set |
| 10 | layout_height exists | android:layout_height set |

**Score Calculation:**
- Passed all 10 tests = 100%
- Each test = 10%
- Partial credit for partial changes

---

### Example JSON Output

```json
{
  "statistics": {
    "total_checks": 10,
    "passed": 10,
    "failed": 0,
    "marks": 1.0,
    "percentage": 100.0
  }
}
```
```json
{
  "tests": [...],
  "statistics": {
    "total_checks": 10,
    "passed": 10,
    "failed": 0,
    "marks": 1.0,
    "percentage": 100.0
  }
}
```

### Manual Validation (without Docker)

Ensure you have Python 3.11+ and pytest installed:
```bash
pip install pytest lxml pytest-json-report

# Create submission directory if needed
mkdir -p submission
cp activity_main.xml submission/

# Run validation
pytest validate_xml.py -v
```

---

## Validation Checks

The test suite performs **10 validation checks:**

| # | Test | Checks |
|----|------|--------|
| 1 | XML is valid | XML parses without errors |
| 2 | Root element | ConstraintLayout is root |
| 3 | Namespaces | All required namespaces present |
| 4 | TextView exists | TextView element found |
| 5 | Text attribute | `android:text` exists |
| 6 | Text modified | Not "Hello World!" |
| 7 | Correct text | Text equals "Hi Android" |
| 8 | Constraints preserved | All ConstraintLayout constraints intact |
| 9 | Layout width | `android:layout_width` present |
| 10 | Layout height | `android:layout_height` present |

---

## Example Solution

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <!-- CHANGED: Text now says "Hi Android" -->
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hi Android"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

---

## Concepts Covered

### XML Basics
- **Well-formed XML**: Proper tags, attributes, nesting
- **Namespaces**: `android`, `app`, `tools` prefixes
- **Attributes**: Key-value pairs in elements

### Android Layout XML
- **ConstraintLayout**: Flexible positioning system
- **TextView**: Text display widget
- **`android:text`**: Content attribute
- **Constraints**: Position connections to parent/siblings

### Best Practices
- Maintain consistent formatting
- Don't modify other attributes
- Always verify XML is valid
- Test after each modification

---

## Troubleshooting

### "XML parsing failed"
- Check for unclosed tags
- Verify quotes are matching
- Ensure all namespaces are declared

### "TextView not found"
- Verify `<TextView` tag exists
- Check namespace prefix (should be `android:`)

### "Text attribute missing"
- Confirm `android:text="..."` is present
- Check the exact value matches requirements

### "Constraints removed"
- Verify all `app:layout_constraint*` attributes are present
- Check constraint values point to "parent"

---

## Next Steps

After completing this assignment:
1. ✅ Assignment 2: Style the Text (add colors, size, weight)
2. ✅ Assignment 3: Multiple Views (ConstraintLayout chaining)
3. ✅ Episode 2: Buttons and User Interaction
4. ✅ Episode 3: Images and Lists

---

## Resources

- [Android ConstraintLayout Documentation](https://developer.android.com/reference/androidx/constraintlayout/widget/ConstraintLayout)
- [Android XML Layout Guide](https://developer.android.com/guide/topics/ui/declaring-layout)
- [Android Text View](https://developer.android.com/reference/android/widget/TextView)

---

## Support

For issues or questions:
1. Check the error message in validation output
2. Review the "Troubleshooting" section above
3. Compare with `activity_main_solution.xml`
4. Check that `submission/activity_main.xml` exists

**Good luck! 🚀**
