Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B66CBE00867; Tue, 21 Mar 2017 05:17:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
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
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.196 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66D4CE00726
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:17:45 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id r45so21009540qte.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x2YojcMaEHChFB6qX0Qtf/bJKubCjgjrVWVowU8grFs=;
	b=ECz29BRFbfz62mXpS5EKHarwd0pNfP5zPQ4RyUxs1hGPxMOYP1aRoIWDtc5cvhSuHK
	2IIkILjz8F6ZeRmFyW/gzQ0ePEGM8VToNXpP6ipG/wui7FU0qSoftZ+lVJuz9bwvFTkE
	9NGZ+bTgAFVs68zT12/RNk/QjMnYX4FW0C1xbbnUaabOMM0fl0GqVLObGmRwZsd9RR5c
	F7X/PWRnMQklnvRQtzH0pH0G5LHh7yxiE75K8LIc2NfNJiZG6SkuY3G45ETbwGNGb30/
	Zp6a2Ii/E43yXp7mo/R9RoWxp/qOklYHMlSUzcDPUhB/MFiGkxJZ6sdUQH2mTUVl5KFk
	H3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x2YojcMaEHChFB6qX0Qtf/bJKubCjgjrVWVowU8grFs=;
	b=GRbQxM7HiK2aEHi2U+Kv4/VHM3fvLOnuViX1QKDIwW4X2bwSCPTF3iy5mjTHwh9Z0I
	rsb/dAs1fsOLp0jmcgO7UoJM329RzNz49M53EYRajlv6f7rKpN7MGYy3D/gGi/EaLZKE
	xWDhXiwc3as903GXv+yj/vcUoA3a3g2Mw5xzdbiaG/KXZXT3UhgL4r1epgvG7wcK2hVq
	f6aGR6GDTxdiOXM750U5hkr+DFc77si4jRAGC+EtrtLtYRAB21QqNCc08StncUcuHx9b
	XMfbGY93fjMjMk+ULsKSL/hfpvuZMIvkwDWviAPlH0n6NvBJhaDvNxDeL/36tqxuZee5
	eWug==
X-Gm-Message-State: AFeK/H20axTHTsiyxH0X3dXagHtaoGVpeTRL2IkunD8TLVR7jrsOjL74EExI3sgsrGtqWFOvb33SsYa8K6lAtw==
X-Received: by 10.200.35.195 with SMTP id r3mr33753685qtr.282.1490098665080;
	Tue, 21 Mar 2017 05:17:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 21 Mar 2017 05:17:44 -0700 (PDT)
In-Reply-To: <20170321035947.13930-3-raj.khem@gmail.com>
References: <20170321035947.13930-1-raj.khem@gmail.com>
	<20170321035947.13930-3-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2017 08:17:44 -0400
Message-ID: <CADkTA4MGjEQ3dfbDxKGoJoLosC_B9XUA8McgWa9mCCy8S8KNwA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH 3/6] seabios: Its x86 only package
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
X-List-Received-Date: Tue, 21 Mar 2017 12:17:46 -0000
Content-Type: multipart/alternative; boundary=001a1142c1769cddbb054b3ca189

--001a1142c1769cddbb054b3ca189
Content-Type: text/plain; charset=UTF-8

Staged.

Bruce

On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-extended/seabios/seabios_1.9.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/seabios/seabios_1.9.1.bb
> b/recipes-extended/seabios/seabios_1.9.1.bb
> index 88f2963..5c095ac 100644
> --- a/recipes-extended/seabios/seabios_1.9.1.bb
> +++ b/recipes-extended/seabios/seabios_1.9.1.bb
> @@ -23,6 +23,8 @@ TUNE_CCARGS = ""
>  EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
>  EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
>
> +COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
> +
>  do_configure() {
>      oe_runmake defconfig
>  }
> --
> 2.12.0
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142c1769cddbb054b3ca189
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Staged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Mar 20, 2017 at 11:59 P=
M, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">seabi<wbr>os_1.9.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" r=
el=3D"noreferrer" target=3D"_blank">sea<wbr>bios_1.9.1.bb</a> b/recipes-ext=
ended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"noreferrer" target=
=3D"_blank">sea<wbr>bios_1.9.1.bb</a><br>
index 88f2963..5c095ac 100644<br>
--- a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">sea<wbr>bios_1.9.1.bb</a><br>
+++ b/recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">sea<wbr>bios_1.9.1.bb</a><br>
@@ -23,6 +23,8 @@ TUNE_CCARGS =3D &quot;&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;HOSTCC=3D&#39;${BUILD_CC}&#39;&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;CROSS_PREFIX=3D${TARGET_PREFIX}<wbr>&quot;<br=
>
<br>
+COMPATIBLE_HOST =3D &quot;(i.86|x86_64).*-linux&quot;<br>
+<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake defconfig<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a1142c1769cddbb054b3ca189--
