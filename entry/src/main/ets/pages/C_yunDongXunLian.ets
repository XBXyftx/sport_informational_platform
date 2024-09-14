//运动训练管理详情页
import router from '@ohos.router'
import { zhiDingLan } from './Index'

@Entry
@Component
struct YDXLGL {
  build() {
    Column(){
      zhiDingLan()
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [['#c498f4e8', 0], ['#f31c6bd7', 1]]
    })
  }
}