import 'package:weather/datasource/network/dio/dio_client.dart';
import 'package:weather/common/config/default_env.dart';
import 'package:weather/datasource/data/local_user_data.dart';

class ApiChatClient extends DioClient {
  ApiChatClient()
      : super(
            baseUrl: DefaultConfig.baseUrl,
            headers: getAuthenticationHeader(),
            interceptors: []);

  static Map<String, String> getAuthenticationHeader() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Auth-Token':'${LocalUserData.getInstance.chat_token}',
      'X-User-Id':'${LocalUserData.getInstance.chat_id}',
      // 'Authorization':
      //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiMTJkZmNjZDcwMTk0ODUwMmY1ZjdjOTAyM2Q4MTQxZDRiYWEyOTlkNjBiOWViZTEzNmFjMjZhYzY4ODNlMDU1MDc2MzdhMDdjMjdkMzFlZGYiLCJpYXQiOjE2NTEyMTY0NjcuMTQ2OTAxLCJuYmYiOjE2NTEyMTY0NjcuMTQ2OTA4LCJleHAiOjE2NTI1MTI0NjYuOTIzNjk0LCJzdWIiOiIxOTUiLCJzY29wZXMiOlsiKiJdfQ.PgA-SwPgB9B7xpzfNffXDxcUZ1TJFZAtx-4aeQc2OjlyjXtxIl0aHmCKOdZsjAhToML_WovzT4oTuJm0npxjT33nr5g-3-1Dd8xVb7sTVA-GHlPZfsImsymgZEJMFlLrXG5T4YdyUwCuKSCD-one4lSkv476AXcrD0LAlReA_DYdxOCIdDzuyGgjWVkbvhgafzhT2MlVxlcHs8ulf1BfFEyA4Hb32OWXoMsYgCxx__n9RO7zEJ9iiGWykmOaEbeHFTU3ELUhU_2XJR66I5--7rVo_WMe7ZFgMgC4urNmO3eEWzi47sV7fch0NguNrE5omd8maB7hsbdG7SNUlqSNv_uKqZj435hxbTol1Fl1T8fm8NuQScMVCgUlvbV-1GZttOKJLL-ZHre_KyjgwT16ofHZ7-vJEE_0iWvJUN4MoaTfYFlu3HarC-hfRECxq7w5zv16XpMLOWqII9qJfxrCwtk1OXzYEhmcMcREswD_JU7FBk01gGVhBRCPZmIfKu3fVGTPGjrN1gVt4u0XDRKtZQK12AGaxRDVh5MRn9kSwm90k_QXZdSxLKE6bzSptnyxqLScA6YjY2f43CgkehxzIqcFFAUWAG-TFo4Zj8NK-lQYu2HcWIv-Xt9GJzJ7X6HIDFgK2drwyVnLDzYf1-2UQbMO5nxbbEmzQ0IoIRyOHSE',
      'Authorization' :'Bearer ${LocalUserData.getInstance.accessToken}',
      'Accept-Language': '${LocalUserData.getInstance.defaultLanguage}'
    };
  }
}
