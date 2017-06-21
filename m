Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FBA8E00BD0; Wed, 21 Jun 2017 11:26:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
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
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFD1BE00BD0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 11:26:30 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id 16so11547013qkg.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w7nq4+nLU1cZ/TvC8p1R+trPEXCeaWn3cS4dbskWP20=;
	b=uHh7kPBKD4Gq1dvRMeX6VVBHuGOeXSj3krRGpfxzluAP5gxu0q6iLCLvcIzAXEE9Lo
	ft4RqzXGt5pDclFJBRXQieRuz+WIDqv4wE9RFze8GaQ69wDyMexOwPmRBbjIDeQy1ppm
	AFXp7sTDqRhHNTZyEOLYKMlwTt0hOvy+Ql5xI+OHnT+6p90vnoAqINfBmjuqPkNT0cgw
	Xm4LYDgUr7fJ8Kzp5D4aTVSkDEBjV5ksTFxrE7ttJvQnSzNfZi6BrSBTJSsZ2O/1h4mV
	c8q4anVcp4kWvwKkM8LQODy9AOuxQofoEPegCMNq+V0oqK/fGIvL5gyi6Oj9Sq833ltY
	T6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w7nq4+nLU1cZ/TvC8p1R+trPEXCeaWn3cS4dbskWP20=;
	b=DXiDJgAgPAOKMuTd6TmukckHk+OsBq0fZBiXG3nG4PZV3qGhNwa2/tGoSOFa8u+n/b
	RK8uF+OYjNZHeh+uHWD7NzFCA/zTSdJCcy1XpoqyEbGsF7sofw08+7y4bSsk3x5ZfzS1
	F1pk/u9Y+uAOLz+Vvf3qf9MF/dB9IcUFuyvNBcUxGj9kqMuNnQd/bhLuaFqLfUF4EU/i
	H6skpqow2Yyw8C8fhcuj9jSqbEP2LZZ4a8eleiHX9QMe3BYHz5k7vbYz5yKyqw2yu7W+
	vkM7URjO1LN6/DP2bVh2W+LF9gHKpwVVB53pmo4f3vVtLkJCzmHeTbBQWv7F+B05/85D
	fo4Q==
X-Gm-Message-State: AKS2vOxutdpHBwyll43w+ddkEfv1tutlr9b4S82RCT4ZoqHgZWqw6ce4
	LTsnklwTY8q9FUQxe0CqAsOrgxq3Xw==
X-Received: by 10.55.187.196 with SMTP id l187mr42912940qkf.185.1498069590276; 
	Wed, 21 Jun 2017 11:26:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.135.172 with HTTP; Wed, 21 Jun 2017 11:26:29 -0700 (PDT)
In-Reply-To: <1497988374-10596-1-git-send-email-mark.asselstine@windriver.com>
References: <1497988374-10596-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2017 14:26:29 -0400
Message-ID: <CADkTA4Pvwd0=mf+G4Kz9Ahfu_qwpcqZRmGAEkBdjyPboW85dCA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: add missing dependencies required for ptest
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
X-List-Received-Date: Wed, 21 Jun 2017 18:26:35 -0000
Content-Type: multipart/alternative; boundary="94eb2c049334c7083605527c81fa"

--94eb2c049334c7083605527c81fa
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jun 20, 2017 at 3:52 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On a minimally provisioned rootfs the tests are currently getting
> 'stuck' after running for a few minutes because 'find' and 'which' are
> not being found. Add these to the ptest package RDEPENDS to ensure
> they are present in the rootfs.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index 6ab0c40..a17c273 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -8,7 +8,7 @@ RDEPENDS_${PN}-ptest += "\
>         python-datetime python-netclient python sed \
>         ldd perl-module-socket perl-module-carp perl-module-exporter \
>         perl-module-xsloader python-netserver python-threading \
> -       python-resource python-subprocess \
> +       python-resource python-subprocess findutils which \
>         "
>
>  S = "${WORKDIR}/git"
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

--94eb2c049334c7083605527c81fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 20, 2017 at 3:52 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On a minimally provisioned rootf=
s the tests are currently getting<br>
&#39;stuck&#39; after running for a few minutes because &#39;find&#39; and =
&#39;which&#39; are<br>
not being found. Add these to the ptest package RDEPENDS to ensure<br>
they are present in the rootfs.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index 6ab0c40..a17c273 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -8,7 +8,7 @@ RDEPENDS_${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-datetime python-netclient python sed \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldd perl-module-socket perl-module-carp perl-mo=
dule-exporter \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-xsloader python-netserver python-th=
reading \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python-resource python-subprocess \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python-resource python-subprocess findutils whi=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c049334c7083605527c81fa--
