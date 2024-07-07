import router from '@ohos.router'

interface PE_MoKuai {
  img: Resource
  str: string
}

//体育教学管理详情页
@Entry
@Component
struct PE_T_M {
  @State PE_MK: PE_MoKuai[] = [
    { img: $rawfile('jiaoShiGuanLi.svg'), str: '教师管理' }
  ]

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

      //标题
      Row() {
        Text('体育教学管理')
          .fontSize(40)
          .fontWeight(800)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 10, bottom: 10 })

      Divider()
        .strokeWidth(3)
        .color(Color.Black)
        .margin({ bottom: 10 })

      //下半区主内容根组件
      List() {

        //教学管理模块
        ListItem() {
          Row() {
            Image($rawfile('jiaoShiGuanLi.svg'))
              .height(50)
            Text('教师管理')
              .fontSize(30)
              .fontWeight(500)
              .flexGrow(1)
              .textAlign(TextAlign.Center)

          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .padding({ left: 20, right: 0, top: 10, bottom: 10 })
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ bottom: 10 })
          .width(360)
          .backgroundColor('#9affffff')
          .border({ color: Color.Black, width: 2 })
          .borderRadius(30)
        }
        .width('100%')
        .margin({ top: 10, bottom: 10 })

      }
      .flexGrow(1)
      .width('100%')

    }
    .width('100%')
    .height('100%')
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
    })
  }
}