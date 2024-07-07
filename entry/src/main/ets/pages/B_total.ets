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
  url: string
}

interface baoXiuZhongLei {
  text: string
  MK: baoXiuMoKuai[]
}

interface baoXiuMoKuai {
  text: string
  img: Resource
  color: string
}

interface myMoKuai {
  title: string
  etitle: string
  img: Resource
  details: string
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
    { text: '体育教学管理', size: 26, url: "pages/C_PE_teaching_management" },
    { text: '学生体质测试', size: 26, url: "" },
    { text: '群体活动管理', size: 26, url: "" },
    { text: '体育志愿者管理', size: 24, url: "" },
    { text: '运动训练管理', size: 26, url: "" },
    { text: '教改科研管理', size: 26, url: "pages/C_jiaoYan" },
    { text: '运动场馆管理', size: 26, url: "" },
    { text: '第二课堂系统', size: 26, url: "" },
  ]
  @State baoXiuMK1: baoXiuMoKuai[] = [
    { text: '我的报修', img: $rawfile('myBaoXiu.svg'), color: '' },
    { text: '我要报修', img: $rawfile('woYaoBaoXiu.svg'), color: '' },
    { text: '报修须知', img: $rawfile('xuZhi.svg'), color: '' },
  ]
  @State baoXiuMK2: baoXiuMoKuai[] = [
    { text: '紧急报修', img: $rawfile('jinJiBaoXiu.svg'), color: '#ffdb1010' }
  ]
  @State baoXiuMK3: baoXiuMoKuai[] = [
    { text: '维修确认', img: $rawfile('weiXiuQueRen.svg'), color: '' }
  ]
  @State baoXiuMK4: baoXiuMoKuai[] = [
    { text: '特殊报修', img: $rawfile('teShu.svg'), color: '' }
  ]
  @State baoXiuMK5: baoXiuMoKuai[] = [
    { text: '隐患上报', img: $rawfile('yinHuan.svg'), color: '' }
  ]
  @State baoXiuZL: baoXiuZhongLei[] = [
    { text: '报修业务', MK: this.baoXiuMK1 },
    { text: '紧急业务', MK: this.baoXiuMK2 },
    { text: '维修确认', MK: this.baoXiuMK3 },
    { text: '特殊业务', MK: this.baoXiuMK4 },
    { text: '隐患上报', MK: this.baoXiuMK5 }
  ]
  @State woDeMK: myMoKuai[] = [
    {
      title: '我的课表',
      etitle: 'Class schedule',
      img: $rawfile('keBiao.svg'),
      details: '明天暂时没有课程哦好好休息吧'
    },
    {
      title: '学生选课',
      etitle: 'Curricula-variable',
      img: $rawfile('xuanKe.svg'),
      details: '选课系统暂未开放'
    },
    {
      title: '空教室查询',
      etitle: 'Empty classroom',
      img: $rawfile('kongJiaoShi.svg'),
      details: '当前空教室:WLA-102，WLA-205，WLA-301，XXB-301...'
    },
    // {
    //   title: '教室借用',
    //   etitle: 'Classroom borrowing',
    //   img: $rawfile('jieJiaoShi.svg'),
    //   details: '申请空教室使用权'
    // },
    {
      title: '我的成绩',
      etitle: 'My grades',
      img: $rawfile('chengJi1.svg'),
      details: '来看看自己的最新成绩'
    },
    {
      title: '学分查询',
      etitle: 'class schedule',
      img: $rawfile('xueFen.svg'),
      details: '查询学业完成度'
    },
    {
      title: '校园调研',
      etitle: 'Campus research',
      img: $rawfile('diaoYan.svg'),
      details: '完成调研问卷，及时反馈问题'
    },
  // {
  //   title: '我的课表',
  //   etitle: 'class schedule',
  //   img: $rawfile('keBiao.svg'),
  //   details: '明天暂时没有课程哦好好休息吧'
  // },
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

      //置顶栏
      Row() {
        //最上角叉子组件
        Column() {
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

        //右上角更多组件
        Column() {
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
        //首页
        TabContent() {
          //首页tabContent根组件
          Flex({ direction: FlexDirection.Column }) {

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
                    radius: 40,
                    offsetX: 10,
                    offsetY: 10
                  })
                  .stateStyles({
                    pressed: {
                      .shadow({
                        radius: 10,
                        offsetX: 10,
                        offsetY: 10
                      })
                    }
                  })
                }
                .margin({ bottom: 10, top: 10 })
                .onClick(() => {
                  router.pushUrl({ url: item.url })
                })

              })


            }
            .width('100%')
            // .scrollable(ScrollDirection.Vertical)
            .padding({ top: 20, left: 10, bottom: 10, right: 10 })
            .lanes(2)
            .height('495.00vp')
          }
          .width('100%')
          .height('100%')
          .padding({ bottom: 5 })
          .linearGradient({
            direction: GradientDirection.RightBottom,
            colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
          })
        }.tabBar(this.TabBuilder(0, $rawfile('Firstpage.svg'), '首页'))

        //订单
        TabContent() {

          Flex({ direction: FlexDirection.Column }) {
            //订单页根组件
            Text('您的订单')
              .width('100%')
              .textAlign(TextAlign.Center)
              .margin({ top: 20, bottom: 20 })
              .fontSize(35)
              .fontWeight(700)
              .flexBasis(85)

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
            .padding({ bottom: 5 })
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
                      Text(item.text)
                        .fontSize(25)
                        .fontWeight(600)
                    }
                    .width('100%')
                    .height(30)
                    .alignItems(VerticalAlign.Center)
                    .justifyContent(FlexAlign.Start)

                    //具体服务模块区域
                    Flex({ wrap: FlexWrap.Wrap }) {

                      ForEach(item.MK, (it: baoXiuMoKuai, ind: number) => {
                        //服务模块
                        Row() {
                          Text(it.text)
                            .fontSize(20)
                          Image(it.img)
                            .width(50)
                            .fillColor(it.color)
                        }
                        .backgroundColor(Color.White)
                        .width(180)
                        .height(100)
                        .borderRadius(20)
                        .padding({ left: 20, right: 15 })
                        .margin(6)
                        .shadow({ radius: 50, offsetX: 20, offsetY: 10 })
                        .justifyContent(FlexAlign.SpaceBetween)
                        .stateStyles({
                          pressed: {
                            .shadow({
                              radius: 15,
                              offsetY: 10,
                              offsetX: 20
                            })
                          }
                        })
                      })


                    }
                    .width('100%')
                    .padding(10)
                  }
                }
                .margin({ top: 20, bottom: 20 })
              })


            }
            .width('100%')
            .flexGrow(1)
            .margin({ bottom: 70 })
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
          //我的页根组件
          Flex({ direction: FlexDirection.Column }) {
            //上半区固定栏
            Column() {

              //右上角设置外层组件
              Row() {
                //设置图标包裹组件
                Row() {
                  Image($rawfile('setting.svg'))
                    .width(25)
                }
                .width(30)
                .height(30)
                .margin(6)
                .justifyContent(FlexAlign.Center)
                .backgroundColor('#c0bbbaba')
                .borderRadius(35)
              }
              .width('100%')
              .justifyContent(FlexAlign.End)

              //头像昵称学号栏
              Column({ space: 10 }) {

                Image($rawfile('kongTouXiang.svg'))
                  .width(80)

                Text('姓名:XXX')
                  .fontSize(18)
                // .opacity(1)
                Text('学号:202XXXXXXX')
                  .fontSize(18)
                Text('学院:XXX学院')
                  .fontSize(18)
                  .margin({ bottom: 10 })
              }
              .width('100%')
              .alignItems(HorizontalAlign.Center)

            }
            .width('100%')
            // .backgroundColor('#5affffff')
            .linearGradient({
              direction: GradientDirection.LeftBottom,
              colors: [['#c4c20df7', 0], ['#f300fffc', 1]]
            })
            .flexBasis(320)

            //下半区功能栏根组件
            List({ space: 20 }) {

              //我的空间横幅
              ListItem() {
                Text('我的空间')
                  .fontSize(25)
                  .fontWeight(600)
                  .margin(5)
              }
              .width('100%')
              .backgroundColor('#d2ffffff')
              .margin({ top: 20 })

              ForEach(this.woDeMK, (item: myMoKuai, index: number) => {
                //具体功能模块
                ListItem() {

                  //模块最外层组件
                  Row({ space: 10 }) {
                    //左侧列表名
                    Column({ space: 10 }) {
                      Text(item.title)
                        .fontSize(24)
                        .fontWeight(500)
                      Text(item.etitle)
                        .opacity(0.6)
                        .fontSize(16)
                    }
                    .justifyContent(FlexAlign.Center)
                    .alignItems(HorizontalAlign.Start)
                    .width(120)

                    //中央功能图片
                    Image(item.img)
                      .height(50)

                    //简介文字
                    Text(item.details)
                      .width(160)
                      .opacity(0.8)
                      .maxLines(3)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })

                    //右箭头
                    Image($rawfile('youJianTou.svg'))
                      .width(35)
                      .alignSelf(ItemAlign.Center)
                  }
                  .width('100%')
                  .padding({ left: 5, right: 5, top: 15, bottom: 15 })
                  .justifyContent(FlexAlign.Start)
                  .alignItems(VerticalAlign.Center)

                }
                .width('100%')
                .backgroundColor('#d2ffffff')
              })


            }
            // .height(530)
            .width('100%')
            .flexGrow(1)
            .padding({ bottom: 5 })

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