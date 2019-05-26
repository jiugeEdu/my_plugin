## **1.image_picker**
功能：通过相机或相册获得图片
版本：image_picker: ^0.4.10


### **1.ImagePickerPlugin**

```
NSString *tmpDirectory = NSTemporaryDirectory();
替换
NSString *tmpDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
```

### **2.dart**
使用 `lib/melibs/lib_me_picture.dart` 文件

### **3.example**

```
import 'package:image_picker/image_picker.dart';
```

