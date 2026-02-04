"""
XML Validation Test Suite for Assignment 1
Assignment: Change Text Content in activity_main.xml
Validates that student XML correctly changes text from "Hello World!" to "Hi Android"
"""

import pytest
from lxml import etree
from pathlib import Path


def get_textview(xml_root):
    """Helper to find TextView, handling both namespaced and non-namespaced elements"""
    ns = {'android': 'http://schemas.android.com/apk/res/android'}
    textview = xml_root.find('.//android:TextView', ns)
    if textview is None:
        textview = xml_root.find('.//TextView')
    return textview


def get_android_attr(element, attr_name):
    """Helper to get Android attribute, handling both namespaced and non-namespaced forms"""
    if element is None:
        return None
    # Try namespaced first
    value = element.get('{http://schemas.android.com/apk/res/android}' + attr_name)
    if value is None:
        # Try non-namespaced
        value = element.get(attr_name)
    return value


def get_app_attr(element, attr_name):
    """Helper to get app namespace attribute"""
    if element is None:
        return None
    return element.get('{http://schemas.android.com/apk/res-auto}' + attr_name)


@pytest.fixture
def xml_root():
    """Parse and return XML root element"""
    xml_path = Path("/submission/activity_main.xml")
    if not xml_path.exists():
        pytest.skip("activity_main.xml not found in submission folder")
    try:
        tree = etree.parse(str(xml_path))
        return tree.getroot()
    except etree.XMLSyntaxError as e:
        pytest.fail(f"XML parsing failed: {e}")


class TestXMLValidation:
    """Validates Assignment 1 - Change Text Content"""

    def test_001_xml_is_valid(self, xml_root):
        """Test 1: XML is well-formed and parses successfully"""
        assert xml_root is not None, "XML root element should exist"

    def test_002_root_is_constraint_layout(self, xml_root):
        """Test 2: Root element is ConstraintLayout"""
        tag_name = xml_root.tag
        assert "ConstraintLayout" in tag_name, f"Expected ConstraintLayout root, got {tag_name}"

    def test_003_has_namespaces(self, xml_root):
        """Test 3: All required namespaces are declared"""
        nsmap = xml_root.nsmap
        assert "android" in nsmap, "Missing android namespace"
        assert "app" in nsmap, "Missing app namespace"
        assert "tools" in nsmap, "Missing tools namespace"

    def test_004_textview_element_exists(self, xml_root):
        """Test 4: TextView element exists in layout"""
        textview = get_textview(xml_root)
        assert textview is not None, "No TextView element found in layout"

    def test_005_textview_has_text_attribute(self, xml_root):
        """Test 5: TextView has android:text attribute"""
        textview = get_textview(xml_root)
        assert textview is not None, "TextView element not found"
        
        text_attr = get_android_attr(textview, 'text')
        assert text_attr is not None, "TextView missing android:text attribute"

    def test_006_text_is_not_hello_world(self, xml_root):
        """Test 6: Text is NOT 'Hello World!' (student modified it)"""
        textview = get_textview(xml_root)
        assert textview is not None, "TextView element not found"
        
        text_attr = get_android_attr(textview, 'text')
        assert text_attr != "Hello World!", "Text must be changed from 'Hello World!'"

    def test_007_text_is_hi_android(self, xml_root):
        """Test 7: Text value equals 'Hi Android'"""
        textview = get_textview(xml_root)
        assert textview is not None, "TextView element not found"
        
        text_attr = get_android_attr(textview, 'text')
        assert text_attr == "Hi Android", f"Expected 'Hi Android', got '{text_attr}'"

    def test_008_constraints_preserved(self, xml_root):
        """Test 8: All ConstraintLayout constraints are preserved"""
        textview = get_textview(xml_root)
        assert textview is not None, "TextView element not found"
        
        constraints = ['layout_constraintTop_toTopOf', 'layout_constraintBottom_toBottomOf',
                      'layout_constraintStart_toStartOf', 'layout_constraintEnd_toEndOf']
        
        for constraint in constraints:
            value = get_app_attr(textview, constraint)
            assert value == "parent", f"Constraint {constraint} missing or not set to 'parent'"

    def test_009_textview_layout_width_exists(self, xml_root):
        """Test 9: TextView has layout_width attribute"""
        textview = get_textview(xml_root)
        assert textview is not None, "TextView element not found"
        
        width = get_android_attr(textview, 'layout_width')
        assert width is not None, "TextView missing android:layout_width"

    def test_010_textview_layout_height_exists(self, xml_root):
        """Test 10: TextView has layout_height attribute"""
        textview = get_textview(xml_root)
        assert textview is not None, "TextView element not found"
        
        height = get_android_attr(textview, 'layout_height')
        assert height is not None, "TextView missing android:layout_height"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

