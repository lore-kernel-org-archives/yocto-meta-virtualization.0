Return-Path: <mihai.prica@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D3B6E0072F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jan 2013 10:45:50 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2013 10:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,433,1355126400"; 
	d="scan'208,217";a="269411460"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2013 10:45:48 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.13]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.95]) with mapi id
	14.01.0355.002; Tue, 8 Jan 2013 18:45:47 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: "ray.danks@se-eng.com" <ray.danks@se-eng.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 1/2] linux-yocto: added kernel
	configuration for KVM
Thread-Index: AQHN7PwdxYoU4hWQk0CNkHerymk/2pg+KqKAgAAF1gCAAZQGMA==
Date: Tue, 8 Jan 2013 18:45:46 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
	<CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
	<50EB1486.4080901@se-eng.com>
In-Reply-To: <50EB1486.4080901@se-eng.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 08 Jan 2013 18:45:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_97BD068FB200C44AA73C2B641F162ECF8FB2DCIRSMSX101gercorpi_"

--_000_97BD068FB200C44AA73C2B641F162ECF8FB2DCIRSMSX101gercorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


I didn't know about the configuration fragments from the kernel tree. I'll =
redo the patch to use those.
I see that the .cfg from the kernel tree enables kvm as modules. In this si=
tuation, I think I need to add an extra RRECOMMENDS with the necessary kern=
el-module-kvm to bring the necessary modules to the sysroot.  Where would b=
e the best places to add this, considering there is no specific recipe for =
kvm? I tried to add them to the image recipe but it didn't worked.

Thanks,
Mihai

From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-virtualizat=
ion-bounces@yoctoproject.org] On Behalf Of Raymond Danks
Sent: Monday, January 07, 2013 8:32 PM
To: Bruce Ashfield
Cc: meta-virtualization@yoctoproject.org
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
@@ -4,5 +4,6 @@ SRC_URI +=3D "file://xt-checksum.scc<file:///\\xt-checksum.=
scc> \
              file://ebtables.scc<file:///\\ebtables.scc> \
            file://vswitch.scc<file:///\\vswitch.scc> \
            file://lxc.scc<file:///\\lxc.scc> \
+            file://kvm-enable.scc<file:///\\kvm-enable.scc> \
            "


_______________________________________________
meta-virtualization mailing list
meta-virtualization@yoctoproject.org<mailto:meta-virtualization@yoctoprojec=
t.org>
https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"


--_000_97BD068FB200C44AA73C2B641F162ECF8FB2DCIRSMSX101gercorpi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I didn&#8217;t know about=
 the configuration fragments from the kernel tree. I&#8217;ll redo the patc=
h to use those.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I see that the .cfg from =
the kernel tree enables kvm as modules. In this situation, I think I need t=
o add an extra RRECOMMENDS with the necessary kernel-module-kvm
 to bring the necessary modules to the sysroot.&nbsp; Where would be the be=
st places to add this, considering there is no specific recipe for kvm? I t=
ried to add them to the image recipe but it didn&#8217;t worked.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Thanks,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Mihai<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">From:</span></b><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif=
&quot;;color:windowtext"> meta-virtualization-bounces@yoctoproject.org [mai=
lto:meta-virtualization-bounces@yoctoproject.org]
<b>On Behalf Of </b>Raymond Danks<br>
<b>Sent:</b> Monday, January 07, 2013 8:32 PM<br>
<b>To:</b> Bruce Ashfield<br>
<b>Cc:</b> meta-virtualization@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH 1/2] linux-yocto: added ke=
rnel configuration for KVM<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 01/07/2013 11:10 AM, Bruce Ashfield wrote:<o:p></=
o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks &lt;<=
a href=3D"mailto:ray.danks@se-eng.com" target=3D"_blank">ray.danks@se-eng.c=
om</a>&gt; wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">I'm going to show my lack of knowledge in this area,=
 but I know this is going to come up when I push a xen.cfg that I apparentl=
y never added.<br>
<br>
Is it possible to do something along the lines of PACKAGE_CONFIG in the lin=
ux-yocto.bbappend? &nbsp;For example, in the libvirt package one can use PA=
CKAGE_CONFIG to construct a &quot;minimal&quot; build of libvirt. &nbsp;Wha=
t would be the method for one to do the same in this
 package?<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">kernel configuration fragment use are controlled via=
 the KERNEL_FEATURES variable, and<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">for anything pre-yocto 1.4 that means an in-tree ker=
nel configuration fragment (I'm still pushing<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">for the fragments to be maintained in tree, since th=
at allows them to be reused and maintained<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">more easily).<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">KERNEL_FEATURES is managed like any other variable i=
n the system, including updating<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">it via optional/dynamic features as we see fit.<o:p>=
</o:p></p>
</div>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal"><br>
Thanks Bruce.&nbsp; Yes, KERNEL_FEATURES is what I was looking for, I belie=
ve.&nbsp; I'm seeing some references and examples for this now.<br>
<br>
Ray<br>
<br>
<br>
<o:p></o:p></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
Yes, I imagine that worst case there can be a SRC_URI_distro definition tha=
t includes only the .scc files required for that &quot;minimal&quot; image =
build, but it seems like we want to keep away from that as much as possible=
 being that this isn't a distro layer.<o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Typically we do this via a base KERNEL_FEATURES spec=
ification in the relevant recipe(s), and<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">distros, or other configurations can override/extend=
 it as required.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Buce<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Thanks,<br>
Ray <o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><br>
<br>
On 01/07/2013 05:08 AM, Mihai Prica wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mih=
ai.prica@intel.com" target=3D"_blank">mihai.prica@intel.com</a>&gt;<br>
---<br>
&nbsp; recipes-kernel/linux/linux-yocto/kvm-enable.scc | &nbsp; &nbsp;4 &#4=
3;&#43;&#43;&#43;<br>
&nbsp; recipes-kernel/linux/linux-yocto/kvm.cfg &nbsp; &nbsp; &nbsp; &nbsp;=
| &nbsp; &nbsp;4 &#43;&#43;&#43;&#43;<br>
&nbsp; recipes-kernel/linux/linux-yocto_3.4.bbappend &nbsp; | &nbsp; &nbsp;=
1 &#43;<br>
&nbsp; 3 files changed, 9 insertions(&#43;)<br>
&nbsp; create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc<b=
r>
&nbsp; create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc b/recipes-kern=
el/linux/linux-yocto/kvm-enable.scc<br>
new file mode 100644<br>
index 0000000..0b5f4fc<br>
--- /dev/null<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
@@ -0,0 &#43;1,4 @@<br>
&#43;define KFEATURE_DESCRIPTION &quot;Enable KVM host support&quot;<br>
&#43;define KFEATURE_COMPATIBILITY board<br>
&#43;<br>
&#43;kconf non-hardware kvm.cfg<br>
diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg b/recipes-kernel/linu=
x/linux-yocto/kvm.cfg<br>
new file mode 100644<br>
index 0000000..0cfcf58<br>
--- /dev/null<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-yocto/kvm.cfg<br>
@@ -0,0 &#43;1,4 @@<br>
&#43;CONFIG_KVM=3Dy<br>
&#43;CONFIG_KVM_INTEL=3Dy<br>
&#43;CONFIG_KVM_AMD=3Dy<br>
&#43;CONFIG_TUN=3Dy<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index 5b163ff..71bead2 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -4,5 &#43;4,6 @@ SRC_URI &#43;=3D &quot;<a href=3D"file:///\\xt-checksum=
.scc">file://xt-checksum.scc</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"file:///\\ebtab=
les.scc">file://ebtables.scc</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"file:///\\vswitch.scc"=
>file://vswitch.scc</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"file:///\\lxc.scc">fil=
e://lxc.scc</a> \<br>
&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"file:///\\kvm-ena=
ble.scc">file://kvm-enable.scc</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><o:p></o:p></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">-- <br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_97BD068FB200C44AA73C2B641F162ECF8FB2DCIRSMSX101gercorpi_--
