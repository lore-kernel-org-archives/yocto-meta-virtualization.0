Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42DCEE00AE4; Tue, 25 Apr 2017 05:12:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D76CFE00A9B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:12:01 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id u75so8248433qka.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rSQihQFmM1aU4Mre2tviy+ov+dxvUUH/woA6WpFqjIQ=;
	b=X+kB7JSxEq/7FGYB2U4jKe0Btbcn6ta6l26ihd6H12K8aV5AaiPOSRiiNoqCxQuByi
	QZ6b8+/kuYdON6o3yj3DFqFEq+yS8s3Jj7NSvQXCRApLNDPw37lJQA0XOMagh/ur8Ed/
	sN22MQTY5bjbG0zCaUZUAen94cX5ZmsN6Kke2RYUyur4JYA83bC2JKmKwzIo557Nrq0N
	X5eMYtBq74QDm6R9MLTe/jJSz+cwUxrm2Pgc5Dj0TGzrin2h5DgUIQl0IQ7OxO/Tj0Q4
	Xqh1DSQ6IgaUjndCD3ugAqy6aR3vyyaff8gY1skqGkwJ0XLPOtioxYDdGXkUNtuUtgBI
	zfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rSQihQFmM1aU4Mre2tviy+ov+dxvUUH/woA6WpFqjIQ=;
	b=X6OGj1HavvGurEKvZJFV0/LzO6r1SYpIbT3JahwVJR5Fm+zrNqHzgBUfT7Ckb1V/7T
	7iPbfZowdVAUtnJzO6YawIEH+P3X88mv1I9SG8HDhNM8JAeaJPADSNQpg9+c1qTx+jlp
	m70w+qH0SwxOq1o55eDxcNsngEanreeP+46JJMxhUk/YiS65oatJPQAl8de2hZI8AvP4
	F+ZGkOag+Qo7LSXhY9hMNmHtTzXTZQ9dLPX/nCVU/p3k8TZjW+vwL4QMn0kURuoRCL4q
	IKUGX5S+uGQHa7Vlg3LywY01Cg91vs47LKBbs0y6Dh1k6FQixqYgDMjrw7jTWKFNS0A5
	gBfg==
X-Gm-Message-State: AN3rC/6KpskohXU0yqIuvWZSx16AbZamtioL4EC4E+UebTDOfrDA4r0R
	v7rqyC8hT/Ugv2fT5TAsAP1K3vn6vA==
X-Received: by 10.55.190.66 with SMTP id o63mr29753968qkf.149.1493122320858;
	Tue, 25 Apr 2017 05:12:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Tue, 25 Apr 2017 05:12:00 -0700 (PDT)
In-Reply-To: <1493107201-29291-3-git-send-email-B40290@freescale.com>
References: <1493107201-29291-1-git-send-email-B40290@freescale.com>
	<1493107201-29291-3-git-send-email-B40290@freescale.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Apr 2017 08:12:00 -0400
Message-ID: <CADkTA4MT7eGfhSj1Au1mw+qeFE5dob1h3hmiZv2rFAVUrWgNGQ@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, chunrong.guo@nxp.com
Subject: Re: [PATCH 3/3] packagegroup-virtualization: initial add
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
X-List-Received-Date: Tue, 25 Apr 2017 12:12:03 -0000
Content-Type: multipart/alternative; boundary=94eb2c04395c8a8199054dfca184

--94eb2c04395c8a8199054dfca184
Content-Type: text/plain; charset=UTF-8

This package group doesn't make a lot of sense, its name is far to
general/broad
to only contain libvirt.

There's such a broad set of package that are required for system level use
out of
meta-virtualization that we've generally stayed away from package groups.

Cheers,

Bruce

On Tue, Apr 25, 2017 at 4:00 AM, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> ---
>  .../packagegroups/packagegroup-virtualization.bb           | 14
> ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 recipes-extended/packagegroups/packagegroup-
> virtualization.bb
>
> diff --git a/recipes-extended/packagegroups/packagegroup-virtualization.bb
> b/recipes-extended/packagegroups/packagegroup-virtualization.bb
> new file mode 100644
> index 0000000..7e9dae5
> --- /dev/null
> +++ b/recipes-extended/packagegroups/packagegroup-virtualization.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "All packages virtualization packages"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58"
> +
> +inherit packagegroup
> +
> +PACKAGES = "${PN}"
> +
> +RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
> +    'libvirt \
> +    libvirt-libvirtd \
> +    libvirt-virsh \
> +    '', d)} \
> +"
> --
> 1.9.0
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

--94eb2c04395c8a8199054dfca184
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This package group doesn&#39;t make a lot of sense, its na=
me is far to general/broad<br><div>to only contain libvirt.</div><div><br><=
/div><div>There&#39;s such a broad set of package that are required for sys=
tem level use out of</div><div>meta-virtualization that we&#39;ve generally=
 stayed away from package groups.</div><div><br></div><div>Cheers,</div><di=
v><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, Apr 25, 2017 at 4:00 AM, Chunrong Guo <span dir=3D=
"ltr">&lt;<a href=3D"mailto:B40290@freescale.com" target=3D"_blank">B40290@=
freescale.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From:=
 Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com">chunrong.guo@nxp.=
com</a>&gt;<br>
<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-virtualization.bb" r=
el=3D"noreferrer" target=3D"_blank">packagegroup<wbr>-virtualization.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/<wbr>packagegroups/<a href=3D"htt=
p://packagegroup-virtualization.bb" rel=3D"noreferrer" target=3D"_blank">pa=
ckagegroup-<wbr>virtualization.bb</a><br>
<br>
diff --git a/recipes-extended/<wbr>packagegroups/<a href=3D"http://packageg=
roup-virtualization.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<=
wbr>virtualization.bb</a> b/recipes-extended/<wbr>packagegroups/<a href=3D"=
http://packagegroup-virtualization.bb" rel=3D"noreferrer" target=3D"_blank"=
>packagegroup-<wbr>virtualization.bb</a><br>
new file mode 100644<br>
index 0000000..7e9dae5<br>
--- /dev/null<br>
+++ b/recipes-extended/<wbr>packagegroups/<a href=3D"http://packagegroup-vi=
rtualization.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>vir=
tualization.bb</a><br>
@@ -0,0 +1,14 @@<br>
+DESCRIPTION =3D &quot;All packages virtualization packages&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58&quot;<br>
+<br>
+inherit packagegroup<br>
+<br>
+PACKAGES =3D &quot;${PN}&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#3=
9;, &#39;x11&#39;, \<br>
+=C2=A0 =C2=A0 &#39;libvirt \<br>
+=C2=A0 =C2=A0 libvirt-libvirtd \<br>
+=C2=A0 =C2=A0 libvirt-virsh \<br>
+=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
+&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c04395c8a8199054dfca184--
