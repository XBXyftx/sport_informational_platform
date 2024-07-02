import router from '@ohos.router'

interface dill{
  type:string
  number:string
  cost:number
  time:string
  state:string
  color:string
}

@Entry
@Component
struct total {
  @State fontColor: string = '#182431' //默认文字颜色
  @State selectedFontColor: string = '#007DFF' //被选中时的文字颜色
  @State currentIndex: number = 0 //是否被选中的判别器
  private controller: TabsController = new TabsController()
  scroller: Scroller = new Scroller()
  @State
  dills:dill[]=[
    {type:'场地预约',number:'XXXXX000',cost:15,time:'2024年5月8日11:39',state:'已完成',color:'#ff05e31b'},
    {},
    {},
    {},
    {},
  ]

  @Builder
  TabBuilder(index: number, picture: Resource, name: string) {
    //通用TabBuilder
    Column() {
      Image(picture)
        .width(30)
        .margin({ top: 5 })
        .fillColor(this.currentIndex === index ? '#fff42aaa' : Color.Blue)
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)//文字颜色根据是否被选择判别器currentIndex来决定
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)//选中后文字稍微变粗
        .lineHeight(22)
        .margin({ top: 0 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
      //分割线透明度根据是否被选择判别器currentIndex来决定
    }.width('100%')
    .backgroundColor('#ffd7e9fc')
    .height(70)
  }

  build() {
    //根组件
    Flex({ direction: FlexDirection.Column }) {

      Row() {
        //置顶栏
        Column() {
          //最上角叉子组件
          Image($rawfile('X.svg'))
            .height(20)
            .fillColor(Color.White)
            .onClick(() => {
              router.back()
            })

        }
        .backgroundColor(Color.Black)
        .stateStyles({
          pressed: {
            .backgroundColor(Color.Gray)
          }
        })
        .height(30)
        .width(30)
        .margin({ left: 12, right: 10 })
        .justifyContent(FlexAlign.Center)


        Text('北京信息科技大学体育信息化平台')
          .fontColor(Color.White)
          .fontWeight(600)

        Column() {
          //右上角更多组件
          Image($rawfile('more_sport.svg'))
            .width(30)
        }
        .height(30)
        .width(30)
        .margin({ right: 10 })
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.Black)
        .stateStyles({
          pressed: {
            .backgroundColor(Color.Gray)
          }
        })

      }
      .flexBasis(60)
      .width('100%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceBetween)


      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        //下半部分
        TabContent() {
          //首页
          Column() {
            //首页tabContent根组件
            Image($rawfile('Total_Sport_Picture.png'))
              .width('100%')


            Scroll(this.scroller) {
              //下方功能按钮块的滚动组件
              Row({ space: 10 }) {
                //横向排布的两列


                Column({ space: 20 }) {
                  //左侧列


                  Column() {
                    Text('体育教学管理')
                      .fontSize(26)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })


                  Column() {
                    Text('学生体质测试')
                      .fontSize(26)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })


                  Column() {
                    Text('群体活动管理')
                      .fontSize(26)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })


                  Column() {
                    Text('体育志愿者管理')
                      .fontSize(24)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })

                }
                .width(180)


                Column({ space: 20 }) {
                  //右侧列


                  Column() {
                    Text('教改科研管理')
                      .fontSize(26)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })


                  Column() {
                    Text('运动训练管理')
                      .fontSize(26)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })


                  Column() {
                    Text('运动场馆管理')
                      .fontSize(26)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })


                  Column() {
                    Text('第二课堂系统')
                      .fontSize(26)
                      .fontWeight(600)
                      .fontColor(Color.White)
                  }
                  .width(180)
                  .height(110)
                  .borderRadius(20)
                  .justifyContent(FlexAlign.Center)
                  .linearGradient({
                    colors: [['#ff98f4e8', 0], ['#ff0a34f0', 1]],
                    direction: GradientDirection.LeftBottom
                  })
                  .shadow({
                    radius: 30,
                    offsetX: 10,
                    offsetY: 10
                  })

                }
                .width(180)

              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(VerticalAlign.Top)
              .padding({ top: 30, left: 15, right: 15 })

            }
            .height(490)
            .width('100%')
            .scrollable(ScrollDirection.Vertical)
            .linearGradient({
              direction: GradientDirection.RightBottom,
              colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
            })
          }
          .width('100%')
          .height('100%')
        }.tabBar(this.TabBuilder(0, $rawfile('Firstpage.svg'), '首页'))


        TabContent() {
          //订单
          Column() {
            //订单页根组件
            Text('您的订单')
              .width('100%')
              .textAlign(TextAlign.Center)
              .margin({ top: 20, bottom: 20 })
              .fontSize(35)
              .fontWeight(700)

            Scroll(this.scroller) {

              //订单单元格
              Column({ space: 5 }) {
                Text('订单类型: 场地预约')
                  .fontSize(20)
                Text('订单编号: XXXXX000')
                  .fontSize(20)
                Text('实付金额: 15元')
                  .fontSize(20)
                Text('支付时间: 2024年5月8日11:39')
                  .fontSize(20)
                Divider()
                  .color(Color.Black)
                  .strokeWidth(2)
                Row() {
                  Text('订单状态:')
                    .fontSize(20)
                  Text('已完成')
                    .fontSize(40)
                    .fontColor('#ff05e31b')

                }
                .margin({top:5})
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(VerticalAlign.Bottom)
              }
              .width('90%')
              .padding(10)
              .backgroundColor(Color.White)
              .borderRadius(8)
              .alignItems(HorizontalAlign.Start)



            }
            .flexGrow(1)

          }
          .width('100%')
          .height('100%')
          .linearGradient({
            direction: GradientDirection.RightBottom,
            colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
          })
        }.tabBar(this.TabBuilder(1, $rawfile('Order.svg'), '订单'))


        TabContent() {
          //报修
          Column() {
            //报修页根组件
          }
        }.tabBar(this.TabBuilder(2, $rawfile('repairs.svg'), '报修'))


        TabContent() {
          //我的
          Column() {
            //我的页根组件
          }
        }.tabBar(this.TabBuilder(3, $rawfile('My.svg'), '我的'))

      }
      .width('100%')
      .flexGrow(1)
      .vertical(false)
      .scrollable(true)
      .barWidth('100%')
      .barHeight(70)
      .animationDuration(200)
      .onChange((index: number) => {
        this.currentIndex = index
      })

    }
    .width('100%')
    .height('100%')
  }
}