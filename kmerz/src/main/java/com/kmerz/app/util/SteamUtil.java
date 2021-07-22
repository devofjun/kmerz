package com.kmerz.app.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.http.HttpMethod;



public class SteamUtil {

	// 스팀앱 리스트 가져오기 
	public static String getSteamApps() {
		String url = "http://api.steampowered.com/ISteamApps/GetAppList/v0002/?key=STEAMKEY&format=json";
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("key", "F8FFD310D21B47B80811A652B7AADDB1");
		parameter.put("format", "json");

		String html = getRequest(url, HttpMethod.GET, parameter);
		//System.out.println("응답 html:");
		//System.out.println(html);
		return html;
	}

	// 스팀앱 디테일에서 필요한 부분 가져오기
	public static void getAppdetails() {
		String url = "https://store.steampowered.com/api/appdetails";
		// String param = "l=koreana&appids=322330";
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("l", "koreana");
		parameter.put("appids", "322330");
		parameter.put("appids", "578080");
		
		// appdetails HttpURLConnection 요청
		String html = getDetailsRequest(url, HttpMethod.GET, parameter);
		
		try {
			JSONObject jsonObj = new JSONObject(html);
			String imgPath = jsonObj.getJSONObject("322330")
					.getJSONObject("data")
					.getString("header_image");
			System.out.println(imgPath);
			String imgPath2 = jsonObj.getJSONObject("578080")
					.getJSONObject("data")
					.getString("header_image");
			System.out.println(imgPath2);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		File file = new File("D:/test/test.json");
		
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(file));
			writer.write(html);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 스팀 앱 디테일 요청
	public static String getDetailsRequest(String url, HttpMethod method, Map<String, Object> parameter) {
		try {
			// 파라미터값 문자열 맞추기
			String param = null;
			if(parameter != null) {
				StringBuffer sb = new StringBuffer();
				// appids=123,456,789
				for(String key : parameter.keySet()) {
					if(key.equals("appids")) {
						if(sb.length() <= 0) {
							sb.append(key);
							sb.append("=");
							sb.append(parameter.get(key));
						} else {
							sb.append(",");
							sb.append(parameter.get(key));
						}
					}
				}
				// &l=koreana
				for(String key : parameter.keySet()) {
					if(!key.equals("appids")) {
						if (sb.length() > 0) {
							sb.append("&");
						}
						sb.append(key);
						sb.append("=");
						sb.append(parameter.get(key));
					}
				}
				param = sb.toString();
			} else {
				param = "";
			}
			// 파라미터값 문자열 맞추기 끝
			
			// Http method가 GET 방식의 경우 파라미터를 url 주소 뒤에 붙인다.
			if (HttpMethod.GET.equals(method)) {
				if (url.contains("?")) {
					url += "&" + param;
				} else {
					url += "?" + param;
				}
			}
			System.out.println("요청URL: " + url);
			
			URL uri = new URL(url);
			// url를 통해 HttpURLConnection 클래스를 생성한다.
			HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
			// 해더의 메소드를 정의한다.
			connection.setRequestMethod(method.toString());
			// 해더의 ContentType를 정의한다.
			connection.setRequestProperty("ContentType", "application/json; charset=utf-8");
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
			System.out.println("결과[getRequest]: " + code);
			// 스트림으로 반환 결과값을 받는다.
			try (BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
				String line;
				StringBuffer buffer = new StringBuffer();
				while ((line = input.readLine()) != null) {
					buffer.append(line);
				}
				return buffer.toString();
			}
		} catch(Throwable e) {
			throw new RuntimeException(e);
		}
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
			//connection.setRequestProperty("ContentType", "application/json; charset=utf-8");
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
			System.out.println("결과[getRequest]: "+code);
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
