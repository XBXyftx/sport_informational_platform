import router from '@ohos.router'
import { zhiDingLan } from './Index'

interface PE_MoKuai {
  img: Resource
  str: string
  // url:string
}

//体育教学管理详情页
@Entry
@Component
struct PE_T_M {
  @State PE_MK: PE_MoKuai[] = [
    { img: $rawfile('jiaoShiGuanLi.svg'), str: '教师管理' },
    { img: $rawfile('jiaoYan.svg'), str: '教研管理' },
    { img: $rawfile('tiYu.svg'), str: '体育课程开设' },
    { img: $rawfile('PEchengJi.svg'), str: '体育成绩管理' },
    { img: $rawfile('ziYuan.svg'), str: '教学资源' }
  ]

  build() {
    //根组件
    Flex({ direction: FlexDirection.Column }) {

      zhiDingLan()

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
        .margin({ bottom: 30 })

      //下半区主内容根组件
      List() {

        ForEach(this.PE_MK, (item: PE_MoKuai, index: number) => {
          //教学管理模块
          ListItem() {
            Row() {
              Image(item.img)
                .height(50)
              Text(item.str)
                .fontSize(30)
                .fontWeight(500)
                .flexGrow(1)
                .textAlign(TextAlign.Center)

            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .padding({
              left: 20,
              right: 0,
              top: 10,
              bottom: 10
            })
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ bottom: 10 })
            .width(360)
            .backgroundColor('#9affffff')
            .border({ color: Color.Black, width: 2 })
            .borderRadius(30)
            .opacity(1)
            .stateStyles({
              pressed: {
                .opacity(0.6)
              }
            })
          }
          .width('100%')
          .margin({ top: 10, bottom: 10 })

        })

        ListItem() {
          Text('- 智慧运动 - 健康随行 -')
            .fontSize(25)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontWeight(500)
            .margin({ top: 20 })
        }
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