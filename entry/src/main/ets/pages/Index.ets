@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      //根组件
      Row(){
        //置顶栏
        Image($rawfile('X.svg'))
          .height(20)
          .margin({left:12,right:12})

        Text('北京信息科技大学体育信息化平台')
          .fontColor(Color.White)
          .fontWeight(600)

        Image($rawfile('more_sport.svg'))
          .width(30)
          .margin({right:10})
      }
      .height(60)
      .width('100%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceBetween)

      Image($rawfile('bxk.jpg'))
        .width(100)
        .margin({top:80})
    }
    .width('100%')
    .height('100%')
  }
}