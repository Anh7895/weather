# weather
cd

//# Tài liệu hướng dẫn


* [Cấu trúc thư mục](#part1)

* [Run project](#part2)

* [Các công nghệ và pattern được sử dụng](#part3)

* [Common widget thường sử dụng](#part4)

## Role Branch
* Tạo branch feature theo cấu trúc: 'feature/your_name/your_feature'
* Tạo branch fix bug theo cấu trúc: 'fix/your_name/fix...'

## Các quy tắc cần lưu ý

* Tên lớp, enum đặt theo PascalCase, ví dụ: UserClass, CategoryClass, ..
* Tên hàm và phương thức sử dụng camelCase, ví dụ getUser, getCategory…
* Tên biến cũng sử dụng camelCase loginUser,loginUser,categoryList…
* Tên hằng số thì đặc biệt, viết hoa hết và cách nhau bởi dấu gạch dưới DISCOUNT_PERCENT, LIMIT_RATE…
* Tên các file đặt theo kiểu underscore ví dụ: user_screen.dart, ...

* Trong thư mục ui sẽ tạo các directory tương ứng với screen trong đó sẽ có màn hình chính và các widget component.

* Nên tách các component ui trong một màn hình.
  Ví dụ: Danh sách Category sẽ tách item category sang widget khác.
  Các widget component có thể tạo ngay trong thư mục chứa màn hình đó hoặc tách riêng vào thư mục widget trong common. Tùy vào mức độ tái sử dụng của component.
  Mục đích: Dễ tìm, gọn code, dễ xử lý, có thể tái sử dụng ở nhiều ui khác nhau, ...


## <a name="part1"></a> Cấu trúc thư mục
*  `blocs` : Thư mục BLoC của từng màn hình, trong mỗi bloc folder bao gồm 3 class : Bloc, Event, State
*  `datasource` : Thư mục quản lý model, network và repository
*  `common` : Thư mục quản lý widget common, validator widget, constant value
*  `ui` : Thư mục quản lý UI
* `app.dart` : Thay đổi màn hình khởi tạo ở `initialRoute:Routes.targetRouteName`


## <a name="part2"></a> Run Project
Requirement tools:
* flutter version 2.5.3
* dart version 2.14.4

* Step by step : Flutter clean -> Flutter pub get -> Flutter run

## <a name="part3"></a> Các công nghệ và pattern được sử dụng

### **BLoC** (Bussiness Logic Component):

<div align="center">
   <p style="margin-top: 48; margin-bottom: 48;">
      <img width="800" style="vertical-align: middle;" src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_architecture.png"/>
   </p>
</div>


BLoC là một pattern được khuyên dùng bởi Google khi làm việc với Flutter, về cơ bản BLoC là một thành phần chứa logic nghiệp vụ của chương trình, nhận dữ liệu đầu vào `X`, xử lý nghiệp vụ và trả về `Y`.

Ví dụ: ứng dụng cần gọi rest API để lấy về thông tin tài khoản cho người dùng, giả sử người dùng có `userId = X`, và dữ liệu mong muốn là thông tin tài khoản `Y`, BLoC sẽ được xây dựng để thực hiện một `HttpRequest` lên server với tham số `X`, dữ liệu trả về được xử lý và đóng gói thành dữ liệu dạng `Y`.

BLoC được xây dựng dựa trên 2 khái niệm cơ bản của Dart và Flutter là `Stream` và `InheritedWidget`. `Stream` được sử dụng để giúp BLoC tương tác với các thành phần khác, nhận và trả về dữ liệu. Trong Flutter, các thành phần của một ứng dụng tồn tại trong các `Widget`, BLoC cũng tương tự. BLoC được bao bọc trong một `InheritedWidget` và nhờ đặc tính của `Widget` này, các thành phần khác trong ứng dụng có thể truy xuất được đối tượng BLoC này.

Nhờ việc chia tách logic nghiệp vụ khỏi các đối tượng UI, sử dụng BLoC giúp việc tái sử dụng code và unit test trở nên dễ dàng hơn.

*** State management được triển khai theo mô hình của packages  flutter_bloc ***

### **flutter_bloc** (https://pub.dev/packages/flutter_bloc):
Thư viện giúp dễ dàng triển khai pattern BLoC

### **kiwi** https://pub.dev/packages/kiwi):
Thư viện giúp cho việc triển khai DI
- command  generator kiwi:
  `flutter packages pub run build_runner build --delete-conflicting-outputs`

Folder lib/common/injector

Mỗi lần tạo thêm một bloc mới, repository mới, remotedata source mới, cần khai báo thêm trong injector_config class
VD :
@Register.factory(NewBloc)
void _configureBlocs();

@Register.factory(NewRepository)
void _configureRepositories();

@Register.factory(NewDataSource)
void _configureDataSources();


sau đó run `flutter packages pub run build_runner build --delete-conflicting-outputs` để generate lại data


Tham khảo:

[State Management in Flutter](https://blog.geekyants.com/state-management-in-flutter-7df833e6f3bd)

[Reactive Programming - Streams - BLoC](https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/)

[Triển khai flutter_bloc package](https://www.miquido.com/blog/flutter-architecture-provider-vs-bloc/)

[flutter_bloc package](https://pub.dev/packages/flutter_bloc)

[kiwi package](https://pub.dev/packages/kiwi)

### **Swagger Generate** (Sử dụng cho BE viết swagger):
- Swagger generate code api, tạo các file api, model,...

Mỗi lần swagger update, client cần generate lại file api.
- `cd api`
- Với macos `openapi-generator generate -i 'url swagger json' -g dart-dio-next`
- Với windown `openapi-generator generate -cli 'url swagger json' -g dart-dio-next`
- `flutter packages pub run build_runner build --delete-conflicting-outputs`

Ex:
Url swagger json:  `https://petstore.swagger.io/v2/swagger.json`


## <a name="part4"></a> Common widget thường sử dụng
### **BaseScreen**
- Widget cung cấp giao diện mặc định có appbar, khả năng show/hide loading khi giao tiếp network (để show/hide loading, luôn xây dựng widget HttpStreamHandler nằm trong body của BaseScreen)

```dart
BaseScreen(
      overrideBack: (context) {
        if (_currentPage > 0) {
          setState(() {
            _currentPage -= 1;
            _pageController.animateToPage(_currentPage,
                duration: Duration(milliseconds: 240), curve: Curves.easeIn);
          });
        }
      },
      backgroundColor: _backgroundColor,
      isShowAppBar: true,
      appBar: buildAppBarShowPartner(context),
      title: 'Voucher Screen',
      body: HttpStreamHandler<VoucherBloc, BaseState>(
        bloc: _bloc,
        listener: (context, state) async {
        },
        builder: (context, state) {
          return _buildScreens(context);
        },
      ),
    );
```
### **HttpStreamHandler**
- Widget xây dựng dựa trên widget BlocConsumer của package flutter_bloc, handle response success/ error, show alert cảnh báo chung khi call api thất bại
- Chú ý : không dùng setState trong builder(){}, chỉ được dùng setstate trong listener(){}
```dart
HttpStreamHandler<VoucherBloc, BaseState>(
        bloc: _bloc,
        listener: (context, state) async {
          if (state is CheckVoucherCodeSuccessState) {
            _response = state.response.result;
            _pageController.animateToPage(1,
                duration: Duration(milliseconds: 240), curve: Curves.easeIn);
          } else if (state is ConsumeCodeSuccessState) {
            showAlert(context, 'Successfully',
                'You have just consumed code successfully',
                dismissible: false, canPop: false, onDismiss: (_) {
              _pageController.animateToPage(0,
                  duration: Duration(milliseconds: 240), curve: Curves.easeIn);
            });
          } else if (state is UpdateBackgroundColorSuccessState) {
            if (state.isChangeColor) {
              _backgroundColor = ThemeColor.voucherBackgroundColor;
            } else {
              _backgroundColor = Colors.transparent;
            }
          }
        },
        builder: (context, state) {
          return _buildScreens(context);
        },
      )
```
