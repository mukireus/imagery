# Imagery

### Uygulamanın özellikleri
  - İlk açıldığında, güncel ve popüler olan fotoğrafları rastgele bir şekilde ekrana bastırır.
  - Beğendiğiniz fotoğrafa tıkladığınız zaman fotoğrafın büyük hali açılır.
  - Büyük olarak açılan fotoğrafa tıkladığınızda indirme başlar. (Geri tıkladığınızda indirmeden çıkabilirsiniz.).
  
### Kurulum
#### Apk :
###### Uygulamamızı google play butonuna tıklayarak indirebilir ve ardından kullanabilirsiniz
[![Google Play](https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png)](https://play.google.com/store/apps/details?id=com.Ases.imagery)

### Kullanılan Paketler
Flutter uygulamaları oluşturmak için hazır paketler kullanılabilir. Bu paketlere [Dart packages pub.dev](https://pub.dev/)'den erişebilirsiniz. Uygulamamızda kullanılan paket dosyasına [pubspec.yaml](https://github.com/mukireus/imagery/blob/main/pubspec.yaml) dosyasından erişebilirsiniz.


| Plugin İsmi | Plugin Link |
| ------ | ------ |
| mobx | https://pub.dev/packages/mobx |
| flutter_mobx | https://pub.dev/packages/flutter_mobx |
| http | https://pub.dev/packages/http |
| mobx_codegen | https://pub.dev/packages/mobx_codegen |
| flutter_staggered_grid_view | https://pub.dev/packages/flutter_staggered_grid_view |
| cached_network_image | https://pub.dev/packages/cached_network_image |
| permission_handler | https://pub.dev/packages/permission_handler |
| toast | https://pub.dev/packages/toast |
| media_store | https://pub.dev/packages/media_store |
| build_runner | https://pub.dev/packages/build_runner |


## UX Arayüz Tasarım Dokümanı
Uygulamamızdaki senaryoyu özetleyelim. Kullanıcı uygulamayı ilk açtığında güncel ve popüler fotoğrafları ekranda görür. Eğer kullanıcı arama yapmak isterse uygulamanın en üst kısmında bulunan arama bileşenine, aratmak istediği kelimeyi yazdıktan sonra klavyede bulunan arama aksiyonuna tıklayarak aramayı başlatabilir. Eğer aramayı temizlerse, tekrardan rastgele fakat yeni fotoğraflar gözükür. Kullanıcı bir fotoğrafı beğenir ve büyük görüntülemek isterse, fotoğrafa bir kere tıkladıktan sonra fotoğrafın büyük halinin yüklenmesini bekler. Ardından indirmek isterse bir kez daha fotoğrafa tıklayarak fotoğrafı indirebilir. İptal etmek isterse, geri çıkması yeterlidir.

Aşağıdaki tabloda uygulamaya ait ekran görüntülerini bulabilirsiniz.


<table>
  <tr>
    <td> Servis yüklenme ekranı </td>
    <td> Fotoğraf yüklenme ekranı </td>
    <td> Rastgele fotoğraflar ekranı </td>
  </tr>
  <tr>
    <td> <img src="https://github.com/mukireus/imagery/blob/main/screenshots/loading_service.jpg" width = 270px height = 600px ></td>
    <td> <img src="https://github.com/mukireus/imagery/blob/main/screenshots/loading_photo.jpg" width = 270px height = 600px ></td>
    <td> <img src="https://github.com/mukireus/imagery/blob/main/screenshots/random.jpg" width = 270px height = 600px ></td>
  </tr> 
</table>
<table>
  <tr>
    <td> Fotoğraf Aratma Ekranı </td>
    <td> Seçilen fotoğraf yüklenme ekranı </td>
    <td> Büyütülmüş fotoğraf ekranı </td>
  </tr>
  <tr>
    <td> <img src="https://github.com/mukireus/imagery/blob/main/screenshots/search_word.jpg" width = 270px height = 600px ></td>
    <td> <img src="https://github.com/mukireus/imagery/blob/main/screenshots/image_loading.jpg" width = 270px height = 600px ></td>
    <td> <img src="https://github.com/mukireus/imagery/blob/main/screenshots/selected_image.jpg" width = 270px height = 600px ></td>
  </tr> 
</table>
