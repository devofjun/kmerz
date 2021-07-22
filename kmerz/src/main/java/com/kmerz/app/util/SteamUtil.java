package com.kmerz.app.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpMethod;

public class SteamUtil {
	
	public static void getSteamApps() {
		String url = "http://api.steampowered.com/ISteamApps/GetAppList/v0002/?key=STEAMKEY&format=json";
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("key", "F8FFD310D21B47B80811A652B7AADDB1");
		parameter.put("format", "json");
	}
	
	public static void getAppdetails() {
		String url = "https://store.steampowered.com/api/appdetails?";
		//String param = "l=koreana&appids=322330";
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("l", "korean");
		parameter.put("appids", "322330");
		
		String html = getRequest(url, HttpMethod.GET, parameter);
		System.out.println("응답 html:");
		System.out.println(html);
	}
	
	
	// HttpURLConnection를 실행하는 함수
	public static String getRequest(String url, HttpMethod method, Map<String, Object> parameter) {
		try {
			String param = null;
			// 파라미터가 있을 경우, 파라미터키=파라미터값&파라미터키=파라미터값&파라미터키=파라미터값 의 형태로 만든다.
			if (parameter != null) {
				StringBuffer sb = new StringBuffer();
				for (String key : parameter.keySet()) {
					if (sb.length() > 0) {
						sb.append("&");
					}
					sb.append(key);
					sb.append("=");
					sb.append(parameter.get(key));
				}
				param = sb.toString();
			} else {
				param = "";
			}
			// Http method가 GET 방식의 경우 파라미터를 url 주소 뒤에 붙인다.
			if (HttpMethod.GET.equals(method)) {
				if (url.contains("?")) {
					url += "&" + param;
				} else {
					url += "?" + param;
				}
			}
			URL uri = new URL(url);
			// url를 통해 HttpURLConnection 클래스를 생성한다.
			HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
			// 해더의 메소드를 정의한다.
			connection.setRequestMethod(method.toString());
			// 해더의 ContentType를 정의한다.
			connection.setRequestProperty("ContentType", "application/x-www-form-urlencoded");
			// Http method가 POST 방식의 경우, 해더 아래에
			if (HttpMethod.POST.equals(method)) {
				// 커넥션의 header 밑의 stream을 사용한다. (Get의 경우는 필요가 없다.)
				connection.setDoOutput(true);
				try (DataOutputStream output = new DataOutputStream(connection.getOutputStream())) {
					output.writeBytes(param);
					output.flush();
				}
			}
			// 프로토콜의 반환 코드를 받을 수 있다. (200이면 정상이다.)
			int code = connection.getResponseCode();
			System.out.println(code);
			// 스트림으로 반환 결과값을 받는다.
			try (BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
				String line;
				StringBuffer buffer = new StringBuffer();
				while ((line = input.readLine()) != null) {
					buffer.append(line);
				}
				return buffer.toString();
			}
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}

}
