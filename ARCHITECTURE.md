# Android XML Layout Assignments

## Overview

Android XML Layout learning path with progressive assignments. Each episode covers fundamental UI concepts through ConstraintLayout and XML attributes.

---

## 🔄 Testing Framework Strategy

### Phase 1: XML Validation (Episodes 1-3) ✅
- **Framework**: pytest + lxml
- **Purpose**: XML structure, attributes, and layout validation
- **Container Size**: ~150MB (lightweight)
- **Why**: Direct XML parsing without runtime overhead
- **Assignments**: Change text, styling, multiple views, buttons, images

### Phase 2: Android Code Testing (Episodes 4+) 🔜
- **Framework**: Roboelectric + Gradle + JUnit
- **Purpose**: Activity lifecycle, handlers, database, logic testing
- **Container Size**: ~800MB+ (full Android runtime)
- **Why**: Can test Java/Kotlin code AND XML in real Android context
- **Assignments**: Will shift here when needed

**Decision**: Keep Episodes 1-3 as XML-only validation → More efficient → Shift to Roboelectric when testing actual Android code

---

## Episode 1: Basic Layout & Text Views

### Assignment 1: Change Text Content

**Assignment Name:** Change Hello World Text

**Objective:** Learn to modify TextView text content in XML.

**Starter Code (activity_main.xml):**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello World!"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

**Solution Code (activity_main.xml):**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

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

**Key Changes:**
- Changed `android:text="Hello World!"` → `android:text="Hi Android"`
- TextView remains centered with ConstraintLayout constraints

**Concepts Covered:**
- TextView XML element
- `android:text` attribute
- Text string modification

---

### Assignment 2: Style the Text

**Assignment Name:** Apply Text Styling and Colors

**Objective:** Learn text appearance attributes (size, color, weight).

**Starter Code (activity_main.xml):**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

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

**Solution Code (activity_main.xml):**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hi Android"
        android:textSize="32sp"
        android:textColor="#2196F3"
        android:textStyle="bold"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

**Key Changes:**
- Added `android:textSize="32sp"` (scale-independent pixels)
- Added `android:textColor="#2196F3"` (Material Blue)
- Added `android:textStyle="bold"` (font weight)

**Concepts Covered:**
- `android:textSize` attribute
- `android:textColor` attribute with hex color codes
- `android:textStyle` attribute (bold, italic, normal)

---

### Assignment 3: Layout Multiple Views

**Assignment Name:** Create Two-View Layout

**Objective:** Learn to arrange multiple TextViews with ConstraintLayout.

**Starter Code (activity_main.xml):**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello World!"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

**Solution Code (activity_main.xml):**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="16dp"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/titleText"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:text="Welcome to Android"
        android:textSize="28sp"
        android:textColor="#1976D2"
        android:textStyle="bold"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent" />

    <TextView
        android:id="@+id/subtitleText"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:text="Learning XML Layouts"
        android:textSize="16sp"
        android:textColor="#666666"
        android:layout_marginTop="12dp"
        app:layout_constraintTop_toBottomOf="@id/titleText"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

**Key Changes:**
- Added unique `android:id` to each TextView for referencing
- Used `android:layout_width="0dp"` for match_constraint behavior
- Chained views vertically using `app:layout_constraintTop_toBottomOf`
- Added `android:layout_marginTop` for spacing
- Used `android:padding` on root container

**Concepts Covered:**
- View IDs and references (`android:id`, `@id/`)
- ConstraintLayout constraints (top, start, end)
- `layout_width="0dp"` with constraints
- Margin vs Padding
- Vertical view chaining

---

## Episode 1 - Summary

### Key XML Concepts
- **ConstraintLayout**: Flexible layout system with position-based constraints
- **Namespaces**: android, app (Material), tools
- **Dimensions**: match_parent, wrap_content, 0dp (match_constraint)
- **Units**: dp (density-independent pixels), sp (scale-independent pixels)
- **Attributes**: Text content, sizing, styling, positioning
- **Constraints**: Connect views to parent or other views
- **IDs**: Unique identifiers for referencing views

### Attributes Learned
| Attribute | Purpose | Example |
|-----------|---------|---------|
| `android:text` | Text content | `"Hi Android"` |
| `android:textSize` | Font size | `32sp` |
| `android:textColor` | Text color | `#2196F3` |
| `android:textStyle` | Font weight | `bold` |
| `android:id` | Unique identifier | `@+id/titleText` |
| `android:layout_width` | Width dimension | `match_parent`, `wrap_content`, `0dp` |
| `android:layout_height` | Height dimension | `match_parent`, `wrap_content`, `0dp` |
| `android:padding` | Internal spacing | `16dp` |
| `android:layout_margin*` | External spacing | `12dp` |
| `app:layout_constraint*` | Position constraints | `@id/titleText` |

---

# Episode 1 - Complete Architecture

## **Directory Structure**

```
/Users/enfec/Desktop/Assignment_Android/Episode1/
├── Assignment1/
│   ├── arm64/
│   │   └── android-validator.tar (22MB)
│   ├── x86/
│   │   ├── android-validator.tar (21MB)
│   │   ├── docker-compose.yml
│   │   ├── validator.sh
│   │   ├── starter_code.zip
│   │   └── solution_code.zip
│   ├── Dockerfile
│   ├── activity_main.xml (stub - student fills this)
│   ├── activity_main_solution.xml (reference solution)
│   ├── validate_xml.py (validation test suite)
│   ├── docker-compose.yml
│   ├── validator.sh
│   ├── enhance_json.py
│   ├── android-validator.tar (22MB - base image)
│   ├── starter_code.zip
│   ├── solution_code.zip
│   └── submission/ (folder for student code)
├── Assignment2/ (same structure)
└── Assignment3/ (same structure)
```

---

## **Episode 1 Content**

### **Assignment 1: Change Text Content**

**Concepts Covered:**
- XML structure and syntax
- ConstraintLayout root element
- TextView element
- `android:text` attribute modification
- Proper XML namespaces

**Tasks:**
1. Modify `android:text` from "Hello World!" to "Hi Android"
2. Maintain all ConstraintLayout attributes
3. Ensure proper XML formatting

**Validation Checks:**
- Valid XML syntax (no parsing errors)
- TextView element exists
- `android:text` attribute value equals "Hi Android"
- All constraints remain intact
- Proper namespace declarations

**Test Count:** 8 validation checks
**Expected Pass Rate:** 100% with solution

---

### **Assignment 2: Style the Text**

**Concepts Covered:**
- Text styling attributes
- `android:textSize` with `sp` units
- `android:textColor` with hex color codes
- `android:textStyle` attribute
- Multiple attributes on single element

**Tasks:**
1. Add `android:textSize="32sp"` to TextView
2. Add `android:textColor="#2196F3"` (Material Blue)
3. Add `android:textStyle="bold"`
4. Keep existing text and constraints

**Validation Checks:**
- Valid XML syntax
- TextView has all three style attributes
- Correct attribute values
- Correct unit format for textSize (sp)
- Correct color format (hex code)
- textStyle value is "bold"
- No attributes removed

**Test Count:** 12 validation checks
**Expected Pass Rate:** 100% with solution

---

### **Assignment 3: Layout Multiple Views**

**Concepts Covered:**
- Multiple TextView elements
- View IDs and references (`android:id`, `@+id/`, `@id/`)
- ConstraintLayout constraints (top, start, end)
- `layout_width="0dp"` with constraints
- View chaining with `layout_constraintTop_toBottomOf`
- Margin and padding attributes
- Organizing multiple views vertically

**Tasks:**
1. Create two TextViews with unique IDs
2. Set first TextView as title (larger, bold)
3. Set second TextView as subtitle (smaller)
4. Chain second view below first with margin
5. Use proper constraint attributes

**Validation Checks:**
- Valid XML syntax
- Two TextView elements present
- Both have unique `android:id`
- Proper ID reference format
- First TextView styled appropriately
- Second TextView styled appropriately
- Constraints properly chain views
- Margin attribute on second view
- Layout widths set to 0dp for match_constraint
- Root container has padding attribute

**Test Count:** 16 validation checks
**Expected Pass Rate:** 100% with solution

---

## **Docker & Deployment Architecture**

### **Docker Image Setup**

**Base Image:** `alpine:3.19` (minimal Linux)

**Packages Installed:**
- Python 3.11
- libxml2-utils (XML validation)
- xmllint (XML linting)
- python3-pip
- pytest 9.0.1
- lxml (Python XML library)
- defusedxml (secure XML parsing)

**Image Size:** ~21-22MB (x86 and ARM64)

**Non-root User:** 
- Username: `validator`
- UID: 1000, GID: 1000

**Validator Structure in Image:**
```
/validator/
├── validator.sh
├── validate_xml.py
├── enhance_json.py
└── [XML files mounted at runtime]
```

---

## **Runtime Workflow**

### **1. Initialization Mode** (`docker-compose up -d`)

**Command:** `/validator/validator.sh init`

**Process:**
1. Initializes validator environment
2. Verifies Python and tools installed
3. Keeps container running with: `tail -f /dev/null`

**Container State:** Running and ready for validation commands

---

### **2. XML Validation Mode** (`docker-compose exec -T assignment1_validator /validator/validator.sh`)

**Process:**
1. Create `/tmp/validation_results` directory
2. Copy student XML from `/submission/activity_main.xml`
3. Run validation suite with pytest:
   ```bash
   pytest /validator/validate_xml.py \
     --json-report \
     --json-report-indent=2 \
     --json-report-file=/tmp/validation_results/report.json \
     -v
   ```
4. Run `enhance_json.py` to add statistics (marks, percentage)
5. Output complete JSON report to stdout

---

## **Docker Compose Configuration** (docker-compose.yml)

```yaml
version: '3.8'

services:
  assignment1_validator:
    image: android-validator:latest
    container_name: episode1_assignment1_validator
    
    # Volume Mounts
    volumes:
      - ./submission:/submission                          # Student XML files
      - ./validate_xml.py:/validator/validate_xml.py     # Validation tests
      - ./enhance_json.py:/validator/enhance_json.py     # JSON enhancement
    
    # Security
    cap_drop:
      - ALL                                              # Drop all capabilities
    security_opt:
      - no-new-privileges:true
    read_only: true                                      # Read-only filesystem
    tmpfs:
      - /tmp                                             # Temp files allowed
      - /run
    
    # Resources
    deploy:
      resources:
        limits:
          cpus: '1'
          memory: 256M
        reservations:
          cpus: '0.5'
          memory: 128M
    
    # Execution
    command: /validator/validator.sh init
    restart: unless-stopped
```

---

## **Dockerfile Structure**

**Episode 1 Approach (Efficient):**
```dockerfile
FROM android-validator:latest
USER root
COPY validate_xml.py /validator/validate_xml.py
COPY enhance_json.py /validator/enhance_json.py
COPY validator.sh /validator/validator.sh
RUN chmod +x /validator/validate_xml.py /validator/validator.sh
USER validator
CMD ["/validator/validator.sh", "init"]
```

**Key:** Uses pre-built base image (~21-22MB), only adds validator scripts

---

## **File Components**

### **activity_main.xml** (Student fills this)
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <!-- STUDENT: Modify the text content here -->
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello World!"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

### **activity_main_solution.xml** (Reference)
- Complete implementation with all required changes
- Used to verify validation tests work correctly
- Not distributed to students

### **validate_xml.py** (Validation Test Suite)
```python
import pytest
from lxml import etree
from pathlib import Path

class TestXMLValidation:
    """Validates Assignment 1 XML structure and attributes"""
    
    @pytest.fixture
    def xml_root(self):
        xml_file = Path("/submission/activity_main.xml")
        tree = etree.parse(xml_file)
        return tree.getroot()
    
    def test_xml_is_valid(self, xml_root):
        """Test 1: XML parses without errors"""
        assert xml_root is not None
    
    def test_textview_exists(self, xml_root):
        """Test 2: TextView element exists"""
        ns = {'android': 'http://schemas.android.com/apk/res/android'}
        textview = xml_root.find('.//android:TextView', ns)
        assert textview is not None
    
    def test_text_attribute_value(self, xml_root):
        """Test 3: android:text = 'Hi Android'"""
        ns = {'android': 'http://schemas.android.com/apk/res/android'}
        textview = xml_root.find('.//android:TextView', ns)
        text = textview.get('{http://schemas.android.com/apk/res/android}text')
        assert text == "Hi Android"
    
    # ... more validation methods
```

### **validator.sh** (Execution Orchestrator)
```bash
#!/bin/bash
set -e

if [ "$1" = "init" ]; then
    echo "✓ XML Validator initialized"
    tail -f /dev/null
else
    export PYTHONPATH=/validator:$PYTHONPATH
    
    # Run validation tests
    pytest /validator/validate_xml.py \
        --json-report \
        --json-report-file=/tmp/validation_results/report.json \
        -v --tb=short
    
    # Enhance JSON with statistics
    python /validator/enhance_json.py
fi
```

### **enhance_json.py** (JSON Post-processor)
```python
import json
from pathlib import Path

def enhance_report():
    """Add statistics to pytest JSON report"""
    report_file = Path("/tmp/validation_results/report.json")
    
    with open(report_file) as f:
        data = json.load(f)
    
    # Calculate statistics
    total = len(data['tests'])
    passed = sum(1 for t in data['tests'] if t['outcome'] == 'passed')
    failed = total - passed
    
    stats = {
        'total_checks': total,
        'passed': passed,
        'failed': failed,
        'marks': passed / total if total > 0 else 0.0,
        'percentage': (passed / total * 100) if total > 0 else 0.0
    }
    
    data['statistics'] = stats
    
    with open(report_file, 'w') as f:
        json.dump(data, f, indent=2)
    
    # Output to stdout
    print(json.dumps(data, indent=2))

if __name__ == "__main__":
    enhance_report()
```

---

## **Deployment Flow**

### **Student Setup:**
1. Extract `android-validator.tar`: `docker load -i android-validator.tar`
2. Extract `starter_code.zip` → get `activity_main.xml` and `validate_xml.py`
3. Create `submission/` folder
4. Edit `submission/activity_main.xml` with required changes

### **Validation Flow:**
1. `docker-compose up -d` → Initialize validator
2. `docker-compose exec -T assignment1_validator /validator/validator.sh` → Run validation
3. Receive JSON output with validation results and statistics
4. Parse JSON to determine pass/fail and score

---

## **Key Files Distribution**

### **For ARM64 (in AssignmentX/ root):**
- `android-validator.tar` (22MB base image)
- `docker-compose.yml`
- `validator.sh`
- `starter_code.zip` (contains activity_main.xml template)
- `solution_code.zip` (contains activity_main_solution.xml)

### **For x86_64 (in AssignmentX/x86/):**
- `android-validator.tar` (21MB x86 image)
- `docker-compose.yml`
- `validator.sh`
- `starter_code.zip`
- `solution_code.zip`

---

## **Validation Output Example**

```json
{
  "created": "2026-02-04T12:27:29",
  "tests": [
    {
      "nodeid": "validate_xml.py::TestXMLValidation::test_xml_is_valid",
      "outcome": "passed"
    },
    {
      "nodeid": "validate_xml.py::TestXMLValidation::test_textview_exists",
      "outcome": "passed"
    },
    {
      "nodeid": "validate_xml.py::TestXMLValidation::test_text_attribute_value",
      "outcome": "passed"
    }
  ],
  "statistics": {
    "total_checks": 8,
    "passed": 8,
    "failed": 0,
    "marks": 1.0,
    "percentage": 100.0
  }
}
```

---

## **Pedagogical Design**

1. **Progressive Difficulty:** Text modification → Styling → Multiple views
2. **Beginner-Friendly:** XML attributes are simple, namespace-aware
3. **Topic-Aligned:** Only taught XML concepts are required
4. **Guided Templates:** Comments explain what to modify
5. **Comprehensive Validation:** Multiple checks per task (syntax, structure, values)

---

## **Roadmap Notes for Future Development**

### Episode 1 (Current) ✅
- **Framework**: pytest + lxml
- **Status**: Complete (Assignment 1 built, 2-3 ready to build)
- **Focus**: XML layouts, ConstraintLayout, TextViews

### Episode 2 (Ready to build)
- **Framework**: pytest + lxml (same as Episode 1)
- **Focus**: Buttons, OnClick handlers, nested layouts

### Episode 3 (Ready to build)
- **Framework**: pytest + lxml (same as Episode 1)
- **Focus**: ImageViews, Lists, ScrollView

### Episode 4+ (Future - Will shift here)
- **Framework**: Roboelectric + Gradle + JUnit (upgrade)
- **Reason**: Need to test actual Android code (Java/Kotlin) + lifecycle
- **Size Impact**: ~800MB container (includes full Android runtime)
- **Benefits**: Can test Java logic, Activities, Fragments, Databases

**Important**: Keep Episodes 1-3 lightweight XML validation until user confirms shift to Roboelectric testing framework.
6. **Instant Feedback:** JSON output with score immediately after validation
7. **Clear Instructions:** Each assignment explains why XML skills matter

---

## **XML Validation Approach**

**Tools Used:**
- `xmllint` - Command-line XML validation
- `lxml` (Python) - Programmatic XML parsing with namespace support
- `defusedxml` - Secure XML parsing (prevents XXE attacks)

**Validation Levels:**
1. **Syntax**: XML is well-formed (no parse errors)
2. **Structure**: Required elements/attributes exist
3. **Values**: Attribute values match expected format
4. **Types**: Correct data types (hex colors, dimension units)
5. **References**: IDs and constraints reference existing elements
6. **Format**: Proper spacing, naming conventions

