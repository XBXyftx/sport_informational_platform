@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Flex({ direction: FlexDirection.Column }){
      //根组件
      Row(){
        //置顶栏
        Column(){
          //最上角叉子组件
          Image($rawfile('X.svg'))
            .height(20)
            .fillColor(Color.White)

        }
        .backgroundColor(Color.Black)
        .stateStyles({
          pressed:{
            .backgroundColor(Color.Gray)
          }
        })
        .height(30)
        .width(30)
        .margin({left:12,right:10})
        .justifyContent(FlexAlign.Center)


        Text('北京信息科技大学体育信息化平台')
          .fontColor(Color.White)
          .fontWeight(600)

        Column(){
          //右上角更多组件
          Image($rawfile('more_sport.svg'))
            .width(30)
        }
        .height(30)
        .width(30)
        .margin({right:10})
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.Black)
        .stateStyles({
          pressed:{
            .backgroundColor(Color.Gray)
          }
        })

      }
      .flexGrow(1)
      .width('100%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceBetween)



      Column(){
        //下半区最外层组件
        Image($rawfile('bxk.jpg'))
          .width(100)
          .margin({top:80})
          .borderRadius(50)

        Text('北京信息科技大学体育信息化平台')
          .fontColor(Color.Black)
          .fontWeight(600)
          .fontSize(20)
          .margin({top:15})

        Flex({direction: FlexDirection.Column}){
          //输入区域组件
          Row(){
            //账号行
            Text('账号')
              .width(60)
          }
          .flexGrow(1)
          .width('100%')
          .margin({left:10,right:5})

          Divider()

          Row(){
            //密码行
            Text('密码')
              .width(60)
          }
          .flexGrow(1)
          .width('100%')
          .margin({left:10,right:5})

          Divider()

          Row(){
            //验证码行
            Text('验证码')
              .width(60)
          }
          .flexGrow(1)
          .width('100%')
          .margin({left:10,right:5})

        }
        .margin({top:40})
        .backgroundColor('#ffc1bebe')
        .width(330)
        .height(150)
        .opacity(0.5)
      }
      .width('100%')
      .backgroundImage($rawfile('sign_in_background.jpg'))
      .backgroundImageSize(ImageSize.Cover)
      .flexGrow(20)

    }
    .width('100%')
    .height('100%')

  }
}