Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 785D1E00D0C; Sun,  3 Jul 2016 21:27:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05D45E00CF0
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Jul 2016 21:27:18 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id j2so31687456qkf.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 03 Jul 2016 21:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NbnZgnJbKk06LRKDRYekxFLtUcQISfLlwvxgfBubHwY=;
	b=fAt8PVDxE1G2Y2RolwOyaHXF8xP6gwJfA3x0XQ3+hn3YwIRmTqQ6QoRKDOyRr8lPRi
	wEXk4zWXfvnO0OxiEqSKNKnxlsovlUe8tThtDmMTjSAYWWTDLPpagJTSakYtpIT0wlZR
	EQlmQ+XVnW8UIPaDzQ8v4+FGTyMOy8gRiGWFEdJriOlixHIL7vSboJT/CAQcjAOPHrEl
	O34G4eAPdoWnYv879ScUf8tOQjQX3MaFF6zGJ96RW0y/R7WWqYgc5MBjiPoaG0wJ68V0
	iT7Jy43faxcNUiYtnMjwtzEtzlNMAwjFYra0g/dcvcu/l3BVCaWqc41Lqybx50T/XAEz
	0byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NbnZgnJbKk06LRKDRYekxFLtUcQISfLlwvxgfBubHwY=;
	b=PvKkdV0nJXOfFhXAm4JEgtONwQgj8LEXraMHi03wXgL6/EWxxXUakaaPn7ZR9u5/Ag
	gVAjby2SFb8nD07lQSYT5rlxSKEQb0aWt6gc8MehFCeA2H4mCCgROAIQKEEWpCnh4sPH
	eVrI57Qm0HqEAcjCucjTKohTpuV3BWa0lp0IZD4B3YthKpne9Fm+KdKKMvvhLqPYAU8I
	S+e5ePrW3zozd55LgK7Tdwf3k0POOdg5QvB6NdDNTRaiEGZrLDkD9hP3k3i/vJltuQyn
	mplLlrNeD5rSTd3VHx6dAXK/TuJ03PjP4c6QxtguqHE6B1fw/NtelILBxAik5QDgvzCc
	WiUg==
X-Gm-Message-State: ALyK8tLScOqYVaHkUQJN6Al/73zRsfRGifeJY6kg9P2VHdGiMYvDoYrQvjIsLKNMmm8UydW6ztN/d88L0dhv9Q==
X-Received: by 10.55.17.137 with SMTP id 9mr13423307qkr.36.1467606437517; Sun,
	03 Jul 2016 21:27:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Sun, 3 Jul 2016 21:27:16 -0700 (PDT)
In-Reply-To: <1466720221-32248-1-git-send-email-cjp256@gmail.com>
References: <1466720221-32248-1-git-send-email-cjp256@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Jul 2016 00:27:16 -0400
Message-ID: <CADkTA4PruC6EEO8jiP2jiit5vXL-emYsjHOJpsKzTwj9njAMNQ@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] base-files: remove bbappend hacking on fstab
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
X-List-Received-Date: Mon, 04 Jul 2016 04:27:21 -0000
Content-Type: multipart/alternative; boundary=001a11474f9860de9b0536c7c0d2

--001a11474f9860de9b0536c7c0d2
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Jun 23, 2016 at 6:17 PM, Chris Patterson <cjp256@gmail.com> wrote:

> From: Chris Patterson <pattersonc@ainfosec.com>
>
> This approach breaks images which have Xen in DISTRO_FEATURES,
> but are not booting under Xen (and mounting /proc/xen fails).
>
> xencommons, xendriverdomain, or proc-xen.mount should take care of
> mounting /proc/xen.
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  recipes-core/base-files/base-files_3.%.bbappend | 5 -----
>  1 file changed, 5 deletions(-)
>  delete mode 100644 recipes-core/base-files/base-files_3.%.bbappend
>
> diff --git a/recipes-core/base-files/base-files_3.%.bbappend
> b/recipes-core/base-files/base-files_3.%.bbappend
> deleted file mode 100644
> index eb973ad..0000000
> --- a/recipes-core/base-files/base-files_3.%.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -do_install_append() {
> -       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> -               echo "xenfs                /proc/xen            xenfs
> defaults              0  0" >> ${D}${sysconfdir}/fstab
> -       fi
> -}
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

--001a11474f9860de9b0536c7c0d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jun 23, 2016 at 6:17 PM=
, Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com"=
 target=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">From: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ain=
fosec.com">pattersonc@ainfosec.com</a>&gt;<br>
<br>
This approach breaks images which have Xen in DISTRO_FEATURES,<br>
but are not booting under Xen (and mounting /proc/xen fails).<br>
<br>
xencommons, xendriverdomain, or proc-xen.mount should take care of<br>
mounting /proc/xen.<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.co=
m">pattersonc@ainfosec.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/base-files/base-files_3.%.bbappend | 5 -----<br>
=C2=A01 file changed, 5 deletions(-)<br>
=C2=A0delete mode 100644 recipes-core/base-files/base-files_3.%.bbappend<br=
>
<br>
diff --git a/recipes-core/base-files/base-files_3.%.bbappend b/recipes-core=
/base-files/base-files_3.%.bbappend<br>
deleted file mode 100644<br>
index eb973ad..0000000<br>
--- a/recipes-core/base-files/base-files_3.%.bbappend<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo &quot;${DISTRO_FEATURES}&quot; | grep -=
q &#39;xen&#39;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;xenfs=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /proc/xen=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xenfs=C2=A0 =C2=A0 =C2=A0 defaults=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 0&quot; &gt;&gt; ${D}${sysco=
nfdir}/fstab<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a11474f9860de9b0536c7c0d2--
