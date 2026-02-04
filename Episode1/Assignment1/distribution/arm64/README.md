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

### Using Docker Compose

**Step 1: Start the validator container**
```bash
docker-compose up -d
```

**Step 2: Run validation**
```bash
docker-compose exec -T assignment1_validator /validator/validator.sh
```

**Step 3: View results**
The command outputs JSON with validation results:
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
