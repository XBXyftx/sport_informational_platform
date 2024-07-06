@Entry
@Component
struct PE_T_M{
  build(){
    //根组件
    Flex({direction:FlexDirection.Column}){

    }
    .width('100%')
    .height('100%')
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
    })
  }
}