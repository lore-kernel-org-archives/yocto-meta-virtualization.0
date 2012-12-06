Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1043E0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:20:12 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id m13so5604162lah.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wudAmbEhGqvLr1mP33zX9jziVkxly3u3S6WOJcOlP9U=;
	b=jofsuKSJaTvZEMKcEjVc00CwYqLTd89ABKdsx1DDqkP1plaqOqmRuE9pEWFvSbRkjh
	tMYS8qcwyLQn2f8qYeuEjiLBb9/wdZH/UatmvZ/rKHyQm7BDS8sWLe1Ki+7zh8iPxtY7
	vsro2Iya1L6lgv8KTVGgf8WO2BWoNHrC3snWk/1IwGM/BBk8ntSNl22QUJM9plTl76uF
	w+O5RFB1t9oS9fT6g19nXgi7qzQ5oiSxQ/zuWLreazl11Pn1+oog17A75iTXsCvK3zY+
	hCUOcRYHXy1qJDnMFqIERNtRzK0l9M1erLKgH4n940ySfq/0fEO2i9gfCFsz+J37ekTD
	6TGQ==
MIME-Version: 1.0
Received: by 10.112.46.199 with SMTP id x7mr964992lbm.109.1354803611930; Thu,
	06 Dec 2012 06:20:11 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Thu, 6 Dec 2012 06:20:11 -0800 (PST)
In-Reply-To: <1354802601-10840-7-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-7-git-send-email-david.c.nystrom@gmail.com>
Date: Thu, 6 Dec 2012 09:20:11 -0500
Message-ID: <CADkTA4NZfY+P=2U7jdk4wY-SFJP-Ns4MMDtauy=HorkFRNHyWg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv3 06/14] Added openbsd-netcat recipe, libvirt dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 14:20:13 -0000
Content-Type: multipart/alternative; boundary=bcaec55405680790ac04d02fcc06

--bcaec55405680790ac04d02fcc06
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2012 at 9:03 AM, <david.c.nystrom@gmail.com> wrote:

> From: David Nystr=F6m <david.nystrom@enea.com>
>
> ---
>  recipes-networking/netcat/openbsd-netcat_1.6.bb |   29
> +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb
>

Random comment. I was surprised that this wasn't already in the
meta-networking
layer, so I went to have a look. And indeed I don't see it.

Is that consistent with what other people see ? This seems like it could go
in another
layer at some point.

At a glance, I'm not seeing the libvirt dependency. Am I overlooking it
somehow ?

Cheers,

Bruce


>
> diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bbb/recipes-net=
working/netcat/
> openbsd-netcat_1.6.bb
> new file mode 100644
> index 0000000..1ae3f37
> --- /dev/null
> +++ b/recipes-networking/netcat/openbsd-netcat_1.6.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "OpenBSD Netcat"
> +HOMEPAGE =3D "http://code.google.com/p/openbsd-netcat/"
> +SECTION =3D "console/network"
> +LICENSE =3D "BSD-3-Clause"
> +PR =3D "r0"
> +
> +SRCREV =3D "5"
> +
> +SRC_URI =3D "svn://
> openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3Dhttp"
> +S =3D "${WORKDIR}/trunk"
> +
> +inherit update-alternatives gettext
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +       cd ${S}
> +       oe_runmake
> +}
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> +}
> +
> +ALTERNATIVE_${PN} =3D "nc"
> +ALTERNATIVE_PRIORITY =3D "101"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec55405680790ac04d02fcc06
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 9:03 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:david.c.nys=
trom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;</span> =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">From=
: David Nystr=F6m &lt;<a href=3D"mailto:david.nystrom@enea.com">david.nystr=
om@enea.com</a>&gt;<br>

<br>
---<br>
=A0recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" targe=
t=3D"_blank">openbsd-netcat_1.6.bb</a> | =A0 29 +++++++++++++++++++++++<br>
=A01 file changed, 29 insertions(+)<br>
=A0create mode 100644 recipes-networking/netcat/<a href=3D"http://openbsd-n=
etcat_1.6.bb" target=3D"_blank">openbsd-netcat_1.6.bb</a></div></div></bloc=
kquote><div><br></div><div>Random comment. I was surprised that this wasn&#=
39;t already in the meta-networking</div>
<div>layer, so I went to have a look. And indeed I don&#39;t see it.</div><=
div><br></div><div>Is that consistent with what other people see ? This see=
ms like it could go in another</div><div>layer at some point.</div><div>
=A0</div><div>At a glance, I&#39;m not seeing the libvirt dependency. Am I =
overlooking it somehow ?</div><div><br></div><div>Cheers,</div><div><br></d=
iv><div>Bruce</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
diff --git a/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6=
.bb" target=3D"_blank">openbsd-netcat_1.6.bb</a> b/recipes-networking/netca=
t/<a href=3D"http://openbsd-netcat_1.6.bb" target=3D"_blank">openbsd-netcat=
_1.6.bb</a><br>

new file mode 100644<br>
index 0000000..1ae3f37<br>
--- /dev/null<br>
+++ b/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" ta=
rget=3D"_blank">openbsd-netcat_1.6.bb</a><br>
@@ -0,0 +1,29 @@<br>
+DESCRIPTION =3D &quot;OpenBSD Netcat&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/openbsd-netcat/" ta=
rget=3D"_blank">http://code.google.com/p/openbsd-netcat/</a>&quot;<br>
+SECTION =3D &quot;console/network&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRCREV =3D &quot;5&quot;<br>
+<br>
+SRC_URI =3D &quot;svn://<a href=3D"http://openbsd-netcat.googlecode.com/sv=
n;module=3Dtrunk;protocol=3Dhttp" target=3D"_blank">openbsd-netcat.googleco=
de.com/svn;module=3Dtrunk;protocol=3Dhttp</a>&quot;<br>
+S =3D &quot;${WORKDIR}/trunk&quot;<br>
+<br>
+inherit update-alternatives gettext<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+<br>
+do_compile() {<br>
+ =A0 =A0 =A0 cd ${S}<br>
+ =A0 =A0 =A0 oe_runmake<br>
+}<br>
+<br>
+do_install() {<br>
+ =A0 =A0 =A0 install -d ${D}${bindir}<br>
+ =A0 =A0 =A0 install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}<br>
+}<br>
+<br>
+ALTERNATIVE_${PN} =3D &quot;nc&quot;<br>
+ALTERNATIVE_PRIORITY =3D &quot;101&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div>

--bcaec55405680790ac04d02fcc06--
