# InvioCase-RickandMorty
Invio USG Challenge için Rick and Morty API kullanılarak yapılmış bir listeleme uygulaması.

## Genel Bakış
- Kullanıcıyı bir logonun ve yazının olduğu splash screen karşılar. Kullanıcı ilk defa uygulamayı açıyorsa "Welcome!", ilk açışı değil ise "Hello"
yazısı karşılar.
- Ana sayfada UICollectionViewCompositionalLayout kullanarak oluşturlan, lokasyonları listeleyen yatay ve karakterlerin listelendiği dikey bir liste 
bulunmaktadır. Lokasyonlar seçildiğinde, lokasyonda bulunan karakterler gelmektedir. Karakterler seçildiğinde ise karakter detay sayfasına gitmektedir.

- Detay sayfasında başlıkta karakterin ismi devamında ise fotoğrafı ve detayları bulunmaktadır. Detaylar çok fazla label içerdiği için UIStackView kullandım.

- Ana sayfada veriler güncellenmediği ve filtreleme, arama yapma gibi fonksiyonlar olmadığı için DiffableDataSource kullanmadım.

- CompositionalLayout kullandığım için Task 8'i yerine getiremedim çünkü UICollectionViewDelegate fonksiyonu olan
```scrollViewDidEndDragging```, ```orthogonalScrollingBehavior``` özelliğine sahip olan yatay listede oluşan eventleri belirleyemiyor. Section callback'i olan ```section.visibleItemsInvalidationHandler```kullanmayı denedim fakat sonuca ulaşamadım.

## Kullanılan Yapılar 
- MVVM Architectural Pattern with Delegation
- Dependency Injection
- Generic Network Layer
- Programmatic UI with SnapKit
- UICollectionViewCompositionalLayout

## Üçünü Parti Kütüphaneler
- Snapkit
- SDWebImage

## Screenshots
### Splash Screen
<img src="https://user-images.githubusercontent.com/83546571/230061689-357f9db7-bcfe-4e2c-b711-90eedceb71f7.png" width="294" height="620" />

### Home Screen
<img src="https://user-images.githubusercontent.com/83546571/228595116-43b71f86-81cf-465e-935a-f205ecc291b6.png" width="294" height="620" />

### Detail Screen
<img src="https://user-images.githubusercontent.com/83546571/229820265-f2542dc4-cf86-404f-855a-1c96a205b6a3.png" width="294" height="620" />
