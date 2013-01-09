Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92E96E00559
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jan 2013 19:44:38 -0800 (PST)
Received: by mail-la0-f50.google.com with SMTP id fs13so1276398lab.23
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Jan 2013 19:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XtUATZ/4HVQCOe7e83LRbeUILJCcKm7oQGKKGE1vymc=;
	b=v1csoL9J65xkvbZ9o5UaX8Dux0PSLYSKhc4DQ2FOA7RoyoR4lWMUc/pDPohh6kshy3
	5vxSuCBGJfWb7o93sl4vtTXNrj8bgq61YtyDTwE19SA5VUwhFboB92ovGJWKOPMOn/M8
	TbK2F8gOwyFB7IzCQyjulvkWeIxZoNcDSN67/cnvFMRJKaDh8BZowuEjZww6s1K11Ttg
	OzaRjaaOT2onAUbyXBlL8936qk94k3Nk6tqWLJwqOif2NrwCiSozbdjhXicpUJn4dNKs
	mBVqcSxpboUwJXN5z78AVz1Ca3TdufeutQ8dnc0V7hHhNNjN0u+hbe3vc7ukyTe5OlE8
	c7FA==
MIME-Version: 1.0
Received: by 10.112.39.129 with SMTP id p1mr27365108lbk.26.1357703077518; Tue,
	08 Jan 2013 19:44:37 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Tue, 8 Jan 2013 19:44:37 -0800 (PST)
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
	<CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
	<50EB1486.4080901@se-eng.com>
	<97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
Date: Tue, 8 Jan 2013 22:44:37 -0500
Message-ID: <CADkTA4NXx8pQQcvObPXQjST08BrQMWGZW-d-8kx4S3Mp7iUuOQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Prica, Mihai" <mihai.prica@intel.com>
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
X-List-Received-Date: Wed, 09 Jan 2013 03:44:39 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe2f76a55ed604d2d2e1ee

--e0cb4efe2f76a55ed604d2d2e1ee
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 8, 2013 at 1:45 PM, Prica, Mihai <mihai.prica@intel.com> wrote:

>  ** **
>
> I didn=92t know about the configuration fragments from the kernel tree. I=
=92ll
> redo the patch to use those. ****
>
> I see that the .cfg from the kernel tree enables kvm as modules. In this
> situation, I think I need to add an extra RRECOMMENDS with the necessary
> kernel-module-kvm to bring the necessary modules to the sysroot.  Where
> would be the best places to add this, considering there is no specific
> recipe for kvm? I tried to add them to the image recipe but it didn=92t
> worked.
>


You are presumably going to enable the in tree fragments by appending to
KERNEL_FEATURES
in the linux-yocto_3.4.bbappend. Which to me, seems like the right place to
also add the
RRECOMMENDS. Or had you tried this and it didn't work for some reason I'm
missing at the
moment (it's late here, and I've spent all day hunting autobuilder
breakage) :)

Cheers,

Bruce


> ****
>
> ** **
>
> Thanks,****
>
> Mihai****
>
> ** **
>
> *From:* meta-virtualization-bounces@yoctoproject.org [mailto:
> meta-virtualization-bounces@yoctoproject.org] *On Behalf Of *Raymond Dank=
s
> *Sent:* Monday, January 07, 2013 8:32 PM
> *To:* Bruce Ashfield
> *Cc:* meta-virtualization@yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH 1/2] linux-yocto: added
> kernel configuration for KVM****
>
> ** **
>
> On 01/07/2013 11:10 AM, Bruce Ashfield wrote:****
>
>  ** **
>
> ** **
>
> On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks <ray.danks@se-eng.com>
> wrote:****
>
> I'm going to show my lack of knowledge in this area, but I know this is
> going to come up when I push a xen.cfg that I apparently never added.
>
> Is it possible to do something along the lines of PACKAGE_CONFIG in the
> linux-yocto.bbappend?  For example, in the libvirt package one can use
> PACKAGE_CONFIG to construct a "minimal" build of libvirt.  What would be
> the method for one to do the same in this package?****
>
> ** **
>
> kernel configuration fragment use are controlled via the KERNEL_FEATURES
> variable, and****
>
> for anything pre-yocto 1.4 that means an in-tree kernel configuration
> fragment (I'm still pushing****
>
> for the fragments to be maintained in tree, since that allows them to be
> reused and maintained****
>
> more easily).****
>
> ** **
>
> KERNEL_FEATURES is managed like any other variable in the system,
> including updating****
>
> it via optional/dynamic features as we see fit.****
>
>
> Thanks Bruce.  Yes, KERNEL_FEATURES is what I was looking for, I believe.
> I'm seeing some references and examples for this now.
>
> Ray
>
>
> ****
>
> ** **
>
>
> Yes, I imagine that worst case there can be a SRC_URI_distro definition
> that includes only the .scc files required for that "minimal" image build=
,
> but it seems like we want to keep away from that as much as possible bein=
g
> that this isn't a distro layer.****
>
>  ** **
>
> Typically we do this via a base KERNEL_FEATURES specification in the
> relevant recipe(s), and****
>
> distros, or other configurations can override/extend it as required.****
>
> ** **
>
> Cheers,****
>
> ** **
>
> Buce****
>
>  ****
>
> Thanks,
> Ray ****
>
>
>
> On 01/07/2013 05:08 AM, Mihai Prica wrote:****
>
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
>   recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
>   recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
>   3 files changed, 9 insertions(+)
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg
>
> diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> new file mode 100644
> index 0000000..0b5f4fc
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable KVM host support"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware kvm.cfg
> diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg
> b/recipes-kernel/linux/linux-yocto/kvm.cfg
> new file mode 100644
> index 0000000..0cfcf58
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_KVM=3Dy
> +CONFIG_KVM_INTEL=3Dy
> +CONFIG_KVM_AMD=3Dy
> +CONFIG_TUN=3Dy
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..71bead2 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -4,5 +4,6 @@ SRC_URI +=3D "file://xt-checksum.scc \
>               file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://kvm-enable.scc \
>             "
>   ****
>
> ** **
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization****
>
>
>
> ****
>
> ** **
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end" ****
>
> ** **
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe2f76a55ed604d2d2e1ee
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 8, 2013 at 1:45 PM, Prica, Mihai <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@inte=
l.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">





<div bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">I didn=92t know about the=
 configuration fragments from the kernel tree. I=92ll redo the patch to use=
 those.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">I see that the .cfg from =
the kernel tree enables kvm as modules. In this situation, I think I need t=
o add an extra RRECOMMENDS with the necessary kernel-module-kvm
 to bring the necessary modules to the sysroot.=A0 Where would be the best =
places to add this, considering there is no specific recipe for kvm? I trie=
d to add them to the image recipe but it didn=92t worked.</span></p></div>
</div></blockquote><div><br></div><div><br></div><div style>You are presuma=
bly going to enable the in tree fragments by appending to KERNEL_FEATURES</=
div><div style>in the linux-yocto_3.4.bbappend. Which to me, seems like the=
 right place to also add the</div>
<div style>RRECOMMENDS. Or had you tried this and it didn&#39;t work for so=
me reason I&#39;m missing at the</div><div style>moment (it&#39;s late here=
, and I&#39;ve spent all day hunting autobuilder breakage) :)</div><div sty=
le>
<br></div><div style>Cheers,</div><div style><br></div><div style>Bruce</di=
v><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"white" lang=
=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Thanks,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Mihai<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">From:</span></b><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif=
&quot;;color:windowtext"> <a href=3D"mailto:meta-virtualization-bounces@yoc=
toproject.org" target=3D"_blank">meta-virtualization-bounces@yoctoproject.o=
rg</a> [mailto:<a href=3D"mailto:meta-virtualization-bounces@yoctoproject.o=
rg" target=3D"_blank">meta-virtualization-bounces@yoctoproject.org</a>]
<b>On Behalf Of </b>Raymond Danks<br>
<b>Sent:</b> Monday, January 07, 2013 8:32 PM<br>
<b>To:</b> Bruce Ashfield<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=
=3D"_blank">meta-virtualization@yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH 1/2] linux-yocto: added ke=
rnel configuration for KVM<u></u><u></u></span></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On 01/07/2013 11:10 AM, Bruce Ashfield wrote:<u></u>=
<u></u></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><u></u>=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks &lt;<=
a href=3D"mailto:ray.danks@se-eng.com" target=3D"_blank">ray.danks@se-eng.c=
om</a>&gt; wrote:<u></u><u></u></p>
<p class=3D"MsoNormal">I&#39;m going to show my lack of knowledge in this a=
rea, but I know this is going to come up when I push a xen.cfg that I appar=
ently never added.<br>
<br>
Is it possible to do something along the lines of PACKAGE_CONFIG in the lin=
ux-yocto.bbappend? =A0For example, in the libvirt package one can use PACKA=
GE_CONFIG to construct a &quot;minimal&quot; build of libvirt. =A0What woul=
d be the method for one to do the same in this
 package?<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">kernel configuration fragment use are controlled via=
 the KERNEL_FEATURES variable, and<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">for anything pre-yocto 1.4 that means an in-tree ker=
nel configuration fragment (I&#39;m still pushing<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">for the fragments to be maintained in tree, since th=
at allows them to be reused and maintained<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">more easily).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">KERNEL_FEATURES is managed like any other variable i=
n the system, including updating<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">it via optional/dynamic features as we see fit.<u></=
u><u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal"><br>
Thanks Bruce.=A0 Yes, KERNEL_FEATURES is what I was looking for, I believe.=
=A0 I&#39;m seeing some references and examples for this now.<br>
<br>
Ray<br>
<br>
<br>
<u></u><u></u></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
Yes, I imagine that worst case there can be a SRC_URI_distro definition tha=
t includes only the .scc files required for that &quot;minimal&quot; image =
build, but it seems like we want to keep away from that as much as possible=
 being that this isn&#39;t a distro layer.<u></u><u></u></p>

</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Typically we do this via a base KERNEL_FEATURES spec=
ification in the relevant recipe(s), and<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">distros, or other configurations can override/extend=
 it as required.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Cheers,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Buce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Thanks,<br>
Ray <u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><br>
<br>
On 01/07/2013 05:08 AM, Mihai Prica wrote:<u></u><u></u></p>
<p class=3D"MsoNormal">Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mih=
ai.prica@intel.com" target=3D"_blank">mihai.prica@intel.com</a>&gt;<br>
---<br>
=A0 recipes-kernel/linux/linux-yocto/kvm-enable.scc | =A0 =A04 ++++<br>
=A0 recipes-kernel/linux/linux-yocto/kvm.cfg =A0 =A0 =A0 =A0| =A0 =A04 ++++=
<br>
=A0 recipes-kernel/linux/linux-yocto_3.4.bbappend =A0 | =A0 =A01 +<br>
=A0 3 files changed, 9 insertions(+)<br>
=A0 create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
=A0 create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc b/recipes-kern=
el/linux/linux-yocto/kvm-enable.scc<br>
new file mode 100644<br>
index 0000000..0b5f4fc<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
@@ -0,0 +1,4 @@<br>
+define KFEATURE_DESCRIPTION &quot;Enable KVM host support&quot;<br>
+define KFEATURE_COMPATIBILITY board<br>
+<br>
+kconf non-hardware kvm.cfg<br>
diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg b/recipes-kernel/linu=
x/linux-yocto/kvm.cfg<br>
new file mode 100644<br>
index 0000000..0cfcf58<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/kvm.cfg<br>
@@ -0,0 +1,4 @@<br>
+CONFIG_KVM=3Dy<br>
+CONFIG_KVM_INTEL=3Dy<br>
+CONFIG_KVM_AMD=3Dy<br>
+CONFIG_TUN=3Dy<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index 5b163ff..71bead2 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -4,5 +4,6 @@ SRC_URI +=3D &quot;<a>file://xt-checksum.scc</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 <a>file://ebtables.scc</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 <a>file://vswitch.scc</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 <a>file://lxc.scc</a> \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0<a>file://kvm-enable.scc</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
=A0 <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
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
/a><u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<p class=3D"MsoNormal">-- <br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div></div></div>
</div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--e0cb4efe2f76a55ed604d2d2e1ee--
