Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85D55E00CA7; Mon, 21 May 2018 19:09:11 -0700 (PDT)
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
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12C5CE00CA4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 19:09:09 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id u140-v6so14426365lff.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aDtqpNgc5PhQuhPd7mNHy85dLYZ3A7CIe/FTI1jEzT8=;
	b=WXvRTevzDPXRapLBfQvswjac4rARxLDE1nNx5lmDSZHLRsrfHWZTh+qw6v0XMmKG5c
	pIQ22p0Wj9xYUWhIBI0HlIlUftw/QMFOCcm23KFqrCSEQMq32tueoqtIQx7KLAVbnyEA
	fmspN2E+3XR19irGfQw3jxdRzsT/v7KJSNI6yKiJwXr7i1HgyIdwhN1TguE0LUkVnioL
	nbmanL30GFio8nPMI9YHhPtCbXHCf90y9WQ0lN2rgeQGHx+F4pwC84FvJ4GTEMUC5sZe
	YpzZrlyuhHW4qDXes0J6Pev8MLpEsStsFMeYWEMRVxyrQeG3NXk4MPBGLua5x4BL923N
	LwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aDtqpNgc5PhQuhPd7mNHy85dLYZ3A7CIe/FTI1jEzT8=;
	b=DFiL9gdJQlDABdkm/AZaa55U1gJYXHdveXKaieAKK4TVkMGx3S2tIXNyMOoAk2HAym
	NYyvjG9b9egW4BGzeQNNjBimXuRUk3XIEw1ODiI/dFsG+hYuECTYaOF+ZO9qpBAwbI3Q
	k3XlIIXtnGe/vZxSqxryHmVum7kKSuwHvoLiZA3+xFa5a7jYoeSUHXe6FYadCCrm/aW1
	7N5ofTthaN/x7mPdmJnQtFdyvVS+Ivre8wDEBz2zh6BhwPso+cLaAORSGZElq1KXMoj9
	Ko6Rb5hVx/LQsaG0nK5MIItEWQbi+Jl4XBjAQ1ZGocM8AHeY9ELzPofxToa5/OuS8pkE
	pK3Q==
X-Gm-Message-State: ALKqPwfKhXnIlj7X4dkvHLNAv+dgt3rIvC/sXhSJJM5XbTpOx84+N6Di
	daleZgB4duiZy7eWUrRZsuykzB+WOX4WAkCBfS8=
X-Google-Smtp-Source: AB8JxZrKGtueUcbKqYBTTKIA2XnC151GwsFcCcI4Hid8IaaXpz154BOVYNDjV3kn1aHedSen2ToU/Xv3w+Jo4IKLfHA=
X-Received: by 2002:a2e:8350:: with SMTP id
	l16-v6mr13295393ljh.28.1526954948651; 
	Mon, 21 May 2018 19:09:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Mon, 21 May 2018 19:09:08 -0700 (PDT)
In-Reply-To: <1526041972-30695-1-git-send-email-cjp256@gmail.com>
References: <1526041972-30695-1-git-send-email-cjp256@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 May 2018 22:09:08 -0400
Message-ID: <CADkTA4MsGgLQuaGTfD5cNQwU1sOAxEAEMw-ULCbzBd_1TQO-Nw@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] xen: add xendriverdomain systemd unit to devd
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
X-List-Received-Date: Tue, 22 May 2018 02:09:11 -0000
Content-Type: multipart/alternative; boundary="0000000000004d6f45056cc1e7c3"

--0000000000004d6f45056cc1e7c3
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, May 11, 2018 at 8:32 AM, Chris Patterson <cjp256@gmail.com> wrote:

> From: Chris Patterson <pattersonc@ainfosec.com>
>
> Matches sysvinit packaging.
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  recipes-extended/xen/xen.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 8dfe589..cadbd78 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -438,6 +438,7 @@ FILES_${PN}-cpuid = "\
>
>  FILES_${PN}-devd = "\
>      ${sysconfdir}/init.d/xendriverdomain \
> +    ${systemd_unitdir}/system/xendriverdomain.service \
>      "
>
>  FILES_${PN}-flask = "\
> @@ -778,7 +779,8 @@ INITSCRIPT_NAME_${PN}-devd = "xendriverdomain"
>  INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
>
>  # systemd packages
> -SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
> +SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains
> ${PN}-devd"
> +SYSTEMD_SERVICE_${PN}-devd = "xendriverdomain.service"
>  SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
>  SYSTEMD_SERVICE_${PN}-xencommons = " \
>      proc-xen.mount \
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

--0000000000004d6f45056cc1e7c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Fri, May 11, 2018 at 8:32 AM,=
 Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" =
target=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">From: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainf=
osec.com">pattersonc@ainfosec.com</a>&gt;<br>
<br>
Matches sysvinit packaging.<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.co=
m">pattersonc@ainfosec.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 8dfe589..cadbd78 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -438,6 +438,7 @@ FILES_${PN}-cpuid =3D &quot;\<br>
<br>
=C2=A0FILES_${PN}-devd =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/<wbr>xendriverdomain \<br>
+=C2=A0 =C2=A0 ${systemd_unitdir}/system/<wbr>xendriverdomain.service \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-flask =3D &quot;\<br>
@@ -778,7 +779,8 @@ INITSCRIPT_NAME_${PN}-devd =3D &quot;xendriverdomain&qu=
ot;<br>
=C2=A0INITSCRIPT_PARAMS_${PN}-devd =3D &quot;defaults 82&quot;<br>
<br>
=C2=A0# systemd packages<br>
-SYSTEMD_PACKAGES =3D &quot;${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendo=
mains&quot;<br>
+SYSTEMD_PACKAGES =3D &quot;${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendo=
mains ${PN}-devd&quot;<br>
+SYSTEMD_SERVICE_${PN}-devd =3D &quot;xendriverdomain.service&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-xen-<wbr>watchdog =3D &quot;xen-watchdog.servic=
e&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-<wbr>xencommons =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0proc-xen.mount \<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br>
2.1.4<br>
<br>
-- <br>
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

--0000000000004d6f45056cc1e7c3--
