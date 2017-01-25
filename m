Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A890E009CD; Wed, 25 Jan 2017 11:31:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.179 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A95CE00990
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jan 2017 11:31:47 -0800 (PST)
Received: by mail-qt0-f179.google.com with SMTP id k15so34635280qtg.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jan 2017 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q+3jHz8HHoBU5k8yArEKMLEyJ0Zim+zMkucGx6vGSQ4=;
	b=faI5TUP2zxPe5jCQaqLfCuWDaKeX7WnenwVT0Vi0nGJ95WsEJdd5sGTlx5rrgElyfJ
	NMXyLSCLEmsWaKAoDI1REpMfwo8Uqs6xN5KfK91NWJMqIkSSBlsA3exe+oEIltP+6/yr
	t9TIznTtOuRB9IUy/toor8phcnLJRGwFr/DEJ8e++uJyitDbnBY/mSb44k+TAMmZ9iNP
	dXNgWUxUQb/FtNQ1/LDgDUyGCrUbTTcfkjmmFw6RmUFVMhqSIRLxfWpj0/Y6NJ8BO8EL
	CT+f7ZbB8VdqN8jtz9UAax7FCi35nxVJGnuAK0v342BgQGbt7Wo697pHv3mmmq1ETgFJ
	f+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q+3jHz8HHoBU5k8yArEKMLEyJ0Zim+zMkucGx6vGSQ4=;
	b=qQyhzKB8MfI1IdqOsfqY2CqemWy7X7E5x8r/NV/UIKEhhZWfmi3x7utbnWN0bZMNDC
	JQD6v3b4Ieg85ErnhS4iP6jC5cbNXNM/8mIZlPj2twTjYMuWzh7B1w+icqIl2E04swXt
	ZSBU9nEdG57W0Y54PYBpI8LF+BPxVIEAlvdIE3aq91GF3Hs62hfDDACGbmvESL4SbOP5
	QAIfcRQ6I34NCsY56QuNQrTS3wScPVO50vEions+MmnS14a9uZ8mPVYXI8cgVvP6E6RQ
	Zakrqljnxdrow8SlJqIA+aeX67VQdluMbWMe7sN3+R20GT14x7wnEkSnh/NB2PF7yuPW
	+w3A==
X-Gm-Message-State: AIkVDXJ/9tURqnSJY6oa+sNG/kSJMXGbohMt0ptIYPeTGS/rDgEjx2fP99CB0mJhgD7zVY7eGQJtFeW42B2PFg==
X-Received: by 10.237.38.65 with SMTP id z59mr35278977qtc.5.1485372707227;
	Wed, 25 Jan 2017 11:31:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Wed, 25 Jan 2017 11:31:46 -0800 (PST)
In-Reply-To: <1485227341-30506-1-git-send-email-mark.asselstine@windriver.com>
References: <1485227341-30506-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Jan 2017 14:31:46 -0500
Message-ID: <CADkTA4P5=dc5C4whpS+zGUPGwEcZu+Wc2wHy-=vVoW1nA+xVJw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] python-osc-lib: initial version
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
X-List-Received-Date: Wed, 25 Jan 2017 19:31:54 -0000
Content-Type: multipart/alternative; boundary=94eb2c122e5892cf680546f04810

--94eb2c122e5892cf680546f04810
Content-Type: text/plain; charset=UTF-8

Everything should now be merged. I found that one of the patches wouldn't
apply, since I had missed a change from one of your older series.

... so if you can rebase your queue against master, you'll probably find
something that I mucked up. Resend those and I'll get them merged.

Bruce

On Mon, Jan 23, 2017 at 10:09 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> This is required for the uprev of python-heatclient to
> stable/newton. The version is selected based on all version
> requirements.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../python/python-osc-lib_1.1.0.bb                 | 32
> ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-osc-
> lib_1.1.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-osc-
> lib_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-osc-
> lib_1.1.0.bb
> new file mode 100644
> index 0000000..70582f7
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "OpenStackClient Library"
> +HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +SRCNAME = "osc-lib"
> +
> +SRC_URI = "https://pypi.io/packages/source/o/${SRCNAME}/${SRCNAME}
> -${PV}.tar.gz \
> +"
> +
> +SRC_URI[md5sum] = "08bf2b46089da52240893d99a3892897"
> +SRC_URI[sha256sum] = "e06ca111b2702d442f5cf70c754b63
> 31cc7742231f0fe0b634cbd03c502610ba"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} += " \
> +        python-pbr \
> +        python-six \
> +        python-babel \
> +        python-cliff \
> +        python-keystoneauth1 \
> +        python-os-client-config \
> +        python-oslo.i18n \
> +        python-oslo.utils \
> +        python-simplejson \
> +        python-stevedore \
> +        "
> +
> +CLEANBROKEN = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c122e5892cf680546f04810
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Everything should now be merged. I found that on=
e of the patches wouldn&#39;t apply, since I had missed a change from one o=
f your older series. <br><br></div>... so if you can rebase your queue agai=
nst master, you&#39;ll probably find something that I mucked up. Resend tho=
se and I&#39;ll get them merged.<br><br></div>Bruce<br></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jan 23, 2017 at 10:09 P=
M, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">This is required for the uprev =
of python-heatclient to<br>
stable/newton. The version is selected based on all version<br>
requirements.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python-osc-lib_1.1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python-osc-lib_1.1.<wbr>0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++++++++++++++++++++<br>
=C2=A01 file changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta-openstack/recipes-<wbr>devtools/python/<a hre=
f=3D"http://python-osc-lib_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-osc-<wbr>lib_1.1.0.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-osc-lib_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-<w=
br>lib_1.1.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-osc-lib_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-osc-<wbr>lib_1.1.0.bb</a><br>
new file mode 100644<br>
index 0000000..70582f7<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
osc-lib_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-<wbr>lib_=
1.1.0.bb</a><br>
@@ -0,0 +1,32 @@<br>
+DESCRIPTION =3D &quot;OpenStackClient Library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://opensource.perlig.de/rcssmin/" rel=3D=
"noreferrer" target=3D"_blank">http://opensource.perlig.de/<wbr>rcssmin/</a=
>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>1dece7821bf3fd70fe130=
9eaa37d52<wbr>a2&quot;<br>
+<br>
+SRCNAME =3D &quot;osc-lib&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.io/packages/source/o/${SRCNAME}/=
${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://pypi.=
io/packages/<wbr>source/o/${SRCNAME}/${SRCNAME}<wbr>-${PV}.tar.gz</a> \<br>
+&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>08bf2b46089da52240893d99a38928<wbr>97&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>e06ca111b2702d442f5cf70c754b63<wbr>31cc7=
742231f0fe0b634cbd03c5026<wbr>10ba&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
+<br>
+inherit setuptools<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-six \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-babel \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-cliff \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-keystoneauth1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-os-client-config \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-oslo.i18n \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-oslo.utils \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-simplejson \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-stevedore \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c122e5892cf680546f04810--
