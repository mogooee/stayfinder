## 문제와 해결

**1. 탭을 누르기 전까지 탭 아이콘과 타이틀이 화면에 보이지 않는 문제**
2022.5.25

```Swift
// SceneDelegate.swift
let home = HomeController()

home.tabBarItem = .init(
  title: "검색",
  image: .magnifier,
  tag: 0
)
```

시뮬레이터 실행 시 화면에 반영됨

**🤔 문제상황**

```Swift
// HomeController.swift
func viewDidLoad() {
  // ...
  self.tabBarItem = .init(
    title: "검색",
    image: .magnifier,
    tag: 0
  )
}
```

But, viewDidLoad 에서 설정하면 탭을 누르기 전까지 화면에 나오지 않음

**💡 해결**

원인: 탭을 누르기 전까지 viewDidLoad 는 호출되지 않음

해결: viewDidLoad 에서 설정하지 않고 TabBarController 를 설정하는 컨텍스트에서 HomeController의 tabBarItem 설정
