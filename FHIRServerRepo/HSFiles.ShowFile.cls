Class FHIRServerRepo.HSFiles.ShowFile Extends %CSP.Page
{

Parameter Title As STRING = "Log Files";

ClassMethod OnPage() As %Status
{
	Do ..DisplayFile()
	Return $$$OK
}

ClassMethod DisplayFile()
{
	If '$Data(^||filedata) {
		Write "<h2>Nothing to show</h2>"
		 Return $$$OK
	}
	Write "<img class=""portalLogo"" src=""portal/InterSystems IRIS.png"">"
	Write "<head>"
	Write "<link rel=""stylesheet"" href=""https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"">"
	Write "<link rel=""stylesheet"" href=""https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"">"
	Write "<script src=""https://code.jquery.com/jquery-3.7.0.js""></script>"
	Write "<script src=""https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js""></script>"
	Write "<script src=""https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js""></script>"
	Write "<style> tr:hover{background-color:#f5f5f5;transform:scale(1.01);}</style>"
	Write "<script language=""javascript"">$(document).ready(function(){$('#example').DataTable();})</script>"
	Write "</head>"
	Write "<title>"_..#Title_"</title>"
	Write "<body>"
	Write "<div>"
	Write "</div>"
	Write " <table id=""example"" class=""table table-striped"" style=""width:100%;padding: 0.1rem 0.1rem;font-size:12px;"">"
	Write " <thead class='table-header'>"
	Write "<tr>"
	Write "<th style='background-color:#333695;color:white;'>Entry</th>" 
	Write "</tr>"
	Write "<tbody>"
	Set counter=""
	For {
		Set counter=$order(^||filedata(counter),1,details) quit:counter=""	
		Write "<tr>"
		Write "<td>"_details_"</td>"
		Write "</tr>"
	}
	Write "</tbody>"
	Write "</table>"
	Write "</body>"
	Return $$$OK
}

ClassMethod OnPreHTTP() As %Boolean
{
	Set fileName=%request.Get("file")
	If fileName'="" {
		Do ..LoadIntegrityData(fileName)
	}
	Return $$$OK
}

ClassMethod LoadIntegrityData(fileName) As %Boolean
{
	Set file = $SYSTEM.Util.ManagerDirectory()_fileName
	Set stream = ##class(%Stream.FileCharacter).%New()
 	Set stream.Filename = file,data =""
	While 'stream.AtEnd {
 		Set ^||filedata($I(i))=stream.ReadLine()
	}
	Return $$$OK
}

}