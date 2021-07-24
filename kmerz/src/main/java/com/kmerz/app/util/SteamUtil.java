package com.kmerz.app.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.http.HttpMethod;

import com.kmerz.app.vo.SteamAppVo;



public class SteamUtil {

	// 스팀앱 리스트 가져와서 검색
	public static List<String> appSearch(String schWord) {
		String url = "http://api.steampowered.com/ISteamApps/GetAppList/v0002/";
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("key", "E7C4563CA09F3BB39360ECCEA67F68F8");
		parameter.put("format", "json");
		
		System.out.println("요청시작");
		String html = getRequest(url, HttpMethod.GET, null);
		
		System.out.println("파싱시작");
		JSONObject jsonObj = new JSONObject(html);
		int appsCount = jsonObj.getJSONObject("applist").getJSONArray("apps").length();
		System.out.println("파싱끝 " + appsCount + "개의 앱");
		
		System.out.println("검색시작");
		List<String> idList = new ArrayList<>();
		
		for(int i=0; i<appsCount; i++) {
			String appName = jsonObj.getJSONObject("applist")
				.getJSONArray("apps")
				.optJSONObject(i)
				.getString("name");
			if(appName.contains(schWord)) {
				int appid = jsonObj.getJSONObject("applist")
				.getJSONArray("apps")
				.optJSONObject(i)
				.getInt("appid");
				String strAppid = Integer.toString(appid);
				idList.add(strAppid);
			}
		}
		
		System.out.println("검색끝 "+idList.size()+"개의 검색 결과");
		/*s
		File file = new File("D:/test/test.json");
		
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(file));
			writer.write(html);
			writer.close();
			System.out.println("파일저장 성공");
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		return idList;
	}

	// 스팀앱 디테일에서 필요한 부분 가져오기
	public static List<SteamAppVo> getAppdetails(List<String> appids) {
		final String url = "https://store.steampowered.com/api/appdetails";
		final int appsNum = appids.size();
		
		JSONObject[] jsonObj = new JSONObject[appsNum];
		List<SteamAppVo> appList = new ArrayList<SteamAppVo>();
		for(int i=0; i<appsNum; i++) {
			Map<String, Object> parameter = new HashMap<>();
			parameter.put("l", "koreana");
			parameter.put("appids", appids.get(i));
			// http 요청 시작
			String html = getRequest(url, HttpMethod.GET, parameter);
			try {
				// json 파싱
				jsonObj[i] = new JSONObject(html);
				
				String type = null;
				String name = null;
				String description = null;
				String imgPath = null;
				String appPrice = null;
				String appMovie = null;
				String background = null;
				
				boolean success = jsonObj[i].getJSONObject(appids.get(i))
						.getBoolean("success");
				if(success) {
					// 데이터가 있을때(스토어 등록된 앱일때)
					type = jsonObj[i].getJSONObject(appids.get(i))
							.getJSONObject("data")
							.getString("type");
					if(type.equals("game")) {
						// 타입이 게임일때만 데이터를 가져온다.
						name = jsonObj[i].getJSONObject(appids.get(i))
								.getJSONObject("data")
								.getString("name");
						description = jsonObj[i].getJSONObject(appids.get(i))
								.getJSONObject("data")
								.getString("short_description");
						imgPath = jsonObj[i].getJSONObject(appids.get(i))
								.getJSONObject("data")
								.getString("header_image");
						try {
						appPrice = jsonObj[i].getJSONObject(appids.get(i))
								.getJSONObject("data")
								.getJSONObject("price_overview")
								.getString("final_formatted");
						} catch(Exception e) {
							System.out.println("무료이거나 판매중이 아님");
						}
						try {
						appMovie = jsonObj[i].getJSONObject(appids.get(i))
								.getJSONObject("data")
								.getJSONArray("movies")
								.optJSONObject(1)
								.getJSONObject("webm")
								.getString("480");
						} catch(Exception e) {
							System.out.println("영상 없음");
						}
						try {
						background = jsonObj[i].getJSONObject(appids.get(i))
								.getJSONObject("data")
								.getString("background");
						} catch(Exception e) {
							System.out.println("배경이미지 없음");
						}
						appList.add(new SteamAppVo(Integer.parseInt(appids.get(i)), name, description, imgPath, appPrice, appMovie, background));
					} else {
						System.out.println("게임 아님");
					}
				} else {
					System.out.println("스토어에 등록되지 않음");
				}
			} catch(Exception e) {
				System.out.println("데이터 셋이 맞지 않음");
			}
		}
		System.out.println("매칭된 게임수: "+appList.size());
		System.out.println(appList.toString());
		
		return appList;
	}

	// http 요청
	public static String getRequest(String url, HttpMethod method, Map<String, Object> parameter) {
		try {
			// 파라미터값 문자열 맞추기
			String param = null;
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
			System.out.println("요청 결과[HTTP Code]: " + code);
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
	
	

}
