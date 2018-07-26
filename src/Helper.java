import java.util.HashMap;
import java.util.StringJoiner;


public class Helper {
	//TODO this should be a hashmap object, but need to figure out how to pass xml node from BW
	//in as hashmap to do that. So for now, less elegant to get working
	public static String buildMapLookupStatement(String InfoId, String ReceivingApplicationUniversalID, 
			String ReceivingFacilityUniversalIDType, String ReceivingApplicationUniversalIDType,
			String SendingFacilityUniversalID, String SendingFacilityUniversalIDType,
			String ReceivingFacilityUniversalID, String MessageTypeTriggerEvent,
			String MessageTypeMessageCode, String SendingFacilityNamespaceID,
			String ReceivingFacilityNamespaceID, String MessageHeader,
			String MessageTypeMessageStructure, String SendingApplicationNamespaceID,
			String ReceivingApplicationNamespaceID, String SendingApplicationUniversalID,
			String Version, String SendingApplicationUniversalIDType)
	{
		
		System.out.println(InfoId);
		StringJoiner whereClause = new StringJoiner(" and ");
		if(InfoId != null & InfoId.length() > 0){
			whereClause.add("ml.InfoId = '"+InfoId+"'");
		}
		if(ReceivingApplicationUniversalID != null & ReceivingApplicationUniversalID.length() > 0){
			whereClause.add("ml.ReceivingApplicationUniversalID = '"+ReceivingApplicationUniversalID+"'");
		}
		if(ReceivingFacilityUniversalIDType != null & ReceivingFacilityUniversalIDType.length() > 0){
			whereClause.add("ml.ReceivingFacilityUniversalIDType = '"+ReceivingFacilityUniversalIDType+"'");
		}
		if(ReceivingApplicationUniversalIDType != null & ReceivingApplicationUniversalIDType.length() > 0){
			whereClause.add("ml.ReceivingApplicationUniversalIDType = '"+ReceivingApplicationUniversalIDType+"'");
		}
		if(SendingFacilityUniversalID != null & SendingFacilityUniversalID.length() > 0){
			whereClause.add("ml.SendingFacilityUniversalID = '"+SendingFacilityUniversalID+"'");
		}
		if(SendingFacilityUniversalIDType != null & SendingFacilityUniversalIDType.length() > 0){
			whereClause.add("ml.SendingFacilityUniversalIDType = '"+SendingFacilityUniversalIDType+"'");
		}
		if(ReceivingFacilityUniversalID != null & ReceivingFacilityUniversalID.length() > 0){
			whereClause.add("ml.ReceivingFacilityUniversalID = '"+ReceivingFacilityUniversalID+"'");
		}
		if(MessageTypeTriggerEvent != null & MessageTypeTriggerEvent.length() > 0){
			whereClause.add("ml.MessageTypeTriggerEvent = '"+MessageTypeTriggerEvent+"'");
		}
		if(MessageTypeMessageCode != null & MessageTypeMessageCode.length() > 0){
			whereClause.add("ml.MessageTypeMessageCode = '"+MessageTypeMessageCode+"'");
		}
		if(SendingFacilityNamespaceID != null & SendingFacilityNamespaceID.length() > 0){
			whereClause.add("ml.SendingFacilityNamespaceID = '"+SendingFacilityNamespaceID+"'");
		}
		if(ReceivingFacilityNamespaceID != null & ReceivingFacilityNamespaceID.length() > 0){
			whereClause.add("ml.ReceivingFacilityNamespaceID = '"+ReceivingFacilityNamespaceID+"'");
		}
		if(MessageHeader != null & MessageHeader.length() > 0){
			whereClause.add("ml.MessageHeader = '"+MessageHeader+"'");
		}
		if(MessageTypeMessageStructure != null & MessageTypeMessageStructure.length() > 0){
			whereClause.add("ml.MessageTypeMessageStructure = '"+MessageTypeMessageStructure+"'");
		}
		if(SendingApplicationNamespaceID != null & SendingApplicationNamespaceID.length() > 0){
			whereClause.add("ml.SendingApplicationNamespaceID = '"+SendingApplicationNamespaceID+"'");
		}
		if(ReceivingApplicationNamespaceID != null & ReceivingApplicationNamespaceID.length() > 0){
			whereClause.add("ml.ReceivingApplicationNamespaceID = '"+ReceivingApplicationNamespaceID+"'");
		}
		if(SendingApplicationUniversalID != null & SendingApplicationUniversalID.length() > 0){
			whereClause.add("ml.SendingApplicationUniversalID = '"+SendingApplicationUniversalID+"'");
		}
		if(Version != null & Version.length() > 0){
			whereClause.add("ml.Version = '"+Version+"'");
		}
		if(SendingApplicationUniversalIDType != null & SendingApplicationUniversalIDType.length() > 0){
			whereClause.add("ml.SendingApplicationUniversalIDType = '"+SendingApplicationUniversalIDType+"'");
		}
		StringBuffer wc = new StringBuffer();
		if(whereClause.length() > 0){
			System.out.println(whereClause.toString());
			wc.append(" where ");
			wc.append(whereClause.toString());
		}
		//build out dynamic where clause based off parms and values
		//for now just do full select temporarily
		return "SELECT ml.id as ml_id, ml.SendingApplicationUniversalIDType, ml.SendingApplicationUniversalID," +
				"ml.ReceivingApplicationNamespaceID, " +
				"ml.Version, " +
				"ml.SendingApplicationNamespaceID, " +
				"ml.MessageTypeMessageStructure, " +
				"ml.SendingFacilityUniversalIDType, " +
				"ml.ReceivingFacilityUniversalID, " +
				"ml.DateTimeofMessage, " +
				"ml.MessageTypeTriggerEvent, " +
				"ml.MessageTypeMessageCode, " +
				"ml.SendingFacilityNamespaceID, " +
				"ml.ReceivingFacilityNamespaceID, " +
				"ml.MessageHeader, " +
				"ml.InfoId, " +
				"ml.ReceivingApplicationUniversalID, " +
				"ml.ReceivingFacilityUniversalIDType, " +
				"ml.ReceivingApplicationUniversalIDType, " +
				"ml.SendingFacilityUniversalID, " +
				"ml.created_at, " +
				"ml.modified_at, " +
				"ml.active_map_id, m.* " +
			  "FROM map_lookup as ml  " +
			  "inner join maps as m on ml.active_map_id = m.id" + wc.toString();
		
	}
	
}
