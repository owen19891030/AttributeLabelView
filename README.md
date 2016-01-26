# AttributeLabelView
swift语言编写的标签视图

![image1](https://github.com/yaoqiang8808/AttributeLabelView/blob/master/Simulator%20Screen%20Shot%202016年1月26日%20上午8.52.37.png)


![image2](https://github.com/yaoqiang8808/AttributeLabelView/blob/master/Simulator%20Screen%20Shot%202016年1月26日%20上午8.54.43.png)

用法:

        /// 初始化
        let attributeLabelView = AttributeLabelView(frame: CGRect(x: 30, y: 100, width: 300, height: 100))
        /// 设置属性
        attributeLabelView.horizontalSpace = 10
        view.addSubview(attributeLabelView)
        attributeLabelView.selecteEnable = false
        attributeLabelView.title = "种类"
        attributeLabelView.titleColor = UIColor.blackColor()
        attributeLabelView.titleFont = UIFont.systemFontOfSize(20)
        attributeLabelView.textData = ["小型车紧凑型车", "中型车", "中大型车", "SUV/越野车","商务车"];
        
        /// 调用setupUI 加载视图
        attributeLabelView.setupUI()



