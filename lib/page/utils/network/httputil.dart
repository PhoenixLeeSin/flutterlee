import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

///网络请求工具类
class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;
  CancelToken cancelToken = CancelToken();

  static HttpUtil getInstance() {
    if (null == instance) instance = HttpUtil();
    return instance;
  }

  HttpUtil() {
    //BaseOptions Options RequestOptions 都可以配置参数，优先级依次递增，并且可以根据优先级覆盖参数
    options = BaseOptions(
      baseUrl: '',
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {},
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.plain,
    );
    dio = Dio(options);
    //cookie
    dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return options;
      },
      onResponse: (Response response) {
        return response;
      },
      onError: (e) {
        return e;
      },
    ));
  }

  ///GET
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
    } catch (e) {
      formatError(e);
    }
    return response;
  }

  ///POST
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
    } catch (e) {
      formatError(e);
    }
    return response;
  }

  ///DOWNLOAD
  download(url, savePath) async {
    Response response;
    try {
      response = await dio.download(
        url,
        savePath,
        onReceiveProgress: (int count, int total) {
          print("$count $total");
        },
      );
    } catch (e) {
      formatError(e);
    }
    return response;
  }

  ///统一错误处理
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print('连接超时');
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("取消请求");
    } else {
      print("未知错误");
    }
  }

  ///取消请求
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
