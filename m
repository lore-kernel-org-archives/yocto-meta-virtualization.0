Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02FE2E00C9F; Tue, 29 Aug 2017 05:44:11 -0700 (PDT)
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
	*      [209.85.217.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A98FFE00C94
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:44:09 -0700 (PDT)
Received: by mail-ua0-f195.google.com with SMTP id 104so1372031uas.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w9FRjxPrT/yGAToeD42PfxEA2ydv95pAF8kHoH+6rL0=;
	b=j2/RALo1PTWs45jtg3qQ9pEeFgMQtkf6pVOwJT6mbmxqJ6IUatrwpagUQGihm5eSoM
	QZvfRYMhdDOgBUzOECQmaDORaZI3IKzD7KMygdTJuUfUCZt7pJ90V8L8SgprEPmxsTyW
	pfNhBut8mo8xdXVOPjDjvOR1H2cvP8gpmzHUTSCOA9ftnVx1hJuS7z1dYvXDpolMDkLS
	ryfs3qKLYuMgav6d/SxtqL/Z9mjAoM1h0XE4zAf5kUVOQWD21ROsezD/qOu1ch+OB4LF
	h0K9m3A/IsYswTNsCQY8EZOXU+ZuM1BMI+9+e2pAzynyFhff+pSKrwddKfh4dq7CSacw
	GW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w9FRjxPrT/yGAToeD42PfxEA2ydv95pAF8kHoH+6rL0=;
	b=icAAaT1t4UUqtfETnRi8oequBY2Ns6RrhhBswv2AzRVZTX8IK3lPfmJfbooqTyPZLG
	q16JQZgL4nDBL23D3DBTx9QaxeGUxaGSNMH54g2rw3ZQ2IpenF1rY9qKolA9xPSAtnuT
	5JMUbB/ZVqKsA0e/iOfhg/QNHtu9nGSQYjixwafi7FQHNL+Q/ry8WmGYpdy+5Kq9W+lP
	lNTGLkZ2XIc5f/0UKnI5dbDnUmUrgs/Gbv1yY6AcQtW/MzXhpFOEfH1mRmTb2PtV5KCq
	gPgliDzzmAtsdi011geoDiaSgqg7rBec5EsJvoBNWXktVjb4pP/ZTSR1BYhCz8HrcifW
	/ClA==
X-Gm-Message-State: AHYfb5i6cyrj8ufpopYSClfwWrLPAy3mVCtVRoae1MkiGzTTxSXBLniv
	l502lUvlo1RiPgIyMyD/AGHUy2HNzg==
X-Received: by 10.176.7.214 with SMTP id d22mr116682uaf.71.1504010648670; Tue,
	29 Aug 2017 05:44:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 29 Aug 2017 05:44:08 -0700 (PDT)
In-Reply-To: <1503711892-25162-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503711892-25162-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Aug 2017 08:44:08 -0400
Message-ID: <CADkTA4P9AmLbD41mBfSj7fmYMMnEiFpGBCN00MDHUJkJ5LCSsw@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH] xen: Only generate long-double-32.h if absent
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
X-List-Received-Date: Tue, 29 Aug 2017 12:44:11 -0000
Content-Type: multipart/alternative; boundary="f403045f81f873d95f0557e3c4cf"

--f403045f81f873d95f0557e3c4cf
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Aug 25, 2017 at 9:44 PM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.clark6@baesystems.com>
>
> Only copy long-double-64.h to create long-double-32.h if it is not
> already present.
>
> Compile tested with both ARM 32-bit build and x86 64-bit build.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>
> In fixing the 64-bit clean build, long-double-32.h was populated from
> the available long-double-64.h . Unfortunately this broke the 32-bit
> build where long-double-32.h is already present and long-double-64.h
> is not.
>
>  recipes-extended/xen/xen.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index b429c81..ab69987 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -912,7 +912,9 @@ do_configure() {
>
>      # do configure
>      oe_runconf
> -    cp ${STAGING_INCDIR}/bits/long-double-64.h
> ${STAGING_INCDIR}/bits/long-double-32.h
> +    if [ ! -e ${STAGING_INCDIR}/bits/long-double-32.h ]; then
> +        cp ${STAGING_INCDIR}/bits/long-double-64.h
> ${STAGING_INCDIR}/bits/long-double-32.h
> +    fi
>  }
>
>  do_compile() {
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

--f403045f81f873d95f0557e3c4cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Aug 25, 2017 at 9:44 PM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" t=
arget=3D"_blank">christopher.w.clark@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">From: Christopher Clark &lt;<a href=3D"mailto:c=
hristopher.clark6@baesystems.com">christopher.clark6@<wbr>baesystems.com</a=
>&gt;<br>
<br>
Only copy long-double-64.h to create long-double-32.h if it is not<br>
already present.<br>
<br>
Compile tested with both ARM 32-bit build and x86 64-bit build.<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
---<br>
<br>
In fixing the 64-bit clean build, long-double-32.h was populated from<br>
the available long-double-64.h . Unfortunately this broke the 32-bit<br>
build where long-double-32.h is already present and long-double-64.h<br>
is not.<br>
<br>
=C2=A0recipes-extended/xen/xen.inc | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index b429c81..ab69987 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -912,7 +912,9 @@ do_configure() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# do configure<br>
=C2=A0 =C2=A0 =C2=A0oe_runconf<br>
-=C2=A0 =C2=A0 cp ${STAGING_INCDIR}/bits/long-<wbr>double-64.h ${STAGING_IN=
CDIR}/bits/long-<wbr>double-32.h<br>
+=C2=A0 =C2=A0 if [ ! -e ${STAGING_INCDIR}/bits/long-<wbr>double-32.h ]; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_INCDIR}/bits/long-<wbr>double-64.=
h ${STAGING_INCDIR}/bits/long-<wbr>double-32.h<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
=C2=A0do_compile() {<br>
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

--f403045f81f873d95f0557e3c4cf--
