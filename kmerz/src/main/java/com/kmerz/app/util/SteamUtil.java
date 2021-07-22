package com.kmerz.app.util;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class SteamUtil {
	public static void getSteamApps() {
		String domain = "http://www.naver.com";

		try {

			URL u = new URL(domain);

			HttpURLConnection http = (HttpURLConnection) u.openConnection();

			http.setRequestMethod("HEAD");

			System.out.println(http.getHeaderFields());

		} catch (MalformedURLException e) {

			System.out.println(domain+" is not a URL I understand");

		} catch (IOException e) {

		}
	}
}
