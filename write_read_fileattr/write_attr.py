import win32api
import win32file
import win32con

def add_custom_property(file_path, property_name, value):
    # 使用 NTFS Alternate Data Streams 添加屬性
    ads_path = f"{file_path}:{property_name}"
    with open(ads_path, "w", encoding="utf-8") as ads:
        ads.write(value)

def test1():
    # 使用範例
    file_path = "test_attr.ahk"
    property_name = "target_script"
    value = r"C:\Users\USER\Documents\Learn_python\note\module\03_qt_test\main.py"
    add_custom_property(file_path, property_name, value)
    print(f"已將屬性 '{property_name}' 添加到檔案 '{file_path}'，值為：{value}")

if __name__ == '__main__':
    test1()
