Return-Path: <mihai.prica@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACA7AE002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:03:44 -0800 (PST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jan 2013 06:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,559,1355126400"; 
	d="scan'208,217";a="254199603"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 29 Jan 2013 06:03:37 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.60]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.20]) with mapi id
	14.01.0355.002; Tue, 29 Jan 2013 14:03:36 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH V3 1/2] linux-yocto: added kernel
	configuration for KVM
Thread-Index: AQHN/ieGetKiIwounEq7wcO82ZHh3ZhgVeLw
Date: Tue, 29 Jan 2013 14:03:36 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF916722@IRSMSX101.ger.corp.intel.com>
References: <1359464154-16618-1-git-send-email-mihai.prica@intel.com>
	<CADkTA4MVpWpujnuL4wXkHHyz2to9A7Fqg739UPNksYNF1B8XBg@mail.gmail.com>
In-Reply-To: <CADkTA4MVpWpujnuL4wXkHHyz2to9A7Fqg739UPNksYNF1B8XBg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V3 1/2] linux-yocto: added kernel configuration for KVM
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 14:03:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_97BD068FB200C44AA73C2B641F162ECF916722IRSMSX101gercorpi_"

--_000_97BD068FB200C44AA73C2B641F162ECF916722IRSMSX101gercorpi_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
Sent: Tuesday, January 29, 2013 3:50 PM
To: Prica, Mihai
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH V3 1/2] linux-yocto: added kernel=
 configuration for KVM

On Tue, Jan 29, 2013 at 7:55 AM, Mihai Prica <mihai.prica@intel.com<mailto:=
mihai.prica@intel.com>> wrote:
Signed-off-by: Mihai Prica <mihai.prica@intel.com<mailto:mihai.prica@intel.=
com>>
---
 recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend
index 5b163ff..bac7646 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -6,3 +6,8 @@ SRC_URI +=3D "file://xt-checksum.scc \
            file://lxc.scc \
            <file:///\\xt-checksum.scc%20\%0b=A0%20=A0%20=A0%20=A0%20=A0%20=
=A0%20file:\lxc.scc%20\%0b=A0%20=A0%20=A0%20=A0%20=A0%20=A0%20> "

+KERNEL_FEATURES_append =3D " features/kvm/qemu-kvm-enable"

I can always change (and test this on merge), but I think if you double che=
ck the
last email on this patch, we want this to be:

   KERNEL_FEATURES_append =3D " features/kvm/qemu-kvm-enable.scc"

No need for a v4, I can tweak it on the way in if you agree.

Yes, you're right. I don't know why I missed the scc, I copy-pasted the lin=
e from the v2 reply.
If you could change it that would be great.

Thanks,
Mihai


Cheers,

Bruce

+
+module_autoload_kvm =3D "kvm"
+module_autoload_kvm-amd =3D "kvm-amd"
+module_autoload_kvm-intel =3D "kvm-intel"
--
1.7.9.5

_______________________________________________
meta-virtualization mailing list
meta-virtualization@yoctoproject.org<mailto:meta-virtualization@yoctoprojec=
t.org>
https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"





--_000_97BD068FB200C44AA73C2B641F162ECF916722IRSMSX101gercorpi_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"ProgId" content=3D"Word.Document">
<meta name=3D"Generator" content=3D"Microsoft Word 14">
<meta name=3D"Originator" content=3D"Microsoft Word 14">
<link rel=3D"File-List" href=3D"cid:filelist.xml@01CDFE3A.315A1D40"><!--[if=
 gte mso 9]><xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
<o:DoNotRelyOnCSS/>
</o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:WordDocument>
<w:SpellingState>Clean</w:SpellingState>
<w:TrackMoves/>
<w:TrackFormatting/>
<w:EnvelopeVis/>
<w:ValidateAgainstSchemas/>
<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
<w:IgnoreMixedContent>false</w:IgnoreMixedContent>
<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
<w:DoNotPromoteQF/>
<w:LidThemeOther>EN-US</w:LidThemeOther>
<w:LidThemeAsian>X-NONE</w:LidThemeAsian>
<w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
<w:Compatibility>
<w:DoNotExpandShiftReturn/>
<w:BreakWrappedTables/>
<w:SplitPgBreakAndParaMark/>
<w:EnableOpenTypeKerning/>
</w:Compatibility>
<m:mathPr>
<m:mathFont m:val=3D"Cambria Math"/>
<m:brkBin m:val=3D"before"/>
<m:brkBinSub m:val=3D"&#45;-"/>
<m:smallFrac m:val=3D"off"/>
<m:dispDef/>
<m:lMargin m:val=3D"0"/>
<m:rMargin m:val=3D"0"/>
<m:defJc m:val=3D"centerGroup"/>
<m:wrapIndent m:val=3D"1440"/>
<m:intLim m:val=3D"subSup"/>
<m:naryLim m:val=3D"undOvr"/>
</m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"true" DefSemi=
Hidden=3D"true" DefQFormat=3D"false" DefPriority=3D"99" LatentStyleCount=3D=
"267">
<w:LsdException Locked=3D"false" Priority=3D"0" SemiHidden=3D"false" Unhide=
WhenUsed=3D"false" QFormat=3D"true" Name=3D"Normal"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"false" Unhide=
WhenUsed=3D"false" QFormat=3D"true" Name=3D"heading 1"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 2"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 3"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 4"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 5"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 6"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 7"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 8"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 9"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 1"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 2"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 3"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 4"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 5"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 6"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 7"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 8"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"toc 9"/>
<w:LsdException Locked=3D"false" Priority=3D"35" QFormat=3D"true" Name=3D"c=
aption"/>
<w:LsdException Locked=3D"false" Priority=3D"10" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Title"/>
<w:LsdException Locked=3D"false" Priority=3D"1" Name=3D"Default Paragraph F=
ont"/>
<w:LsdException Locked=3D"false" Priority=3D"11" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Subtitle"/>
<w:LsdException Locked=3D"false" Priority=3D"22" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Strong"/>
<w:LsdException Locked=3D"false" Priority=3D"20" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"59" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Table Grid"/>
<w:LsdException Locked=3D"false" UnhideWhenUsed=3D"false" Name=3D"Placehold=
er Text"/>
<w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"false" Unhide=
WhenUsed=3D"false" QFormat=3D"true" Name=3D"No Spacing"/>
<w:LsdException Locked=3D"false" Priority=3D"60" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"61" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light List"/>
<w:LsdException Locked=3D"false" Priority=3D"62" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"63" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 1"/>
<w:LsdException Locked=3D"false" Priority=3D"66" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Dark List"/>
<w:LsdException Locked=3D"false" Priority=3D"71" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"72" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful List"/>
<w:LsdException Locked=3D"false" Priority=3D"73" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"60" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Shading Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"61" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light List Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"62" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Grid Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"63" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 1 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 2 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"65" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 1 Accent 1"/>
<w:LsdException Locked=3D"false" UnhideWhenUsed=3D"false" Name=3D"Revision"=
/>
<w:LsdException Locked=3D"false" Priority=3D"34" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"List Paragraph"/>
<w:LsdException Locked=3D"false" Priority=3D"29" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"30" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Intense Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"66" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 2 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"67" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 1 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 2 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"69" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 3 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"70" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Dark List Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"71" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Shading Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"72" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful List Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"73" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Grid Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"60" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Shading Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"61" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light List Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"62" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Grid Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"63" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 1 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"64" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 2 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 1 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"66" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 2 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 1 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"68" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 2 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 3 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"70" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Dark List Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"71" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Shading Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"72" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful List Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"73" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Grid Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"60" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Shading Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"61" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light List Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"62" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Grid Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"63" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 1 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"64" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 2 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"65" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 1 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"66" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 2 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"67" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 1 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"68" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 2 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"69" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 3 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Dark List Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"71" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Shading Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"72" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful List Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"73" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Grid Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"60" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Shading Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"61" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light List Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"62" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Grid Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"63" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 1 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"64" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 2 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"65" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 1 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"66" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 2 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"67" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 1 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"68" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 2 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"69" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 3 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"70" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Dark List Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"71" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Shading Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"72" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful List Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"73" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Grid Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"60" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Shading Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"61" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light List Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"62" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Grid Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"63" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 1 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"64" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 2 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"65" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 1 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"66" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 2 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"67" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 1 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"68" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 2 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"69" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 3 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"70" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Dark List Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"71" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Shading Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"72" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful List Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"73" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Grid Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"60" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Shading Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"61" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light List Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"62" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Light Grid Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"63" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 1 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"64" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Shading 2 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"65" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 1 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"66" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium List 2 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"67" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 1 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"68" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 2 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"69" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Medium Grid 3 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"70" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Dark List Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"71" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Shading Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"72" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful List Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"73" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" Name=3D"Colorful Grid Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"19" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Subtle Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"21" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Intense Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"31" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Subtle Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"32" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Intense Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"33" SemiHidden=3D"false" Unhid=
eWhenUsed=3D"false" QFormat=3D"true" Name=3D"Book Title"/>
<w:LsdException Locked=3D"false" Priority=3D"37" Name=3D"Bibliography"/>
<w:LsdException Locked=3D"false" Priority=3D"39" QFormat=3D"true" Name=3D"T=
OC Heading"/>
</w:LatentStyles>
</xml><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520092929 1073786111 9 0 415 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520081665 -1073717157 41 0 66047 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:Calibri;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:purple;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	color:#1F497D;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 10]><style>/* Style Definitions */
table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
</style><![endif]--><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"tab-interval:.=
5in">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><b><font size=3D"2" face=3D"Tahoma"><span style=3D"f=
ont-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-f=
areast-font-family:&quot;Times New Roman&quot;;font-weight:bold">From:</spa=
n></font></b><font size=3D"2" face=3D"Tahoma"><span style=3D"font-size:10.0=
pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-f=
amily:&quot;Times New Roman&quot;">
 Bruce Ashfield [mailto:bruce.ashfield@gmail.com] <br>
<b><span style=3D"font-weight:bold">Sent:</span></b> Tuesday, January 29, 2=
013 3:50 PM<br>
<b><span style=3D"font-weight:bold">To:</span></b> Prica, Mihai<br>
<b><span style=3D"font-weight:bold">Cc:</span></b> meta-virtualization@yoct=
oproject.org<br>
<b><span style=3D"font-weight:bold">Subject:</span></b> Re: [meta-virtualiz=
ation] [PATCH V3 1/2]
<span class=3D"SpellE">linux-yocto</span>: added kernel configuration for K=
VM</span></font><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><font size=3D"3" face=
=3D"Times New Roman"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></sp=
an></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">On Tue, Jan 29, 2013 at 7:55 AM, Mihai Prica &lt;<a =
href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@intel.c=
om</a>&gt; wrote:<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mih=
ai.prica@intel.com">mihai.prica@intel.com</a>&gt;<br>
---<br>
&nbsp;recipes-kernel/<span class=3D"SpellE">linux</span>/linux-yocto_3.4.bb=
append | &nbsp; &nbsp;5 &#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 5 insertions(&#43;)<br>
<br>
diff --<span class=3D"SpellE">git</span> a/recipes-kernel/<span class=3D"Sp=
ellE">linux</span>/linux-yocto_3.4.bbappend b/recipes-kernel/<span class=3D=
"SpellE">linux</span>/linux-yocto_3.4.bbappend<br>
index 5b163ff..bac7646 100644<br>
--- a/recipes-kernel/<span class=3D"SpellE">linux</span>/linux-yocto_3.4.bb=
append<br>
&#43;&#43;&#43; b/recipes-kernel/<span class=3D"SpellE">linux</span>/linux-=
yocto_3.4.bbappend<br>
@@ -6,3 &#43;6,8 @@ SRC_URI &#43;=3D &quot;<a href=3D"file:///\\xt-checksum=
.scc%20\%0b&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20file:\lxc.=
scc%20\%0b&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20">file://xt=
-checksum.scc \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://lxc.scc \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </a>&quot;<br>
<br>
&#43;<span class=3D"SpellE">KERNEL_FEATURES_append</span> =3D &quot; featur=
es/<span class=3D"SpellE">kvm</span>/<span class=3D"SpellE">qemu</span>-<sp=
an class=3D"SpellE">kvm</span>-enable&quot;<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">I can always change (and test this on merge), but I =
think if you double check the<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">last email on this patch, we want this to be:&nbsp;<=
o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">&nbsp; &nbsp;<span class=3D"SpellE">KERNEL_FEATURES_=
append</span> =3D &quot; features/<span class=3D"SpellE">kvm</span>/<span c=
lass=3D"SpellE">qemu-kvm-enable.scc</span>&quot;<o:p></o:p></span></font></=
p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">No need for a v4, I can tweak it on the way in if yo=
u agree.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
>Yes, you&#8217;re right. I don&#8217;t know why I missed the
<span class=3D"SpellE">scc</span>, I copy-pasted the line from the v2 reply=
. <o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
>If you could change it that would be great.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
>Thanks,<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
>Mihai<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">Cheers,<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">Bruce<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;mso-border=
-left-alt:solid #CCCCCC .75pt;padding:0in 0in 0in 6.0pt;margin-left:4.8pt;m=
argin-right:0in">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">&#43;<br>
&#43;<span class=3D"SpellE">module_autoload_kvm</span> =3D &quot;<span clas=
s=3D"SpellE">kvm</span>&quot;<br>
&#43;<span class=3D"SpellE">module_autoload_kvm-amd</span> =3D &quot;<span =
class=3D"SpellE">kvm-amd</span>&quot;<br>
&#43;<span class=3D"SpellE">module_autoload_kvm-intel</span> =3D &quot;<spa=
n class=3D"SpellE">kvm-intel</span>&quot;<br>
<font color=3D"#888888"><span style=3D"color:#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a></span></font><o:p></o:p></span></font></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><br>
<br clear=3D"all" style=3D"mso-special-character:line-break">
<o:p></o:p></span></font></p>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
</div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">--
<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_97BD068FB200C44AA73C2B641F162ECF916722IRSMSX101gercorpi_--
