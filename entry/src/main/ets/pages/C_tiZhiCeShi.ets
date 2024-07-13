//学生体质测试详情页
import router from '@ohos.router'

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