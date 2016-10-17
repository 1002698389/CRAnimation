# WCLLoadingView

gitHub:<https://github.com/631106979/WCLLoadingView>

动画详细解析：<http://blog.csdn.net/wang631106979/article/details/52473985>

![](https://camo.githubusercontent.com/a6eec93a26efa4b006ccddafcc132871e6a8a514/687474703a2f2f696d672e626c6f672e6373646e2e6e65742f3230313630393038313632333236353330)

### 简介：

WCLLoadingView，用CAAnimation写的loading动画，供大家学习交流使用，已封装好也可以用到项目里面当loading动画

### 使用：

```swift
//使用默认颜色
WCLLoadingView.init(frame: CGRect.zero)
//根据线条的颜色初始化
let colorArr = [UIColor.init(rgba: "#9DD4E9") , UIColor.init(rgba: "#F5BD58"),  UIColor.init(rgba: "#FF317E") , UIColor.init(rgba: "#6FC9B5")]
WCLLoadingView.init(fram: CGRect.zero, colors: colorArr)
```

### 属性列表

```swift
//动画的总时间，修改这个来改变动画的速度
var duration:Double    = 2
//动画的间隔时间，循环动画的间隔时间
var interval:Double    = 1
```






