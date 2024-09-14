//学生体质测试详情页
import router from '@ohos.router'
import { zhiDingLan } from './Index'

interface tiZhiAnNiu{
  text:string
  url:string
}
@Entry
@Component
struct TZCS {
  @State tZAN : tiZhiAnNiu[]=[
    {text:'测试预约',url:''},
    {text:'缓考申请',url:''},
    {text:'成绩查询',url:''},
    {text:'测试预约',url:''},
  ]

  build() {
    Flex({ direction: FlexDirection.Column }) {
      zhiDingLan()

      //标题
      Row() {
        Text('学生体质测试')
          .fontSize(40)
          .fontWeight(800)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 10, bottom: 10 })

      //下半区主内容根组件
      Column({space:35}) {

        Image($rawfile('tiZhi.svg'))
          .width(200)

        ForEach(this.tZAN,(item:tiZhiAnNiu,index:number)=>{
          Row() {
            Text(item.text)
              .fontSize(28)
              .fontWeight(600)
          }
          .padding(20)
          .borderRadius(100)
          .linearGradient({
            direction: GradientDirection.RightBottom,
            colors: [['#fcffffff', 0], ['#a5b2b2b2', 1]]
          })
          .justifyContent(FlexAlign.Center)
          .shadow({radius:0})
          .stateStyles({
            pressed:{
              .shadow({radius:20})
            }
          })
        })

      }
      .flexGrow(1)
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .margin({ top: 60 })
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
    })
  }
}