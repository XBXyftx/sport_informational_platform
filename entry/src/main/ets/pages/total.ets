@Entry
@Component
struct total{
  @State fontColor: string = '#182431'//默认文字颜色
  @State selectedFontColor: string = '#007DFF'//被选中时的文字颜色
  @State currentIndex: number = 0//是否被选中的判别器
  private controller: TabsController = new TabsController()





  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }





  build(){
    Column(){
      //根组件
    }
  }
}