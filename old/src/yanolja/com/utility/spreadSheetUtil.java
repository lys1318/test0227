package yanolja.com.utility;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.SheetsScopes;
import com.google.api.services.sheets.v4.model.AppendValuesResponse;
import com.google.api.services.sheets.v4.model.ValueRange;

public class spreadSheetUtil {
	private static final String APPLICATION_NAME = "LogAutomation";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	private static final String TOKENS_DIRECTORY_PATH = "tokens";
	
	/**
	 * Global instance of the scopes required by this quickstart. If modifying these
	 * scopes, delete your previously saved tokens/ folder.
	 */
	// private static final List<String> SCOPES =
	// Collections.singletonList(SheetsScopes.SPREADSHEETS_READONLY);
	private static final List<String> SCOPES = Collections.singletonList(SheetsScopes.SPREADSHEETS);
	private static final String CREDENTIALS_FILE_PATH = "/credentials.json";
	
	/**
	 * Creates an authorized Credential object.
	 * 
	 * @param HTTP_TRANSPORT The network HTTP Transport.
	 * @return An authorized Credential object.
	 * @throws IOException If the credentials.json file cannot be found.
	 */
	private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {
		
		// Load client secrets.
		InputStream in = spreadSheetUtil.class.getResourceAsStream(CREDENTIALS_FILE_PATH);
		if (in == null) {
			throw new FileNotFoundException("Resource not found: " + CREDENTIALS_FILE_PATH);
		}
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

		// Build flow and trigger user authorization request.
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY,
				clientSecrets, SCOPES)
						.setDataStoreFactory(new FileDataStoreFactory(new java.io.File(TOKENS_DIRECTORY_PATH)))
						.setAccessType("offline")
						.build();
		LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(9000).build();
		return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
	}

	/**
	 * Prints the names and majors of students in a sample spreadsheet:
	 * https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
	 */
	public static void main(String... args) throws IOException, GeneralSecurityException {
		// Build a new authorized API client service.
		final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
		final String spreadsheetId = "1v9ecOkXBsJEfUBAtCRyqElY2aHWeyD-70pZ00XUhH14";
		final String range = "FailHistory";
		System.out.println(SCOPES);
		
		getSpreadSheet(HTTP_TRANSPORT, spreadsheetId, range);
		//appendSpreadSheet(HTTP_TRANSPORT, spreadsheetId, range);

	}
	
	public static void failHistoryAppend(String date, String pageName, String eventType, String Enviroment, String desc) throws IOException, GeneralSecurityException {
		System.out.println("failHistoryAppend");
		// Build a new authorized API client service.
		final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
		final String spreadsheetId = "1v9ecOkXBsJEfUBAtCRyqElY2aHWeyD-70pZ00XUhH14";
		final String range = "FailHistory";
		
		ArrayList failLog = new ArrayList();
	    
		failLog.add(date);
		failLog.add(pageName);
		failLog.add(eventType);
		failLog.add(Enviroment);
		failLog.add(desc);
		
		//getSpreadSheet(HTTP_TRANSPORT, spreadsheetId, range);
		appendSpreadSheet(HTTP_TRANSPORT, spreadsheetId, range, failLog);

	}

	private static void appendSpreadSheet(NetHttpTransport HTTP_TRANSPORT, String spreadsheetId, String range, ArrayList failLog) throws IOException, GeneralSecurityException {
		System.out.println("appendSpreadSheet");
		// How the input data should be interpreted.
	    String valueInputOption = "USER_ENTERED"; // TODO: Update placeholder value.

	    // How the input data should be inserted.
	    String insertDataOption = "INSERT_ROWS"; // TODO: Update placeholder value.

	    // TODO: Assign values to desired fields of `requestBody`:
	    ValueRange requestBody = new ValueRange();
	    /*
	    ArrayList arr = new ArrayList();
	    arr.clear();
	    arr.add("test1");
	    arr.add("test2");
	    arr.add("test3");
	    arr.add("test4");
	    arr.add("test5");
	    */
	    ArrayList value = new ArrayList();
	    value.add(failLog);
	    
	    requestBody.put("range", range);
	    requestBody.put("majorDimension", "ROWS");
	    requestBody.put("values", value);
	    
	    Sheets service = new Sheets.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
				.setApplicationName(APPLICATION_NAME)
				.build();
	    
	    AppendValuesResponse response = service.spreadsheets().values().append(spreadsheetId, range, requestBody)
	    		.setValueInputOption(valueInputOption)
	    		.setInsertDataOption(insertDataOption)
	    		.execute();
	    // TODO: Change code below to process the `response` object:
	    System.out.println(response);
	}

	private static void getSpreadSheet(NetHttpTransport HTTP_TRANSPORT, String spreadsheetId, String range) throws IOException {
		// TODO Auto-generated method stub
		Sheets service = new Sheets.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
				.setApplicationName(APPLICATION_NAME)
				.build();
		ValueRange response = service.spreadsheets().values().get(spreadsheetId, range).execute();
		List<List<Object>> values = response.getValues();
		if (values == null || values.isEmpty()) {
			System.out.println("No data found.");
		} else {
			System.out.println(values);
		}
	}
}