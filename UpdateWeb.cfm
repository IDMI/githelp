<cfoutput>Updating...<br></cfoutput>
<cfexecute name="C:\WINDOWS\system32\cmd.exe" arguments="/c C:\scripts\gitupdatewebgithelp.bat" variable="return" timeout=30></cfexecute>
<cfoutput>
<pre>
--- Message from Git ----
#return#
--- End Message from Git ----
</pre>
</cfoutput>
<cfoutput>Complete<br></cfoutput>