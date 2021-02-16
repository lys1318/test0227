package yanolja.com.utility;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class Dilog {
	public static String baseURL = "https://dilog.di.yanolja.in/api/qa/logs";

	public static JSONParser parser = new JSONParser();
	public static boolean flag = false;
	
	public static String osName = "web";
	public static String cgntId = "ap-northeast-2:9b12c43d-619c-4f9e-8bf9-62b58bfe63df";
	public static String service = "YanoljaCX";
	
	public static JSONArray getLog(String pageName) {
		String url = null;
		
		url = baseURL + "?key=pageName&value=" + pageName + "&osName=" + osName + "&service=" + service;

		Log.info("url : " + url);
		
		try {
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder().url(url).build(); // GET Request
			// 동기 처리시 execute함수 사용
			Response response = client.newCall(request).execute();
			String message = response.body().string();
			
			return (JSONArray) parser.parse(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public static JSONArray crreatedTsFilter(JSONArray array,long time) {
		
		JSONArray filteredArray = new JSONArray();
		array.forEach(json -> {
			
			if(time < (long)getJObj(getJObj((JSONObject)json,"raw"),"system").get("createdTs")) {
				if(getIsValid((JSONObject)json,"isValid").equals("true")) {
					Log.info(getJObj((JSONObject)json,"def").get("no").toString() + " | " + getJObj(getJObj((JSONObject)json,"raw"),"system").get("createdTs").toString() + " | " + getJObj((JSONObject)json,"def").get("priority").toString() + " | " + getJObj((JSONObject)json,"def").get("eventType").toString() + " | " + getJObj((JSONObject)json,"def").get("desc").toString());
					filteredArray.add((JSONObject)json);
				}
			}
			
		});
		System.out.println(filteredArray.size());
		return filteredArray;
		
		
	}
	
	public static boolean assertLogByDesc(String pageName, String osName, String desc, String eventType, long time) {

		flag = false;
		
		JSONArray array = crreatedTsFilter(getLog(pageName), time);

		array.forEach(json -> {
			JSONObject def = getJObj((JSONObject)json,"def");
			
			if((def.get("pageName").toString().equals(pageName)) && (def.get("eventType").toString().equals(eventType) && def.get("desc").toString().equals(desc))) {				
				flag = true;
				
			}
			
		});
		
		if(flag) {
			Log.info("flag : " + flag);
		}
		
		return flag;
		
	}
	
	public static JSONObject getJObj(JSONObject json, String key) {
		try {
			//System.out.println((JSONObject)parser.parse(json.get(key).toString()));
			return (JSONObject)parser.parse(json.get(key).toString());
		} catch (ParseException e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	public static String getIsValid(JSONObject json, String key) {
		try {
			return json.get(key).toString();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	/*

	public static boolean assertLog(String pageName, String osName, String eventType, long time) {
		
		JSONArray array = crreatedTsFilter(getLog(pageName, osName, service), time) ;
		
		
		array.forEach(json -> {
			JSONObject def = getJObj((JSONObject)json,"def");	

			if( (def.get("pageName").toString().equals(pageName)) && (def.get("eventType").toString().equals(eventType))) {

				flag = true;
				
			}

		});
		
		return flag;
		
	}
	
	public static boolean assertLog(String pageName, String osName, String eventType, String objectContainer, long time) {

		JSONArray array = crreatedTsFilter(getLog(pageName, osName, service), time) ;
		
		array.forEach(json -> {
			JSONObject def = getJObj((JSONObject)json,"def");
			
			if( (def.get("pageName").toString().equals(pageName)) && (def.get("eventType").toString().equals(eventType) && def.get("objectContainer").toString().equals(objectContainer))) {				

				flag = true;
				
			}

		});
		
		return flag;
		
	}

	public static void main(String[] args) throws Exception {
//		String input = "2007-11-11 12:13:14" ;
//		java.sql.Timestamp ts = java.sql.Timestamp.valueOf( input ) ;
//		
//		System.out.println(ts.getTime());
		String url = "https://dilog.di.yanolja.in/api/qa/logs";
		String adid = "00000000-0000-0000-0000-000000000000";
		String osName = "iOS";
		String service = "YanoljaCX";
		Dilog di = new Dilog();
		JSONObject defJson = null;
//		JSONArray array = di.crreatedTsFilter(di.getLog(), 1609730492877L) ;
		String tmp = "abc";
//		di.assertLog("Home", "impr", 1609730492877L);
//		System.out.println(di.assertLog("Home", "impr","benefitBanner"));
//		array.forEach(json -> {
//				def = getJObj((JSONObject)json,"def");
//				System.out.println(def.get("eventType"));
//				System.out.println(def.get("eventType").toString());
//				System.out.println(def.get("pageName").toString()); 
//			
//			
//		});
		
		
		
		//		json = (JSONObject)array.get(0);
		
			
//		JSONObject json1 = (JSONObject)parser.parse(json.get("raw").toString());
//
//		
//		System.out.println(
//				
//				
//				json1.get("system")
//				
//				);
//		System.out.println(json1.get("eventType"));
		
//		array.forEach(json -> {
			
//		getJObj(getJObj((JSONObject)json,"raw"),"system").get("createdTs");
//		System.out.println(getJObj(getJObj((JSONObject)json,"raw"),"system").get("createdTs"));
			
//			if(time < (long)getJObj(getJObj((JSONObject)json,"raw"),"system").get("createdTs")) {
//				filteredList.add((JSONObject)json);
//			}
//		
//		System.out.println(
//				(time < (long)getJObj(getJObj((JSONObject)json,"raw"),"system").get("createdTs") )
//						
//						);
		
//		getJObj((JSONObject) getJObj((JSONObject)json,"raw").get("system"),"createdTs")

//		});

		
//		System.out.println(System.currentTimeMillis());
		
		

	}
	*/

	/*
	 * public static void main(String[] args) {
	 * 
	 * String cgntId = "ap-northeast-2:44defd42-39b6-499e-ab04-d1f951773d63"; String
	 * osName = "iOS"; String service = "YanoljaCX";
	 * 
	 * String url =
	 * "https://dilog.di.yanolja.in/api/qa/logs?key=cgntId&value=ap-northeast-2:44defd42-39b6-499e-ab04-d1f951773d63&osName=iOS&service=YanoljaCX";
	 * JSONParser parser = new JSONParser(); Object obj ;
	 * 
	 * try { OkHttpClient client = new OkHttpClient(); Request request = new
	 * Request.Builder() .url(url) .build(); //GET Request
	 * 
	 * //동기 처리시 execute함수 사용 Response response = client.newCall(request).execute();
	 * 
	 * //출력 String message = response.body().string(); System.out.println(message);
	 * 
	 * JSONArray jsonArray = (JSONArray) parser.parse(message);
	 * System.out.println(jsonArray.get(0).toString());
	 * 
	 * 
	 * } catch (Exception e) { e.printStackTrace(); // TODO: handle exception }
	 * 
	 * }
	 */
	

}