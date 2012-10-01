<cfparam name="seeApache" default="1">
<cfparam name="seeIIS" default="0">

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>GIT for IDMI Training</title>
	<!---<link rel="stylesheet" type="text/css" href="gitHelp.css" />--->
	<style type="text/css">
		body {
			margin: 0; padding: 0;
			font-family: Sans-Serif;
			font-size: 14px;
			background-color: ##eee;
			color: ##333;
		}
		##wrapper {
			margin: 0 auto;
			width: 85%;
			padding: 2%;
			background-color: white;
			border-left: 1px solid ##ddd;
			border-right: 1px solid ##ddd;
			border-bottom: 1px solid ##ddd;
		}
		h1 {
			font-size: 2.2em;
			font-family: 'Trebuchet', 'Trebuchet MS', Sans-Serif;
			font-weight: normal;
			margin: 10px 0px 15px 0px; padding: 0;
			border-bottom: 1px solid ##ddd;
		}
		.divider {
			clear: both;
		}
		.note {
			padding: 15px;
			background-color: ##fff5cf;
			border: 1px solid ##ffea95;
			margin: 5px 0px;
		}
		.code {
			font-family: 'Consolas', 'Courier New', Monospace;
			font-size: 11px;
			border: 1px solid ##cee0ff;
			background-color: ##e9f1ff;
			padding: 0px 15px;
			color: ##314f82;
		}
		.content {
			margin: 0px 15px 15px 15px;
		}
		.copyright {
			clear: both;
			font-size: .6em;
			color: ##999;
			text-align: center;
			padding: 10px 10px 100px 10px;
			letter-spacing: .1em;
		}
		.back2top {
			text-align: right;
		}
		img {
			padding: 15px;
		}
		.title {
			text-align: center;
			border-bottom: 1px solid ##ddd;
		}
		.sub-title {
			text-align: left;
			border-bottom: 1px solid ##ddd;
		}
	</style>
</head>	</cfoutput>
<cfscript>
/**
 * Converts a number to Roman numerals.
 */
function RomanFormat(DecIn) {

/* declare variables */
var RomOut = ""; // string to be returned
var RomList = "M,D,C,L,X,V,I"; // list of roman numerals
var DecList = "1000,500,100,50,10,5,1"; // list of equivalents to roman numerals

/* variables used in looping */
var i = 1;
var j = 1; 

/* implement the subtraction rule by converting the in strings to the out strings later */
var RomReplaceInList = "DCCCC,CCCC,LXXXX,XXXX,VIIII,IIII";
var RomReplaceOutList = "CM,CD,XC,XL,IX,IV";

/* convert lists to arrays for easier access */
var RomArray = ListToArray(RomList);
var DecArray = ListToArray(DecList);
var RomReplaceInArray = ListToArray(RomReplaceInList);
var RomReplaceOutArray = ListToArray(RomReplaceOutList);

/* hack off the decimal part of the incoming argument */
DecIn = int(DecIn);

/* generate the raw Roman string */
i = 1;
while (DecIn GT 0) {
    if (DecIn - DecArray[i] GTE 0) {
        DecIn = DecIn - DecArray[i];
        RomOut = RomOut & RomArray[i];
        } else {
        i = i + 1;
    }
}

/* apply the subtraction rule to the raw Roman string */
for (j = 1; j LTE ArrayLen(RomReplaceInArray); j = j + 1) {
    RomOut = Replace(RomOut, RomReplaceInArray[j], RomReplaceOutArray[j]);
}

return RomOut;
}
</cfscript>

<cfoutput>#RomanFormat(1)#</cfoutput>

<cfset chapterCount = 1>
<cfset SectionCount = 1>

<cfoutput>
<body>
<a name="top"></a>
	<div id="wrapper">
		<div class="container">
			<h1>Git Training - Table of Contents</h1>
				<table>
					<tr>
						<td style="width:5%;">&nbsp;</td>
						<td style="width:70%;">&nbsp;</td>
						<td style="width:20%;">&nbsp;</td>
						<td style="width:5%;">&nbsp;</td>
					</tr>
					<tr>
						<td colspan=4><a href="##preface">Preface</a></td>
					</tr>
					<!---Chapter I. Installing the Essentials--->
					<tr>
						<td colspan=4><a href="##essentials">Chapter I. Installing the Essentials</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##installwebservice">I. Installing local web service Apache<cfif seeIIS IS 1>/IIS</cfif></a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##CFinstall">II. Installing ColdFusion 9/10</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##CFBinstall">III. Installing ColdFusion Builder 2/Eclipse</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitinstall">IV. Installing eGit</a></td>
					</tr></cfoutput>
					<cfif seeIIS IS 1><cfoutput>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##installiisweb">VI. Installing IIS if you prefer it</a></td>
					</tr></cfoutput>
					</cfif><cfoutput>
				<!---Chapter II. Setting up Local Web Service--->
					<tr>
						<td colspan=4><a href="##setuplocalweb">Chapter II. Setting up Local Server</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##setapache">I. Setting up local server with Apache</a></td>
					</tr></cfoutput>
					<cfif seeIIS IS 1><cfoutput>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##setIIS">II. Setting up local server with IIS (If you prefer IIS)</a></td>
					</tr></cfoutput>
					</cfif><cfoutput>			
					<!---Chapter III. Setting up Git/Github.com--->
					<tr>
						<td colspan=4><a href="##setupgit">Chapter III. Setting up Git/Github.com</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##setbitbucket">I. Create Github User Account</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##setssh">II. Setting up SSH Key in Eclipse</a></td>
					</tr>
					<!---<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##cfbsettings">III. CFB Settings/Tips</a></td>
					</tr>--->
					<!---Chapter IV - Setting Up Local PTS Project--->
					<tr>
						<td colspan=4><a href="##egitdevelopers">Chapter IV - Setting Up Local PTS Project</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitClone">I. Clone a Github Repository</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitsetupcfproj">II. Create CF Project &amp; Setting it as Git Project</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##PTSlocalApache">III. Setting Local PTS Project with Apache</a></td>
					</tr></cfoutput>
					<cfif seeIIS IS 1><cfoutput>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##PTSlocalIIS">IV. Setting Local PTS Project with IIS</a></td>
					</tr></cfoutput>
					</cfif><cfoutput>
					<!---Chapter V - Working with eGit in Eclipse--->
					<tr>
						<td colspan=4><a href="##egitcfbwork">Chapter V - Working with eGit in Eclipse</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitbasics">I. Switch To/Create Branch/Checking out Branch/Fetching</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitsetuppull">II.  Setting Pull Configurations/ Pull</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitpushcommit">III. Committing &amp; Pushing to Github</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##bitbucketpullrequest">IV. Creating Pull Requests</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitmergeconflicts">V. Handling Merge Conflicts</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitmanydev">VI. Tickets Requiring Many Developers' Effort Tips</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##egitimportant">VII. Important Notes/Procedures to Follow</a></td>
					</tr>
					<!---<!---Chapter VI. CODE REVIEW PERSONNEL (Basic Git Commands/Documentation)--->
					<tr>
						<td colspan=4><a href="##gitcodereview">Chapter VI. CODE REVIEW PERSONNEL (Basic Git Commands/Documentation)</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##gitinstall">I. Installing Git Command Line</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##gitworkflow">II. Work Process to Follow</a></td>
					</tr>
					<!---Further Enhancements--->
					<tr>
						<td colspan=4><a href="##furtherenh">X. Further Enhancements Available to You</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##gitBash">I. Git Command Line installation (gitBash)</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan=3><a href="##gitBash">II. Git Command Line Common Commands and Documentation Links</a></td>
					</tr>--->
					<tr>
						<td colspan=4><a href="##troubleShoot">X. Troubleshoot</a></td>
					</tr>
				</table>
		</div>
	<div class="divider"></div>
		<div class="content"><a name=preface></a>
			<h1 class="title">Preface</h1>
			<h2>Major Differences from Previous GIT training <u>Bonnie Martin</u> created</h2>
			<ul>
				<li>The GIT Process - You no longer need to work with your personal Github accounts once you have done the SSH step</li>
				<li>You no longer need to FORK, but you still need to "Create pull request" in Github to request to post to DEV/SUP/Live(master)) 
				- You Push to "idmiadmin" repository and whichever project you happen to be working in</li>
				<li>This document will point out the impact on how an error made by a developer in the GIT process can cause certain issues for the CODE REVIEW dept.</li>
				<li>This document also is meant for training of future Code Review employees. (WIP)</li>
				<li>If you are interested in the command line, this document will also teach you some common/simple commands useful for everyday operations.</li>
			</ul>
			<div class="note">I have noticed everyone's machine is unique in their own way, which may cause issues either during the Web server, GIT, or even CFB bugs. Therefore it's difficult to set up a tutorial 
			that will support everyone's machine. I have set up several machines by my own, but they were mainly fresh installations of everything. I would say if you can, have the time, and patience
			start from a fresh start. Installing the following in order:<br>1. Web service Apache<cfif seeIIS IS 1>/IIS</cfif><br>2. CF10<br>3. CFB/Eclipse</div>
		</div>	
		<div class="divider"></div>
		<!---Chapter I. Installing the Essentials --->
		<div class="content"><a name="essentials"></a>
			<h1 class="title">Chapter I. Installing the Essentials</h1>
			<div class="content"><a name="installwebservice"></a>
				1) Installing Apache is the first step in getting everything set up because you need a web service already installed before you install CF9/10. 
				<br>2) If you already have CF9/10 installed, which most of should anyway, you only need to configure your CF Web Configuration for Apache > <a href="##setapache">See Setting Apache with CF.</a>
				</cfoutput><cfif seeIIS IS 1><cfoutput><li>If you prefer IIS > <a href=##installiisweb>Install IIS</a></li></cfoutput></cfif><cfoutput>
				<div class="note">If you prefer using IIS for your web service, see Peyman as OPS does not Support IIS. If you are running WIN XP, you will need to use Apache
				as IIS cannot run multiple websites in WIN XP: Click <a href="http://www.it-notebook.org/iis/article/multiple_websites_xp.htm"  target="_blank">Here</a> if you want to learn more about it</div>
			</div>
			<div class="sub-title"><a name="installwebservice"></a>
				<h2>I. Installing local web service Apache<cfif seeIIS IS 1>/IIS</cfif></h2></div>
				<div class="content">
					1) First go here and download the latest Apache > <a href="http://httpd.apache.org/download.cgi" target="_blank">Download Apache</a>. Look for the newest version that has "<strong>no_ssl.msi</strong>" in it.<br>
					2) For following "Server Information" screen, the textbox information is not really significant to the functionality of Apache, but if you want to you can fill them out how you like it. <br>
					Just make sure you select the first radio button
					"<strong>for all Users, on Port 80, as a Service -- Recommended.</strong>"<br>
					<img src="Images/apacheInstServerInfo.jpg" /><br>
					3) Continue with installation and finish. 
						<ul>
						<li>The installation should be simple enough, if you need help > follow steps 1-4: <a href="http://www.thesitewizard.com/apache/install-apache-2-windows.shtml" target="_blank">here</a> </li>
					</ul>
					<br>
					4) To verify Apache is now running, go into your browser and for the URL type "http://localhost" Should just say "It Works." You can now proceed to ColdFusion 9/10 if you do not have it.<br>
					5) If  you get an error message at this point from Apache service saying it could not start or use port 80, 
					more than likely you have an application already assigned to port 80.<br>
					6) Proceed to the following section to install CF10 if you do not have it. Otherwise, go <a href="##setapache">here</a> to continue setting up Apache if you already have CF installed. If 
					you have CF10 installed, but do not have ColdFusion Builder 2/Eclipse, go <a href="##CFBinstall">install Eclipse</a>
					<div class="note">I'm not telling you to install IIS, but if you prefer IIS, click <a href="##installiisweb" />Install IIS</a> for IIS Installation Instructions</a>
					 - This will display the Windows features required	for installation that are	needed for CF<br>
					 AGAIN! If you are running WIN XP, you will need to use Apache
					as IIS cannot run multiple websites in WIN XP: Click <a href="http://www.it-notebook.org/iis/article/multiple_websites_xp.htm"  target="_blank">Here</a> if you want to learn more about it</div>
			</div>
			<!---Installting CF10--->
			<div class="content"><a name="CFinstall"></a>
				<h2>II. Installing CF 10</h2>
				<div class="content">
					1) If you do not have ColdFusion 9/10 installed, you can access the CF10 installer @ "\\gatekeeper1\Users\Peyman\ColdFusion"<br>
					2) For Server configuration: <br>
					<img src="Images/cfinstallerConfig.JPG" /><br>
					3) The "<strong>Remote Component Administrator Credentials</strong>"  is your username/password you would use to login to your CF administrator. You can use whatever you want, but I recommend
					keeping "admin" as your userName. Later on the installation you will be asked to enter the password once more. Just use the same password as you did on this screen. <br>
					<img src="images/cfremoteadmin.JPG" /><br>
					4) You need to configure when you reach the "<strong>Configure Web Servers/Websites</strong>" to run CF with Apache.<br>
					5) Leave the default radio button selected; should be "Configure web server connector for ColdFusion"<br>
					<img src="Images/cfwebserviceconfig.JPG" /><br>
					6) Click "<strong>Add</strong>". This will pop-up the "<strong>Add Web Server Configuration</strong>" You need to select the location of the Apache configuration file and the Apache binary file. 
					If you selected the default location	for Apache during its installation, the directories are:<br>
					
					<ul><strong>64 Bit Platform</strong>
						<li>
							C:\Program Files\Apache Software Foundation\Apache2.2\conf
						</li>
						<li>
							C:\Program Files\Apache Software Foundation\Apache2.2\bin\httpd.exe
						</li>
					</ul>
					<ul><strong>32 Bit Platform</strong>
						<li>
							C:\Program Files (x86)\Apache Software Foundation\Apache2.2\conf
						</li>
						<li>
							C:\Program Files (x86)\Apache Software Foundation\Apache2.2\bin\httpd.exe
						</li>
					</ul><br>
					Your directories should look like this after:<br>
					<img src="Images/apacheAddedConfigServer.JPG" /><br>
					7) Click Ok and Next on the "<strong>Configure Web Servers/Websites</strong>" screen. <br>
					8) The "<strong>Enable RDS</strong>" is a useful tool for debugging purposes. You can read about it on that window. But it is recommended you Enable this, although it's not required.<br>
					<img src="Images/cfenableRDS.JPG" /><br>
					9) The next few screens should just be "Next" and installation will start and finish.<br>
					10) To access your CF administrator you can either use "127.0.0.1:80/CFIDE/administrator/index.cfm" or "localhost/CFIDE/administrator/index.cfm"<br>
					11) Launch the Configuration Wizard after installation is complete. Use the password you entered during installation process. <br>
					12) Access the "Debug Output Settings" screen. <br>
					13) Enable "<strong>Robust Exception information</strong>." The other 2 debugging options are optional if you need them. Click "Submit Changes" to apply.<br>
					<img src="Images/cfadmindebugging.JPG" height="500px" width="1000px"/><br>
					14) Done with CF Admin for now until we start setting up projects in CFB/Eclipse.<br> <a href="##top">Back to Top</a>
				</div>
			</div>
			<!---Installting CFB--->
			<div class="content"><a name="CFBinstall"></a>
				<h2>III. Installing ColdFusion Builder 2</h2>
				<div class="content">
					1) You can also grab the CFB installer from  "\\gatekeeper1\Users\Peyman\ColdFusion"<br>
					<div class="note">
					<ul><strong>If you prefer using Eclipse and using CFB as a plugiin for Eclipse</strong>
						<li>
							Extract everything inside this zip folder "\\gatekeeper1\Users\Peyman\ColdFusion\Eclipse" to your local machine. 
						</li>
						<li>
							Copy the Eclipse folder to your local C drive or wherever you want. Then you can proceed with CFB installation, during the installation I'll explain what you will have to do different
							installing CFB as either a plug-in or standalone. 
						</li>
						<li>
							The only real difference b/t CFB and Eclipse is that Eclipse is 64-bit while CFB is 32-bit. And there is "Juno," which is the newer version of Eclipse out, 
							but I have been told that is not compatible with CFB plug-in right now. I'm sure they will update "Juno" soon.  
						</li>
					</ul>
					</div><br>
					2) Continuing with CFB installation...<br>
					3) The "<strong>Select Install Type</strong>" screen is what I was talking about whether wanting to install CFB as a standalone or Plugin with Eclipse.<br> 

					<img src="Images/cfbinstalltype.JPG" /><br>
					<ul>
						<li>
							If you want standalone, select "Standard ColdFusion Builder installation" <div class="note">If you select this, just skip to step 4.</div>
						</li>
						<li>
							If you want plugin with Eclipse, select "ColdFusion Builder plugins within Eclipse"<br>
							<div class="note">
								<strong>If you selected "ColdFusion Builder plugins within Eclipse read following note:</strong><br>
								The very next screen when you click "Next" is where you want CFB update to install basically. You can just leave this as default.<br>
								The next screen labeled "<strong>Select Eclipse Installation Folder</strong>" is where you point the installation of the CFB to the Eclipse directory. 
								I typically just have Eclipse in "c:/eclipse," so that would be my directory.<br>
								<img src="Images/cfbeclipseplugin.JPG" />
							</div>
						</li>
					</ul>
					4) Installation will run and complete. Run Eclipse(it may run automatically after installation) and go to <a href="##cfbsettings">Setting up CFB/Eclipse</a><!--- NEED TO COME BACK TO WORK---> for setting up some basic tools. <br>
					<div class="note">From this point forward I'll refer to CFB as Eclipse. With the exception of looks and some other perspectives Eclipse provides not needed for our company, everything should 
					be the same.</div>
					 <a href="##top">Back to Top</a>
				</div>
			</div>
			<!---Installting GIT--->
			<div class="content"><a name="egitinstall"></a>
				<h2>IV. Installing GIT on Eclipse</h2>
				<div class="content">
					1) To install GIT; from your Eclipse toolbar go to: <strong>Help>Install New Software.</strong> You are presented with following<br>
					<img src="Images/eclipseinstallnewsoft.JPG" /><br>
					2) Enter this address in the "<strong>Work With</strong>" text box: <i>"http://download.eclipse.org/egit/updates"</i> and press "ENTER"<br>
					3) Should present you with the following option, in which you need to choose the following I have selected below. 
					Make sure you deselect "EGit Import Support" and "EGit Mylyn" or it will fail in the next screen<br>
					<img src="Images/eclipseinstallnewsoft2.JPG" /><br>
					<div class="note">If you get an error during the eGit installation see <a href=##egitinstallerror>eGit Install Troubleshoot</a></div>
					4) Click Next, accept the license agreement and finish installation. Restart Eclipse and you are done with GIT installation.<br>
					5) Go to chapter III for <a href="##setupgit">Setting up eGit</a> after installation is complete. Or proceed to follwoing chapter to set your local server in Eclipse.<br>
					 <a href="##top">Back to Top</a>
				</div>
			</div></cfoutput>
			<!---Install IIS --->
			<cfif seeIIS IS 1><cfoutput>
			<div class="content"><a name="installiisweb"></a>
				<h2>V. Install IIS</h2>
				<div class="content">
					<div class="note">I'm not telling you to install IIS, but if you prefer using IIS, follow the below instructions. Again do not use IIS if you are running WIN XP<br>
					Also, OPS Supports developers using Apache, so if you use IIS make sure you know how to use/debug IIS, if you need help with IIS, you would need to get help from Peyman C.</div>
					1) Go to your "Control Panel" and access "Programs and Features"<br>
					2) In the left menu options, there should be an option for "Turn Windows features on or off"<br>
					3) Once there, check off the following features under the "Internet Information Services<br>
					<img src="Images/iisfeaturesinstall.JPG" /><br>
					4) Click Ok and it will take a few minutes to install. <br>
					5) Once done, see <a href="##setIIS">Setting IIS</a> for setting up IIS configurations, etc.<br>
					 <a href="##top">Back to Top</a>
				</div>
			</div></cfoutput>
			</cfif><cfoutput>
		</div><!---content DIV--->
		<div name="divider"></div>
		<!---Chapter II. Setting up local server --->
		<div class="content"><a name=setuplocalweb></a>
		<h1 class="title">Chapter II. Setting up local server</h1></cfoutput>
			<cfif seeIIS IS 1><cfoutput>
				<div class="note">If you are running IIS and need to set up local server, skip to section II of this chapter </div></cfoutput>
			</cfif>	<cfoutput>
				<div class="content"><a name="setapache"></a>
				<h2>I. Setting up local server with Apache</h2>
				<div class="note">I would recommend you upgrading to CF10 and setting up the Apache configuration during its installation. 
				Otherwise follow this link <a href="http://www.adobe.com/devnet/coldfusion/articles/setup_dev.html" target="_blank">Click Here</a></div>
				<div class="note"> If you have followed the instructions above until now, you should have CF10, and you do NOT need to run the CF9 updater/select Multi-server configuration,  JRUN,
				or do anything that you would have done during the CF9 updater. The following is for a fresh installation of CF10. You should be set to add your server in 
				Eclipse/modify Apache configuration files/modify CF ADMIN and you should be good. </div>
				<div class="content">
					1) In Eclipse, click the "Add Server" icon in the "Servers" window.<br>
					<img src="Images/clickaddserver.JPG" /><br> 
					2) Set your New ColdFusion Server Setup as the following screenshot. You can use whatever server name you want, we tend to use either "cfusion" or "localhost." I use "localhost". 
					For CF10 you need to select "<strong>CF+ Tomcat Bundle</strong>"<br>
					<img src="Images/eclipseaddserver.JPG" /><br>	 
					3) Click Next and change directories to match the following screenshot.<br>
					<img src="Images/eclipseaddserver2.JPG" /><br>	 
					4) On the same window, select the "<strong>URL Prefix</strong>" tab and match your screen with following screenshort. 
					Once you have Browse the local path and entered the URL Prefix, click "<strong>Add</strong>" and the URL will display in the smaller window.<br>
					<div class="note">The following step is for Apache only. If you happen to be running IIS, you do not need the following</div><br>
					<img src="images/eclipseaddserverApacheURL.JPG"><br>
					5) Click Finish and sever should start automatically.<br>
					6) <!---Since you are now using Apache, skip the following part II(Setting up local with IIS) and*IIS*---> Now go to <a href=##setupgit>Chapter III - Setting up Git/ Github account</a> 
					if you do not have a Github.com account. Otherwise, go to <a href="##PTSlocalApache">Here</a> to set your PTS to run locally with Apache <br>
					<!---Need to come back to this and fix this EDITMark--->
					 <a href="##top">Back to Top</a>
				</div>
			</div>	<!---setapache DIV ---></cfoutput>
			<cfif seeIIS IS 1><cfoutput>
			<div class="content"><a name="setIIS"></a>
				<h2>II. Setting up local with IIS</h2>
				<div class="content">
					<div class="note">You should have IIS installed by now. If not go back to <a href="##installiisweb">Here</a> to install it.</div>
				</div>
				1) All your IIS needs can be done through its manager configuration tool, which can accessed through "Control Panel>Administrative Tools>Internet Information Services(IIS) Manager"<br>
				Should look this:<br>
				<img src="images/iismanager.JPG"><br>
				2) If you installed IIS before CF10, than your "<strong>Default Document</strong>" configuration should already be set up correctly. If you installed IIS after CF10, than find "<strong>Default Document</strong>"
				under IIS list and access that menu. Access the Default Document and verify "index.cfm" and "default.cfm" are there.<br>
				3) On the top-right corner of the window click "ADD" and add these 2 file extensions to the Default Document list. 
				<ul>
					<li>
						index.cfm
					</li>
					<li>
						default.cfm
					</li>
				</ul>
				4) Once finished, Default Document should look something like this:<br>
				<img src="images/iisdefaultdoc.JPG"><br>
				5) Go back to the main page. <br>
				6) You need to add a CFIDE and jakarta(CF10 only) virtual directories for every local project running in your machine. If you installed CF10 after IIS, your "Default Web Site" should
				already have those 2 directories added automatically. <br>
				7) Expand the "Default Web Site." Again, if you installed CF10 after IIS, it should have "<strong>CFIDE</strong>" and "<strong>jakarta</strong>" directories already added. 
				If they are not there for any reason, you would need to add them manually. Follow the note below
				<a name="addvirtualdirectory"></a>
				<div class="note">Note:<br>Right-click on "<strong>Default Web Site(Or for every website you add)</strong>" and select <strong>Add Virtual Directory</strong><br>
				So you would do this process twice for every website, one for each directory.
				<img src="images/iiscfidejakarta.JPG"><br>
				End result for your website(s) should be like: 
				<img src="images/iiscfidejakartadone.JPG"><br>
				Again, every PTS project running locally will need these 2 directories added manually. Only CFIDE is needed if you are running CF9. 				
				</div>
				8) You are done with IIS for now. Continue with section III of this tutorial to set up a Github account if you do not have a Github account. Otherwise, see
				 <a href="##PTSlocalIIS">setting up</a> PTS local project using IIS on how to add a project directory to IIS. <br>
			 	<a href="##top">Back to Top</a>
			</div>
		</div><!---setuplocalweb DIV ---></cfoutput>
		</cfif><cfoutput>
		<!---Chapter III - Setting up Git/ bitbucket account--->	
		<div name="divider"></div>
		<div class="content"><a name=setupgit></a>
		<h1 class="title">Chapter III - Setting up Git/ Github account</h1>
			<div class="content"><a name="setbitbucket"</a>
				<h2>I. Setting up Github.com Account</h2>
				1) First step in setting up GIT to work with a remote repository, which IDMI uses gitHub, is setting up a gitHub account. <br>
			 	2) Access "github.com" and Sign-up. Use your IDMI email. Please make your username recognizable to others, so that we can identify you. <br>
				3) Once you have added your account, either contact me, <strong>Peyman Carlsen</strong> or <strong>Tim Cunningham</strong> in giving you access to a particular project you need to work in. 
				This is sort of like an OPS ticket asking for access to a PTS or something.<br> 
				<div class="note">In your request for a PTS access on gitHub, please provide:<br>
				Your gitHub userName<br>
				Which PTS project you are wanting access to</div>
				4) Also in your gitHub account, on the top right corner it should have the universal "Settings" icon, marked "Account Settings". This is where you would need to go to enter your SSH Key.
				Access that screen and if your First/Last name is blank, fill them out. This is so that when you either Push or do Pull requests or any type of remote action on Github, other users will see your full name and not just 
				your username because I know some of you like to be creative with your usernames, but others will not know who you are. <br>
				<a href="##top">Back to Top</a>
			</div><!---setbitbucket DIV --->
			<div class="content"><a name="setssh"</a>
				<h2>II. Setting up SSH Key in Eclipse</h2>
				1) Within Eclipse on top toolbar, go to Window>Preferences. In the textbox provided, type "<strong>SSH</strong>." The first option labeled SSH2 is what you want to access. Should look like <br>
				<img src="images/ssh2main.JPG"><br>
				2) 2 things need to be done in this tab, unless you are happy with your SSh2 Home. If not. 
					<ul>
						<li>
							2.1 - Browse to where you want your SSH information to be stored. I recommend leaving it at default user/.ssh because there may be authentication errors later if you store the SSH key elsewhere.  
						</li>
						<li>	
							2.2 - If the Private Keys does not have "id_rsa" listed for whatever reason, click "<strong>Add Private Keys</strong> and type "id_rsa" to create one. But it should already have "id_rsa"
						</li>
					</ul>
				3) Switch over to "<strong>Key Management</strong>" tab and complete the following for this tab<br>
					<ul>
						<li>
							3.1 - Click <strong>Generate RSA key.</strong>This will automatically generate a certain key for you.<br>
							<img src="images/sshgeneratersakey.JPG">
						</li>
						<li>
							3.2 - Click <strong>Save Private Key...</strong> and browse to the same folder where you set your <strong>SSH2 Home</strong> directory. It will display this confirmation, but
							just click "OK."<br>
							<img src="images/sshaddrsaconfirm.JPG">
						</li>
						<li>
							3.3 - Once Ok, it will be followed by this screen, which is good. <br>
							<img src="images/sshkeyaccept.JPG">
						</li>
					</ul>
				4) You can Click "Ok" out of the preferences window. <br>
				5) In windows explorer, access your SSH directory. <br>
				6) Open the <strong>id_rsa</strong> .PUB file with Notepad. <br>
				<img src="images/sshhomedir.JPG"><br>
				7) Copy the entire content of the file and go to Github.com<br>
				<img src="images/sshnotepad.JPG"><br>
				8) In your Account Settings, one of the tabs on the left side should be called <strong>SSH Keys</strong>. Access it. <br>
				9) At this point you probably do not have any SSH Keys(unless you have access to other projects in Github already), so you would use the "Add SSH key" section to add your key. <br>
				<img src="images/githubaddsshkey.JPG"><br>
				10) The name of the Key is not really important, but if you plan on working out of this account from many workstations, than you may want to name them accordingly. Here is mine for example:<br>
				<div class="note">Example adding SSH:<br>
				 <img src="images/githubaddsshkey1.JPG"></div>
				11) As you can see, I have 2 SSH keys for every workstation I want to access this account from. <br>
				<div class="note">For every workstation, you need a distinct SSH Key, so you would basically loop over this "Setting up SSH key in Eclipse" step everytime you want to work on a particular GIT 
				project on different a workstation.<br></div>
				<a href="##top">Back to Top</a>
			</div><!---setssh DIV --->
		</div><!---setupgit DIV --->	
		<div name="divider"></div>
		<!---Chapter IV - Setting up Local PTS/eGit--->	
		<div class="content"><a name=egitdevelopers></a>
		<h1 class="title">Chapter IV - Setting up Local PTS/eGit</h1>
			<div class="content"><a name="egitClone"</a>
				<h2>I. Cloning a PTS Repository from Github</h2>
				<div class="note">All steps below using Apache<cfif seeIIs IS 1>/IIS</cfif> will need to be looped everytime you are wanting to work with a PTS local project. Nothing below is a one-time occurrence</div>
				1) First you need to switch over to Git Repositories perspective in Eclipse. <br>
				2) Go to Window>Open Perspective>Other<br>
				3) Within that window, select <strong>Git Repository Exploring</strong>	<br>		
				4) In Eclipse, you need to add eGit menu options/perspectives to give you shortcut command keys when using eGit. In Eclipse, go to Window>Customize Perspective.<br>
				5) Go to the <strong>Command Groups Availability</strong> tab<br>
				6) Under Command Groups Availability, select "Git" and this should automatically add the Git "Menu Visibility" and "Tool Bar Visibility" in 
				their own tab and also check them by default. But go back to both "Tool Bar Visibility" and "Menu Visibility" and verify "Git" is checked off for both of them. Then click Ok.<br>
				7) Your Eclipse view after the steps above should look like something like this: Also notice the <strong>CLONE</strong> icon for next step<br>
				<img src="images/eclipsegitrepositoriesview.JPG"><br>
				8) Click Clone and this window is displayed. Clone is just a Git term, meaning you are importing a set of files from a remote URL into your local machine..<br>
				9) In your Github account, once you have been given access to Links PTS for example, on the left side of page, there should be "Repositories" menu. If you do not see it, try clicking on
				"<strong>github</strong>" on the top left and see if you can see the Repositories menu on right side. <br>
				10) Once you find the Links repository, the screen would look something like this: <br>
				<img src="images/githubrepositoryview.JPG"><br>
				11) You want to copy the part I have in between the two arrows above. If you are using command line you can do following<br>
				<div class="note">If you use command line, make sure at this point you are on already in the directory you want the project to be cloned into before running following.<br>
				So if you want to keep your projects in "c:/domains/git/xxxx" where xxxx would be the name of project, make sure you are in "c:/domains/git" before running the code</div>
				<div class="code">$ git clone git@github.com:IDMI/SSG.git</div>
				12) Back to Eclipse...<br>
				13) In the Clone Window that you should have open, paste what you copied, which should be something like "git@github.com:IDMI/xxxx.git" where "xxxx" would be the project name"". 
				The Host, Repository Path and User textboxes will automatically populate with the data needed. Select <strong>SSH</strong> as the Protocol and click "Next" <br>
				<img src="images/eclipseclonerepository.JPG"><br>
				14) The next screen will grab the "Branches" available under the repository. 
				<div class="note">Since this was your first time setting a SSH key in Eclipse/github, you may get a confirmation pop-up saying something about<br>
				"The authenticity of host 'hithub.com' can't be established......Are you sure you want to continue connecting"<br> 
				Just click Yes or Ok for both of the 2 confirmation pop-ups.</div>
				<div class="note">Think of branch as literally branches on a tree. Links/Hallmark/WNC/ARIC would be our Tree(or Repository in GIT terminology). Branches are what we use to make changes and apply
				them back into the main Branch/Repo. You will learn more of this in Chapter V</div>
				15) To begin with, you only need the "master,DEV,SUPPORT" branch. Select those branches and Click Next.  <br>
				16) The next screen displayed below is where you want to import the files to "<strong>Directory</strong>". This can be wherever you are comfortable with. But just know this is the same directory you will use when
				setting up Apache<cfif seeIIS IS 1>/IIS</cfif> for your project<br>
				17) The initial branch is just the very first branch you want to checkout. You will be able to checkout other branches later on<br>
				18) 
				<img src="images/egitcloneproject2.JPG"><br>
				<div class="note"> master branch = Live Code. The others are same</div>
				18) Now it will take around 2-5mins depending on the size of repository to import the project. <br>
				<a href="##top">Back to Top</a>
			</div><!---egitClone DIV --->	
			<div class="content"><a name="egitsetupcfproj"</a>
				<h2>II. Create CF Project &amp; Setting it as Git Project</h2>
				<div class="note">There are a few way on adding a CF project as a Git project. I will show you the most two common  we use</div>
				1) At this point the Repository should be added to your "Git Repositories" view. Should be called Links [master] xxxxxxxx, where "xxxxxx" would be the directory
				you stored it in. Right-click on the repository and click <strong>Import Projects</strong><br>
				<img src="images/egitrepositorieslist.JPG"><br>
				2) In the Import Projects window, select the <strong>Use the New Project wizard</strong> radio button and click Finish<br>
				3) Next Screen open "ColdFusion" and select the ColdFusion Project.<br>
				<img src="images/createprojectwizard1.JPG"><br>
				4) Next screen is the name of your Project you wish to use(not important) and where the project location is located(this would be the same place where you Cloned the repository from Github)<br>
				<img src="images/createprojectwizard2.JPG"><br>
				5) Click Next and select your server name we created at the very beginning of this tutorial. Mine is called "localhost," but I know some of you use "cfusion."<br>
				6) Click Finish and it should import the CF project and as a GIT project in one process. You can verify it's under GIT by the project and all files/folders' having the golden cylinder and it should 
				also have [links master] as your default project since you had master checked out in the Git Repositories view. Like:<br>
				<img src="images/createprojectwizarddone.JPG"><br>
				<div class="note">Lot of people get errors when creating the CF project, if you do, talk to Tim C. or Peyman C.</div><br>
				<strong>OPTIONAL: IF YOU WOULD LIKE TO LEARN THE OTHER WAY ON CREATING THE CF PROJECT UNDER GIT READ THE FOLLOWING YELLOW BACKGROUND TEXT, OTHERWISE PROCEED <a href="##PTSlocalApache">Here</a></strong>
				<div class="note"><strong>The other way on creating a CF project under GIT</strong><br>
				1) In your Navigator panel, Right-Click>New>ColdFusion Project. <br>
				<img src="images/eclipsecreatecfproj.JPG"><br>
				2) Opens this screen. Insert data from following screenshot<br>
				<img src="images/createprojectwizard2.JPG"><br>
				3) Click Next and select your Server name from the list<br>
				4) Click Next until Finish<br>
				5) You will see the project under Navigator panel. Right-click>Team>Share Project<br>
				<img src="images/sharecfproject.JPG"><br>
				6) If the very first panel is called "Share Project" just select "Git" and select "Next" You may not get the "Share Project" window and just go straight to step 7's window(Depends on what you had installed)<br>
				<img src="images/shareprojectGit.JPG"><br>
				7) You should just be able to leave this at the default checkbox and continue. If you try this and the project does not go under Git control, basically best thing to do is start over from creating the CF project. 
				I say this because every time I think I have seen all different errors, someone else introduces something new to me, so it's hard to support everyone at once. <br>
				<img src="images/shareprojectconfiguregit.JPG"><br>
				8) You should now see the CF project with those gold cylinder symbols and also [Links xxxx] where xxxx would the initial branch you had checked out.
				</div>
				7) We are now ready to modify the Apache <cfif seeIIS IS 1>or IIS</cfif> configuration to view our code in the browser<br>
				<a href="##top">Back to Top</a>
			</div><!---egitsetupcfproj DIV --->
			
			
			<!---Setting a PTS Local Project Under Apache --->
			<div class="content"><a name="PTSlocalApache"</a>
				<h2>III. Setting a PTS Local Project Under Apache</h2>
				1) To keep things simple for now, let's say we want to add "Links" as our PTS project. <br>
				2) First you need to access your windows hosts file and modify it. If you have NotePad++ you can just open the file and modify. If you have normal NotePad, run Notepad as Administrator first, then OPEN that file.<br>
				3) The file is located: C:\WINDOWS\system32\drivers\etc\hosts<br>
				4) We typically follow this common format: <strong>xxxxx.local</strong> where "xxxxx" would be the name of project, but you can name them whatever you are comfortable with. 
				Your hosts file would look something like this once "Links.local" is added. Ignore my "git.local" project.<br> 
				<div class="note">The name of the host you create here is important as you will need to use the same in the Apache configuration files</div>
				<img src="images/hostsfile.JPG"><br>
				5) Now the Apache configuration files...<br>
				6) You need to <strong>Stop Apache</strong> server from running before proceeding. <br>
				7) The first change you need is to do is the <strong>httpd</strong>  file, which is located in your Apache/conf directory. The default installation directory for Apache is "
				<strong>C:\Program Files (x86)\Apache Software Foundation\Apache2.2</strong>,"
				so if you installed on the default, go there and access the <strong>conf</strong> folder and you should see <strong>httpd</strong>. You need to modify it in a text editor. See the ExamDiff report as a reference.<br>
				<a href="apacheConfigdiff.htm" target="_blank">ExamDiff httpd<a> The right panel is what your's should look like after uncommenting the necessary lines<br>
				<div class="note">Also see a fellow colleague's <a href="apacheConfigdiff1.htm" target="_blank">ExamDiff Ref</a> httpd file to view some differences you will probably see. 
				All of these differences are normal if you installed Apache in a different location than others did; also your
				PC name/email address within that file will of course be different. I just wanted to point out the normal differences </div>
				<ul><strong>Few things you need to change in the httpd file.</strong>
					<li>
						Around line 128 find "<strong>##LoadModule vhost_alias_module modules/mod_vhost_alias.so</strong>" - This needs to be uncommented, which can be done by removing the "##" in front of it
					</li>
					<li>
						Line 193 - change "Deny" to "Allow" 
					</li>
					<li>
						Line 250 - change "Deny" to "Allow" 
					</li>
					<div class="note">If you forget to change "Deny" to "Allow", you might get a 403 Forbidden error(access denied) when trying to access  local. I got this error, so I changed Deny to Allow and PTS loaded for me, but 
					just for experimental purposes, I changed "Allow" back to "Deny" after that, but did not get the 403 error again and PTS loaded fine, so it's weird.</a></div>
					<li>
						Line 241 - change the entire line to "<strong>DirectoryIndex dex login.cfm index.html default.cfm index.cfm</strong>"
					</li>
					<li>
						All the way down, line 470 find "<strong>##Include conf/extra/httpd-vhosts.conf</strong>" - This needs to be uncommented as well, which can be done by removing the "##" in front of it
					</li>
				</ul>
				8) Save the httpd file. If you get an error about "Saved Failed" or something, you may need to run Notepad as ADMIN, than open and modify that file. <br>
				9) Now that we enabled vhosts, which stands for Virtual hosts, we need to modify that file. The following steps need to be done everytime a local project is added under Apache.<br>
				10) From this directory "<strong>C:/Program Files (x86)/Apache Software Foundation/Apache2.2/conf</strong>", there should be an <strong>Extra</strong> folder. Access it and the very last file should be <strong>httpd-vhosts</strong><br>
				11) You would probably need to run Notepad or Notepad++ as ADMIN than opening the file.<br>
				12) See the changes I made from original version to my version <br><a href="apachehttpd-vhostsdiff.htm" target="_blank">ExamDiff httpd-vhosts<a> by adding only links.local PTS project. <br>
				<div class="note">The Right side of the ExamDiff is what your version should be similar to. The notes I have left lines 45, 55-56 are my comments I left for training purposes.</div>
				13) Changes can be seen in the ExamDiff, but here are some pointers in knowing what's critical and what's not.
				<ul>
					<li>
						The serverName can be either 127.0.0.1 or localhost. 
					</li>
					<li>
						jakarta is only for CF10. If you have CF9.xx, you do not need it.  
					</li>
					<li>
						All of the ErrorLog and CustomLog are directories in which that particular vhosts stores its information in. They can be called whatever you want. So if you want your Links project to have its own
						ErrorLog/CustomLog, then have like <br>
						<div class="code"> "ErrorLog logs/Links_errorLog.log" <br>
						"CustomLog logs/links_errorLog.log common"</div> These logs are not really that important. Any error associated with Apache 
						will show in these files. For example the "403 Forbidden access error I described above would show." Otherwise, just have all of them named the same for all of your vhosts.
					</li>
					<div class="note">
						I just have all my vhosts set to <br>
						<div class="code"> "ErrorLog logs/localhost_errorLog.log" <br>
						"CustomLog logs/localhost_errorLog.log common"</div> 
					</div>	
					</li>
				</ul>
				14) Once you have completed modifying the httpd-vhosts file. <strong>Restart Apache</strong>. <br>
				<a name=confirmmapping></a>
				15) In CF ADMIN, under <strong>SERVER SETTINGS</strong> find <strong>Mappings</strong>. You need to tell the root directory of your project, otherwise, you will get CFE when you run the local project. <br>
				16) Follow the following screenshot. THIS NEEDS TO BE DONE FOR EVERY PTS PROJECT YOU ADD AS A LOCAL. So example: HallmarkRoot, Hallmark5Root, WNCRoot, SSGRoot, ARICRoot...<br>
				<img src="images/cfadminaddmapping.jpg"><br>
				<ul>
					<li>
						Logical Path - Would be LinksRoot, HallmarkRoot, Hallmark5Root, ARICRoot, SSGRoot for example. 
					</li>
					<li>
						Directory Path - Should just be pointed to the same location you cloned you GIT repository for that project. 
					</li>
				</ul>
				<div class="note">If you do not add this, you will get the following CFE when running the project. See <a href=##troubleShortcferootmapping>TroubleShoot</a></div>
				17) And you should be good to run PTS locally using Apache. Skip the following IV section as that is for IIS. Skip to <a href=##egitcfbwork>Chapter 5 - Working with eGit in Eclipse</a> <br>
				<div class="note">If you are using IIS and need help setting up a PTS project using IIS, let Peyman C. know</div>
				<a href="##top">Back to Top</a>
			</div><!---PTSlocalApache DIV ---></cfoutput>
			<cfif seeIIS IS 1><cfoutput>
			<!---IV. Setting a PTS Local Project Under IIS --->	
			<div class="content"><a name="PTSlocalIIS"</a>
				<h2>IV. Setting a PTS Local Project Under IIS</h2>
				1) Again, let's say we want to add Links PTS as a local website by IIS <br>
				2) First you need to access your windows hosts file and modify it. If you have NotePad++ you can just open the file and modify. If you have normal NotePad, run Notepad as Administrator first, then OPEN that file.<br>
				3) The file is located: C:\WINDOWS\system32\drivers\etc\hosts<br>
				4) We typically follow this common format: <strong>xxxxx.local</strong> where "xxxxx" would be the name of project, but you can name them whatever you are comfortable with. 
				Your hosts file would look something like this once "Links.local" is added. Ignore my "git.local" project.<br> 
				<img src="images/hostsfile.JPG"><br>
				5) Access the IIS Manger, which can be found in Control Panel>Administrative Tools>Internet Information Services (IIS) Manager)<br>
				6) In the left side menu, it should have your PC name and username. Right-click and click "<strong>Add Web Site</strong>"<br>
				7) Follow the screenshot below to fill out the necessary textboxes. <br>
				<img src="images/iisaddwebsite.JPG"><br>
				<ul><strong>Pointers</strong>
					<li>
						When you type in the "Site Name" the <strong>Application Pool</strong> changes to what you typed for Site Name. Make sure you click <strong>SELECT</strong> right next to it and 
						selet <strong>DefaultAppPool</strong>
					</li>
					<li>
						Physical Path - Should be where you cloned the Links project from Github. 
					</li>
					<li>
						Host Name - Should be exactly what you typed in for the <strong>hosts</strong> file  (C:\WINDOWS\system32\drivers\etc\hosts). 
					</li>
					<li>
						Your site name and host name do not have to be the same, but to keep things simple for yourself, name them the same thing
					</li>
				</ul>
				8) Click Ok and should see your new website added to the website list on the left side. <br>
				<img src="images/iiswebsiteadd2.JPG"><br>
				<div class="note">I have two links.local as you can see and both are pointing to the same directory, so I can't have both of the sites running simultaneously, so I could Stop one and make the other run.<br>
				I only have two because adding one for this tutorial. Otherwise, there shouldn't be a reason why you would need two website pointing to the same directory</div>
				9) Remember what you would need to do now? Add the virtual CFIDE and Jakarta(Only if you have CF10) directories to that website. This is needed for every website you add that's a CF project. 
				Follow these steps in adding them. <a href="##addvirtualdirectory">Add virtual directories</a><br>
				10) Go to your CF administrator, either "http://127.0.0.1/CFIDE/administrator/index.cfm" or "http://localhost/CFIDE/administrator/index.cfm"<br>
				11) On the left side menu, under <strong>DATA &amp; SERVICES</strong> there should be <strong>Data Sources</strong> right below it. Access that menu. <br>
				12) You need to add the main database at this point. You do not need to make a data source for every one of the databases (rate, import,log). You only need the main one. <br>
				<img src="images/cfadminadddatasource.jpg"><br>
				13) Click Add once you have filled out the 2 fields. The Data Source name is not really important, but again, just name it the same consistent to the actual database name. 
				<div class="note">I only have "links40" for mine because I already have a "Links" so it will allow me to "Add" the same existing name</div>
				14) Follow the following screenshot to fill out the textboxes when you click "ADD"<br>
				<img src="images/cfadminadddatasource2.jpg"><br>
				<ul>
					<li>
						The CF Data Source Name populates from what you typed on previous page. 
					</li>
					<li>
						The Database should be exactly as the name database name(Links, or Hallmark, WNC, ARIC, Aggressive) * Important 
					</li>
					<li>
						Server is where the database is located. i.e (idmisql01/02/04/05/06)
					</li>
				</ul>
				15) Submit and on the top you should see a note in green saying "data source updated successfully" I believe an (x) is placed next to the data source name if it does not connect, in which case you might have
				input the incorrect information when adding the data source. <br>
				16) Still in CF ADMIN, under <strong>SERVER SETTINGS</strong> find <strong>Mappings</strong>. You need to tell the root directory of your project, otherwise, you will get CFE when you run the local project. 
				17)Follow the following screenshot. THIS NEEDS TO BE DONE FOR EVERY PTS PROJECT YOU ADD AS A LOCAL. So example: HallmarkRoot, Hallmark5Root, WNCRoot, SSGRoot, ARICRoot...<br>
				<img src="images/cfadminaddmapping.jpg"><br>
				<ul>
					<li>
						Logical Path - Would be LinksRoot, HallmarkRoot, Hallmark5Root, ARICRoot, SSGRoot for example. 
					</li>
					<li>
						Directory Path - Should just be pointed to the same location your cloned the GIT repository. 
					</li>
				</ul>
				19) That should be it, you should now be able to run the PTS project under IIS in your local machine. If you are having issues, see <strong>Peyman Carlsen</strong><br>
				<a href="##top">Back to Top</a>
			</div><!---PTSlocalIIS DIV --->	</cfoutput>
			</cfif><cfoutput>
		</div><!---V. Setting a PTS Local Project Under IIS --->
		
		<!---Chapter V - Working with eGit in Eclipse DIV --->
		<div class="divider"></div>
		<div class=content><a name=egitcfbwork></a>
				<h1 class="title">Chapter V - Working with eGit in Eclipse</h1>
			<div class="content">
				<div class="content"><a name="egitbasics"</a><!---egitbasics DIV --->
				<h2>I. Switch To/Create Branch/Checking out Branch/Fetching</h2>
				1) At this point you should have everything installed, have either Apache/IIS web server, have a local server set, and you should be able to pull up "Links.local"(If you followed the tutorial of adding Links as 
				your PTS) in your browser. If you have followed the tutorial, the address should just be "links.local".<br>
				
				<strong>Create Branch/Switch To</strong><br>
				1) Whenever you are wanting to start new work, you would create a new branch. Again, a branch in Git is basically a future feature/addition you are wanting to add to either Dev/Sup/master branch.<br> 
				<div class="note">There are a few ways on creating a new branch. I'll teach you a couple that is used mainly.</div> 
				<div class="note"><strong>You should ALWAYS create a new branch off of DEV(This could change to master as we progress through smoothing out the Git process)</strong></div>
				2) If you have the Git Toolbar on top of Eclipse visible, find the following icon. If you do not see this toolbar, go to Window>Customize Perspective and make sure GIT is checked off in the "Commands
				Groups Availability, Menu Visibility, and Tool Bar Visibility." Clicking this icon will take you to the screen shown in the note below<br>
				<img src="images/egitcreatebranch1.jpg"><br>
				3) The other most common way to Create/switch branch. Right-click on the project>Team>Switch To>New Branch<br>
				<img src="images/egitcreatebranch2.jpg"><br>
				<div class="note">Instead of going to "New Branch"; if you click "Other" you are presented with same screen if you followed the step 2 method. From this screen<br>
				<img src="images/egitbrancheswin.jpg"><br>
				<ul>
					<li>Checkout local branches by double-clicking. (Make sure you have committed changes in your current branch before attempting to checkout another branch or else, you will get an error)</li>
					<li>Create New Branch</li>
				</ul></div>
				4) Create New Branch should be done every time you are starting new work.
				<div class="note">Use this syntax when creating branches associated with ticket. xxxxyyyyyy where "xxxx" is the type of ticket (DEV/SUP/PROD) and "yyyyy" is the ticket number. If you like to use a "." between 
				the ticket type and number, that is fine.<br>
				This is to make the code review deptarment's job easier scrolling and trying to find the branch associated with a certain ticket. It's difficult when everyone has their own naming method, so we can remove
				this constraint if we all follow the same naming method</div>
				
				<a name="egitcreatenewbranch"></a> 
				<img src="images/egitcreatebranchwin.jpg"><br>
				<div class="note">If you create a branch off of "refs/heads/DEV"(which is your local DEV) make sure you do a PULL on it first.<br>
				The best option would be to use "<strong>"refs/heads/origin/DEV</strong>"(which is remote DEV), and you would never need to do a PULL before creating a new branch because
				you are creating a branch off of the remote, which is always being updated by code review dept.<br>
				It's your option...</div><br>
				<div class="note">The difference between "Rebase," "Merge," and "None" Pull Strategy lot of you wonder on<br>
				The only difference between Merge/None is Merge automatically <a href="##egitsetuppull">Sets Git Pull Config</a><!---Need to come back to this and fix this EDITMark---> while "None" does not create that Pull Config strategy.<br>
				<strong>Rebase</strong> - Creates the Pull Configuration and set the rebase key to true, so that when your changes are merged into DEV, Git will show a linear(cleaner) history. <br>
				<strong>Merge</strong> - Creates the Pull Configuration but DOES NOT set the rebase key to true. If you happen to select Merge accidently, no problem, the code review dept. rebases.<br>
				<img src="images/egitmergerebasediff.jpg" /><br>
				You can see that my DevTest branch has the pull configuration set and rebase set to true, whereas other branches only have the pull configuration. <br>
				<strong>None</strong> - Does neither create the Pull Configuration nor setting rebase key to true. (Neither of the above screenshot)<br> 
				<strong>WHEN SHOULD YOU USE THEM:</strong><br>
				1) You should always pick "Rebase"<br>
				2) Selecting Rebase automatically sets the pull configuration, so if you are working on a major ticket requiring many developers, one can create the initial branch. See
				<a href="##egitmanydev">Working Together Strategy</a> on how you and your colleagues should set up your local systems to work jointly.<br>
				3) For these 3 branches <strong>DEV/SUPPORT/master ALWAYS</strong> use the "<strong>Merge/Rebase</strong>", so that you will automatically be set to do a "PULL" to grab the most 
				updated changes from either DEV/SUPPORT/master. The Rebase with these, although does not hurt, would not make sense since you will not be pushing a change directly in DEV from your local
				DEV. Again always select "Rebase," I am just informing you on the differences.<br></div>
				</div>	
				<strong>Fetch</strong><br>
				5) Fetch from Remote - Fetch <strong>Only</strong> shows you differences between your local repository to the remote repository. 
				It does <strong>NOT UPDATE</strong> any of your local code to what is in the Github repository. After the Fetch, results would show up like this:<br>
				<img src="images/egitfetchresults.jpg"><br>
				If there are no differences between your local and remote, it will just display a message in the same window, but it will say "everything up to date"<br>
				<a href="##top">Back to Top</a>
			</div>
			<div class="content"><a name="egitsetuppull"</a><!---egitbasics DIV --->
				<h2>II. Setting Pull Configurations/ Pull</h2>
				1) If you accidently missed the "Merge" pull strategy from the 3 main branches (DEV/SUPPORT/master) noted in <a href="##egitcreatenewbranch">step 1</a> above, you can set up the Pull configuration manually from eGit. Let's say you need to add 
				the Pull strategy for the SUPPORT branch. <br>
				2) Right-Click on the Repository itself and go to "Properties"<br>
				<img src="images/egitgitproperties.jpg"><br>
				3) In the following screen, you can see we only have Pull strategies configured for DEV and master only. <br>
				4) To verify, if you cancel out of this, checkout the SUPPORT branch and Right-Click on the CF project, >Team>Pull. You will get this <a href="##egitpullerrornoconfig">error</a><br>
				<img src="images/egitgitproperties1.jpg"><br>
				5) From the Properties window above, click <strong>Add Entry/New Entry</strong> You need to make one for the "Merge" and "Remote" key. 
				<img src="images/egitaddproperties.jpg"><br>
				6) After your addition, you should be able to see SUPPORT now in your list of Keys. You should be able to Team>Pull on the SUPPORT branch now.  <br>
				<img src="images/egitaddproperties1.jpg"><br>
				<strong>Using Command Line to Set Pull Config</strong><br>
				While you have the branch you want to set the key configuration for checked out, for example if we want to add key configuration for SUPPORT. Execute following:
				<div class="code">$ git checkout SUPPORT<br>$ git pull origin SUPPORT</div>
				Running that will automatically add the key we did in steps 1-6. <br><br>
				<strong>Executing a Pull</strong>
				<div class="note">A Pull is a FETCH followed by a MERGE, so a Pull does synchronize your local copy to what's in the remote repository. You would need to do this a lot for joint effort tickets.<br>
				You should ALWAYS do a Team>Pull on the DEV branch(May eventually be changed to master) before starting new work to grab the most updated changes from the remote repository.</div>
				<a href="##top">Back to Top</a>
			</div>
			<div class="content"><a name="egitpushcommit"</a><!---egitpushcommit DIV --->
				<h2>III. Committing & Pushing to Github</h2><a name="egitCommitting"</a><br>
				<strong>Committing</strong><br>
				<div class="note">Commit basically applies any change you made to a file to the staging area. When you make a change and save that file, the file you changed is inserted 
				into the "Unstaged/unstaging" area of the Git flow. To actually have Git track those changes and eventually push them to the remote, you need to add them to the "Staging" area, which can be done by Commit.</div>
				1) Couple easy ways to Commit your changes. <br>
				 <img src="images/egitcommitchange1.jpg"><br>
				 2) Another way to commit is Right-click on project>Team>Commit.<br>
				 3) You could always do the shortcut key as well if you want to. <br>
				 <div class="note"><strong>Executing a Commit on the File or using the Toolbar Shortcut</strong><br>
				 Yes you can Right-Click on file>Team>Commit. You can do a commit like this, but this by default only 
				 selects that file to add to the STAGING area. Just make sure you select all the files you want to Commit, if indeed you do want all of them. See below for example<br>
				 <img src="images/egitcommitonfile.jpg"><br> 
				 <strong>Important</strong><br>
				 4) One scenario that could be an issue if you tend to commit on the file and only commit the change for that one file. See <a href="##egitimportant">Important Notes</a><br>
				 5) To avoid the above scenario, attempt to get in a habit of committing by Right-click on <strong>project>Team>Commit</strong>. The shortcut Commit on the toolbar menu is the same as right-click on file>Commit. 
				 </div><br>
				 <strong>Re-committing</strong><br>
				 1) If you find yourself in a scenario where you have to start new work(for example a critical fix/issue), so you would need to create a new branch.
				 Since you cannot switch branches before committing at least once if you have made changes in your current branch, you would need to commit. When you come back to that ticket and continue work,
				 the next time you commit, select <strong>AMEND</strong> within the Commit window. This basically keeps all your commits you may have done in one single commit, which improves the GIT history view,
				 process efficiency, and also makes the code review department's job easier. <br>
				 <img src="images/egitcommitamend.jpg"><br><br>
				 <strong>Pushing to remote</strong><br>
				 1) Everything up to this point happened on your local. When you push a branch to the remote repository, everyone else can access your branch you pushed up. <br>
				 2) There are few ways to push, but I would recommend using the following because it gives you more options before the push executes. This is done through Right-click on project>Team>Remote>Push<br>
				  <img src="images/egitteampush.jpg"><br>
				  3) The first window "Destination Git Repository" is standard and you can leave that alone. Should be pushing to IDMI/xxxxxx, where xxxxx would be the project you are pushing to.<br>
				  4) The "Push Ref Specifications" screen is where you select the source branch and its destination, which is nice, so you'll know exactly where you want your branch to go. <br>
				  <img src="images/egitpushspecs.jpg"><br>
				  <div class="note"><strong>Force Update</strong> - If this is your first time pushing your branch and it's a new branch in the remote repository, you do not need to check "Force Update." Force Update will basically 
				  merge your source branch into the destination you selected and it will overwrite the destination no matter if your source branch and the destination branch have a common ancestor or not. <br>
				  <strong>Please refrain from ever selecting the "Force Update" option for the following DEV/SUPPORT/master</strong> branches because that will basically overwrite either DEV/SUPPORT/master
				  with your branch. It's not a big deal, we can back the change out within seconds, but the code review
				  department will be mad at you.
				  <br>If the branch is your own branch that you pushed before and want to make additions to  that branch, you are able to select "Force Update"</div> 
				  5) If you forget to do something the first time you pushed and need to add to your code, you can checkout the original branch, and push again. <br>
				  6) If you get rejected shown by the following screen you can go back and check "Force Update", but make sure you are pushing to your own built branch, then check "Force Update" and try again. <br>
				 7) The "Push Confirmation" is another reason why I like to go into >Team>Remote>Push because it gives this screen, which shows you the changes that will take place before you push anything,
				 so it's a good way for you to verify your work.<br>
				  <img src="images/egitpushrejected.jpg"><br>
				  <strong>Other method to Push</strong><br>
				 1) Using the shortcut key from the Git toolbar<br>
				 2) Or Right-Click on project>Team>Push to Upstream<br>
				 <img src="images/egitpushshortcut.jpg"><br> 
				 <div class="note">Both of these function the same. Both are "Fast-forward" Pushes ONLY, which basically look for common ancestors between your branch you have checked out and
				 the branches in the remote.<br> This goes along with the "Force Update" described above, where if you select "Force Update", it will update the remote branch no matter if there exists
				 a common ancestor between the source and destination branch<br>
				 Following these methods to Push - eGit attempts to merge your branch into ALL remote branches. However, since it is "Fast-forward" Push and your branch would more than likely have no 
				 common ancestor(s) between the other branches in remote, Git will never update them, and only update the branch(s) that do have a common ancestor, which almost always would be 
				 your own branch in the remote.<br>
				 If this is your first time Pushing your branch and you follow either of these methods, Git will just create a new branch. (Should show this in the Push Results window)</div>
				<a href="##top">Back to Top</a>
			</div><!---egitpushcommit DIV --->
			<div class="content"><a name="bitbucketpullrequest"</a><!---bitbucketpullrequest DIV --->
				<h2>IV. Creating Pull Requests</h2><!---<a name="bitbucketpullrequest"</a>---><br>
				<strong>The Git department is now implementing a change requiring developers to once again start creating pull requests. Read Note below as to why</strong>
				<div class="note">Pull requests allow developers to see a snapshot of differences between their branch to the destination branch they are attempting to create the pull request for.<br>
				This allows you to verify you have included all of your file changes/or whether you changed something irrelevant to the ticket's requirements<br>
				You can see below that I am creating pull request to merge into the real DEV, but I can see a snapshot of differences from the two branches. 
				<img src="images/bitbucketpullrequest.jpg"><br>
				It's an extra step for developers, but ultimately is meant to make the process more effective. 
				</div>
				1) Once you have pushed your branch to the "IDMI" Github repository, find "create pull request" on top right side<br>
				<img src="images/githubcreatepullrequest.jpg"><br>
				3) Find your branch you have made as the <strong>Source</strong> and the <strong>Destination</strong> should almost always be DEV. Unless there are SEV 1 tickets/Live HotFixes, in which case 
				you can request to push to "master;" otherwise, all Pull requests should be destined for "DEV" originally.<br>
				<img src="images/githubcreatepullrequest1.jpg"><br>
				4) You should also "<strong>Verify</strong>" that the 'Files Changed' are in fact the files you wanted and needed for the ticket you worked in. <br>
				<a href="##top">Back to Top</a>
			</div><!---bitbucketpullrequest DIV --->
				<div class="content"><a name="egitmergeconflicts"</a><!---egitmergeconflicts DIV --->
				<h2>V. Handling Merge Conflicts </h2><!---<a name="bitbucketpullrequest"</a>--->
				<strong>Handling Remote Merge Conflicts</strong><br>
				</a><img src="images/gitpullerror.jpg"><img src="images/egitmergeconflict.jpg"><br>
				<div class="note">If you receive something like these errors when you do a Pull request and there is a merge conflict. One of the main reasons for 
				merge conflicts is 2 or more people changed the same line and each of the two changes are part of a common ancestor.<br></div>
				<div class="note">If you strictly work with Eclipse and do not have knowledge of the command line follow the following steps. Having the command line does make this solution easier;
				if you have the command line, skip to the "Command Line" section for resolving this issue</div>
				1) You will need to synchronize your workspace with the remote. <br>
				2) On the project >Right-click>Team>Synchronize Workspace<br>
				3) This will switch Eclipse to a new Perspective. This perspective provides clear documentation on where the conflicts exist.<br>
				<img src="images/egitsynchronizeperspective.jpg"><br>
				4) I only have 1 file as a merge conflict, if I had more, they would all be listed on the left under which folder the files exist in. You will need to fix them all.<br>
				5) The left side labeled "Local File Workspace" is yours and right side is what's attempting to merge into your local. Once you or you and your colleague if working in teams
				have managed the merge conflict, change the left side and SAVE. This will automatically change the actual file. <br>
				6) Switch back to your ColdFusion Perspective. <br>
				7) Commit and "Amend" (If you get a merge conflict for the same file(s), right-click on the file(s) and Team>Add to Index)<br>
				8) Now do a Pull. <br>
				9) Now you should be fully synched with your colleague's local machine.<br><br>
				<strong>Command Line</strong><br>
				1) Once you are presented with the merge conflict in Git Bash. <br>
				2) Go to Eclipse and the project including all files that have merge conflicts will have right and left red arrows in front of the file name<br>
				3) You are able to just open the files, manage the merge conflicts, SAVE file. I usually search for ">>>>" or "<<<<" throughout the file to look for merge conflicts.<br>
				4) In command line run <div class="code">$ git add --all</div> which will add all of the files to the staging area.<br>
				5) Execute <div class="code">$ git commit --amend<br>$ git pull</div>				
				6) You should be synched with your colleague's local. <br><br>
				<strong>Handling Local Merge Conflicts</strong><br>
				1) Local conflicts are easier to handle. You do not need to switch to "Synchronize Workspace" perspective. <br>
				2) If you attempt to "Merge" in a local branch into another local branch and you receive the following Merge conflict error<br>
				<img src="images/egitlocalmergeconflict.jpg"><br>
				3) Your project should show the left&right red arrow. Look for the folder and file having the same symbol. See below.<br>
				<img src="images/egitdirectorymergeconflict.jpg"><br> 
				4) Access the file, search for ">>>>" and "<<<<" symbols. Make sure when you save the files, these output symbols are not there anymore. 
				<img src="images/egitmergeconflictoutput.jpg"><br>
				5) You can see my example above has 2 different merge conflicts within policy_action.cfm. <br>
				This is your current local branch you have checked out version of the code
				<div class="code">"<<<<<<<"HEAD<br>CODE CODE CODE CODE CODE <br> =======</div> 
				<div class="code">=======<br>CODE CODE CODE CODE CODE <br> >>>>>>>> refs/heads/xxxxxx</div> 
				7) Where xxxx is the branch/commitID you are attempting to Merge into your checked out 
				local branch. <br>
				8) So you need to decide which of these two versions of code needs to be used.<br> 
				9) Once you decide, modify the code, remove the Git outputs, and SAVE. <br>
				10) Right-click on file>Team>Add To Index - This will basically add it to the staging area.<br>
				11) You need to COMMIT the resolution of the merge conflict. <br>
				12) Now your two local branches should be synched unless the files that had merge conflicts.<br> 
				<a href="##top">Back to Top</a>
			</div><!---egitmergeconflicts DIV --->	
			<div class="content"><a name="egitmanydev"</a><!---egitmanydev DIV --->
				<h2>VI. Tickets requiring Many Developer's Effort </h2><!---<a name="bitbucketpullrequest"</a>---><br>
				<strong>Follow these tips when working with major enhancements/PROD/rating tickets that require many developers</strong><br>
				1) This requires greater communication and collaboration between you and your teammates; more than what we were all used to working with Frontpage. <br>
				2) Between the number of developers working together, determine what the 1st step of that ticket needs to be and who is to complete it before others can initiate their work <br>
				3) The first step developer should create the branch off of DEV(select <strong>REBASE</strong> as the pull strategy), complete his or her work, and push the branch to "idmiadmin,"
				but no Pull requests is needed at this point.<br>
				4) Once the branch is in Github, other developers needing the first developer's code should Right-click on project>Team>Pull. This grabs the most updated changes, merges them in, and also imports tracking of
				any new remote branches found in the Github repository. <br>
				5) At this point the developers are able to "create new branch," and select the remote branch. Look for "refs/remotes/origin/xxxxxx" where xxxxx would be the branch the first developer named<br>
				<img src="images/egitcreatebranchdiff.jpg"><br>
				6) Select the <strong>REBASE</strong> strategy for the Pull strategy. This is to set the "Pull configuration" automatically. If you miss to use the merge strategy, you will need to go to 
				<a href="##egitsetuppull">here</a> and set the pull configuration manually<br>
				7) There should now exist a link between your local copies of that branch. <br>
				8) Complete your work, commit<br>
				<div class="note">When you commit, make sure you "<strong>Amend</strong>" your commits, so that the entire effort be fewest commits as possible. (I understand issues during merge/pull you 
				are presented with merge conflicts, in which you need extra commit(s))</div>
				9) If you do a Pull on the branch and you are presented with merge conflict error, it is more than likely one or more other developers changed the same line and 
				Git does not know which one should be used. In this case, all would need to get together to discuss an ultimate code for that conflict. 
				Go back to  <a href="##egitmergeconflicts">V. Handling Merge Conflicts</a> for the solution<br>
				10) Once work is complete, if there were several tickets associated with one major effort(rating side/forms side/exports side) every developer should baseline his or her ticket(s), but please
				 <strong>NOTE</strong> on ticket the branch name so the code department will know the branch associated with the ticket(s).<br>
				<a href="##top">Back to Top</a>
			</div><!---egitmanydev DIV --->
				

			
			
			
			
			
			<div class="content"><a name="egitimportant"</a><!---egitbasics DIV --->
				<h2>V. Important Notes To Consider/Procedures to Follow</h2><br>
				<strong>Scenario - Committing on the file or using shortcut Commit in the Toolbar</strong><br>
				<div class="note">If you have the tendency of committing on the file or using the shortcut commit in the Git toolbar, within the Commit window, let's say you forget to select all the files 
				needed for example ticket 12345. Since you technically did the Commit, eGit will allow you to switch branches; 
				however, the one file(or however many) that was left in the "Unstaging" area that you forgot to commit changes to, the changes in that file will be carried over to the next branch(let's say DEV)
				you checkout and so on until that file is part of a commit.<br>
				<strong>The issue</strong><br> If you start working on a new ticket, let's say 67890 by creating a branch off of DEV, even if you do a PULL on DEV, since the file(s) is still in the "Unstaging" area, 
				Git will not update the file(s) with changes from remote(Github) because Git thinks you are still working in the file(s), so it does not want to overwrite your unstaged changes.<br>
				So you create another branch for ticket 67890, make your changes, but this time, let's say you happen to Commit on the project, Right-click on project>>Team>Commit or accidently do select 
				all uncommitted files in the Commit Window, and do not notice that one file(or however many)
				you originally needed for your 12345 ticket is being included as part of the changes for ticket 67890. Then the developer pushes up a change not associated with the correct ticket. <br>
				I have seen this, where GIT sees different changes associated with a branch than what the developer lists in his or her file changes in the ticket. (I realize that this could 
				sometimes be user mistake not listing or listing too many files being changed in the ticket, but sometimes it is due to this scenario).<br>
				To avoid this: "<strong>However method you use to commit, make sure you are committing the files associated with the changes for that ticket</strong>"
				See <a href="##egitCommitting">Committing</a><br></div>
				<a href="##top">Back to Top</a>
			</div>
		</div><!---Chapter V - Working with eGit in Eclipse DIV --->
		
		
		
		<div class="divider"></div>
		<div class=content><a name=troubleShoot></a>
				<h1 class="title">X. Troubleshoot</h1>

			<div class="content">
				<a name="troubleShortcferootmapping"></a>
				<h2>Issue 1</h2>
				<img src="images/cfenorootmapping.jpg"><br>
				<div class="note">You will get something similar to this error (could not find the included) if you did not set your CF ADMIN mappings correctly. 
				This would need to be done whether you are using Apache or IIS. See <a href=##confirmmapping>Here
				for Mappings</a></div>
				
				<a name="egitinstallerror"></a>
				<h2>Issue 2</h2>
				<img src="images/egitinstallerror.jpg"><br>
				<div class="note">If you get this error installing eGit in CFB. I saw this installing eGit on a colleague's machine. Found out he was using CFB before the Update 1 release
				by Adobe. I do not believe the HOTFIX 1 by Adobe is the same thing.
				You would need to install the CFB standalone or plugin for Eclipse at <strong>\\gatekeeper1\Users\Peyman\ColdFusion</strong></strong>  You will not lose your projects as those are 
				in your workspace directory and if you have kept the workspace as default, the next time you install CFB, it will import all your projects. <br>
				You would need to install the FrontPage Ext. Plugin Mike W. wrote again though.<a href=##egitinstall>Back to Installing eGit</a></div>
				
				<a href="##top">Back to Top</a><br>
				
				<a name="cannotcreateprojecttroubleshoot"></a>
				<h2>Issue 3</h2>
				<img src="images/cannotcreateprojecttroubleshoot.jpg"><br>
				<div class="note">If you get this error when you are trying to create a CF project. This just means the directory you are trying to set  a CF project that already has 
				the .setting folder and .project files within the directory. These 2 along with one other file are created by Eclipse whenever you add a project under Eclipse. All you need to do is
				go to the directory, find: <br>
				.setting folder<br>
				.project file<br>
				and <strong>Delete</strong> both of them. Go back to this "New ColdFusion Project" window and do some action that makes that window Refresh, and this error will go away
				</div>
				
				
				<a name="egitpullerrornoconfig">
				<h2>Issue 4</h2>
				</a><img src="images/egitpullerrornoconfig.jpg"><br>
				<div class="note">You will get this error if you current branch you have checked out is not configured for a Pull request and you do a Team>Pull request from a remote repository. 
				Your solutions are one of following:<br>
				1) In eGit, follow these instructions <a href="##egitsetuppull">Set pull configuration</a><br>
				2) If you use command line, while you have the branch you want to add the Pull Key configuration for example "SUPPORT", run 
				<div class="code">$ git pull origin SUPPORT</div>
				3) Longer Route: Or you could delete the branch, checkout the branch you want to Create your feature branched based on, and this time select the "Merge" strategy noted  <a href="##egitcreatenewbranch">here</a>
				</div>
				
				

				<a href="##top">Back to Top</a>
				
			</div>
		</div><!---troubleShoot DIV --->
			
			
			
	</div><!---wrapper DIV--->
</body>	
	
</html>

	
	
	
</cfoutput>