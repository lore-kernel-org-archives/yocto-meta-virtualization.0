Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22390E00529; Thu, 17 Nov 2016 10:07:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.196 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73E02E004E5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Nov 2016 10:07:22 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id n34so14974682qtb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Nov 2016 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gtmUytIsdAga62J94a3Oh8NiDqve5RpTQdkDE/5H+EE=;
	b=JZjI6ZcvM6Iqhxwc/tQXmUmDslZCiaskzi6CUF7hUQ/rhGVv4m4KZVqu9dcY9QBdCd
	D1BIfW9t1GY3bK/rIrwpE+Vow15nDuKxhWCeIu7Ho93Fr5F6BlZ6xGSdd855hIdPsZLz
	6ZMxNPTpbnqJVk7dG0/J7iD6mvBh9iwUT3OekIS77gNFqt1N0OcquQXLgbIPD2o7eP1R
	gNqpHwHh76pecuX7ahjGjoovnd2c/kIyprz+cqNcuq2p8TE3KHgxYBU/+3PH2uM+BRwb
	wbl3WOneT8PsflY4v5Z9IZA0zshvtjUStYGbL3Tz4wkYhsI3QVD/+L1Wpb77T/7mktKr
	fRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gtmUytIsdAga62J94a3Oh8NiDqve5RpTQdkDE/5H+EE=;
	b=Yz2dY9Qb6/W1oRb3npLkp/NWNpC9uh/G06g6PkqzxhILBzFWR8ElaIKse0gIiggbf6
	3skiYHQ67ZW5EC2kiJgPQ4VgeETwkt8KzUebxnuO0Md57OANDY8tDdWqdWRC67+pObiu
	f4DPGeW/KginJ+0J8h+JyhtwKAePi0UocGm0ayJHlk3YcnydrJ4bInykoeEzE4bXjcpn
	jVFtw6hXysC33pcAd/aY/hKhCN9sWjIGhUaV6BBsb2m37J9idsoOfLS8tB1I3V1GPOlI
	7QdcZfo/aciUDPKND0kwsyVkjGbvNFEt+bSvcoPaBdUeXdLObB/8U/5LKaWwyia/+hRM
	AKtA==
X-Gm-Message-State: AKaTC018EbrkhLA47h6mUjkIXUmGxULpU3zDw5VWz/uEyYdngt+5xsI4csyAO+iorcvYrPzBR+8mI8TBiKuB2A==
X-Received: by 10.200.54.157 with SMTP id a29mr3040823qtc.172.1479406041274;
	Thu, 17 Nov 2016 10:07:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Thu, 17 Nov 2016 10:07:20 -0800 (PST)
In-Reply-To: <1479326189-19985-1-git-send-email-mark.asselstine@windriver.com>
References: <1479326189-19985-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Nov 2016 13:07:20 -0500
Message-ID: <CADkTA4O-vWKnckSrb7MNGeKqKjZsdLrUqpryFUdY72-EHKU-vg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: add 'wireshark' packageconfig
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
X-List-Received-Date: Thu, 17 Nov 2016 18:07:24 -0000
Content-Type: multipart/alternative; boundary=001a11420ee291a2110541830f8b

--001a11420ee291a2110541830f8b
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Nov 16, 2016 at 2:56 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> libvirt by default has '--with-wireshark-dissector' set to
> 'check'. Therefor if wireshark is built before vs after libvirt this
> will result in a potentially unexpected difference in how libvirt is
> configured. Additionally the build of libvirt with wireshark
> capabilities enabled is currently broken and thus if attempted will
> result in the error:
>
> fatal error: ws_symbol_export.h: No such file or directory
>
> To prevent the random configuration of libvirt with respect to
> wireshark we add a new packageconfig for wireshark.
>
> NOTE that the wireshark recipe is currently incomplete so this new
> packageconfig will result in a build failure if used, until wireshark
> is updated to build libwsutil.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index fad5632..c848c99 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -208,6 +208,7 @@ PACKAGECONFIG[numactl] = "--with-numactl,--without-
> numactl,numactl,"
>  PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
>  PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
>  PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
> +PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--
> without-wireshark-dissector,wireshark libwsutil,"
>
>  # Enable the Python tool support
>  require libvirt-python.inc
> --
> 2.7.4
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11420ee291a2110541830f8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Wed, Nov 16, 2016 at 2:56 PM, M=
ark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@wind=
river.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">libvirt by default has &#39;--with-=
wireshark-dissector&#39; set to<br>
&#39;check&#39;. Therefor if wireshark is built before vs after libvirt thi=
s<br>
will result in a potentially unexpected difference in how libvirt is<br>
configured. Additionally the build of libvirt with wireshark<br>
capabilities enabled is currently broken and thus if attempted will<br>
result in the error:<br>
<br>
fatal error: ws_symbol_export.h: No such file or directory<br>
<br>
To prevent the random configuration of libvirt with respect to<br>
wireshark we add a new packageconfig for wireshark.<br>
<br>
NOTE that the wireshark recipe is currently incomplete so this new<br>
packageconfig will result in a build failure if used, until wireshark<br>
is updated to build libwsutil.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_1.3.5.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
index fad5632..c848c99 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
@@ -208,6 +208,7 @@ PACKAGECONFIG[numactl] =3D &quot;--with-numactl,--witho=
ut-<wbr>numactl,numactl,&quot;<br>
=C2=A0PACKAGECONFIG[fuse] =3D &quot;--with-fuse,--without-fuse,<wbr>fuse,&q=
uot;<br>
=C2=A0PACKAGECONFIG[audit] =3D &quot;--with-audit,--without-audit,<wbr>audi=
t,&quot;<br>
=C2=A0PACKAGECONFIG[libcap-ng] =3D &quot;--with-capng,--without-capng,<wbr>=
libcap-ng,&quot;<br>
+PACKAGECONFIG[wireshark] =3D &quot;--with-wireshark-dissector,--<wbr>witho=
ut-wireshark-dissector,<wbr>wireshark libwsutil,&quot;<br>
<br>
=C2=A0# Enable the Python tool support<br>
=C2=A0require libvirt-python.inc<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a11420ee291a2110541830f8b--
