<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>

	<!--

	/********************************************************************
	                              README
	/********************************************************************

	This /etc/fonts/local.conf file is intended to be used
	in conjunction with the freetype-infinality subpixel hinting patch at
	http://www.infinality.net/

	- The rules assume that all Windows XP/Vista/7 fonts are installed.
	- The rules assume that the most recent version(s) of the fonts are
	    installed.
	- Windows, Apple, Google, and Linux fonts are included in the rules
	  along with other misc popular or useful fonts found on the web.
	- Feel free to propose additions and changes to this file at:
		http://www.infinality.net/forum/
		-->

	<!--


	/********************************************************************
	Changes for 2010-11-14
	/********************************************************************

	Added configuration for different rendering styles. These can be enabled by
	  uncommenting the style you want.  For instance, if you want your system
	  to look like Windows 98, uncomment that style, and make sure others
	  are commented out.  Obviously you'd want to have appropriate fonts
	  installed for that rendering style.  Aliases for different OS
	  fontsets will be added eventually.  The old default style is now
	  considered "Infinality" style.  Not all styles that are defined are
	  filled in yet- but "Apple" and anything above it are.

	Due to the above, in combination with the prevalence of @font-face on
	  the web, I've made "Infinality" style rendering use autohint by
	  default, and only call out fonts that specifically should use TT
	  hinting.  The patched autohint will render more fonts, better, than
	  TT native hinting will.


	/********************************************************************
	Changes for 2010-10-22
	/********************************************************************

	Promoted Century Gothic, Arial Black and Calibri to Full TT subpixel hinting
	Added Google fonts
	Added Nimbus fonts
	Added more Apple fonts
	Replace Courier New with Apple's Courier - MUCH nicer result
	Better comments to help new users understand what everything means
	Reorganization of some rules
	General Cleanup
	Removed code for artificial oblique, as most distros have this in
	  /etc/fonts/conf.d/
	Added nonlatin font alias preferences that favor MS fonts, which have the
	  best hinting AFAICT. If you have all Windows Vista/7 fonts installed,
	  www.wikipedia.org should look pretty nice.

	/********************************************************************
	Changes for 2010-10-03
	/********************************************************************

	Promoted Geneva, Geneva CY to Full TT subpixel hinting.
	Added an alias for "Trebuchet" to point to "Trebuchet MS"
	Minor comment updates

	-->


	<match target="pattern">
		<!-- Choose an OS Style.  This affects how everything is applied -->

		<!-- A Customized combination of things, similar to Windows 7 -->
		<edit name="rendering_style" target="pattern">
			<string>Infinality</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Infinality</string>
		</edit>

		<!--
		<edit name="rendering_style" target="pattern">
			<string>Windows 7</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Windows 7</string>
		</edit>
		-->

		<!--
		<edit name="rendering_style" target="pattern">
			<string>Windows XP</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Windows XP</string>
		</edit>
		-->

		<!--
		<edit name="rendering_style" target="pattern">
			<string>Windows 98</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Windows 98</string>
		</edit>
		-->

		<!--
		<edit name="rendering_style" target="pattern">
			<string>Apple</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Apple</string>
		</edit>
		-->


		<!-- THE BELOW STYLES ARE NOT WELL FILLED-IN YET -->

		<!--
		<edit name="rendering_style" target="pattern">
			<string>No Replacements</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>No Replacements</string>
		</edit>
		-->

		<!--
		<edit name="rendering_style" target="pattern">
			<string>Linux</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Linux</string>
		</edit>
		-->

		<!--
		<edit name="rendering_style" target="pattern">
			<string>Fedora Linux</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Fedora Linux</string>
		</edit>
		-->

		<!-- Create your own -->
		<!--
		<edit name="rendering_style" target="pattern">
			<string>Your Own Style</string>
		</edit>
		<edit name="rendering_style" target="font">
			<string>Your Own Style</string>
		</edit>
		-->

		<!-- Forces certain family replacements - NOT IMPLEMENTED YET -->
		<!--
		<edit name="style_settings">
			<string>Forced</string>
		</edit>
		-->

	</match>

	<!-- ********************  BITMAP / OUTLINE  **********************  -->

	<!-- Prevent gnome from using embedded bitmaps in fonts like Calibri -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Apple</string>
		</test>
		<edit name="embeddedbitmap" mode="assign">
			<bool>false</bool>
		</edit>
	</match>

	<!-- Reject bitmap fonts in favour of Truetype, Postscript, etc. -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Apple</string>
		</test>
		<selectfont>
			<rejectfont>
				<pattern>
					<patelt name="scalable" >
						<bool>false</bool>
					</patelt>
				</pattern>
			</rejectfont>
		</selectfont>
	</match>

	<!-- Substitute truetype fonts for bitmap ones -->
	<match target="pattern" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Apple</string>
		</test>
		<edit name="prefer_outline" >
			<bool>true</bool>
		</edit>
	</match>

	<!-- **************************** ALIASES **********************  -->

	<!-- Uncomment 1 of the 3 below for default fonts -->
	<!-- Default fonts - Microsoft Appearance -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<alias>
			<family>sans</family>
			<default>
				<family>Arial</family>
			</default>
		</alias>
		<alias>
			<family>sans-serif</family>
			<default>
				<family>Arial</family>
			</default>
		</alias>
		<alias>
			<family>serif</family>
			<default>
				<family>Times New Roman</family>
			</default>
		</alias>
	</match>

	<!-- Default fonts - Apple Appearance -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<alias>
			<family>sans</family>
			<default>
				<family>Lucida Grande</family>
			</default>
		</alias>

		<alias>
			<family>sans-serif</family>
			<default>
				<family>Lucida Grande</family>
			</default>
		</alias>

		<alias>
			<family>serif</family>
			<default>
				<family>Times</family>
			</default>
		</alias>
	</match>

	<!-- Default fonts - Linux Appearance -->
	<!-- this is handled by default fontconfig rules -->


	<!-- These MS aliases typically are used in user interfaces -->
	<!-- You will mostly run into fonts with these names in WINE programs -->
	<!-- Uncomment 1 of the below for these UI fonts -->

	<!-- WINE UI fonts - Microsoft Windows Vista/7 Appearance -->

	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
		</test>
		<alias binding="same">
			<family>System</family>
			<accept>
				<family>Segoe UI</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Shell Dlg</family>
			<accept>
				<family>Segoe UI</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Sans Serif</family>
			<accept>
				<family>Segoe UI</family>
			</accept>
		</alias>
	</match>

	<!-- WINE UI fonts - Microsoft Windows 98/XP Appearance -->
	<!-- For Win 98, make sure font smoothing is DISABLED within WINE:
		wget http://files.polosatus.ru/winefontssmoothing_en.sh
		sh winefontssmoothing_en.sh
	-->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Windows 98</string>
		</test>
		<alias binding="same">
			<family>System</family>
			<accept>
				<family>Microsoft Sans Serif</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Shell Dlg</family>
			<accept>
				<family>Microsoft Sans Serif</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Sans Serif</family>
			<accept>
				<family>Microsoft Sans Serif</family>
			</accept>
		</alias>
	</match>

	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Windows XP</string>
		</test>
		<alias binding="same">
			<family>System</family>
			<accept>
				<family>Tahoma</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Shell Dlg</family>
			<accept>
				<family>Tahoma</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Sans Serif</family>
			<accept>
				<family>Tahoma</family>
			</accept>
		</alias>
	</match>

	<!-- WINE UI fonts - Apple Appearance -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<alias binding="same">
			<family>System</family>
			<accept>
				<family>Lucida Grande</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Shell Dlg</family>
			<accept>
				<family>Lucida Grande</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Sans Serif</family>
			<accept>
				<family>Lucida Grande</family>
			</accept>
		</alias>
	</match>

	<!-- WINE UI fonts - Linux Appearance -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Linux</string>
		</test>
		<alias binding="same">
			<family>System</family>
			<accept>
				<family>DejaVu Sans</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Shell Dlg</family>
			<accept>
				<family>DejaVu Sans</family>
			</accept>
		</alias>
		<alias binding="same">
			<family>MS Sans Serif</family>
			<accept>
				<family>DejaVu Sans</family>
			</accept>
		</alias>
	</match>

	<!-- Establish priorities for non-Latin fonts -->
	<!-- http://en.wikipedia.org/wiki/List_of_Microsoft_Windows_fonts -->
	<!-- Uncomment 1 of the below for these UI fonts -->

	<!-- Non-latin fonts - Microsoft Windows Vista/7 Appearance -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<alias>
			<family>serif</family>
			<prefer>
				<family>Times New Roman</family>
				<family>Batang</family>
				<family>DFKai-SB</family>
				<family>EucrosiaUPC</family>
				<family>JasmineUPC</family>
				<family>KaiTi</family>
				<family>Kartika</family>
				<family>KodchiangUPC</family>
				<family>MingLiU</family>
				<family>MS Mincho</family>
				<family>SimSun</family>
				<family>Sylfaen</family>
				<family>DaunPenh</family>
				<family>MV Boli</family>
				<family>Iskoola Pota</family>
				<family>Latha</family>
				<family>Microsoft Himalaya</family>
				<family>Mongolian Baiti</family>
				<family>Shruti</family>
				<family>Cardo</family>
				<family>MPH 2B Damase</family>
			</prefer>
		</alias>
		<alias>
			<family>sans-serif</family>
			<prefer>
				<family>Arial</family>
				<family>Meiryo</family>
				<family>Arabic Typesetting</family>
				<family>DokChampa</family>
				<family>Malgun Gothic</family>
				<family>Estrangelo Edessa</family>
				<family>Gautami</family>
				<family>Iskoola Pota</family>
				<family>Microsoft YaHei</family>
				<family>Mangal</family>
				<family>Microsoft JhengHei</family>
				<family>Vrinda</family>
				<family>Plantagenet Cherokee</family>
				<family>Raavi</family>
				<family>Nyala</family>
				<family>Tunga</family>
				<family>Kartika</family>
				<family>MV Boli</family>
				<family>DaunPenh</family>
				<family>Iskoola Pota</family>
				<family>Latha</family>
				<family>Microsoft Himalaya</family>
				<family>Mongolian Baiti</family>
				<family>Shruti</family>
				<family>Skeirs</family>
				<family>Cardo</family>
				<family>MPH 2B Damase</family>
				<family>Tahoma</family>
				<family>Arial Unicode MS</family>
			</prefer>
		</alias>
		<alias>
			<family>monospace</family>
			<prefer>
				<family>Consolas</family>
				<family>Inconsolata</family>
				<family>Andale Mono</family>
				<family>Courier New</family>
				<family>Microsoft JhengHei</family>
				<family>Microsoft YaHei</family>
				<family>MPH 2B Damase</family>
			</prefer>
		</alias>
		<alias>
			<family>fantasy</family>
			<prefer>
				<family>Impact</family>
				<family>Copperplate Gothic Std</family>
				<family>Cooper Std</family>
				<family>Bauhaus Std</family>
			</prefer>
		</alias>
		<alias>
			<family>cursive</family>
			<prefer>
				<family>ITC Zapf Chancery Std</family>
				<family>Zapfino</family>
				<family>Comic Sans MS</family>
			</prefer>
		</alias>
	</match>

	<!-- ************************** REPLACEMENTS  **********************  -->

	<!-- Replaces sans, sans-serif, serif with a specific font preference -->
	<!-- This is also set in aliases above -->

	<!-- Microsoft style - sans, sans-serif, serif -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>sans</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Arial</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>sans-serif</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Arial</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>serif</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Times New Roman</string>
		</edit>
	</match>

	<!-- Apple style - sans, sans-serif, serif -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<test name="family" qual="any" >
			<string>sans</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Lucida Grande</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<test name="family" qual="any" >
			<string>sans-serif</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Lucida Grande</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<test name="family" qual="any" >
			<string>serif</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Times</string>
		</edit>
	</match>



	<!-- Replace these common poorly hinted fonts with Arial -->
	<!-- Adjust as necessary -->

	<!-- Microsoft Appearance - Poorly Hinted Fonts -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Nimbus Sans</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Arial</string>
		</edit>
	</match>
	<match target="pattern" name="family">
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Nimbus Sans</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Arial</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Nimbus Sans L</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Arial</string>
		</edit>
	</match>
	<match target="pattern" name="family">
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Nimbus Sans L</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Arial</string>
		</edit>
	</match>

	<!-- Apple Appearance - Poorly Hinted Fonts -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<test name="family" qual="any" >
			<string>Nimbus Sans</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Helvetica Neue</string>
		</edit>
	</match>
	<match target="pattern" name="family">
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<test name="family" qual="any" >
			<string>Nimbus Sans</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Helvetica Neue</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<test name="family" qual="any" >
			<string>Nimbus Sans L</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Helvetica Neue</string>
		</edit>
	</match>
	<match target="pattern" name="family">
		<test name="family" qual="any" >
			<string>Nimbus Sans L</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Helvetica Neue</string>
		</edit>
	</match>

	<!-- This replacement handles the fonts here, which I recommend
	in place of the default Terminus bitmap files:
	http://files.ax86.net/terminus-ttf/4.30/

	Note that Terminus will only look good at the pixel sizes that
	it was designed for!
	-->
	<match target="font" >
		<test name="family" qual="any" >
			<string>Terminus</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Terminus (ttf)</string>
		</edit>
	</match>
	<match target="pattern" name="family">
		<test name="family" qual="any" >
			<string>Terminus</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Terminus (ttf)</string>
		</edit>
	</match>

	<!-- Replace Helvetica with Arial -->
	<!-- Currently Helvetica has cap height issues -->

	<!-- Microsoft Appearance - Helvetica -->
	<match target="pattern" name="family">
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Arial</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Arial</string>
		</edit>
	</match>

	<!-- Linux Appearance - Helvetica -->
	<match target="pattern" name="family">
		<test name="rendering_style" qual="any" >
			<string>Linux</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Liberation Sans</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Linux</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Liberation Sans</string>
		</edit>
	</match>

	<!-- Replace Helvetica Neue with Arial -->
	<!-- Currently Helvetica Neue has cap height issues -->

	<!-- Microsoft Appearance - Helvetica Neue -->
	<match target="pattern" name="family">
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica Neue</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Arial</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica Neue</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Arial</string>
		</edit>
	</match>

	<!-- Linux Appearance - Helvetica Neue -->
	<match target="pattern" name="family">
		<test name="rendering_style" qual="any" >
			<string>Linux</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica Neue</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Liberation Sans</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Linux</string>
		</test>
		<test name="family" qual="any" >
			<string>Helvetica Neue</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Liberation Sans</string>
		</edit>
	</match>


	<!-- Replace "Arial" with black weight, with font "Arial Black" -->
	<match target="pattern">
		<test name="family" compare="eq" target="default">
			<string>Arial</string>
		</test>
		<test compare="more" name="weight" >
			<const>bold</const>
		</test>
		<edit name="family" mode="prepend" binding="same">
			<string>Arial Black</string>
		</edit>
		<edit name="weight" mode="assign">
			<const>bold</const>
		</edit>
	</match>

	<!-- Replace 'Nimbus Mono L' with Courier New -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>Nimbus Mono L</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Courier New</string>
		</edit>
	</match>
	<match target="pattern" name="family" >
		<test name="family" compare="eq" target="default">
			<string>Nimbus Mono L</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Courier New</string>
		</edit>
	</match>

	<!-- Replace "Lucida Sans Unicode" bold with Lucida Grande bold weight -->
	<match target="pattern">
		<test name="family" compare="eq" target="default">
			<string>Lucida Sans Unicode</string>
		</test>
		<test compare="more" name="weight" >
			<const>medium</const>
		</test>
		<edit name="family" mode="prepend" binding="same">
			<string>Lucida Grande</string>
		</edit>
		<edit name="weight" mode="assign">
			<const>bold</const>
		</edit>
	</match>

	<!-- Microsoft Appearance - Courier -->
	<match target="pattern">
		<test name="rendering_style" qual="any" >
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" compare="eq" target="default">
			<string>Courier</string>
		</test>
		<edit name="family" mode="prepend" binding="same">
			<string>Courier New</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Courier</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Courier New</string>
		</edit>
	</match>

	<!-- NOTE: Apple's Courier renders much nicer than Courier New -->
	<!-- Apple Appearance - Courier -->
	<match target="pattern">
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
			<string>Infinality</string>
		</test>
		<test name="family" compare="eq" target="default">
			<string>Courier New</string>
		</test>
		<edit name="family" mode="prepend" binding="same">
			<string>Courier</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
			<string>Infinality</string>
		</test>
		<test name="family" qual="any" >
			<string>Courier New</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Courier</string>
		</edit>
	</match>

	<!-- Microsoft Appearance:  Replace 'Times' with Times New Roman -->
	<match target="pattern" name="family" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Times</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Times New Roman</string>
		</edit>
	</match>
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Windows 98</string>
		</test>
		<test name="family" qual="any" >
			<string>Times</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Times New Roman</string>
		</edit>
	</match>


	<!-- Fix poorly specified font family names -->

	<match target="pattern" name="family">
		<test name="family" qual="any" >
			<string>Trebuchet</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Trebuchet MS</string>
		</edit>
	</match>
	<match target="font" >
		<test name="family" qual="any" >
			<string>Trebuchet</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Trebuchet MS</string>
		</edit>
	</match>

	<match target="pattern" name="family" >
		<test name="family" qual="any" >
			<string>Palatino</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Palatino Linotype</string>
		</edit>
	</match>
	<match target="font" >
		<test name="family" qual="any" >
			<string>Palatino</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Palatino Linotype</string>
		</edit>
	</match>

	<match target="pattern" name="family" >
		<test name="family" qual="any" >
			<string>Lucida Sans</string>
		</test>
		<edit binding="strong" mode="prepend" name="family" >
			<string>Lucida Grande</string>
		</edit>
	</match>
	<match target="font" >
		<test name="family" qual="any" >
			<string>Lucida Sans</string>
		</test>
		<edit mode="assign" name="family" >
			<string>Lucida Grande</string>
		</edit>
	</match>

	<!-- ********************  BASE SETTINGS  **********************  -->

	<!-- These are the base settings for all rendered fonts.
	We modify them for specific fonts later. -->

	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
		</test>
		<edit mode="assign" name="rgba" >
			<const>rgb</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
		<edit name="lcdfilter" mode="assign">
			<const>lcddefault</const>
		</edit>
	</match>

	<match target="font" >
		<test name="rendering_style" qual="any">
			<string>Windows 7</string>
		</test>
		<edit mode="assign" name="rgba" >
			<const>rgb</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit name="lcdfilter" mode="assign">
			<const>lcddefault</const>
		</edit>
	</match>

	<match target="font" >
		<test name="rendering_style" qual="any">
			<string>Windows XP</string>
		</test>
		<edit mode="assign" name="rgba" >
			<const>rgb</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit name="lcdfilter" mode="assign">
			<const>lcddefault</const>
		</edit>
	</match>

	<match target="font" >
		<test name="rendering_style" qual="any">
			<string>Windows 98</string>
		</test>
		<edit mode="assign" name="rgba" >
			<const>rgb</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit name="lcdfilter" mode="assign">
			<const>lcddefault</const>
		</edit>
	</match>

	<match target="font" >
		<test name="rendering_style" qual="any">
			<string>Apple</string>
		</test>
		<edit mode="assign" name="rgba" >
			<const>rgb</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintnone</const>
		</edit>
		<edit name="lcdfilter" mode="assign">
			<const>lcddefault</const>
		</edit>
	</match>

	<match target="font" >
		<test name="rendering_style" qual="any">
			<string>Fedora Linux</string>
		</test>
		<edit mode="assign" name="rgba" >
			<const>none</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit name="lcdfilter" mode="assign">
			<const>lcdnone</const>
		</edit>
	</match>


	<!-- ********************  FONT GROUPS  **********************  -->

	<!-- Full Subpixel BCI for these fonts.  (Cleartype-like, circa Windows XP/Vista/7) -->
	<!-- These will take advantage of subpixel hinting if infinality patch installed. -->
	<!-- This should only be used by fonts that contain TrueType instructions, -->
	<!-- otherwise fonts will appear blurry. -->

	<match target="font" >
		<test name="family" qual="any" >
			<string>Andale Mono</string>
			<string>Andalus</string>
			<string>Angsana New</string>
			<string>AngsanaUPC</string>
			<string>Aquabase</string>
			<string>Arial Black</string>
			<string>Arial MT</string>
			<string>Arial Narrow</string>
			<string>Arial SF MT</string>
			<string>Arial Unicode MS</string>
			<string>Arial</string>
			<string>ArialMT</string>
			<string>Bitstream Vera Sans Mono</string>
			<string>Bitstream Vera Sans</string>
			<string>Bitstream Vera Serif</string>
			<string>Book Antiqua</string>
			<string>Bookman Old Style</string>
			<string>Browallia New</string>
			<string>BrowalliaUPC</string>
			<string>Calibri</string>
			<string>Cambria</string>
			<string>Candara</string>
			<string>Century Gothic</string>
			<string>Chalkduster</string>
			<string>Charcoal CY</string>
			<string>Charcoal</string>
			<string>Charis SIL</string>
			<string>Chicago</string>
			<string>Comic Sans MS</string>
			<string>Consolas</string>
			<string>Constantia</string>
			<string>Copperplate</string>
			<string>Corbel</string>
			<string>Cordia New</string>
			<string>CordiaUPC</string>
			<string>Courier 10 Pitch</string>
			<string>Courier New</string>
			<string>Courier</string>
			<string>Dark Courier</string>
			<string>DejaVu LGC Sans Mono</string>
			<string>DejaVu Sans Mono</string>
			<string>DejaVu Sans</string>
			<string>DejaVu Serif</string>
			<string>Estrangelo Edessa</string>
			<string>Euphemia</string>
			<string>FrankRuehl</string>
			<string>Franklin Gothic Medium</string>
			<string>Futura</string>
			<string>Georgia</string>			
			<string>Gotham Book</string>
			<string>Gotham Light</string>
			<string>Gotham Medium</string>
			<string>Guatami</string>
			<string>Impact</string>
			<string>Latha</string>
			<string>Levinim MT</string>
			<string>Liberation Mono</string>
			<string>Liberation Sans</string>
			<string>Liberation Serif</string>
			<string>Lucida Console</string>
			<string>Lucida Grande</string>
			<string>Lucida Sans Unicode</string>
			<string>Luxi Mono</string>
			<string>Malgun Gothic</string>
			<string>Microsoft Himalaya</string>
			<string>Microsoft JhengHei</string>
			<string>Microsoft Sans Serif</string>
			<string>Microsoft Uighur</string>
			<string>Microsoft YaHei</string>
			<string>Microsoft Yi Baiti</string>
			<string>Miriam Fixed</string>
			<string>Molengo</string>
			<string>Monaco</string>
			<string>Mongolian Baiti</string>
			<string>MoolBoran</string>
			<string>Narkisim</string>
			<string>Nina</string>
			<string>Nyala</string>
			<string>Padauk</string>
			<string>Palatino Linotype</string>
			<string>Plantagenet Cherokee</string>
			<string>Raavi</string>
			<string>Segoe UI</string>
			<string>Segoe UI Semibold</string>
			<string>TITUS Cyberbit Basic</string>
			<string>Tahoma</string>
			<string>Times New Roman</string>
			<string>Traditional Arabic</string>
			<string>Trebuchet MS</string>
			<string>Tunga</string>
			<string>Verdana</string>
			<string>Vrinda</string>
			<string>Yanone Kaffeesatz</string>
			
			<string>Garamond</string>			
		</test>
		<edit mode="assign" name="font_type" target="font">
			<string>TT Instructed Font</string>
		</edit>
		<!--<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		      </edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>-->
	</match>

	<match target="font" >
		<test name="font_type" qual="any" >
			<string>TT Instructed Font</string>
		</test>
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
		</test>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
	</match>

	<match target="font" >
		<test name="font_type" qual="any" >
			<string>TT Instructed Font</string>
		</test>
		<test name="rendering_style" qual="any" >
			<string>Windows 98</string>
		</test>
		<edit mode="assign" name="antialias" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
	</match>

	<match target="font" >
		<test name="font_type" qual="any" >
			<string>TT Instructed Font</string>
		</test>
		<test name="rendering_style" qual="any" >
			<string>Apple</string>
		</test>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintnone</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
	</match>


	<!-- Make these fonts use autohint slight hinting -->
	<!-- Makes only horizontal stems align to pixels.  Truer to glyph -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>AR PL ShanHeiSun Uni</string>
			<string>American Typewriter</string>
			<string>Apple Chancery</string>
			<string>Apple Garamond Light</string>
			<string>Apple Garamond</string>
			<string>AppleGothic</string>
			<string>Apple Symbols</string>
			<string>Arabic Typesetting</string>
			<string>Baekmuk Gulim</string>
			<string>Baskerville</string>
			<string>Big Caslon</string>
			<string>Bitstream Charter</string>
			<string>BrushScript</string>
			<string>Cantarell</string>
			<string>CantarellRegular</string>
			<string>Cantarell Regular</string>
			<string>Cardo</string>
			<string>Century Schoolbook L</string>
			<string>Century</string>
			<string>Charis SIL</string>
			<string>Chalkboard</string>
			<string>CMU Bright</string>
			<string>Cochin</string>
			<string>Comfortaa</string>
			<string>Comfortaa Regular</string>
			<string>ComfortaaRegular</string>
			<string>Courier Std</string>
			<string>Courier10 BT</string>
			<string>Crimson Text</string>
			<string>David</string>
			<string>Delicious</string>
			<string>Didot</string>
			<string>DilenniaUPC</string>
			<string>District</string>
			<string>DokChampa</string>
			<string>Droid Sans Mono</string>
			<string>Droid Sans</string>
			<string>Droid Serif</string>
			<string>Dutch801 Rm BT</string>
			<string>EucrosiaUPC</string>
			<string>FreeMono</string>
			<string>FreeSans</string>
			<string>FreeSerif</string>
			<string>FreesiaUPC</string>
			<string>Frutiger LT Std</string>
			<string>Frutiger Linotype</string>
			<string>Frutiger-Normal</string>
			<string>Gautami</string>
			<string>Geneva CY</string>
			<string>Geneva Regular</string>
			<string>Geneva</string>
			<string>Gentium</string>
			<string>Gill Sans</string>
			<string>Hard Gothic</string>
			<string>Helvetica</string>
			<string>Helvetica CY</string>
			<string>Helvetica Neue</string>
			<string>Herculanum</string>
			<string>Hoefler Text</string>
			<string>IM Fell</string>
			<string>Inconsolata</string>
			<string>IrisUPC</string>
			<string>JasmineUPC</string>
			<string>Jomolhari</string>
			<string>Josefin Sans Std Light</string>
			<string>Kai</string>
			<string>Kalinga</string>
			<string>KodchiangUPC</string>
			<string>Laconic</string>
			<string>Lacuna</string>
			<string>Levenim MT</string>
			<string>LilyUPC</string>
			<string>LilyUPC</string>
			<string>Linux Biolinum</string>
			<string>Linux Libertine</string>
			<string>Lobster</string>
			<string>Lohit Bengali</string>
			<string>Lohit Gujarati</string>
			<string>Lohit Hindi</string>
			<string>Lohit Hindi</string>
			<string>Lohit Kannada</string>
			<string>Lohit Malayalam</string>
			<string>Lohit Oriya</string>
			<string>Lohit Punjabi</string>
			<string>Lohit Tamil</string>
			<string>Lohit Telugu</string>
			<string>Lucida Sans Std</string>
			<string>Luxi Sans</string>
			<string>Luxi Serif</string>
			<string>M+ 2p</string>
			<string>Marker Felt</string>
			<string>Megalopolis</string>
			<string>MetaMedium-Roman</string>
			<string>Metabook-Roman</string>
			<string>MgOpen Canonica</string>
			<string>MgOpen Cosmetica</string>
			<string>MgOpen Modata</string>
			<string>MgOpen Moderna</string>
			<string>Myriad Pro</string>
			<string>Miriam</string>
			<string>MS Mincho</string>
			<string>MyriadRegular</string>
			<string>Neuton</string>
			<string>Nimbus Roman No9 L</string>
			<string>Nimbus Mono L</string>
			<string>Nimbus Sans</string>
			<string>Nimbus Sans L</string>
			<string>Nobile</string>
			<string>Nobile002</string>
			<string>Nobile-bold</string>
			<string>Nobile-italic002</string>
			<string>Nobile-bold-italic002</string>
			<string>OFL Sorts Mill Goudy TT</string>
			<string>Ocean Sans Std</string>
			<string>Old Standard TT</string>
			<string>Optima</string>  <!--- needs work but may be able to be promoted eventually -->
			<string>OTS derived font</string>
			<string>OTS derivied font</string>			<!-- bug in chrome code? -->
			<string>Palladio</string>
			<string>Papyrus</string>
			<string>PrimaSans BT</string>
			<string>proxima-nova-1</string>
			<string>proxima-nova-2</string>
			<string>proxima nova</string>
			<string>proxima nova bold</string>
			<string>proxima nova regular</string>
			<string>Reenie Beanie</string>
			<string>SimHei</string>
			<string>Skia</string>
			<string>Swansea</string>
			<string>Swiss721</string>
			<string>Sylfaen</string>
			<string>Tangerine</string>
			<string>Times LT Std</string>
			<string>Times New Roman MT Std</string>
			<string>Times Roman</string>
			<string>Times Ten LT Std</string>
			<string>Univers LT Std</string>
			<string>URWClassico</string>
			<string>Utopia</string>
			<string>Verdimka</string>
			<string>Vollkorn</string>
			<string>Yanone Kaffeesatz</string>
			<string>Zapfino</string>
			<string>cmbx10</string>
			<string>cmex10</string>
			<string>cmmi10</string>
			<string>cmr10</string>
			<string>cmsy10</string>
			<string>cmtt10</string>
			<string>eufm10</string>
			<string>msam10</string>
			<string>msbm10</string>
			<string>wasy10</string>
			<string>Eurostile LT Std</string>
		</test>
		<edit mode="assign" name="font_type" target="font">
			<string>NON TT Instructed Font</string>
		</edit>
	</match>

	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
			<string>Linux</string>
			<string>Fedora Linux</string>
		</test>
		<test name="font_type" target="font">
			<string>NON TT Instructed Font</string>
		</test>
		<edit mode="assign" name="autohint"  >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
	</match>

	<!-- For Windows 98 do "smooth edges" for these non-BCI fonts -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Windows 98</string>
		</test>
		<test name="font_type" target="font">
			<string>NON TT Instructed Font</string>
		</test>
		<edit mode="assign" name="rgba" >
			<const>none</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
	</match>

	<!-- For Windows 98 do "smooth edges" for Bold Fonts over 14 px -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Windows 98</string>
		</test>
		<test name="weight" compare="more">
			<const>medium</const>
		</test>
		<test compare="more_eq" name="pixelsize" qual="any" >
			<double>14</double>
		</test>
		<edit mode="assign" name="rgba" >
			<const>none</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
	</match>

	<!-- For Windows 98 do "smooth edges" for fonts above 17 px -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Windows 98</string>
		</test>
		<test compare="more_eq" name="pixelsize" qual="any" >
			<double>18</double>
		</test>
		<edit mode="assign" name="rgba" >
			<const>none</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
	</match>



	<!-- OVERRIDE ABOVE SETTINGS -->
	<!-- Monochrome BCI for these non-bold fonts (circa Windows 98) -->
	<!-- This should only be used by fonts that contain TrueType instructions -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>xxx-NOTHING-xxx</string>
		</test>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
	</match>

	<!-- OVERRIDE ABOVE SETTINGS -->
	<!-- Make these fonts use no antialiasing or hinting (circa DOS / X11) -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>ProFontWindows</string>
			<string>Terminus</string>
			<string>Terminus (ttf)</string>
		</test>
		<edit mode="assign" name="hintstyle" >
			<const>hintnone</const>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>false</bool>
		</edit>
		<!--<edit name="prefer_bitmap">
			<bool>true</bool>
		  </edit>-->
	</match>

	<!-- OVERRIDE ABOVE SETTINGS -->
	<!-- Full autohint -->
	<!-- Makes vertical/horizontal stems align to pixels, but is not true to the glyphs -->
	<!-- Some glyphs may look forced into place, however they are very sharp -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>xxx-NOTHING-xxx</string>
		</test>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
	</match>

	<!-- OVERRIDE ABOVE SETTINGS -->
	<!-- Light autohint on italics -->
	<!-- Use for anything that is full auto or TT hinted above -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>xxx-NOTHING-xxx</string>
		</test>
		<test target="pattern" compare="not_eq" name="slant" >
			<const>roman</const>
		</test>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
	</match>


	<!-- *************  FORCED ARTIFICIAL ITALIC / BOLD ******************  -->

	<!-- "Unforced" artificial/italic already included in /etc/fonts/conf.d/ rules -->

	<!-- Force artificial italic instead of the font's default italic -->
	<!-- In rare cases this is more visually appealing -->

	<!-- Set the flag -->
	<match target="pattern">
		<test target="font" compare="eq" name="family" qual="any" >
			<string>-------Courier</string>  <!-- Somehow this breaks QT -->
		</test>

		<!-- match requests for non-roman face -->
		<test name="slant" compare="not_eq" >
			<const>roman</const>
		</test>

		<!-- remember that this should be slanted -->
		<edit name="fake_slant">
			<bool>true</bool>
		</edit>

		<!--- change to match a roman face instead -->
		<edit name="slant">
			<const>roman</const>
		</edit>
	</match>

	<!-- Force flagged fonts to have artificial oblique -->
	<match target="font" >
		<!-- check to see if the font is roman -->
		<test name="slant" >
			<const>roman</const>
		</test>
		<!-- look for fonts which were marked for fake obliquing -->
		<test name="fake_slant">
			<bool>true</bool>
		</test>
		<!-- multiply the matrix to slant the font -->
		<edit mode="assign" name="matrix" >
			<times>
				<name>matrix</name>
				<matrix>
					<double>1.0</double>
					<double>0.2</double>
					<double>0</double>
					<double>1</double>
				</matrix>
			</times>
		</edit>
		<!-- pretend the font is oblique now -->
		<edit mode="assign" name="slant" >
			<const>oblique</const>
		</edit>
	</match>


	<!-- Force fake bold instead of the font's default bold -->
	<!-- In rare cases this is more visually appealing -->

	<!-- Set the flag -->
	<match target="pattern">
		<test target="font" compare="eq" name="family" qual="any" >
			<string>xxx-NOTHING-xxx</string>
		</test>

		<!-- match requests for bold face -->
		<test name="weight" compare="more">
			<const>medium</const>
		</test>

		<!-- remember that this should be bolded -->
		<edit name="fake_bold">
			<bool>true</bool>
		</edit>

		<!--- change to match a medium weight instead -->
		<edit name="weight">
			<const>medium</const>
		</edit>
	</match>

	<!-- Force flagged fonts to have artificial bold -->
	<match target="font" >
		<!-- look for fonts which were marked for fake bolding -->
		<test name="fake_bold">
			<bool>true</bool>
		</test>
		<!-- Set the embolden flag -->
		<edit name="embolden" mode="assign">
				<bool>true</bool>
		</edit>
		<!-- pretend the font is bold now -->
		<edit mode="assign" name="weight" >
			<const>bold</const>
		</edit>
	</match>



	<!-- Prevent BCI fonts in Win98 mode from getting artificial italic -->
	<match target="font">
		<test name="rendering_style" qual="any" >
			<string>Windows 98</string>
		</test>
		<test name="font_type" target="font">
			<string>TT Instructed Font</string>
		</test>
		<!-- check to see if the font is roman -->
		<test name="slant" >
			<const>roman</const>
		</test>
		<!-- match requests for non-roman face -->
		<test target="pattern" name="slant" compare="not_eq">
			<const>roman</const>
		</test>
		<!-- pretend the font is oblique now -->
		<edit mode="assign" name="slant" >
			<const>oblique</const>
		</edit>
	</match>

	<!-- Prevent BCI fonts in Win98 mode from getting artificial emboldened -->
	<match target="font">
		<test name="rendering_style" qual="any" >
			<string>Windows 98</string>
		</test>
		<test name="font_type" target="font">
			<string>TT Instructed Font</string>
		</test>
		<!-- check to see if the font is just regular -->
		<test name="weight" compare="less_eq">
			<const>medium</const>
		</test>
		<!-- check to see if the pattern requests bold -->
		<test target="pattern" name="weight" compare="more">
			<const>medium</const>
		</test>
		<!-- pretend it's bold now -->
		<edit name="weight" mode="assign">
			<const>bold</const>
		</edit>
	</match>


	<!-- ********************  FINAL SETTINGS **********************  -->

	<!-- Make verdana 9 and 10 appear like they do on Windows -->
	<!-- Does not work with Google Chrome, but does in Firefox -->
	<match target="font">
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
		</test>
		<test name="family" qual="any" >
			<string>Verdana</string>
		</test>
		<test compare="less" name="weight" >
			<const>bold</const>
		</test>
		<test compare="more_eq" name="pixelsize" qual="any" >
			<double>8.5</double>
		</test>
		<test compare="less" name="pixelsize" qual="any" >
				<double>10.5</double>
			</test>
		<edit name="matrix" mode="assign" >
			<times>
				<name>matrix</name>
				<matrix>
					<double>1.1</double>
					<double>0.0</double>
					<double>0.0</double>
					<double>1.0</double>
				</matrix>
			</times>
		</edit>
	</match>


	<!-- Make verdana 12 appear like it does on Windows -->
	<!-- Does not work with Google Chrome, but does in Firefox -->
	<match target="font">
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
		</test>
		<test name="family" qual="any" >
			<string>Verdana</string>
		</test>
		<test compare="less" name="weight" >
			<const>bold</const>
		</test>
		<test compare="more_eq" name="pixelsize" qual="any" >
			<double>11.5</double>
		</test>
		<test compare="less" name="pixelsize" qual="any" >
				<double>12.5</double>
			</test>
		<edit name="matrix" mode="assign" >
			<times>
				<name>matrix</name>
				<matrix>
					<double>1.05</double>
					<double>0.0</double>
					<double>0.0</double>
					<double>1.0</double>
				</matrix>
			</times>
		</edit>
	</match>

	<!-- All fonts should use slight hinting below 8.5 px -->
	<match target="font" >
		<test name="rendering_style" qual="any" >
			<string>Infinality</string>
			<string>Windows 7</string>
			<string>Windows XP</string>
		</test>
		<test compare="less" name="pixelsize" qual="any" >
			<double>8.5</double>
		</test>
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
	</match>

	<!-- All fonts should use full hinting above 22 px
	<match target="font" >
		<test compare="more_eq" name="pixelsize" qual="any" >
			<double>22.5</double>
		</test>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
	</match> -->


	<!-- These full hinted fonts should use slight hinting below 12 px -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>Arial Black</string>
		</test>
		<test compare="less" name="pixelsize" qual="any" >
			<double>11.5</double>
		</test>
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
	</match>

	<!-- These full hinted fonts should use slight hinting below 14 px -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>Aquabase</string>
			<string>Browallia New</string>
			<string>BrowalliaUPC</string>
		</test>
		<test compare="less" name="pixelsize" qual="any" >
			<double>13.5</double>
		</test>
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
	</match>
	
	<!-- These full hinted fonts should use slight hinting at 17 px -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>Gill Sans</string>
		</test>
		<test compare="less" name="pixelsize" qual="any" >
			<double>17.5</double>
		</test>
		<test compare="more_eq" name="pixelsize" qual="any" >
			<double>16.5</double>
		</test>		
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>		
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
	</match>

	<!-- Gentium has issues with the infinality autohint patch -->
	<match target="font" >
		<test name="font_type" qual="any" >
			<string>Gentium</string>
		</test>
		<test compare="less" name="pixelsize" qual="any" >
			<double>10.5</double>
		</test>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintnone</const>
		</edit>
	</match>

	<!-- Italic Courier looks bad with BCI hinting -->
	<match target="font" >
		<test name="family" qual="any" >
			<string>Courier</string>
		</test>
		<!-- match requests for non-roman face -->
		<test name="slant" compare="not_eq" >
			<const>roman</const>
		</test>
		<edit mode="assign" name="hintstyle" >
			<const>hintslight</const>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>true</bool>
		</edit>
	</match>


	<!--  Rescan configuration every 10 seconds when FcFontSetList is called -->
	<rescan>
		<int>10</int>
	</rescan>


	<!-- Global Override for Debugging -->
<!-- 
	<match target="font" >
		<edit mode="assign" name="rgba" >
			<const>rgb</const>
		</edit>
		<edit mode="assign" name="hinting" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="autohint" >
			<bool>false</bool>
		</edit>
		<edit mode="assign" name="antialias" >
			<bool>true</bool>
		</edit>
		<edit mode="assign" name="hintstyle" >
			<const>hintfull</const>
		</edit>
		<edit name="lcdfilter" mode="assign">
			<const>lcddefault</const>
		</edit>
	</match>
	-->

</fontconfig>
