import router from '@ohos.router'

interface dill {
  type: string
  number: string
  cost: number
  time: string
  state: string
  color: string
}

interface shouYeMoKuai {
  text: string
  size: number
}

interface baoXiuZhongLei {
  text: string
}

interface baoXiuMoKuai {
  text: string
  img: Resource
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
  dills: dill[] = [
    {
      type: '场地预约',
      number: 'XXXXX000',
      cost: 10,
      time: '2024年7月1日11:39',
      state: '已完成',
      color: '#ff05e31b'
    },
    {
      type: '报修',
      number: 'XXXXX001',
      cost: 5,
      time: '2024年6月25日19:29',
      state: '已完成',
      color: '#ff05e31b'
    },
    {
      type: '场地预约',
      number: 'XXXXX002',
      cost: 0,
      time: '2024年6月8日1:59',
      state: '已取消',
      color: '#ffe11111'
    },
    {
      type: '场地预约',
      number: 'XXXXX003',
      cost: 55,
      time: '2024年5月29日7:30',
      state: '已完成',
      color: '#ff05e31b'
    },
    {
      type: '报修',
      number: 'XXXXX004',
      cost: 45,
      time: '2024年5月26日12:01',
      state: '已完成',
      color: '#ff05e31b'
    },
    {
      type: '场地预约',
      number: 'XXXXX005',
      cost: 0,
      time: '2024年5月26日8:29',
      state: '已取消',
      color: '#ffe11111'
    },
    {
      type: '场地预约',
      number: 'XXXXX006',
      cost: 15,
      time: '2024年5月20日11:39',
      state: '已完成',
      color: '#ff05e31b'
    },
    {
      type: '场地预约',
      number: 'XXXXX007',
      cost: 12,
      time: '2024年5月14日10:07',
      state: '已完成',
      color: '#ff05e31b'
    }
  ]
  @State
  MoKuai: shouYeMoKuai[] = [
    { text: '体育教学管理', size: 26 },
    { text: '学生体质测试', size: 26 },
    { text: '群体活动管理', size: 26 },
    { text: '体育志愿者管理', size: 24 },
    { text: '运动训练管理', size: 26 },
    { text: '教改科研管理', size: 26 },
    { text: '运动场馆管理', size: 26 },
    { text: '第二课堂系统', size: 26 },
  ]
  @State baoXiuZL: baoXiuZhongLei[] = [
    { text: '报修业务' },
    { text: '紧急业务' },
    { text: '维修确认' },
    { text: '特殊维修' },
    { text: '隐患上报' }
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


            List({ space: 20 }) {

              ForEach(this.MoKuai, (item: shouYeMoKuai, index: number) => {
                ListItem() {
                  Column() {
                    Text(item.text)
                      .fontSize(item.size)
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
                  .stateStyles({
                    pressed: {
                      .shadow({
                        radius: 30,
                        offsetX: 10,
                        offsetY: -10
                      })
                    }
                  })
                }
                .margin({ bottom: 10, top: 10 })

              })


            }
            .width('100%')
            // .scrollable(ScrollDirection.Vertical)
            .linearGradient({
              direction: GradientDirection.RightBottom,
              colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
            })
            .padding({ top: 20, left: 10, bottom: 10, right: 10 })
            .lanes(2)
            .height('495.00vp')
          }
          .width('100%')
          .height('100%')
        }.tabBar(this.TabBuilder(0, $rawfile('Firstpage.svg'), '首页'))

        //订单
        TabContent() {

          Column() {
            //订单页根组件
            Text('您的订单')
              .width('100%')
              .textAlign(TextAlign.Center)
              .margin({ top: 20, bottom: 20 })
              .fontSize(35)
              .fontWeight(700)

            // Scroll(this.scroller) {
            List({ space: 30 }) {

              ForEach(this.dills, (item: dill, index: number) => {
                ListItem() {
                  //订单单元格
                  Column({ space: 5 }) {
                    Text(`订单类型: ${item.type}`)
                      .fontSize(20)
                    Text(`订单编号: ${item.number}`)
                      .fontSize(20)
                    Text(`实付金额: ${item.number}元`)
                      .fontSize(20)
                    Text(`支付时间: ${item.time}`)
                      .fontSize(20)
                    Divider()
                      .color(Color.Black)
                      .strokeWidth(2)
                    Row() {
                      Text('订单状态:')
                        .fontSize(20)
                      Text(`${item.state}`)
                        .fontSize(40)
                        .fontColor(`${item.color}`)

                    }
                    .margin({ top: 5 })
                    .width('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .alignItems(VerticalAlign.Bottom)
                  }
                  .width('90%')
                  .padding(10)
                  .backgroundColor(Color.White)
                  .borderRadius(8)
                  .alignItems(HorizontalAlign.Start)
                  .shadow({ radius: 0 })
                  .stateStyles({
                    pressed: {
                      .shadow({ radius: 30, color: Color.Black })
                    }
                  })
                }
                .margin({ top: 10 })

              })

            }
            .flexGrow(1)
            .width('100%')
            .alignListItem(ListItemAlign.Center)

          }
          .width('100%')
          .height('100%')
          .linearGradient({
            direction: GradientDirection.RightBottom,
            colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
          })
        }.tabBar(this.TabBuilder(1, $rawfile('Order.svg'), '订单'))

        //报修
        TabContent() {
          //报修页根组件
          Column() {
            Text('报修平台')
              .width('100%')
              .textAlign(TextAlign.Center)
              .margin({ top: 20, bottom: 20 })
              .fontSize(35)
              .fontWeight(700)

            List() {

              ForEach(this.baoXiuZL, (item: baoXiuZhongLei, index: number) => {
                ListItem() {
                  //单块报修单元最外层组件
                  Column() {
                    //报修服务类别栏
                    Row({ space: 15 }) {
                      Divider()
                        .color('#ff084dc1')
                        .vertical(true)//true为竖向分割线
                        .strokeWidth(5)
                        .height('100%')
                      Text('报修业务')
                        .fontSize(25)
                        .fontWeight(600)
                    }
                    .width('100%')
                    .height(30)
                    .alignItems(VerticalAlign.Center)
                    .justifyContent(FlexAlign.Start)

                    //具体服务模块区域
                    Flex() {

                      //服务模块
                      Row() {
                        Text('我的报修')
                          .fontSize(20)
                        Image($rawfile('myBaoXiu.svg'))
                          .width(50)
                      }
                      .backgroundColor(Color.White)
                      .width(180)
                      .height(100)
                      .borderRadius(20)
                      .padding({ left: 20, right: 15 })
                      .justifyContent(FlexAlign.SpaceBetween)

                    }
                    .width('100%')
                    .padding(15)
                  }
                }
                .margin({ top: 20, bottom: 20 })
              })


            }
            .width('100%')
            .flexGrow(1)
          }
          .width('100%')
          .height('100%')
          .linearGradient({
            direction: GradientDirection.RightBottom,
            colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
          })
        }.tabBar(this.TabBuilder(2, $rawfile('repairs.svg'), '报修'))

        //我的
        TabContent() {

          Column() {
            //我的页根组件
          }
          .width('100%')
          .height('100%')
          .linearGradient({
            direction: GradientDirection.RightBottom,
            colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
          })
        }.tabBar(this.TabBuilder(3, $rawfile('My.svg'), '我的'))

      }
      .width('100%')
      // .flexGrow(1)
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