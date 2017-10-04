Pod::Spec.new do |spec|
  spec.name         =  'RGListKit'
  spec.version      =  '1.0'
  spec.summary   =  'RGListKit - the missing gap between UITableView & UICollectionView!'
  spec.author = {
    'Ritesh Gupta' => 'rg.riteshh@gmail.com'
  }
  spec.license          =  'MIT' 
  spec.homepage         =  'https://github.com/riteshhgupta/RGListKit'
  spec.source = {
    :git => 'https://github.com/riteshhgupta/RGListKit.git',
    :tag => '1.0'
  }
  spec.ios.deployment_target = "9.0"
  spec.requires_arc =  true

  spec.subspec 'Core' do |core|
      core.source_files =  'Source/DiffKit/*.{swift}', 'Source/ListKit/Core/*.{swift}', 'Source/ListKit/Extension/*.{swift}', 'Source/ListKit/UIKit/*.{swift}'
  end

  spec.subspec 'ReactiveSwift' do |reactiveswift|
      reactiveswift.dependency 'RGListKit/Core'
      reactiveswift.dependency 'ReactiveSwift', '~> 2.0'
      reactiveswift.dependency 'ReactiveCocoa', '~> 6.0'
      reactiveswift.source_files =  'Source/DiffKit/*.{swift}', 'Source/ListKit/Core/*.{swift}', 'Source/ListKit/Extension/*.{swift}', 'Source/ListKit/UIKit/*.{swift}', 'Source/Reactive/*.{swift}'
  end

  spec.default_subspec = 'Core'

end
