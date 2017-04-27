一、NSString用法

1. 字符串写入文件：
[str writeToFile:@"/Users/zhaoxiaohu/Desktop/" atomically:YES  encoding:NSUTF8StringEncoding error:&err];

2.字符串从文件读取：
NSString *str = [NSString stringWithContentsOfFile:@"/Users/zhaoxiaohu/Desktop/str.txt" encoding:NSUTF8StringEncoding error:&err];

3.字符串比较函数：
NSComparisonResult result = [str1 compare:str2 options:NSCaseInsensitiveSearch|NSNumericSearch];
返回值：NSOrderedAscending（str1<str2）
NSOrderedDescending(str1>str2)
NSOrderedSame(str1 = str2)

4. 判读字符串是否相等：
[str1 isEqualToString:str3]


5. 检测字符串前后缀：
[url hasPrefix:@"http://"]； 字符串是否以http://开头
[imgName hasSuffix:@".jpg"]； 检测字符串是否以.jpg结尾


6.查找字符串的位置
NSRange range = [str1 rangeofString:str2]; //str1 中找str2


7,得到指定下标的字符
unichar ch =  [str1 characterAtIndex:1];


8,以拼接变量的方式组成1个新的字符串
NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];


9.字符串截取   Heima
NSString *str1 = [str substringFromIndex:5];//从指定的下标开始一直截取到最后
NSString *str2 = [str substringToIndex:5];// 截取前面指定个数的字符串
NSRange r1 = {3,4};
NSString *str3 = [str substringWithRange:r1];// 截取指定的范围的字符串.

10.字符串替换： //用 * 替换 a
NSString *newStr = [str stringByReplacingOccurrencesOfString:@"a" withString:@"*"];

11. 将字符串转成int类型
int b = [str intValue]; // 前提是字符串是数值类型

12.  c字符串与oc字符串相互替换
NSString *str = [NSString stringWithUTF8String:s]; // c -> oc
const char *s1 = [str2 UTF8String]; // oc -> c

13,删除字符串前后的空格.
str =  [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]



二、NSRange

1. NSRange的结构体初始化
NSRange r4 = NSMakeRange(3,3)

2.打印NSSrange：
NSStringFromRange（r4）




三、NSURL

8.  通过urlwithstring创建NSURL
NSURL *url = [NSURL URLWithString:@"sms://10086"];
NSURL *url = [NSURL URLWithString:@"file:///Users/zhaoxiaohu/Desktop/3.txt"];

9. 用本地路径创建NSURL
NSURL *url = [NSURL fileURLWithPath:@"/Users/zhaoxiaohu/Desktop/4.txt"];

10. 使用类方法从NSURL对象中读取NSString数据
NSString *str2 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];

11.往NSURL中写入数据.
BOOL res =  [str writeToURL:url3 atomically:NO encoding:NSUTF8StringEncoding error:nil];




三、NSMutableString

1. 格式化拼接字符串：
NSMutableString *str = [NSMutableString string];
[str appendFormat:@"http://www.baidu.com/%d",100];//拼接

2. 删除一部分内容：
[str deleteCharactersInRange:NSMakeRange(3, 4)];

3. 字符串拼接：
[str appendString:@"xxxxx"];//拼接





四、NSArray基本使用

1. 数组元素的创建：
NSArray *arr1 = [NSArray arrayWithObjects:@"jack",@"rose",@"lily",@"lelei",nil];
NSArray *arr = @[@"1",@"one",@"3",@"4",@"ONE"];//简化方式

2. 获取数组的某个元素：
NSString *str =[arr objectAtIndex:2];
str = arr[1] //简化方式访问


3. 数组的遍历方式:
普通for循环，取角标
快速枚举法：
for(NSString *str in arr){
    
}

block：
[arr enumerateObjectsUsingBlock:^(id obj, NSUinteger index,BOOL *shop){
    
}];

4. NSArray读写文件：
将数组写入到文件中：
BOOL isWrite =  [array writeToFile:@"/Users/zhaoxiaohu/Desktop/arr.xml" atomically:YES];
从文件中,读取一个数组信息
NSArray *readArr = [NSArray arrayWithContentsOfFile:@"/Users/zhaoxiaohu/Desktop/arr.xml"];


5，将数组连在一起变成NSString //{@"ab",@"bc",@"cd"}  --->  @"ab-bc-cd"
NSString *str = [arr componentsJoinedByString:@"-"];

6. 将字符串分割成数组
str2 = @"400#800#12580#400#888#11200";
NSArray *arr3 = [str2 componentsSeparatedByString:@"#"];

7. 取数组的元素方法：
[arr firstobject] //取出第一个元素
[arr lastobject] // 取出最后一个元素




五、NSMutableArray的基本使用

1. 可变数组：初始化的时候，直接放置某个元素
NSMutableArray *arr2 = [NSMutableArray arrayWithObject:@"one"];
NSMutableArray *arr3 = [NSMutableArray arrayWithObjects:@"one",@"two",@3,nil];

2,创建一个空的,再添加
NSMutableArray *arr4 = [NSMutableArray array];
[arr4 addobject:@"fengjie"]


3. 插入某个元素到数组当中
[arr1 insertObject:@"fengjie" atIndex:0];


4. 修改数组当中的某个元素
[arr3 replaceObjectAtIndex:1 withObject:@"four"];

5. 判断数组中是否包含某个元素
BOOL isSearch = [arr3 containsObject:@"four"];

6,删除
    1). 根据下标来删除数组中的元素.
    - (void)removeObjectAtIndex:(NSUInteger)index;

    2). 删除数组中的最后1个元素
    - (void)removeLastObject;

    3). 清空数组中的所有的元素.
    - (void)removeAllObjects;

    4). 删除数组中指定的元素.
    - (void)removeObject:(ObjectType)anObject;

    5). 删除指定范围的元素
    - (void)removeObject:(ObjectType)anObject inRange:(NSRange)range;



六，NSDictionary的基本使用

1. 快速创建键值对的方法：
NSDictionary *dict4 =[NSDictionary dictionaryWithObjectsAndKeys:@"rose",@"name",@"18",@"age",nil];
NSDictionary *dict4 = @{@"zs":@"zhaosi",@"zs":@"zhangsan",@"ls":@"lisi",@"bz":@"banzhang"};//简写
dict4.count// 计算字典中键值对的个数

2. 使用枚举遍历字典：
[dict4 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    NSLog(@"%@ --> %@",key,obj);
}];

3. 获取字典中的某个元素：
dict[@"zbz"]

4. 把字典写入到文件中：
BOOL isWrite = [dict writeToFile:@"/Users/zhaoxiaohu/Desktop/dict.plist" atomically:YES];

5. 从plist文件中读取字典
NSDictionary *readDict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/zhaoxiaohu/Desktop/dict.plist"];





七、NSMutableDictionary的基本使用

1. 可变字典的创建
NSMutableDictionary *dict1 = [NSMutableDictionary dictionary]; //创建空字典
NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithCapacity:3];//很少用


2. 给可变字典添加键值对
[dict1 setValue:@"zhaosi" forKey:@"ls"];//因为key值重复了,就会覆盖之前的值


3.删除可变字典的键值对
[dict1 removeObjectForKey:@"ls"];//删除这个键对应的键值对.
[dict1 removeAllObjects];//全部清空.


4.修改字典中的数据
[dict1 setObject:@"zhaosi" forKey:@"ls"];

5.获取所有的key值
NSArray *arr = [dict1 allkeys]
[arr containsObject:@"ls"]; // 字典中是否包含@“ls”这个元素
6



八、NSFilemanger 文件管理对象

1.创建文件管理对象  (单例对象：在程序运行期间，只有一个对象存在)
NSFileManger *manger = [NSFileManger defaultManger];

2.判断是否是一个目录
Bool isDir;
[manger fileExistsAtPath:filePath  isDirectory:&isDir];

3.直接获取文件及子目录
subPaths = [fm subpathsOfDirectoryAtPath:dirPath error:nil];

4. 获取指定目录下的文件及目录信息(不在获取后代路径)
subPaths = [fm contentsOfDirectoryAtPath:dirPath error:nil];


5. 根据路径创建文件
BOOL isYES = [fm createDirectoryAtPath:createDirPath withIntermediateDirectories:YES attributes:nil error:nil];

6.移动文件
[fm moveItemAtPath:createDirPath toPath:targetPath error:nil];

7.拷贝文件
[fm copyItemAtPath:createDirPath toPath:targetPath error:nil];

8.删除文件
[fm removeItemAtPath:targetPath error:nil];


九、沙盒
1. 沙盒：
存放数据的文件夹
特点：每个应用程序都有自己的沙盒(iOS只能访问自己的沙盒)，iOS8开始,开放了几个固定区域
应用程序包(文件夹)：Documents 持久化数据
tem 临时目录
library  用户目录下的Library文件夹
cache 缓存
preference (系统偏好)// SQlite，coreData

2. 沙盒路径获取方法：
NSString *sandBoxPath = NSHomeDirectory();


3,、获取document目录
// 参数1：要查找的目录  参数2：是否是用户主目录  YES/NO是否获取全路径
NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *documentPath = [paths lastObject];


十、常见结构体
结构体：
CGPoint
CGPoint c4 = CGPointMake(10, 10);

CGSize
CGSize s2 = CGSizeMake(100, 100);

CGRect
CGRect r2 = {{0,1},{20,34}};
CGRect r3 = CGRectMake(10, 10, 100, 30);


十一、NSNumber的包装
1. NSNumber普通包装：
NSNumber *intObj = [NSNumber numberWithInt:a];

2. NSNumber 快速包装：
NSNumber *number = @(18)  @"18"




十二、NSValue的包装
NSValue对象的包装：
1. 通过CGPoint包装：
CGPoint p1 = CGPointMake(20, 50);
NSValue *pointVal = [NSValue valueWithPoint:p1];

2. 通过CGRect包装
NSRect r1 = NSMakeRect(0, 0, 200, 100);
NSValue *rectVal[NSValue valueWithRect:r1]




十三.NSDate
1,得到当前系统的时间
NSDate *date = [NSDate date];

2,日期对象转化成字符串(固定格式)  NSDate -->  NSString
NSDate *date = [NSDate date];
NSDateFormatter *formatter = [NSDateFormatter new];
formatter.dateFormat = @"yy年M月dd日 hh点mm分ss秒";
NSString *str =  [formatter stringFromDate:date];


3,将字符串转为为日期对象(固定格式) NSString -->  NSDate
NSString *str = @"2020/12/12 13:12:12";
NSDateFormatter *formatter = [NSDateFormatter new];
formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
NSDate *date =  [formatter dateFromString:str];
NSLog(@"date = %@",date);

4. 在当前时间的基础之上加指定的秒数以后是多久.
+ (instancetype)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs

5. 计算两个时间之差.
- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)anotherDate;

6. 计算日历对象：
//创建日期的对象
NSCalendar *cal = [NSCalendar currentCalendar]; 2016-11-30
//cal components:获取日期的哪些部分 fromDate:日期对象
NSDateComponents *coms =  [cal components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:d];




