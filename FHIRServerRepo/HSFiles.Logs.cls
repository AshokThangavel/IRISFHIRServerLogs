Class FHIRServerRepo.HSFiles.Logs Extends %CSP.Page
{

Parameter Title As STRING = "FHIRServer Logs";

Parameter LogFileExt As STRING = "HS.Util.Installer*.log";

ClassMethod OnPage() As %Status
{
	
	Write "<html><head>"
	write "<img class=""portalLogo"" src=""portal/InterSystems IRIS.png"">"
    Write "<style>"
    //Write "body{font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;background:#f4f7fb;color:#333;margin:0;padding:0;}.container{max-width:800px;margin:50px auto;padding:20px;}h2{text-align:center;margin-bottom:20px;color:#222;}.logo{display:block;margin:0 auto 30px;max-width:220px;}.log-list{list-style:none;padding:0;}.log-item{background:white;margin-bottom:12px;border-radius:8px;padding:15px 20px;box-shadow:0 2px 6px rgba(0,0,0,0.07);transition:transform 0.2s,box-shadow 0.2s;display:flex;align-items:center;}.log-item:hover{transform:translateY(-2px);box-shadow:0 6px 15px rgba(0,0,0,0.1);}.log-item i{color:#2b7de9;margin-right:12px;font-size:18px;}.log-item a{text-decoration:none;color:#2b7de9;font-weight:500;font-size:16px;flex-grow:1;}.log-item a:hover{text-decoration:underline;}@media (max-width:600px){.log-item{padding:12px 15px;}.log-item a{font-size:15px;}}"
    Write "body{font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;background:#f4f7fb;color:#333;margin:0;padding:0}.container{max-width:1000px;margin:50px auto;padding:20px}h2{text-align:center;margin-bottom:20px;color:#222}.logo{display:block;margin:0 auto 30px;max-width:220px}.log-list{list-style:none;padding:0;display:flex;flex-wrap:wrap;gap:16px;justify-content:center}.log-item{background:white;border-radius:8px;padding:15px 20px;box-shadow:0 2px 6px rgba(0,0,0,0.07);transition:transform 0.2s,box-shadow 0.2s;display:flex;align-items:center;width:48%;box-sizing:border-box}.log-item:hover{transform:translateY(-2px);box-shadow:0 6px 15px rgba(0,0,0,0.1)}.log-item i{color:#2b7de9;margin-right:12px;font-size:18px}.log-item a{text-decoration:none;color:#2b7de9;font-weight:500;font-size:16px;flex-grow:1}.log-item a:hover{text-decoration:underline}@media (max-width:768px){.log-item{width:100%}}"
    Write "</style>"
    Write "</head><body>"
    Write "<div class='container'>"
    Write "<h2>Available FHIRServer Log Files</h2>"
    Write "<ul class='log-list'>"
	write "<head>"
	Write "<link rel=""stylesheet"" href=""https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"" />"
	Write "<link rel=""stylesheet"" href=""https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"">"
	Write "<link rel=""stylesheet"" href=""https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"">"
	Write "<script src=""https://code.jquery.com/jquery-3.7.0.js""></script>"
	Write "<script src=""https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js""></script>"
	Write "<script src=""https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js""></script>"
	Write "</head>"
	Write "<title>"_..#Title_"</title>"
	Write "<body>"
	;
	Set fileNames("HS.Util.Installer.HSSYS-0.log")=""
	Set fileNames("HS.Util.Installer.HSLIB-0.log")=""
	Set fileNames("ensinstall.log")=""
	Set fileNames("HS.Util.Installer.1.log")=""
	Set fileNames("HS.Util.Installer.HSCUSTOM-0.log")=""
	Set fileNames("HS.Util.Installer.HSSYSLOCALTEMP-0.log")=""
	Set rs = ##class(%SQL.Statement).%ExecDirect(,"SELECT ID as namespace FROM HS_Util_Installer.ConfigItem")
	While rs.%Next() {
		Set fileNames("HS.Util.Installer"_rs.namespace_"-1"_".log")=""
	}
	Do ..GetFilesInDirectory(.fileNames)
	Set file=""
	Write "<ul class=""log-list"">"
	Write "<ul class=""log-list"">"
	Write "<li class=""log-item"">"
	Write "<i class=""fa fa-file-alt""></i>"
	Write "<a href='HSFiles.FSLog.cls' target=""_blank"">FSLogs(^FSLOG)</a>"
	Write "</li>"
	For {
		Set file = $Order(fileNames(file)) Q:file=""
		 Write "<li class=""log-item"">"
		 Write "<i class=""fa fa-file-alt""></i>"
		 Write "<a href='HSFiles.ShowFile.cls?file="_$ZCONVERT(file,"O","URL")_"' target=""_blank"">" _ file _ "</a>"
		 Write "</li>"
	}
	Write "</form>"
	Write "<br><br><br>"
    Write "</ul></div></body></html>"
	Return $$$OK
}

ClassMethod GetFilesInDirectory(ByRef files) As %Status
{
    Set tResult = ##class(%Library.File).FileSetFunc($system.Util.ManagerDirectory(), ..#LogFileExt)
    While tResult.%Next() {
	    Set files(tResult.ItemName)=""
    }
}

ClassMethod OnPreHTTP() As %Boolean
{
	return $$$OK
}

ClassMethod OnPageHEAD() As %Boolean
{
	Do ..HyperEventHead(0,0)
}
}
