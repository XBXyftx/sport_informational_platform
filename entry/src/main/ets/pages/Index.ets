import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State account : Number = 0
  @State password : string = ''
  @State verification_code : Number = 0

  build() {
    //根组件
    Flex({direction:FlexDirection.Column}){
      //置顶栏
      zhiDingLan()


      //下半区最外层组件
      Column(){

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

            TextInput({placeholder:'请输入账号'})
              .type(InputType.Number)
              .onChange((account:string)=>{
                this.account = 0
                this.account = parseInt(account)
              })
          }
          .flexGrow(1)
          .width('100%')
          .margin({left:10,right:5})

          Divider()

          Row(){
            //密码行
            Text('密码')
              .width(60)

            TextInput({placeholder:'请输入密码'})
              .type(InputType.Password)
              .onChange((password:string)=>{
                this.password = password
              })
          }
          .flexGrow(1)
          .width('100%')
          .margin({left:10,right:5})

          Divider()

          Row(){
            //验证码行
            Text('验证码')
              .width(60)

            Image($rawfile('ma.jpg'))
              .height(30)

            TextInput({placeholder:'请输入验证码'})
              .type(InputType.Number)
              .onChange((verification_code:string)=>{
                this.verification_code = 0
                this.verification_code = parseInt(verification_code)
              })
          }
          .flexGrow(1)
          .width('100%')
          .margin({left:10,right:5})

        }
        .margin({top:50})
        .backgroundColor('#ffc1bebe')
        .width(330)
        .height(150)
        .opacity(0.5)
        .shadow({radius:100,color:Color.Black})

        Button('忘记密码')
          .fontColor(Color.White)
          .width(90)
          .height(20)
          .fontSize(12)
          .fontWeight(500)
          .margin({top:15,left:40})
          .backgroundColor('#45292828')
          .alignSelf(ItemAlign.Start)

        Button('登录')
          .margin({top:70})
          .fontSize(18)
          .width(300)
          .opacity(0.9)
          .stateStyles({
            pressed:{
              .opacity(0.6)
            }
          })
          .onClick(()=>{
            router.pushUrl({
              url:"pages/B_total"
            })
          })
      }
      .width('100%')
      .backgroundImage($rawfile('sign_in_background.jpg'))
      .backgroundImageSize(ImageSize.Cover)
      .flexGrow(1)
      .expandSafeArea()

    }
    .width('100%')
    .height('100%')

  }
}

@Builder
function zhiDingLan() {
  //置顶栏
  Row() {
    //最上角叉子组件
    Column() {

      Image($rawfile('X.svg'))
        .height(20)
        .fillColor(Color.White);

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
    .justifyContent(FlexAlign.Center);


    Text('北京信息科技大学体育信息化平台')
      .fontColor(Color.White)
      .fontWeight(600);

    Column() {
      //右上角更多组件
      Image($rawfile('more_sport.svg'))
        .width(30);
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
    });

  }
  .flexBasis(60)
  .width('100%')
  .backgroundColor(Color.Black)
  .justifyContent(FlexAlign.SpaceBetween)
}
export {zhiDingLan}