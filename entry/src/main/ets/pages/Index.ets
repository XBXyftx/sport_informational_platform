@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Image($rawfile('bxk.jpg'))
        .width(100)
    }
    .width('100%')
    .height('100%')
  }
}