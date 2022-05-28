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

**2. 글로벌한 UISearchBar 설정**
2022.5.26

- UINavigationItem 객체는 Navigation Controller 에 View Controller 가 추가될 때 마다 새로 생성되어 삽입됨
- 때문에 글로벌하게 적용하려면 UITabBarController 로 감싸 tabBarController.navigationItem.searchController 로 접근해 서치바를 삽입할 수 있다.
  - ViewController 별 NavigationItem 인스턴스가 생성되기 때문에 기본적으로 navigationItem 에 대한 설정은 독립적이다.
  - tabBarController 인스턴스는 하나뿐이므로 navigationItem 설정을 다른 페이지와 공유할 수 있는 것이다. 그렇지만 이 방법이 workaround 이라는 생각이 든다.
  - 글로벌한 설정을 공유한다는 것 자체가 지양해야할 지점이 아닌가라는 의문이 든다.
