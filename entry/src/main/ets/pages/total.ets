import router from '@ohos.router'

@Entry
@Component
struct total{
  @State fontColor: string = '#182431'//默认文字颜色
  @State selectedFontColor: string = '#007DFF'//被选中时的文字颜色
  @State currentIndex: number = 0//是否被选中的判别器
  private controller: TabsController = new TabsController()





  @Builder TabBuilder(index: number,picture:Resource,name:string) {
    //通用TabBuilder
    Column() {
      Image(picture)
        .width(30)
        .margin({top:5})
        .fillColor(this.currentIndex === index ? '#fff42aaa' : Color.Blue)
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        //文字颜色根据是否被选择判别器currentIndex来决定
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        //选中后文字稍微变粗
        .lineHeight(22)
        .margin({ top:0})
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
        //分割线透明度根据是否被选择判别器currentIndex来决定
    }.width('100%')
    .backgroundColor('#ffd7e9fc')
    .height(70)
  }





  build(){
    Flex({direction:FlexDirection.Column}){
      //根组件
      Row(){
        //置顶栏
        Column(){
          //最上角叉子组件
          Image($rawfile('X.svg'))
            .height(20)
            .fillColor(Color.White)
            .onClick(()=>{
              router.back()
            })

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
      .flexBasis(60)
      .width('100%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceBetween)



      Tabs({ barPosition: BarPosition.End, controller: this.controller }){
        //底部标签栏
        TabContent(){
          //首页
          Column(){
            //首页tabContent根组件
          }
        }.tabBar(this.TabBuilder(0,$rawfile('Firstpage.svg'),'首页'))

        TabContent(){
          //订单
          Column(){}
        }.tabBar(this.TabBuilder(1,$rawfile('Order.svg'),'订单'))

        TabContent(){
          //报修
          Column(){}
        }.tabBar(this.TabBuilder(2,$rawfile('repairs.svg'),'报修'))

        TabContent(){
          //我的
          Column(){}
        }.tabBar(this.TabBuilder(3,$rawfile('My.svg'),'我的'))
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