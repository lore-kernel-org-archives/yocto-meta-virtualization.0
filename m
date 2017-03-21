Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12E53E007BA; Tue, 21 Mar 2017 05:17:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.180 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6863E00726
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:17:31 -0700 (PDT)
Received: by mail-qk0-f180.google.com with SMTP id p64so133047530qke.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8RfwkTHkialmkf7F4wGxjK/Pai17ZUsxX/N4jH0E5ec=;
	b=ONOhpJLi6EyF/4Y3/G91LhXAsA4fCNMoo+pE8HTrgHz/VQZLd6OYBVtD+WzHhwbIgQ
	lajLQ56TjNS/eRlbmesjCGXPXtAmu4fcp0+rnp6cLDQ1JnAO6AdBXJ4N2oLnp/uUnDBX
	0EmpAaKd6FlpgJhMmFPblbkV1o7dDlezgXUVdq2NxfS06/4GXDtnSNizc4KVRsaVIkPX
	UoCwWMzCArxgbok2V1PicfsB0Px3GSM4TCZ2EKhlywsUofBncwD1D0zpT2tlCVIkVq++
	Kk36SRni3Uo/32RBE+2y1dJWsC/MQtaumUcDkePeMHBLH/CEwXUSIqj+zRZSa3ITFlOq
	CXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8RfwkTHkialmkf7F4wGxjK/Pai17ZUsxX/N4jH0E5ec=;
	b=MukG7iMGfwn9vPTG3wWU1Sf8lpFSoI+pVTU+aPcjJn3hJWaun++AVEEEmn0JHzCHqA
	vqcx7WxgKcwVPX5arcSDkaEtyicmhXoKtmwYwtwa4QJxi3wOSjB7zfgSrCXIRuxo3XPA
	+YXZdPklXxCzrI8+tsP3qGrEBEDFr8lej78K76LNvptYYAQggr6Af2+WgW/Gyq78y9/q
	Rz0JquIY+LJPoaSSxL2GIQS5FlGmYj5GkvKB/DZksYHl3z1GGZ4jN2o1YzLh17r1oF8E
	syjNMi95VZbOLvNYmhIMXgtM1JdCMpeYxqu/B7eXR8oQg+riztrl8ohYc04ZYvE/GZka
	ObNg==
X-Gm-Message-State: AFeK/H17nvl/qfqel+0380xp6VVAG9i4r3Wpo6xtbBA30Bi9ngK1ItWQvlWySqYstWkDchuhhadCuC/qwrKowA==
X-Received: by 10.55.112.66 with SMTP id l63mr29995733qkc.149.1490098650919;
	Tue, 21 Mar 2017 05:17:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 21 Mar 2017 05:17:30 -0700 (PDT)
In-Reply-To: <20170321035947.13930-4-raj.khem@gmail.com>
References: <20170321035947.13930-1-raj.khem@gmail.com>
	<20170321035947.13930-4-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2017 08:17:30 -0400
Message-ID: <CADkTA4OwEoC4CMZPtFtBrsbCUq_YSKO+fcLf5gn4OjdUn0Rgmw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH 4/6] protobuf-native: Enable shared libs
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
X-List-Received-Date: Tue, 21 Mar 2017 12:17:35 -0000
Content-Type: multipart/alternative; boundary=001a114fef34c4bd4c054b3ca03b

--001a114fef34c4bd4c054b3ca03b
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-devtools/protobuf/protobuf-native_3.1.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> index 47fb401..c32f627 100644
> --- a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> +++ b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> @@ -8,14 +8,12 @@ LICENSE = "BSD-3-Clause"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
>
> -PR = "r0"
>

This is mixing changes. Either put it in the commit log, or split the
change. Either
way works for me.

We also have no justification as to why we actually want shared libs ? I'd
like
to understand why, since someone will eventually ask me :D

Bruce


> -
>  SRC_URI[md5sum] = "14a532a7538551d5def317bfca41dace"
>  SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a253
> e3f32e458c41261df51c5dbc5ad541e8f7"
>  SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.
> gz;downloadfilename=protobuf-3.1.0.tar.gz \
>         "
>
> -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> +EXTRA_OECONF += " --with-protoc=echo"
>
>  inherit native autotools
>
> --
> 2.12.0
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114fef34c4bd4c054b3ca03b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-native_3.1.0.bb</a> | 4=
 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb<=
/a> b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
index 47fb401..c32f627 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
@@ -8,14 +8,12 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>35953c752efc9299=
b184f91bef5400<wbr>95&quot;<br>
<br>
-PR =3D &quot;r0&quot;<br></blockquote><div><br></div><div>This is mixing c=
hanges. Either put it in the commit log, or split the change. Either</div><=
div>way works for me.</div><div><br></div><div>We also have no justificatio=
n as to why we actually want shared libs ? I&#39;d like</div><div>to unders=
tand why, since someone will eventually ask me :D</div><div><br></div><div>=
Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>14a532a7538551d5def317bfca41da<wbr>ce&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>0a0ae63cbffc274efb573bdde9a253<wbr>=
e3f32e458c41261df51c5dbc5ad541<wbr>e8f7&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v3.1.0.tar.gz;downloadfilename=3Dprotobuf-3.1.0.tar.gz" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.1.0=
.tar.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.1.0.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<br>
+EXTRA_OECONF +=3D &quot; --with-protoc=3Decho&quot;<br>
<br>
=C2=A0inherit native autotools<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.12.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114fef34c4bd4c054b3ca03b--
