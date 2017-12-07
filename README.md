# RGListKit

RGListKit is a **Protocol** & **MVVM** based framework for populating `UITableView` & `UICollectionView`. It takes care of **batch-reload** as well which is powered by [Dwifft](https://github.com/jflinter/Dwifft).

## Features
- No need to call `reloadData()`
- No need to manage indexPaths to `performBatchUpdates(_:, completion:)`
- No need to use different apis to populate UITableView & UICollectionView
- It works with multiple sections
- It works with multiple cell types
- `ListableView`, a protocol which unifies UITableView & UICollectionView
- `ListManager` takes care of populating a `ListableView`
- `[sections]` is all you need to set which acts like a datasource to populate a `ListableView`
- `ItemModel`, a protocol which unifies UITableViewCell & UICollectionViewCell
- Every cell is populated/configured via an `ItemModel` which is based on MVVM pattern
- Decoupled diffing algorithm, powered by [Dwifft](https://github.com/jflinter/Dwifft)
- Extendible API
- Written completely in Swift 

## Installation

### Cocoapods
To integrate RGListKit into your Xcode project using CocoaPods, specify it in your Podfile:

#### Swift 3.1
```
  pod 'RGListKit', :git => 'https://github.com/riteshhgupta/RGListKit.git', :branch => 'swift3'
```

#### Swift 4.0
```
  pod 'RGListKit', :git => 'https://github.com/riteshhgupta/RGListKit.git'
```

#### Swift 4.0 + ReactiveSwift
```
  pod 'RGListKit/ReactiveSwift', :git => 'https://github.com/riteshhgupta/RGListKit.git', :branch => 'swift4'
```

## Example
### UITableView
```swift
...
		let tableView = UITableView()
		let cellModels: [ItemModel] = [...]
		let sectionModel = SectionModel(id: "section-one-id", cells: cellModels)
		
		listManager = ListManager(listView: tableView)
		listManager.sections = [sectionModel]
...
```

### UICollectionView
```swift
...
		let collectionView = UICollectionView()
		let cellModels: [ItemModel] = [...]
		let sectionModel = SectionModel(id: "section-one-id", cells: cellModels)
		
		listManager = ListManager(listView: collectionView)
		listManager.sections = [sectionModel]
...
```

## Internal Architecture

- As you can see the api for populating UITableView or UICollectionView is identical, one of the benefits of using RGListKit. 
- `ItemModel` defines a cell or even a header/footer-view for both UITableViewCell & UICollectionViewCell
- `ListManager` has a property `sections` which when set triggers the view update
- All the updates are by default batch-update but you can turn it off by setting `shouldPerformBatchUpdate = false`
- You don't have to worry about indexPaths anymore, it uses diffing of old & new array of sections which calculates & performs the update for you.
- It doesn't intefere at all with custom views, like custom table cell or custom layout for collection view. RGListKit only takes care of your datasource and not the UI appearance. So you are free to use any custom layouts as required along with RGListKit.
- Since RGListKit consumes both `delegate` & `datasource` so you can simply extend `ListManager` to handle any custom use cases like `didSelect` when required. All the methods will be available under `ListManager` e.g.

```swift
// UICollectionView

extension ListManager {
	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	}
}

```
```swift
// UITableView

extension ListManager {
	public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
	}
}
```

- There are couple of examples in the project itself which you can checkout or create an issue or ping [me](https://twitter.com/_riteshhh) if anything comes up 👍

## Blogs/Newsletter
List of online sources which have mentioned RGListKit, 

- [Natasha's Swift newsletter - issue #133](https://swiftnews.curated.co/#libraries)
- [Swift's Weekly - issue #78](http://digest.swiftweekly.com/issues/swift-weekly-issue-78-59042)
- [Compile Swift newsletter - issue #58](http://mailchi.mp/baadd551f100/the-compileswift-newsletter-issue-1481361)
- [iOS Cookies Newsletter - issue #82](http://mailchi.mp/1cfc2545e484/ios-cookies-newsletter-1406733)

## Contributing

Contributions are welcome and encouraged! Open an [issue](https://github.com/riteshhgupta/RGListKit/issues/new) or submit a [pull request](https://github.com/riteshhgupta/swift-snippets/compare) 🚀

## Licence

RGListKit is available under the MIT license. See the LICENSE file for more info.
