# S0000_SampleDemo
<img src="http://omk22jt2z.bkt.clouddn.com/S0008_JHUD_20170311.gif" width=200 />

##简介：
测试动效

| demo信息    | 详情                                                      |
|:-----------:|:---------------------------------------------------------:|
| DemoName    | JHUD                                     |
| CRID        | S00008                                                    |
| author      | [晋先森](https://github.com/Jinxiansen)                        |
| authorMail  | 463424863@qq.com                                         |
| 源gitHub    | [https://github.com/Jinxiansen/JHUD](https://github.com/Jinxiansen/JHUD)  |
| 其他说明     | [http://www.jianshu.com/p/fc07f027680c](http://www.jianshu.com/p/fc07f027680c)  |

##使用：

###Pod
>pod ‘JHUD’

```
//  Usage
hudView = [[JHUD alloc]initWithFrame:self.view.bounds];

hudView.messageLabel.text = @"hello ,this is a circle animation";

//show
[hudView showAtView:self.view hudType:JHUDLoadingTypeCircle];

//hide 
[hudView hide];
```

```
//  Class method
[JHUD showAtView:self.view message:@"Hello, this is a message"];

[JHUD hide];
```
