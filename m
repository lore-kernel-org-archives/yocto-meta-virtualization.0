Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4515DE00BBC; Thu, 24 Aug 2017 19:03:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF7CE00B3D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 19:03:14 -0700 (PDT)
Received: by mail-vk0-f44.google.com with SMTP id l132so3602762vke.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 19:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YGczWeq6hJj5Nihze9OYowq7tIME8hnmhpqhF7KUoJY=;
	b=n/nIi3R910vitE6dV4EsTWcVBZMwrmk7KwkVR761Ybaj3WL4IXy2ojpQZ/In1oBhB2
	SPwrmVas4zjxGjH/0Ni3ShXfzLEN+RmWNaXfeLqJGPekFGZt6p5gc1wxkDCOe/0LZAYX
	WSaKx1F7xZiTbSRHAFaEhy8IODHgI2Fh6Mkx8jgtWuCgYRCSvy26hbh+rsQnjZMeNILW
	a0ZWBc2X4xmlpnMTai+jCQlQ4jcjR5rfJB8ydWw65xKGt46wi+tu+wmeC+KsLaOZp/Qk
	eCh8TwcuNA5sjziHayHZ0WO6BXGFwAilCy0BwO7LdmEt8Lu0Wg7tRS0VMn5Yy/cW/+1W
	vyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YGczWeq6hJj5Nihze9OYowq7tIME8hnmhpqhF7KUoJY=;
	b=I69nlszRTTqPKKTllh+RTNjB3RnZjdvCEY/rWsera2jj41Uo1h1FxczkzXxEkI8y6U
	u431rPkwhjmbugT04ZjCT+SFAkaAPo4lV4B6LSaUqhUeVR+urypo/3POGsZmHTyNpofA
	kT1xwUIs58e6cCB6alKqcoTrwRZvm/pEaYxd4tbvZbB2qCmh5/lu04jvX8keOaumzkB9
	qNCeXr1aGjraKwBqOO0zU2FuGQBsDP+54DfOsuhEmPha7taz+s3NFHgKopIOX7p349Cw
	uJteGSZ+07cxH76lMr8VuZRQXjc96DsiToR+TYlSMEHKHJmrmA+218PCPumDGsuKDrol
	rkWA==
X-Gm-Message-State: AHYfb5gp98Im45AEnRUdL0iaWWKaliQ8Ctsv1/vbNNqd7nLAIblISRUV
	t5rgVSfXksJzLnom//ELmRnbVisBHw==
X-Received: by 10.31.5.9 with SMTP id 9mr5173967vkf.79.1503626592997; Thu, 24
	Aug 2017 19:03:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 19:03:12 -0700 (PDT)
In-Reply-To: <1503578041-79596-1-git-send-email-tiniuc.alexandru@gmail.com>
References: <1503578041-79596-1-git-send-email-tiniuc.alexandru@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 22:03:12 -0400
Message-ID: <CADkTA4NW1JvB2uW6qbGRSwcNYS6WCFNKazvwwN5URTSOG22iUw@mail.gmail.com>
To: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Added recipe for the Singularity container platform.
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
X-List-Received-Date: Fri, 25 Aug 2017 02:03:16 -0000
Content-Type: multipart/alternative; boundary="001a1143f272f35d5105578a5807"

--001a1143f272f35d5105578a5807
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 24, 2017 at 8:33 AM, Alexandru Tiniuc <
tiniuc.alexandru@gmail.com> wrote:

> Singularity is a container platform built on the principle of mobility
> of compute.  It is designed to be used on HPC clusters and, unlike
> Docker, it does not require root access to mount an image. In addition,
> it can use Docker images out-of-the-box and it can pull them from the
> Docker Hub. For more information, see singularity.lbl.gov
>
> This recipe enables building the Singularity container platform.
> Additionally, it creates a symlink from /usr/bin/python3 to
> /usr/bin/python, as well as a symlink to where python3 expects
> CA certificates to be.
>
> I have tested it on a Raspberry Pi 3: I successfully built and run
> arm32v7 images from Docker Hub. Make sure you have the right image for
> your CPU architecture: it defaults to amd64.
>

Looks reasonable to me.

I do have one additional request though.

Even if it is a really simple concept, can you create a README that shows
the
commands to run a simple sanity/smoke test. That way, we'll have a guide in
the
checked out layer on how to use the infrastructure.

Cheers,

Bruce


>
> Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru at gmail dot com>
> ---
>  recipes-containers/singularity/singularity_git.bb | 35
> +++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 recipes-containers/singularity/singularity_git.bb
>
> diff --git a/recipes-containers/singularity/singularity_git.bb
> b/recipes-containers/singularity/singularity_git.bb
> new file mode 100644
> index 0000000..d0fbeb9
> --- /dev/null
> +++ b/recipes-containers/singularity/singularity_git.bb
> @@ -0,0 +1,35 @@
> +# Skip QA check for library symbolic links (core issue is a packaging
> problem within
> +# Singularity build / config: read up on the dev-so test for more info)
> +INSANE_SKIP_${PN} += "dev-so"
> +
> +RDEPENDS_${PN} += "glibc python3 ca-certificates openssl"
> +# Singularity expects to find python3 under the name python, therefore
> both
> +# cannot be installed at the same time.
> +RCONFLICTS_${PN} = "python"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=
> be78c34e483dd7d8439358b1e024b294 \
> +                    file://LICENSE-LBNL.md;md5=
> 45a007b527e1a9507aa7fa869f8d7ede \
> +                    file://LICENSE.md;md5=df4326b473db6424033f1d98a5645e30
> \
> +                    file://debian/copyright;md5=
> ed267cf386d9b75ab1f27f407e935b10"
> +
> +SRC_URI = "git://github.com/singularityware/singularity.
> git;protocol=https"
> +PV = "2.3.1+git${SRCPV}"
> +SRCREV = "e214d4ebf0a1274b1c63b095fd55ae61c7e92947"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pythonnative autotools-brokensep
> +EXTRA_OECONF = "--prefix=/usr/local"
> +
> +pkg_postinst_${PN}() {
> +    # Singularity requires "python" to resolve to "python3" within the
> commandline.
> +    # This creates a symbolic link from python3 to python. A side-effect
> of this is
> +    # that scripts which expect Python 2 may fail to run correctly.
> +    ln -sr $D${bindir}/python3 $D${bindir}/python
> +
> +    # python3 expects CA certificates to be installed in a different
> place to where
> +    # they are actually installed. These lines link the two locations.
> +    rm -r $D${libdir}/ssl-1.1/certs
> +    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1
> +}
> --
> 2.1.4
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

--001a1143f272f35d5105578a5807
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Aug 24, 2017 at 8:33 AM, Alexandru Tiniuc <span dir=3D"ltr">&lt=
;<a href=3D"mailto:tiniuc.alexandru@gmail.com" target=3D"_blank">tiniuc.ale=
xandru@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Si=
ngularity is a container platform built on the principle of mobility<br>
of compute.=C2=A0 It is designed to be used on HPC clusters and, unlike<br>
Docker, it does not require root access to mount an image. In addition,<br>
it can use Docker images out-of-the-box and it can pull them from the<br>
Docker Hub. For more information, see <a href=3D"http://singularity.lbl.gov=
" rel=3D"noreferrer" target=3D"_blank">singularity.lbl.gov</a><br>
<br>
This recipe enables building the Singularity container platform.<br>
Additionally, it creates a symlink from /usr/bin/python3 to<br>
/usr/bin/python, as well as a symlink to where python3 expects<br>
CA certificates to be.<br>
<br>
I have tested it on a Raspberry Pi 3: I successfully built and run<br>
arm32v7 images from Docker Hub. Make sure you have the right image for<br>
your CPU architecture: it defaults to amd64.<br></blockquote><div><br></div=
><div>Looks reasonable to me.</div><div><br></div><div>I do have one additi=
onal request though.</div><div><br></div><div>Even if it is a really simple=
 concept, can you create a README that shows the</div><div>commands to run =
a simple sanity/smoke test. That way, we&#39;ll have a guide in the</div><d=
iv>checked out layer on how to use the infrastructure.</div><div><br></div>=
<div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Signed-off-by: Alexandru Tiniuc &lt;tiniuc.alexandru at gmail dot com&gt;<b=
r>
---<br>
=C2=A0recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> | 35 +++++=
++++++++++++++++++<br>
=C2=A01 file changed, 35 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/<wbr>singularity/<a href=3D"htt=
p://singularity_git.bb" rel=3D"noreferrer" target=3D"_blank">singularity_gi=
t.bb</a><br>
<br>
diff --git a/recipes-containers/<wbr>singularity/<a href=3D"http://singular=
ity_git.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> b/r=
ecipes-containers/<wbr>singularity/<a href=3D"http://singularity_git.bb" re=
l=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
new file mode 100644<br>
index 0000000..d0fbeb9<br>
--- /dev/null<br>
+++ b/recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
@@ -0,0 +1,35 @@<br>
+# Skip QA check for library symbolic links (core issue is a packaging prob=
lem within<br>
+# Singularity build / config: read up on the dev-so test for more info)<br=
>
+INSANE_SKIP_${PN} +=3D &quot;dev-so&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;glibc python3 ca-certificates openssl&quot;<br>
+# Singularity expects to find python3 under the name python, therefore bot=
h<br>
+# cannot be installed at the same time.<br>
+RCONFLICTS_${PN} =3D &quot;python&quot;<br>
+<br>
+LICENSE =3D &quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT.md;md5=3D<wbr>be78c34e483dd7d8=
439358b1e024b2<wbr>94 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE-LBNL.md;md5=3D<wbr>45a007b527e1a9507aa7fa869f8d7e<wbr>de \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.md;md5=3D<wbr>df4326b473db6424033f1d98a5645e<wbr>30 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://debian/copyright;md5=3D<wbr>ed267cf386d9b75ab1f27f407e935b<wbr>10&quot;<=
br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/singularityware/singu=
larity.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/<wbr>singularityware/singularity.<wbr>git;protocol=3Dhttps</a>&quot;<br>
+PV =3D &quot;2.3.1+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;<wbr>e214d4ebf0a1274b1c63b095fd55ae<wbr>61c7e92947&quot;<=
br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit pythonnative autotools-brokensep<br>
+EXTRA_OECONF =3D &quot;--prefix=3D/usr/local&quot;<br>
+<br>
+pkg_postinst_${PN}() {<br>
+=C2=A0 =C2=A0 # Singularity requires &quot;python&quot; to resolve to &quo=
t;python3&quot; within the commandline.<br>
+=C2=A0 =C2=A0 # This creates a symbolic link from python3 to python. A sid=
e-effect of this is<br>
+=C2=A0 =C2=A0 # that scripts which expect Python 2 may fail to run correct=
ly.<br>
+=C2=A0 =C2=A0 ln -sr $D${bindir}/python3 $D${bindir}/python<br>
+<br>
+=C2=A0 =C2=A0 # python3 expects CA certificates to be installed in a diffe=
rent place to where<br>
+=C2=A0 =C2=A0 # they are actually installed. These lines link the two loca=
tions.<br>
+=C2=A0 =C2=A0 rm -r $D${libdir}/ssl-1.1/certs<br>
+=C2=A0 =C2=A0 ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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
</div></div>

--001a1143f272f35d5105578a5807--
