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
          .fontColor(Color.White)
          .fontWeight(600)
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