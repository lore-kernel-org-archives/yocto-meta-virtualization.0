Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BF7EE00AE4; Tue, 25 Apr 2017 05:13:06 -0700 (PDT)
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
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.195 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA7D9E00A9B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:13:04 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id o36so24663747qtb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0QVy7x43stnSdtZ47SNYVKdIkmzsHocF+vJenkJ/Nc4=;
	b=UDGSjzQZTTAQ10t/mEwyts8jNh2BITUTjhxWoSDKO2dX+3OdsKMFMsTKhEklgjgdFv
	cinxpPVWt9GLiqG6rYxFG/3JOtCGfUz+0qBs1qZ8YRA6Yy7XKDXLVcEcEQ9rqj9gHfH0
	F6GMbBffEuIBMH35+QQYsGMdjRbYg+cKa1RT1lzbOCu5SL3/cV5sBF8My8caI0l3L98h
	7ncYpJrNg09dDgAVxTBghCGmqI7hLOprgcXrG3JQcQ/3VBBQ7YH3+3nnFOrvxopOLFuT
	VPOctKGAtuQushXE2mBVvP5ZbSDlpvLVa4De9lvIKUMvScoF5okBlE+Lmx4fAfsDB+qc
	aRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0QVy7x43stnSdtZ47SNYVKdIkmzsHocF+vJenkJ/Nc4=;
	b=mpVk4Lc2QLNSms5xDS7VG2YKldOiS8A+B7GXUxvAaQj6fzoz4CT5Rml+5vkaN7as+7
	68HuoaNoTqB2V7l6iehktwQvDOK/QNARf8zjFhvlFTYmMDRXFowakLdUAZWY15MWzXgH
	rkogAWzbh7OLoIP41Om2asvwKvFN/1oP1CSCkT70DyOAgp6v8wQBtU0uaGVocsxEjJuH
	Qg0D+hAHrWGOBiBlITDDJI7I0ddM/bQHUkG2tBTxuU0CIvDA2AXn3eURniVbxr577/8y
	HUtKHEiJFcHuAdfjHd0xxYbG7UegQDeyq3/tKVWirVHnFY49Bv5spucY/enZHaUuFUr8
	Zn6Q==
X-Gm-Message-State: AN3rC/7uigzty1RRLR1omzFihx7fA377BjedR93I7Vd1PWzoWf5tBQ7n
	dUmGKsdCX3K2UkUAEI3Zfv2B9wJX4g==
X-Received: by 10.237.35.162 with SMTP id j31mr29877584qtc.117.1493122383725; 
	Tue, 25 Apr 2017 05:13:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Tue, 25 Apr 2017 05:13:03 -0700 (PDT)
In-Reply-To: <1493107201-29291-1-git-send-email-B40290@freescale.com>
References: <1493107201-29291-1-git-send-email-B40290@freescale.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Apr 2017 08:13:03 -0400
Message-ID: <CADkTA4OKVMvXt3ivmZVjQMWZgYb=C5kE8b+KPPCcw4pMXrhZHg@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, chunrong.guo@nxp.com
Subject: Re: [PATCH 1/3] packagegroup-docker:initial add
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
X-List-Received-Date: Tue, 25 Apr 2017 12:13:06 -0000
Content-Type: multipart/alternative; boundary=001a113e7f5449c8dd054dfca57f

--001a113e7f5449c8dd054dfca57f
Content-Type: text/plain; charset=UTF-8

I don't see the point of this. Most people absolutely do not need
docker-registry whenever
docker is installed.

So this is just a packagegroup that is wrapping the install of docker + one
optional
dependency.

What problem are you trying to solve ?

Bruce

On Tue, Apr 25, 2017 at 3:59 AM, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> ---
>  recipes-containers/packagegroups/packagegroup-docker.bb | 13
> +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 recipes-containers/packagegroups/packagegroup-
> docker.bb
>
> diff --git a/recipes-containers/packagegroups/packagegroup-docker.bb
> b/recipes-containers/packagegroups/packagegroup-docker.bb
> new file mode 100644
> index 0000000..8ac7600
> --- /dev/null
> +++ b/recipes-containers/packagegroups/packagegroup-docker.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Install docker tools"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +PACKAGES = "${PN}"
> +
> +RDEPENDS_${PN} = "docker \
> +    docker-registry  \
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

--001a113e7f5449c8dd054dfca57f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t see the point of this. Most people absolutely =
do not need docker-registry whenever<div>docker is installed.=C2=A0</div><d=
iv><br></div><div>So this is just a packagegroup that is wrapping the insta=
ll of docker + one optional=C2=A0</div><div>dependency.</div><div><br></div=
><div>What problem are you trying to solve ?</div><div><br></div><div>Bruce=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tu=
e, Apr 25, 2017 at 3:59 AM, Chunrong Guo <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:B40290@freescale.com" target=3D"_blank">B40290@freescale.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">From: Chunrong Guo &lt;<a h=
ref=3D"mailto:chunrong.guo@nxp.com">chunrong.guo@nxp.com</a>&gt;<br>
<br>
---<br>
=C2=A0recipes-containers/<wbr>packagegroups/<a href=3D"http://packagegroup-=
docker.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>docker.bb=
</a> | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/<wbr>packagegroups/<a href=3D"h=
ttp://packagegroup-docker.bb" rel=3D"noreferrer" target=3D"_blank">packageg=
roup-<wbr>docker.bb</a><br>
<br>
diff --git a/recipes-containers/<wbr>packagegroups/<a href=3D"http://packag=
egroup-docker.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>do=
cker.bb</a> b/recipes-containers/<wbr>packagegroups/<a href=3D"http://packa=
gegroup-docker.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>d=
ocker.bb</a><br>
new file mode 100644<br>
index 0000000..8ac7600<br>
--- /dev/null<br>
+++ b/recipes-containers/<wbr>packagegroups/<a href=3D"http://packagegroup-=
docker.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>docker.bb=
</a><br>
@@ -0,0 +1,13 @@<br>
+DESCRIPTION =3D &quot;Install docker tools&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+inherit packagegroup<br>
+<br>
+PACKAGES =3D &quot;${PN}&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;docker \<br>
+=C2=A0 =C2=A0 docker-registry=C2=A0 \<br>
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

--001a113e7f5449c8dd054dfca57f--
