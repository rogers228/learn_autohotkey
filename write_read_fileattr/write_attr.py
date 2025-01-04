def add_custom_property(file_path, property_name, value):
    # 使用 NTFS Alternate Data Streams 添加屬性
    ads_path = f"{file_path}:{property_name}"
    with open(ads_path, "w", encoding="utf-8") as ads:
        ads.write(value)

def read_custom_property(file_path, property_name):
    # 使用 NTFS Alternate Data Streams 讀取屬性
    ads_path = f"{file_path}:{property_name}"
    try:
        with open(ads_path, "r", encoding="utf-8") as ads:
            return ads.read()  # 讀取並返回資料流內容
    except FileNotFoundError:
        return None  # 如果資料流不存在，返回 None
    except Exception as e:
        raise RuntimeError(f"讀取檔案屬性時發生錯誤: {e}")

def test1():
    # 寫入
    file_path = "run_target.exe"
    property_name = "target_script"
    value = r"C:\Users\USER\Documents\Learn_python\note\module\03_qt_test\main.py"
    add_custom_property(file_path, property_name, value)
    print(f"已將屬性 '{property_name}' 添加到檔案 '{file_path}'，值為：{value}")

def test2():
    # 讀取
    file_path = "run_target.ahk"
    property_name = "target_script"
    read_value = read_custom_property(file_path, property_name)
    if read_value is not None:
        print(f"檔案 '{file_path}' 的屬性 '{property_name}' 值為：{read_value}")
    else:
        print(f"檔案 '{file_path}' 不包含屬性 '{property_name}'")

if __name__ == '__main__':
    test1()
