Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEB86E004AB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2013 08:06:59 -0800 (PST)
Received: by mail-lb0-f174.google.com with SMTP id l12so997679lbo.33
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2013 08:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=5a7Z+vVOjnrTu9LL9rqV6f223NOQNwKXCsZ/20dh1pw=;
	b=YHfjK7/xHx4K7JcpyLsHL30jhllRj9tDQnsPStH/VG+ULpgt07Zt+CeAhrFrxyXuPC
	qmegdEhZmSFx8Kxl5XjgZ2A4XefrwhB+WxU+gkkW83qgiHPThTiR7EgNmzxM6Z874jB7
	71DKSChSwruRZk6arIklWMLLWr52sJQo8vFkVKt5edc0RGLmE9FrW8fIOLu5Rti3rZfq
	Ei9fqkQXXs1L9jZJODi/q8yehYCRQuw3PZMf4ZMKwDiHc2HevYRwcPjFa8bKtqPUTW6g
	C05U4xOKqaPwy5SBWvlOqmTYT9N+Q/JNWfyZOLnpfqqLksH+DdGH8IwRGDD51GN0V9Tl
	oGFw==
MIME-Version: 1.0
X-Received: by 10.112.17.3 with SMTP id k3mr2434202lbd.42.1359130018233; Fri,
	25 Jan 2013 08:06:58 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Fri, 25 Jan 2013 08:06:58 -0800 (PST)
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF914A2E@IRSMSX101.ger.corp.intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<1357921647-17864-2-git-send-email-mihai.prica@intel.com>
	<50F04908.2020103@windriver.com>
	<97BD068FB200C44AA73C2B641F162ECF8FC42C@IRSMSX101.ger.corp.intel.com>
	<50F61E35.9000204@windriver.com>
	<97BD068FB200C44AA73C2B641F162ECF905906@IRSMSX101.ger.corp.intel.com>
	<97BD068FB200C44AA73C2B641F162ECF914A2E@IRSMSX101.ger.corp.intel.com>
Date: Fri, 25 Jan 2013 11:06:58 -0500
Message-ID: <CADkTA4P3cvHBcRiu7CVcTEBq2nk4zB6OteunVP=DqhsBn_x_4g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Prica, Mihai" <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 2/2] Created new target:kvm-image-minimal
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
X-List-Received-Date: Fri, 25 Jan 2013 16:07:00 -0000
Content-Type: multipart/alternative; boundary=f46d0401fb2ff0beab04d41f1d11

--f46d0401fb2ff0beab04d41f1d11
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 25, 2013 at 10:58 AM, Prica, Mihai <mihai.prica@intel.com>wrote:

> > -----Original Message-----
> > From: meta-virtualization-bounces@yoctoproject.org [mailto:
> meta-virtualization-
> > bounces@yoctoproject.org] On Behalf Of Prica, Mihai
> > Sent: Wednesday, January 16, 2013 3:59 PM
> > To: lei yang
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new
> target:kvm-image-
> > minimal
> >
> > > -----Original Message-----
> > > From: lei yang [mailto:lei.yang@windriver.com]
> > > Sent: Wednesday, January 16, 2013 5:28 AM
> > > To: Prica, Mihai
> > > Cc: meta-virtualization@yoctoproject.org
> > > Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new
> > > target:kvm-image- minimal
> > >
> > > On 01/15/2013 06:44 PM, Prica, Mihai wrote:
> > > >> -----Original Message-----
> > > >> From: Lei Yang [mailto:lei.yang@windriver.com]
> > > >> Sent: Friday, January 11, 2013 7:17 PM
> > > >> To: Prica, Mihai
> > > >> Cc: meta-virtualization@yoctoproject.org
> > > >> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new
> > > >> target:kvm-image- minimal
> > > >>
> > > >> On 01/12/2013 12:27 AM, Mihai Prica wrote:
> > > >>> Signed-off-by: Mihai Prica<mihai.prica@intel.com>
> > > >>> ---
> > > >>>    recipes-extended/images/kvm-image-minimal.bb |   28
> > > >> ++++++++++++++++++++++++++
> > > >>>    1 file changed, 28 insertions(+)
> > > >>>    create mode 100644 recipes-extended/images/kvm-image-minimal.bb
> > > >>>
> > > >>> diff --git a/recipes-extended/images/kvm-image-minimal.bb
> > > >>> b/recipes-extended/images/kvm-image-minimal.bb
> > > >>> new file mode 100644
> > > >>> index 0000000..275c43b
> > > >>> --- /dev/null
> > > >>> +++ b/recipes-extended/images/kvm-image-minimal.bb
> > > >>> @@ -0,0 +1,28 @@
> > > >>> +DESCRIPTION = "A minimal kvm image"
> > > >>> +
> > > >>> +IMAGE_INSTALL = " \
> > > >>> +    packagegroup-core-boot \
> > > >>> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> > > >>> +    qemu \
> > > >>> +    libvirt \
> > > >>> +    libvirt-libvirtd \
> > > >>> +    libvirt-virsh \
> > > >>> +    "
> > > >>> +
> > > >>> +IMAGE_FEATURES += "ssh-server-openssh"
> > > >>> +
> > > >>> +IMAGE_LINGUAS = " "
> > > >>> +
> > > >>> +LICENSE = "MIT"
> > > >>> +
> > > >>> +inherit core-image
> > > >>> +
> > > >>> +IMAGE_ROOTFS_SIZE = "8192"
> > > >>> +
> > > >>> +ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ;
> > "
> > > >>> +
> > > >>> +PACKAGE_INSTALL_ATTEMPTONLY = "\
> > > >> Hi Mibai
> > > >>
> > > >> can you explain "PACKAGE_INSTALL_ATTEMPTONLY " to me, I just see
> > > >> this variable first time
> > > > In an image recipe you can't use RRECOMMENDS to specify a list of
> > > > packages
> > > that extend the usability of the image being built.  In this type of
> > > recipe you can use PACKAGE_INSTALL_ATTEMPTONLY that has the same
> > functionality.
> > >
> > > and I think both can be used, from below, it tells me, they can
> > > perform the same function, do you try RRECOMEEDS and meet an error?
> >
> > I tried using RRECOMMENDS. I didn't get any errors but the kernel
> modules were
> > not loaded onto the image. I tried a number of times to be sure it's
> because of
> > the shared state, but with the same result. With
> > PACAKAGE_INSTALL_ATTEMPTONLY it worked.
>
> I see this hasn't been merged to master yet. Is there a specific reason
> for this ? Maybe it's something I'm missing.
>
>
No reason, except I had mentally tied it to the other patch you just ping'd
about.
Resend both (with the minor tweak to the enable .scc) and it should be good
for merge.

Bruce


> Mihai
>
> >
> > >
> > > lyang001@lyang0-9010:~/intel-xeon-core/layers/oe-core/meta/classes$
> > > cat image.bbclass |grep -E "^RRECOM|^PACKAGE_INSTALL_ATTEMPTONLY"
> > > RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
> > > PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
> > >
> > >
> > >   Lei
> > >
> > >
> > >
> > > > Thanks,
> > > > Mihai
> > > >> Lei
> > > >> :-)
> > > >>
> > > >>> +    kernel-module-kvm \
> > > >>> +    kernel-module-kvm-intel \
> > > >>> +    kernel-module-kvm-amd \
> > > >>> +    "
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d0401fb2ff0beab04d41f1d11
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jan 25, 2013 at 10:58 AM, Prica, Mihai <span dir=3D"ltr">&l=
t;<a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@in=
tel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">&gt;=
 -----Original Message-----<br>
&gt; From: <a href=3D"mailto:meta-virtualization-bounces@yoctoproject.org">=
meta-virtualization-bounces@yoctoproject.org</a> [mailto:<a href=3D"mailto:=
meta-virtualization-">meta-virtualization-</a><br>
&gt; <a href=3D"mailto:bounces@yoctoproject.org">bounces@yoctoproject.org</=
a>] On Behalf Of Prica, Mihai<br>
&gt; Sent: Wednesday, January 16, 2013 3:59 PM<br>
&gt; To: lei yang<br>
&gt; Cc: <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@yoctoproject.org</a><br>
&gt; Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new target:k=
vm-image-<br>
&gt; minimal<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: lei yang [mailto:<a href=3D"mailto:lei.yang@windriver.com">=
lei.yang@windriver.com</a>]<br>
&gt; &gt; Sent: Wednesday, January 16, 2013 5:28 AM<br>
&gt; &gt; To: Prica, Mihai<br>
&gt; &gt; Cc: <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-=
virtualization@yoctoproject.org</a><br>
&gt; &gt; Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new<br>
&gt; &gt; target:kvm-image- minimal<br>
&gt; &gt;<br>
&gt; &gt; On 01/15/2013 06:44 PM, Prica, Mihai wrote:<br>
&gt; &gt; &gt;&gt; -----Original Message-----<br>
&gt; &gt; &gt;&gt; From: Lei Yang [mailto:<a href=3D"mailto:lei.yang@windri=
ver.com">lei.yang@windriver.com</a>]<br>
&gt; &gt; &gt;&gt; Sent: Friday, January 11, 2013 7:17 PM<br>
&gt; &gt; &gt;&gt; To: Prica, Mihai<br>
&gt; &gt; &gt;&gt; Cc: <a href=3D"mailto:meta-virtualization@yoctoproject.o=
rg">meta-virtualization@yoctoproject.org</a><br>
&gt; &gt; &gt;&gt; Subject: Re: [meta-virtualization] [PATCH v2 2/2] Create=
d new<br>
&gt; &gt; &gt;&gt; target:kvm-image- minimal<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On 01/12/2013 12:27 AM, Mihai Prica wrote:<br>
&gt; &gt; &gt;&gt;&gt; Signed-off-by: Mihai Prica&lt;<a href=3D"mailto:miha=
i.prica@intel.com">mihai.prica@intel.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt; ---<br>
&gt; &gt; &gt;&gt;&gt; =A0 =A0recipes-extended/images/<a href=3D"http://kvm=
-image-minimal.bb" target=3D"_blank">kvm-image-minimal.bb</a> | =A0 28<br>
&gt; &gt; &gt;&gt; ++++++++++++++++++++++++++<br>
&gt; &gt; &gt;&gt;&gt; =A0 =A01 file changed, 28 insertions(+)<br>
&gt; &gt; &gt;&gt;&gt; =A0 =A0create mode 100644 recipes-extended/images/<a=
 href=3D"http://kvm-image-minimal.bb" target=3D"_blank">kvm-image-minimal.b=
b</a><br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; diff --git a/recipes-extended/images/<a href=3D"http=
://kvm-image-minimal.bb" target=3D"_blank">kvm-image-minimal.bb</a><br>
&gt; &gt; &gt;&gt;&gt; b/recipes-extended/images/<a href=3D"http://kvm-imag=
e-minimal.bb" target=3D"_blank">kvm-image-minimal.bb</a><br>
&gt; &gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt; &gt;&gt;&gt; index 0000000..275c43b<br>
&gt; &gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt; &gt;&gt;&gt; +++ b/recipes-extended/images/<a href=3D"http://kvm-=
image-minimal.bb" target=3D"_blank">kvm-image-minimal.bb</a><br>
&gt; &gt; &gt;&gt;&gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; &gt;&gt;&gt; +DESCRIPTION =3D &quot;A minimal kvm image&quot;<br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +IMAGE_INSTALL =3D &quot; \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0packagegroup-core-boot \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0${ROOTFS_PKGMANAGE_BOOTSTRAP} \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0qemu \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0libvirt \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0libvirt-libvirtd \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0libvirt-virsh \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0&quot;<br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +IMAGE_FEATURES +=3D &quot;ssh-server-openssh&quot;<=
br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +IMAGE_LINGUAS =3D &quot; &quot;<br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +inherit core-image<br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +IMAGE_ROOTFS_SIZE =3D &quot;8192&quot;<br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +ROOTFS_POSTPROCESS_COMMAND +=3D &quot;remove_packag=
ing_data_files ;<br>
&gt; &quot;<br>
&gt; &gt; &gt;&gt;&gt; +<br>
&gt; &gt; &gt;&gt;&gt; +PACKAGE_INSTALL_ATTEMPTONLY =3D &quot;\<br>
&gt; &gt; &gt;&gt; Hi Mibai<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; can you explain &quot;PACKAGE_INSTALL_ATTEMPTONLY &quot;=
 to me, I just see<br>
&gt; &gt; &gt;&gt; this variable first time<br>
&gt; &gt; &gt; In an image recipe you can&#39;t use RRECOMMENDS to specify =
a list of<br>
&gt; &gt; &gt; packages<br>
&gt; &gt; that extend the usability of the image being built. =A0In this ty=
pe of<br>
&gt; &gt; recipe you can use PACKAGE_INSTALL_ATTEMPTONLY that has the same<=
br>
&gt; functionality.<br>
&gt; &gt;<br>
&gt; &gt; and I think both can be used, from below, it tells me, they can<b=
r>
&gt; &gt; perform the same function, do you try RRECOMEEDS and meet an erro=
r?<br>
&gt;<br>
&gt; I tried using RRECOMMENDS. I didn&#39;t get any errors but the kernel =
modules were<br>
&gt; not loaded onto the image. I tried a number of times to be sure it&#39=
;s because of<br>
&gt; the shared state, but with the same result. With<br>
&gt; PACAKAGE_INSTALL_ATTEMPTONLY it worked.<br>
<br>
</div></div>I see this hasn&#39;t been merged to master yet. Is there a spe=
cific reason for this ? Maybe it&#39;s something I&#39;m missing.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div style>No reason, except I had mentally tied it to th=
e other patch you just ping&#39;d about.</div><div style>Resend both (with =
the minor tweak to the enable .scc) and it should be good for merge.</div>
<div style><br></div><div style>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"HOEnZb"><font color=3D"#888888">
Mihai<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; lyang001@lyang0-9010:~/intel-xeon-core/layers/oe-core/meta/classe=
s$<br>
&gt; &gt; cat image.bbclass |grep -E &quot;^RRECOM|^PACKAGE_INSTALL_ATTEMPT=
ONLY&quot;<br>
&gt; &gt; RRECOMMENDS +=3D &quot;${NORMAL_FEATURE_INSTALL_OPTIONAL}&quot;<b=
r>
&gt; &gt; PACKAGE_INSTALL_ATTEMPTONLY ?=3D &quot;${FEATURE_INSTALL_OPTIONAL=
}&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =A0 Lei<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; Mihai<br>
&gt; &gt; &gt;&gt; Lei<br>
&gt; &gt; &gt;&gt; :-)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0kernel-module-kvm \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0kernel-module-kvm-intel \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0kernel-module-kvm-amd \<br>
&gt; &gt; &gt;&gt;&gt; + =A0 =A0&quot;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--f46d0401fb2ff0beab04d41f1d11--
