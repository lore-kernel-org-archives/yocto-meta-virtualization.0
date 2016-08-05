Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C146E00E0F; Thu,  4 Aug 2016 18:46:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
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
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07B43E00E29
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Aug 2016 18:46:23 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id x67so4523057qke.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 04 Aug 2016 18:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vmDVNOgZ1y0/VUpxqlHpsnhIxVU7V3ee/O0uxwq7K78=;
	b=WJWPVTI0qsehcM73PeHX33nRsaXQpFUgkg6LrwFmhfsUiE2GD9Ovd4S1Vzq30Uu8wg
	gz3/VbAiNupTvj86cHkZsfsG3MIHOxFqi8QwzCOzWWjGVYnd932CPnZEh7RHLkK/0DWO
	xcWnO0ObmHSDCxiPWr0TWQXBIZxaqXnqtM4tgTEoWFR2GaThpE0cqZ/BSAzquVfxbCTv
	4DBoO0Ho3VzHmIfnax3V+udbYrNfEsvkGceh1O9rkgPxY+rZdLMuQO95oKKC/vXKwOjV
	9wa4bKyL+dmJqsuIB6HqqEbC+gljAVONn9gWdEETnCL1dhmaiymG+Bnw2T9W0puYp/wO
	F57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vmDVNOgZ1y0/VUpxqlHpsnhIxVU7V3ee/O0uxwq7K78=;
	b=EnXxQqX7IQ1Hvfcq6+prA47IUXKI5uGCtdH7znkh+F8LdXHiYaeIrENXZvYf8p7+Tb
	TJs2+4mfHTuF9b/0GYDv01qFEy5NnHY5ApoWX6zH/KyjQZ3QFT508Y/ptoGRT38LTXgK
	Q1hFEc3fpm8zn5o5xxG0xxG99jtYRIW1Y20ocJ329D6X6loU0U4xSlN4i/zHOckGH3Tz
	sOTTWVDVcYvcAa/GA+1tyiPNJR7eJMPh8npL4YAvY6fxsY4Fyg8E4g1p+qmcc2zGeIny
	N2skXNgNwearxQBgfO+axyurqT2Bjsf32YAPA6zOeXh87GiA3NL3NQ0fz7kVzy7LHSl/
	R/Tg==
X-Gm-Message-State: AEkooutUjA9HFUSHBVpRCHWlxpqSg5MZtNfX0Q/KJFP74AFvzU5+KpVsRXtF85Kk3mcLmRfT8M3Azi5E3+VQWA==
X-Received: by 10.55.122.65 with SMTP id v62mr10230581qkc.120.1470361583496;
	Thu, 04 Aug 2016 18:46:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Thu, 4 Aug 2016 18:46:22 -0700 (PDT)
In-Reply-To: <1470027611-26666-1-git-send-email-jpuhlman@mvista.com>
References: <1470027611-26666-1-git-send-email-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Aug 2016 21:46:22 -0400
Message-ID: <CADkTA4N-G8LmOm8-tyE-35spv+oH=mEE66q=Ht8rqPZZokwNTg@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fix python install in multilib case.
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
X-List-Received-Date: Fri, 05 Aug 2016 01:46:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c05e0ece035220539493be8

--94eb2c05e0ece035220539493be8
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, Aug 1, 2016 at 1:00 AM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> Currently libvirt python builds in the multilib case, but fails to
> install. Switch from PN to BPN, and fix compile to be consistent.
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index 405d5f7..7a7a4cc 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -42,14 +42,14 @@ python __anonymous () {
>
>  do_compile_append() {
>         if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
> -               cd ${WORKDIR}/libvirt-python-${PV} && \
> +               cd ${WORKDIR}/${BPN}-python-${PV} && \
>                   ${STAGING_BINDIR_NATIVE}/python-native/python setup.py
> build
>         fi
>  }
>
>  do_install_append() {
>         if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
> -               cd ${WORKDIR}/${PN}-python-${PV} && \
> +               cd ${WORKDIR}/${BPN}-python-${PV} && \
>                   ${STAGING_BINDIR_NATIVE}/python-native/python setup.py
> install \
>                         --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}
> ${LIBVIRT_INSTALL_ARGS}
>         fi
> --
> 2.6.2
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

--94eb2c05e0ece035220539493be8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, Aug 1, 2016 at 1:00 AM, Je=
remy Puhlman <span dir=3D"ltr">&lt;<a href=3D"mailto:jpuhlman@mvista.com" t=
arget=3D"_blank">jpuhlman@mvista.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Currently libvirt python builds in the multilib case, but=
 fails to<br>
install. Switch from PN to BPN, and fix compile to be consistent.<br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc<br>
index 405d5f7..7a7a4cc 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -42,14 +42,14 @@ python __anonymous () {<br>
<br>
=C2=A0do_compile_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${LIBVIRT_PYTHON_ENABLE}&quot; =3D &=
quot;1&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/libvi=
rt-python-${PV} &amp;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/${BPN=
}-python-${PV} &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${STAGING_BI=
NDIR_NATIVE}/python-native/python setup.py build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${LIBVIRT_PYTHON_ENABLE}&quot; =3D &=
quot;1&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/${PN}=
-python-${PV} &amp;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/${BPN=
}-python-${PV} &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${STAGING_BI=
NDIR_NATIVE}/python-native/python setup.py install \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTAL=
L_ARGS}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.6.2<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c05e0ece035220539493be8--
