package yanolja.com.utility;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.SheetsScopes;
import com.google.api.services.sheets.v4.model.AppendValuesResponse;
import com.google.api.services.sheets.v4.model.ValueRange;

public class NewSpredSheetUtil {
	/**
     * OAUTH 2.0 연동시 지정한 OAuth 2.0 클라이언트 이름
     */
    private static final String APPLICATION_NAME = "LogAutomation";

    /**
     * OAUTH 2.0 연동시 credential을 디스크에 저장할 위치
     */
    private static final java.io.File DATA_STORE_DIR = new java.io.File("tokens/");

    /**
     * Global instance of the {@link FileDataStoreFactory}.
     */
    private static FileDataStoreFactory DATA_STORE_FACTORY;

    /**
     * Global instance of the JSON factory.
     */
    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();

    /**
     * Global instance of the HTTP transport.
     */
    private static HttpTransport HTTP_TRANSPORT;

    /**
     * Google Sheet API 권한을 SCOPE로 지정
     */
    private static final List<String> SCOPES = Arrays.asList(SheetsScopes.SPREADSHEETS);

    /**
     * HTTP_TRANSPORT, DATA_STORE_FACTORY 초기화
     */
    static {
        try {
            HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    /**
     * OAUTH 2.0 연동시 사용될 callback용 local receiver 포트 지정
     */
    private static final int LOCAL_SERVER_RECEIVER_PORT = 9000;

    /**
     * 인증 모드 2개
     */
    private enum AuthMode {
        OAUTH20, SERVICE_ACCOUNT
    }

    /**
     * OAUTH 2.0용 credential 생성
     *
     * @return Credential object.
     * @throws IOException
     */
    public static Credential getOauth2Authorize() throws IOException {
        // OAUTH 2.0용 secret josn 로드
        InputStream in = NewSpredSheetUtil.class.getResourceAsStream("/credentials.json");

        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        GoogleAuthorizationCodeFlow flow =
                new GoogleAuthorizationCodeFlow.Builder(
                        HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                        .setDataStoreFactory(DATA_STORE_FACTORY)
                        .setAccessType("offline")
                        .build();

        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(LOCAL_SERVER_RECEIVER_PORT).build();

        Credential credential = new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
        System.out.println("Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
        return credential;
    }

    /**
     * Google Credential 정보를 가지고 Google Sheet서비스를 초기화 한다.
     *
     * @throws IOException
     */
    public static void getSheetsService(AuthMode authMode, String spreadsheetId, String range) throws IOException {
        Credential credential = null;
        if (authMode == AuthMode.OAUTH20) {
            credential = getOauth2Authorize();
        } else if (authMode == AuthMode.SERVICE_ACCOUNT) {
            //credential = getServiceAccountAuthorize();
        }
        
        Sheets service = new Sheets.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        ValueRange response = service.spreadsheets().values()
                .get(spreadsheetId, range)
                .execute();
        List<List<Object>> values = response.getValues();
        if (values == null || values.size() == 0) {
            System.out.println("No data found.");
        } else {
            for (List row : values) {
                if (row.size() > 0) {
                    System.out.println(row.get(0).toString());
                }
            }
        }
    }
    
    public static void appendSpreadSheet(AuthMode authMode, String spreadsheetId, String range, ArrayList failLog) throws IOException {
        Credential credential = null;
        if (authMode == AuthMode.OAUTH20) {
            credential = getOauth2Authorize();
        } else if (authMode == AuthMode.SERVICE_ACCOUNT) {
            //credential = getServiceAccountAuthorize();
        }
        
        // How the input data should be interpreted.
	    String valueInputOption = "RAW"; // TODO: Update placeholder value.

	    // How the input data should be inserted.
	    String insertDataOption = "INSERT_ROWS"; // TODO: Update placeholder value.

	 // TODO: Assign values to desired fields of `requestBody`:
	    ValueRange requestBody = new ValueRange();

	    ArrayList value = new ArrayList();
	    value.add(failLog);
	    
	    requestBody.put("range", range);
	    requestBody.put("majorDimension", "ROWS");
	    requestBody.put("values", value);
	    
	    Sheets service = new Sheets.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
				.setApplicationName(APPLICATION_NAME)
				.build();
	    
	    //Sheets.Spreadsheets.Values.Append request = service.spreadsheets().values().append(spreadsheetId, range, requestBody);
	    //request.setValueInputOption(valueInputOption);
	    //request.setInsertDataOption(insertDataOption);

	    //AppendValuesResponse response = request.execute();
	    
	    AppendValuesResponse response = service.spreadsheets().values().append(spreadsheetId, range, requestBody)
	    		.setValueInputOption(valueInputOption)
	    		.setInsertDataOption(insertDataOption)
	    		.execute();
	    // TODO: Change code below to process the `response` object:
	    System.out.println(response);
	    
    }

    public static void main(String[] args) throws IOException {

        // 아래의 샘플 구글 시트 URL에서 중간의 문자열이 spreed sheet id에 해당한다.
        // https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
        String spreadsheetId = "1v9ecOkXBsJEfUBAtCRyqElY2aHWeyD-70pZ00XUhH14";

        String range = "FailHistory";
        
        //getSheetsService(AuthMode.OAUTH20, spreadsheetId, range);
        //appendSpreadSheet(AuthMode.OAUTH20, spreadsheetId, range);
    }
    
    public static void failHistoryAppend(String date, String pageName, String eventType, String Enviroment, String desc) throws IOException, GeneralSecurityException {
		System.out.println("failHistoryAppend");
		String spreadsheetId = "1v9ecOkXBsJEfUBAtCRyqElY2aHWeyD-70pZ00XUhH14";
		final String range = "FailHistory";
		
		ArrayList failLog = new ArrayList();
	    failLog.clear();
		failLog.add(date);
		failLog.add(pageName);
		failLog.add(eventType);
		failLog.add(Enviroment);
		failLog.add(desc);
		
		//getSpreadSheet(HTTP_TRANSPORT, spreadsheetId, range);
		appendSpreadSheet(AuthMode.OAUTH20, spreadsheetId, range, failLog);

	}
}
