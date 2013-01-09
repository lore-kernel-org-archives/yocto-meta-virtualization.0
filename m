Return-Path: <mihai.prica@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88EA0E0047F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Jan 2013 11:43:47 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jan 2013 11:43:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,439,1355126400"; 
	d="scan'208,217";a="270160147"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 09 Jan 2013 11:43:45 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.13]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.74]) with mapi id
	14.01.0355.002; Wed, 9 Jan 2013 19:43:43 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 1/2] linux-yocto: added kernel
	configuration for KVM
Thread-Index: AQHN7PwdxYoU4hWQk0CNkHerymk/2pg+KqKAgAAF1gCAAZQGMIAAmNSAgAEKI0A=
Date: Wed, 9 Jan 2013 19:43:43 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF8FB671@IRSMSX101.ger.corp.intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
	<CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
	<50EB1486.4080901@se-eng.com>
	<97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
	<CADkTA4NXx8pQQcvObPXQjST08BrQMWGZW-d-8kx4S3Mp7iUuOQ@mail.gmail.com>
In-Reply-To: <CADkTA4NXx8pQQcvObPXQjST08BrQMWGZW-d-8kx4S3Mp7iUuOQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Jan 2013 21:05:02 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Wed, 09 Jan 2013 19:43:47 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_97BD068FB200C44AA73C2B641F162ECF8FB671IRSMSX101gercorpi_"

--_000_97BD068FB200C44AA73C2B641F162ECF8FB671IRSMSX101gercorpi_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 8, 2013 at 1:45 PM, Prica, Mihai <mihai.prica@intel.com<mailto:=
mihai.prica@intel.com>> wrote:

I didn't know about the configuration fragments from the kernel tree. I'll =
redo the patch to use those.
I see that the .cfg from the kernel tree enables kvm as modules. In this si=
tuation, I think I need to add an extra RRECOMMENDS with the necessary kern=
el-module-kvm to bring the necessary modules to the sysroot.  Where would b=
e the best places to add this, considering there is no specific recipe for =
kvm? I tried to add them to the image recipe but it didn't worked.


You are presumably going to enable the in tree fragments by appending to KE=
RNEL_FEATURES
in the linux-yocto_3.4.bbappend. Which to me, seems like the right place to=
 also add the
RRECOMMENDS. Or had you tried this and it didn't work for some reason I'm m=
issing at the
moment (it's late here, and I've spent all day hunting autobuilder breakage=
) :)

It doesn't work in the kernel recipe. I've talked with Richard and he said =
PACKAGE_INSTALL_ATTEMPTONLY can
be used for this in the image recipe. He said he will add a new IMAGE_INSTA=
LL_RECOMMEND option for this.

There is however one more thing. Which is the best way to configure the mod=
ules to be loaded at boot-time? I
saw some discussion on the mailing list about update-modules becoming obsol=
ete.

Thanks,
Mihai

Cheers,

Bruce


Thanks,
Mihai

From: meta-virtualization-bounces@yoctoproject.org<mailto:meta-virtualizati=
on-bounces@yoctoproject.org> [mailto:meta-virtualization-bounces@yoctoproje=
ct.org<mailto:meta-virtualization-bounces@yoctoproject.org>] On Behalf Of R=
aymond Danks
Sent: Monday, January 07, 2013 8:32 PM
To: Bruce Ashfield
Cc: meta-virtualization@yoctoproject.org<mailto:meta-virtualization@yoctopr=
oject.org>
Subject: Re: [meta-virtualization] [PATCH 1/2] linux-yocto: added kernel co=
nfiguration for KVM

On 01/07/2013 11:10 AM, Bruce Ashfield wrote:


On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks <ray.danks@se-eng.com<mailto=
:ray.danks@se-eng.com>> wrote:
I'm going to show my lack of knowledge in this area, but I know this is goi=
ng to come up when I push a xen.cfg that I apparently never added.

Is it possible to do something along the lines of PACKAGE_CONFIG in the lin=
ux-yocto.bbappend?  For example, in the libvirt package one can use PACKAGE=
_CONFIG to construct a "minimal" build of libvirt.  What would be the metho=
d for one to do the same in this package?

kernel configuration fragment use are controlled via the KERNEL_FEATURES va=
riable, and
for anything pre-yocto 1.4 that means an in-tree kernel configuration fragm=
ent (I'm still pushing
for the fragments to be maintained in tree, since that allows them to be re=
used and maintained
more easily).

KERNEL_FEATURES is managed like any other variable in the system, including=
 updating
it via optional/dynamic features as we see fit.

Thanks Bruce.  Yes, KERNEL_FEATURES is what I was looking for, I believe.  =
I'm seeing some references and examples for this now.

Ray



Yes, I imagine that worst case there can be a SRC_URI_distro definition tha=
t includes only the .scc files required for that "minimal" image build, but=
 it seems like we want to keep away from that as much as possible being tha=
t this isn't a distro layer.

Typically we do this via a base KERNEL_FEATURES specification in the releva=
nt recipe(s), and
distros, or other configurations can override/extend it as required.

Cheers,

Buce

Thanks,
Ray


On 01/07/2013 05:08 AM, Mihai Prica wrote:
Signed-off-by: Mihai Prica <mihai.prica@intel.com<mailto:mihai.prica@intel.=
com>>
---
  recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
  recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
  recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
  3 files changed, 9 insertions(+)
  create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
  create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg

diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc b/recipes-kern=
el/linux/linux-yocto/kvm-enable.scc
new file mode 100644
index 0000000..0b5f4fc
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable KVM host support"
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware kvm.cfg
diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg b/recipes-kernel/linu=
x/linux-yocto/kvm.cfg
new file mode 100644
index 0000000..0cfcf58
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/kvm.cfg
@@ -0,0 +1,4 @@
+CONFIG_KVM=3Dy
+CONFIG_KVM_INTEL=3Dy
+CONFIG_KVM_AMD=3Dy
+CONFIG_TUN=3Dy
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend
index 5b163ff..71bead2 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -4,5 +4,6 @@ SRC_URI +=3D "file://xt-checksum.scc \
              file://ebtables.scc \
            file://vswitch.scc \
            file://lxc.scc \
+            file://kvm-enable.scc \
            <file:///\\xt-checksum.scc%20\%0b=A0%20=A0%20=A0%20=A0%20=A0%20=
=A0%20=A0%20file:\ebtables.scc%20\%0b=A0%20=A0%20=A0%20=A0%20=A0%20=A0%20fi=
le:\vswitch.scc%20\%0b=A0%20=A0%20=A0%20=A0%20=A0%20=A0%20file:\lxc.scc%20\=
%0b+%20=A0%20=A0%20=A0%20=A0%20=A0%20=A0file:\kvm-enable.scc%20\%0b=A0%20=
=A0%20=A0%20=A0%20=A0%20=A0%20> "


_______________________________________________
meta-virtualization mailing list
meta-virtualization@yoctoproject.org<mailto:meta-virtualization@yoctoprojec=
t.org>
https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"




--
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"

--_000_97BD068FB200C44AA73C2B641F162ECF8FB671IRSMSX101gercorpi_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"ProgId" content=3D"Word.Document">
<meta name=3D"Generator" content=3D"Microsoft Word 14">
<meta name=3D"Originator" content=3D"Microsoft Word 14">
<link rel=3D"File-List" href=3D"cid:filelist.xml@01CDEEB2.64F61290"><!--[if=
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-font-family:Calibri;}
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
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Balloon Text";
	mso-ansi-font-size:8.0pt;
	mso-bidi-font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-ascii-font-family:Tahoma;
	mso-hansi-font-family:Tahoma;
	mso-bidi-font-family:Tahoma;}
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
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">On Tue, Jan 8, 2013 at 1:=
45 PM, Prica, Mihai &lt;<a href=3D"mailto:mihai.prica@intel.com" target=3D"=
_blank">mihai.prica@intel.com</a>&gt; wrote:<o:p></o:p></span></font></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"2" color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F49=
7D">&nbsp;</span></font><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"2" color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F49=
7D">I didn&#8217;t know about the configuration fragments from the kernel t=
ree. I&#8217;ll redo the patch to use those.
</span></font><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"2" color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F49=
7D">I see that the .<span class=3D"SpellE">cfg</span> from the kernel tree =
enables
<span class=3D"SpellE">kvm</span> as modules. In this situation, I think I =
need to add an extra RRECOMMENDS with the necessary kernel-module-<span cla=
ss=3D"SpellE">kvm</span> to bring the necessary modules to the
<span class=3D"SpellE">sysroot</span>.&nbsp; Where would be the best places=
 to add this, considering there is no specific recipe for
<span class=3D"SpellE">kvm</span>? I tried to add them to the image recipe =
but it didn&#8217;t worked.</span></font><o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span><=
/font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span><=
/font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">You are presumably going =
to enable the in tree fragments by appending to KERNEL_FEATURES<o:p></o:p><=
/span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">in the linux-yocto_3.4.bb=
append. Which to me, seems like the right place to also add the<o:p></o:p><=
/span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">RRECOMMENDS. Or had you t=
ried this and it didn't work for some reason I'm missing at the<o:p></o:p><=
/span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">moment (it's late here, a=
nd I've spent all day hunting
<span class=3D"SpellE">autobuilder</span> breakage) :)<o:p></o:p></span></f=
ont></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"#1f497d" face=3D"Calibri">=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#1F497D"=
><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;">It doesn&#8217;t work in the ke=
rnel recipe. I&#8217;ve talked with Richard and he said PACKAGE_INSTALL_ATT=
EMPTONLY
 can <o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;">be used for this in the image r=
ecipe. He said he will add a new IMAGE_INSTALL_RECOMMEND option for this.
<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;"><o:p>&nbsp;</o:p></span></font>=
</p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;">There is however one more thing=
. Which is the best way to configure the modules to be loaded at boot-time?
 I<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;">saw some discussion on the mail=
ing list about update-modules becoming obsolete.<o:p></o:p></span></font></=
p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;"><o:p>&nbsp;</o:p></span></font>=
</p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;">Thanks,<o:p></o:p></span></font=
></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bi=
di-font-family:&quot;Times New Roman&quot;">Mihai<o:p></o:p></span></font><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span><=
/font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">Cheers,<o:p></o:p></span>=
</font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span><=
/font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">Bruce<o:p></o:p></span></=
font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">&nbsp;<o:p></o:p></span><=
/font></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;mso-border=
-left-alt:solid #CCCCCC .75pt;padding:0in 0in 0in 6.0pt;margin-left:4.8pt;m=
argin-right:0in">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"2" color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F49=
7D">&nbsp;</span></font><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"2" color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F49=
7D">Thanks,</span></font><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"2" color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F49=
7D">Mihai</span></font><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"2" color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F49=
7D">&nbsp;</span></font><o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in;mso-outline-level:1">
<b><font size=3D"2" face=3D"Tahoma"><span style=3D"font-size:10.0pt;font-fa=
mily:&quot;Tahoma&quot;,&quot;sans-serif&quot;;font-weight:bold">From:</spa=
n></font></b><font size=3D"2" face=3D"Tahoma"><span style=3D"font-size:10.0=
pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-virtualization-bounces@yoctoproject.org" target=3D"_=
blank">meta-virtualization-bounces@yoctoproject.org</a> [mailto:<a href=3D"=
mailto:meta-virtualization-bounces@yoctoproject.org" target=3D"_blank">meta=
-virtualization-bounces@yoctoproject.org</a>]
<b><span style=3D"font-weight:bold">On Behalf Of </span></b>Raymond <span c=
lass=3D"SpellE">
Danks</span><br>
<b><span style=3D"font-weight:bold">Sent:</span></b> Monday, January 07, 20=
13 8:32 PM<br>
<b><span style=3D"font-weight:bold">To:</span></b> Bruce Ashfield<br>
<b><span style=3D"font-weight:bold">Cc:</span></b> <a href=3D"mailto:meta-v=
irtualization@yoctoproject.org" target=3D"_blank">
meta-virtualization@yoctoproject.org</a><br>
<b><span style=3D"font-weight:bold">Subject:</span></b> Re: [meta-virtualiz=
ation] [PATCH 1/2]
<span class=3D"SpellE">linux-yocto</span>: added kernel configuration for K=
VM</span></font><o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
On 01/07/2013 11:10 AM, Bruce Ashfield wrote:<o:p></o:p></span></font></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;margin-bottom:12.0p=
t;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
On Mon, Jan 7, 2013 at 12:26 PM, Raymond
<span class=3D"SpellE">Danks</span> &lt;<a href=3D"mailto:ray.danks@se-eng.=
com" target=3D"_blank">ray.danks@se-eng.com</a>&gt; wrote:<o:p></o:p></span=
></font></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
I'm going to show my lack of knowledge in this area, but I know this is goi=
ng to come up when I push a
<span class=3D"SpellE">xen.cfg</span> that I apparently never added.<br>
<br>
Is it possible to do something along the lines of PACKAGE_CONFIG in the <sp=
an class=3D"SpellE">
linux-yocto.bbappend</span>? &nbsp;For example, in the <span class=3D"Spell=
E">libvirt</span> package one can use PACKAGE_CONFIG to construct a &quot;m=
inimal&quot; build of
<span class=3D"SpellE">libvirt</span>. &nbsp;What would be the method for o=
ne to do the same in this package?<o:p></o:p></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
kernel configuration fragment use are controlled via the KERNEL_FEATURES va=
riable, and<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
for anything pre-<span class=3D"SpellE">yocto</span> 1.4 that means an in-t=
ree kernel configuration fragment (I'm still pushing<o:p></o:p></span></fon=
t></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
for the fragments to be maintained in tree, since that allows them to be re=
used and maintained<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
more easily).<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
KERNEL_FEATURES is managed like any other variable in the system, including=
 updating<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
it via optional/dynamic features as we see fit.<o:p></o:p></span></font></p=
>
</div>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;margin-bottom:12.0p=
t;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
<br>
Thanks Bruce.&nbsp; Yes, KERNEL_FEATURES is what I was looking for, I belie=
ve.&nbsp; I'm seeing some references and examples for this now.<br>
<br>
Ray<br style=3D"mso-special-character:line-break">
<![if !supportLineBreakNewLine]><br style=3D"mso-special-character:line-bre=
ak">
<![endif]><o:p></o:p></span></font></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;margin-bottom:12.0p=
t;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
<br>
Yes, I imagine that worst case there can be a <span class=3D"SpellE">SRC_UR=
I_distro</span> definition that includes only the .<span class=3D"SpellE">s=
cc</span> files required for that &quot;minimal&quot; image build, but it s=
eems like we want to keep away from that as much
 as possible being that this isn't a <span class=3D"SpellE">distro</span> l=
ayer.<o:p></o:p></span></font></p>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
Typically we do this via a base KERNEL_FEATURES specification in the releva=
nt recipe(s), and<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<span class=3D"SpellE"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">distros</span></font></span>, or other configuration=
s can override/extend it as required.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
Cheers,<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<span class=3D"SpellE"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">Buce</span></font></span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
Thanks,<br>
Ray <o:p></o:p></span></font></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
<br>
<br>
On 01/07/2013 05:08 AM, Mihai Prica wrote:<o:p></o:p></span></font></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.prica@intel.com" tar=
get=3D"_blank">mihai.prica@intel.com</a>&gt;<br>
---<br>
&nbsp; recipes-kernel/<span class=3D"SpellE">linux</span>/<span class=3D"Sp=
ellE">linux-yocto</span>/<span class=3D"SpellE">kvm-enable.scc</span> | &nb=
sp; &nbsp;4 &#43;&#43;&#43;&#43;<br>
&nbsp; recipes-kernel/<span class=3D"SpellE">linux</span>/<span class=3D"Sp=
ellE">linux-yocto</span>/<span class=3D"SpellE">kvm.cfg</span> &nbsp; &nbsp=
; &nbsp; &nbsp;| &nbsp; &nbsp;4 &#43;&#43;&#43;&#43;<br>
&nbsp; recipes-kernel/<span class=3D"SpellE">linux</span>/linux-yocto_3.4.b=
bappend &nbsp; | &nbsp; &nbsp;1 &#43;<br>
&nbsp; 3 files changed, 9 insertions(&#43;)<br>
&nbsp; create mode 100644 recipes-kernel/<span class=3D"SpellE">linux</span=
>/<span class=3D"SpellE">linux-yocto</span>/<span class=3D"SpellE">kvm-enab=
le.scc</span><br>
&nbsp; create mode 100644 recipes-kernel/<span class=3D"SpellE">linux</span=
>/<span class=3D"SpellE">linux-yocto</span>/<span class=3D"SpellE">kvm.cfg<=
/span><br>
<br>
diff --<span class=3D"SpellE">git</span> a/recipes-kernel/<span class=3D"Sp=
ellE">linux</span>/<span class=3D"SpellE">linux-yocto</span>/<span class=3D=
"SpellE">kvm-enable.scc</span> b/recipes-kernel/<span class=3D"SpellE">linu=
x</span>/<span class=3D"SpellE">linux-yocto</span>/<span class=3D"SpellE">k=
vm-enable.scc</span><br>
new file mode 100644<br>
index 0000000..0b5f4fc<br>
--- /<span class=3D"SpellE">dev</span>/null<br>
&#43;&#43;&#43; b/recipes-kernel/<span class=3D"SpellE">linux</span>/<span =
class=3D"SpellE">linux-yocto</span>/<span class=3D"SpellE">kvm-enable.scc</=
span><br>
@@ -0,0 &#43;1,4 @@<br>
&#43;define KFEATURE_DESCRIPTION &quot;Enable KVM host support&quot;<br>
&#43;define KFEATURE_COMPATIBILITY board<br>
&#43;<br>
&#43;<span class=3D"SpellE">kconf</span> non-hardware <span class=3D"SpellE=
">kvm.cfg</span><br>
diff --<span class=3D"SpellE">git</span> a/recipes-kernel/<span class=3D"Sp=
ellE">linux</span>/<span class=3D"SpellE">linux-yocto</span>/<span class=3D=
"SpellE">kvm.cfg</span> b/recipes-kernel/<span class=3D"SpellE">linux</span=
>/<span class=3D"SpellE">linux-yocto</span>/<span class=3D"SpellE">kvm.cfg<=
/span><br>
new file mode 100644<br>
index 0000000..0cfcf58<br>
--- /<span class=3D"SpellE">dev</span>/null<br>
&#43;&#43;&#43; b/recipes-kernel/<span class=3D"SpellE">linux</span>/<span =
class=3D"SpellE">linux-yocto</span>/<span class=3D"SpellE">kvm.cfg</span><b=
r>
@@ -0,0 &#43;1,4 @@<br>
&#43;CONFIG_KVM=3Dy<br>
&#43;CONFIG_KVM_INTEL=3Dy<br>
&#43;CONFIG_KVM_AMD=3Dy<br>
&#43;CONFIG_TUN=3Dy<br>
diff --<span class=3D"SpellE">git</span> a/recipes-kernel/<span class=3D"Sp=
ellE">linux</span>/linux-yocto_3.4.bbappend b/recipes-kernel/<span class=3D=
"SpellE">linux</span>/linux-yocto_3.4.bbappend<br>
index 5b163ff..71bead2 100644<br>
--- a/recipes-kernel/<span class=3D"SpellE">linux</span>/linux-yocto_3.4.bb=
append<br>
&#43;&#43;&#43; b/recipes-kernel/<span class=3D"SpellE">linux</span>/linux-=
yocto_3.4.bbappend<br>
@@ -4,5 &#43;4,6 @@ SRC_URI &#43;=3D &quot;<a href=3D"file:///\\xt-checksum=
.scc%20\%0b&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20f=
ile:\ebtables.scc%20\%0b&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;=
%20file:\vswitch.scc%20\%0b&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nb=
sp;%20file:\lxc.scc%20\%0b&#43;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp=
;%20&nbsp;file:\kvm-enable.scc%20\%0b&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&n=
bsp;%20&nbsp;%20">file://xt-checksum.scc
 \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://ebtables.scc \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://vswitch.scc \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://lxc.scc \<br>
&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://kvm-enable.scc \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </a>&quot;<br>
&nbsp; <o:p></o:p></span></font></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><o:p></o:p></span></font></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
<br>
<br clear=3D"all" style=3D"mso-special-character:line-break">
<o:p></o:p></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
-- <br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
<o:p></o:p></span></font></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">=
&nbsp;<o:p></o:p></span></font></p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt"><br>
<br clear=3D"all" style=3D"mso-special-character:line-break">
<o:p></o:p></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span><=
/font></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><font size=3D"3" face=3D"=
Times New Roman"><span style=3D"font-size:12.0pt">--
<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
<o:p></o:p></span></font></p>
</div>
</div>
</div>
</body>
</html>

--_000_97BD068FB200C44AA73C2B641F162ECF8FB671IRSMSX101gercorpi_--
