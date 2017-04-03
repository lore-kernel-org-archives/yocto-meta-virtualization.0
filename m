Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7885AE00AD0; Mon,  3 Apr 2017 04:11:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3141BE00A9A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 04:11:38 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id p22so18714343qka.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Apr 2017 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KKt/eS24k7XR+t4eL8y7mUPfFnX6m1nEtUNKs77xvDs=;
	b=mNciZYP1pvNMkXgScLZYl7PAyAfO+9R6ibahxiGiqTHZGoFEPEhXFsVeEVJyFOqyst
	Y6g5MgoU8yrtUU0Y4fHKOXzPjw9wBmV+BTOPsfvRNV2eH65PTCUfvt6oBeztgg7yIXZP
	1tsMD5uTnIDMYLOkajHSlpU1C8XrgWpb6QTtLnZqbtD44lJhK6sR8aJCLhKZ+I8T9Omj
	npf+AFgo9sg+5RQLZnH4JDa/RA69ITqABCj2HJxm+6rPqcTNZ98I5hqqDTKlW1xhamzY
	jl7RPvrJ+T5TpX1PfRQpasNdJyvDq/ESND5aCbP1I86R1/KkT2CohGktFAmwl7MLTp48
	efBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KKt/eS24k7XR+t4eL8y7mUPfFnX6m1nEtUNKs77xvDs=;
	b=txbUdRI5IP8OdWfpq7cJxxfwLshEkUNvHfw6D25z43BKdy4/SE3o0Mv/fNgzT5/e6y
	9uVatJlP+B9ulAKkeYE2/cLrl7xj1hOvB67HjkKBBPPRYie7A17MRaW0haE1FM+13Vfz
	bjoIG33YbIuP8Rf4EKuE+TOXd26EhqNauIgE6HZOunpOW2MJKC5/hzqs7JJBDXxSUKtd
	SW/0UBUUvcUmd3Kd1d1guPptnn0Dxhs2JDeUgr5F8M8yX437RHkSDm4gD3tu5s266sT9
	UlRpDeJbGMTklj3OxJs/EOMACCniQrHQov/DmTcuk+5xQEaxzBtaOqavelu9VsqnjIGC
	hMHw==
X-Gm-Message-State: AFeK/H1oe41uJLdom5ucnZ3tvMJpqn0xLG4XOz3hcuut9uiZe6pknm1UpW/y62Mw9wyXXEs/YToGAnggPiSx1w==
X-Received: by 10.233.221.196 with SMTP id r187mr14748375qkf.56.1491217898202; 
	Mon, 03 Apr 2017 04:11:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Mon, 3 Apr 2017 04:11:37 -0700 (PDT)
In-Reply-To: <20170403102713.1536-4-pbarker@toganlabs.com>
References: <20170403102713.1536-1-pbarker@toganlabs.com>
	<20170403102713.1536-4-pbarker@toganlabs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Apr 2017 07:11:37 -0400
Message-ID: <CADkTA4PkyDoWF5YivohNMSqkQyqaDusb799HQ8Rsti=QmQP+pg@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: Paul Barker <paul@paulbarker.me.uk>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] runc-opencontainers: Drop unnecessary branch spec from SRC_URI
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
X-List-Received-Date: Mon, 03 Apr 2017 11:11:41 -0000
Content-Type: multipart/alternative; boundary=94eb2c042efa1b018e054c41395e

--94eb2c042efa1b018e054c41395e
Content-Type: text/plain; charset=UTF-8

unnecessary, but I prefer it. since we are not always on master for
this recipe.

I'll test the rest of the series, but I'll pass on this patch.

Bruce

On Mon, Apr 3, 2017 at 6:27 AM, Paul Barker <pbarker@toganlabs.com> wrote:

> From: Paul Barker <paul@paulbarker.me.uk>
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
> b/recipes-containers/runc/runc-opencontainers_git.bb
> index 4a6e8cd..139e3bd 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,8 +1,7 @@
>  include runc.inc
>
>  SRCREV = "75f8da7c889acc4509a0cf6f0d3a8f9584778375"
> -SRC_URI = "git://github.com/opencontainers/runc;branch=master \
> -          "
> +SRC_URI = "git://github.com/opencontainers/runc"
>  RUNC_VERSION = "1.0.0-rc3"
>  PROVIDES += "virtual/runc"
>  RPROVIDES_${PN} = "virtual/runc"
> --
> 2.11.0
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

--94eb2c042efa1b018e054c41395e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">unnecessary, but I prefer it. since we are not always on m=
aster for<div>this recipe.</div><div><br></div><div>I&#39;ll test the rest =
of the series, but I&#39;ll pass on this patch.</div><div><br></div><div>Br=
uce<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Ap=
r 3, 2017 at 6:27 AM, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mailto:p=
barker@toganlabs.com" target=3D"_blank">pbarker@toganlabs.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">From: Paul Barker &lt;<a href=3D=
"mailto:paul@paulbarker.me.uk">paul@paulbarker.me.uk</a>&gt;<br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pau=
l@paulbarker.me.uk</a>&gt;<br>
---<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc-<wbr>opencontainers_git.bb</a> |=
 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_=
git.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_git.b=
b</a> b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.b=
b" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_git.bb</a>=
<br>
index 4a6e8cd..139e3bd 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_git.bb</a><b=
r>
+++ b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_git.bb</a><b=
r>
@@ -1,8 +1,7 @@<br>
=C2=A0include runc.inc<br>
<br>
=C2=A0SRCREV =3D &quot;<wbr>75f8da7c889acc4509a0cf6f0d3a8f<wbr>9584778375&q=
uot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/runc;b=
ranch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>openco=
ntainers/runc;branch=3D<wbr>master</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/runc" =
rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>opencontainers/runc</a=
>&quot;<br>
=C2=A0RUNC_VERSION =3D &quot;1.0.0-rc3&quot;<br>
=C2=A0PROVIDES +=3D &quot;virtual/runc&quot;<br>
=C2=A0RPROVIDES_${PN} =3D &quot;virtual/runc&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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
</div></div></div>

--94eb2c042efa1b018e054c41395e--
