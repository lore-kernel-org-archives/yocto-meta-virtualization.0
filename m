Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D0BBE00C9F; Tue, 29 Aug 2017 05:44:21 -0700 (PDT)
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
	*      [209.85.217.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8711FE00CA2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:44:20 -0700 (PDT)
Received: by mail-ua0-f169.google.com with SMTP id y50so9848558uay.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3t/Gv0kk9rWAGa5uMngKFfg9GguolKRLSO3tjaFVUs4=;
	b=soYWvDZG65tbOWBdASDYdO6eOYUcls17GvPRAYtPfG69EIT2m5VGTiTDF+w1teYxyp
	HaLPGy50y6tZPMg7bkGqx9B5Kk+6s/ytO3j0qW0WBtIp30iukOWYwyN3exkjV6gh7KST
	Hagw5owHq2cVG/OcJDhPGd2QOj1Mepy4BxDIkakc3FrZTfDF4P8swUIVLA6rhQUOXjE9
	sqLIKlVTbwAqTK6flMCkn7YSeCNsdJBsHG9ZYCrHRshDbkjBM7fb/Xr4eZaRryEhOAEc
	9c0Bnk4Vw+6/EE8lNImmkoWdv/W/BxBWycOxhBt5O2V3QQS/9URLt7yd3SG5IqZfImaG
	Kpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3t/Gv0kk9rWAGa5uMngKFfg9GguolKRLSO3tjaFVUs4=;
	b=VsMTvqUzTvsPDFUr9CrW+odlaPJOB+XF/r3fYVt+GBuvqsn2iLqP7QBD/Sj8aQksnR
	Mz3bPkiVEYu3OM3gcOneDvTZDCT0SPOzCRYMLcYDASxeXV7ix81q8aNsOZIARQJyIyAX
	x6DijoUiqgAzhkHQR5MlctjT/sz/y+MrzLryT7pFSeCCm4fdwp4oLDxpSuhksVrr4JaE
	5FVrn+042dmlbmx63WqDQevg0oVB/kwbyp7QF4gONN63VSVcIXkViuIPGjv0DL3FHPdo
	T7Qpz4KzQOFZDF0UXtd4IIMUFtXQeJ2Gundpg193p711+oOpCMoSqhnd0sIQcOaiU3Dl
	SyqA==
X-Gm-Message-State: AHYfb5jzbQryrmqlqhZhR2/8B1VK9B6j9L+s3fJlvpDP27H4SqALpC8n
	faJxTnXmHbyHu2ReVcjVz1qLON1Sug==
X-Received: by 10.176.21.109 with SMTP id p42mr103201uae.41.1504010659695;
	Tue, 29 Aug 2017 05:44:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 29 Aug 2017 05:44:19 -0700 (PDT)
In-Reply-To: <20170825201304.47716-1-jason.wessel@windriver.com>
References: <20170825201304.47716-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Aug 2017 08:44:19 -0400
Message-ID: <CADkTA4NAqZSf34Knz-y-ZfOtK6Cf2f5kjmW39uuStHRPd6pfaA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: Fix compile problems with i586-nlp
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
X-List-Received-Date: Tue, 29 Aug 2017 12:44:21 -0000
Content-Type: multipart/alternative; boundary="001a114558be1c13270557e3c59e"

--001a114558be1c13270557e3c59e
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Aug 25, 2017 at 4:13 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> If you have in your $CC from the compiler template any kind of
> directive which contains a comma character it is going to cause ovs to
> not build due to the macro expansion in the Makefile:
>
> CC = $(if $(C),env REAL_CC="'"$CC"'" CHECK="$(SPARSE) -I
> $(top_srcdir)/include/sparse $(SPARSEFLAGS) $(SPARSE_EXTRA_INCLUDES) " cgcc
> $(CGCCFLAGS),'"$CC"
>
> Put more simply:
>
> CC = $(if $(C), CONFIGURE_CC_DEFINITION, cgcc args CONFIGURE_CC_DEFINITION)
>
> The CONFIGURE_CC_DEFINITION for the i585-nlp definition had
> "-Wa,-momit-lock-prefix=yes".  The comma there caused a strings to
> "break" in the wrong place in the $(if) macro and the build of recipe
> will fail with the error shown below:
>
> /bin/sh: -c: line 1: unexpected EOF while looking for matching `"'
> /bin/sh: -c: line 3: syntax error: unexpected end of file
>
> The solution is to transform the "-Wa," -> "-Xassembler ".
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc
> b/recipes-networking/openvswitch/openvswitch.inc
> index ab5a7e4..58e0fcb 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -86,6 +86,12 @@ INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
>  INITSCRIPT_NAME_${PN}-testcontroller = "openvswitch-testcontroller"
>  INITSCRIPT_PARAMS_${PN}-testcontroller = "defaults 72"
>
> +do_configure_prepend() {
> +       # Work around the for Makefile CC=$(if ....) by swapping out any
> +       # "-Wa," assembly directives with "-Xassembler
> +       CC=`echo '${CC}' | sed 's/-Wa,/-Xassembler /g'`
> +}
> +
>  do_install_append() {
>         install -d ${D}/${sysconfdir}/default/
>         install -m 660 ${WORKDIR}/openvswitch-switch-setup
> ${D}/${sysconfdir}/default/openvswitch-switch
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

--001a114558be1c13270557e3c59e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Aug 25, 2017 at 4:13 PM=
, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriv=
er.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">If you have in your $CC from the compiler=
 template any kind of<br>
directive which contains a comma character it is going to cause ovs to<br>
not build due to the macro expansion in the Makefile:<br>
<br>
CC =3D $(if $(C),env REAL_CC=3D&quot;&#39;&quot;$CC&quot;&#39;&quot; CHECK=
=3D&quot;$(SPARSE) -I $(top_srcdir)/include/sparse $(SPARSEFLAGS) $(SPARSE_=
EXTRA_INCLUDES) &quot; cgcc $(CGCCFLAGS),&#39;&quot;$CC&quot;<br>
<br>
Put more simply:<br>
<br>
CC =3D $(if $(C), CONFIGURE_CC_DEFINITION, cgcc args CONFIGURE_CC_DEFINITIO=
N)<br>
<br>
The CONFIGURE_CC_DEFINITION for the i585-nlp definition had<br>
&quot;-Wa,-momit-lock-prefix=3Dyes&quot;.=C2=A0 The comma there caused a st=
rings to<br>
&quot;break&quot; in the wrong place in the $(if) macro and the build of re=
cipe<br>
will fail with the error shown below:<br>
<br>
/bin/sh: -c: line 1: unexpected EOF while looking for matching `&quot;&#39;=
<br>
/bin/sh: -c: line 3: syntax error: unexpected end of file<br>
<br>
The solution is to transform the &quot;-Wa,&quot; -&gt; &quot;-Xassembler &=
quot;.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/<wbr>openvswitch/openvswitch.inc | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch.inc b/recipes-=
networking/<wbr>openvswitch/openvswitch.inc<br>
index ab5a7e4..58e0fcb 100644<br>
--- a/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
@@ -86,6 +86,12 @@ INITSCRIPT_PARAMS_${PN}-switch =3D &quot;defaults 71&quo=
t;<br>
=C2=A0INITSCRIPT_NAME_${PN}-<wbr>testcontroller =3D &quot;openvswitch-testc=
ontroller&quot;<br>
=C2=A0INITSCRIPT_PARAMS_${PN}-<wbr>testcontroller =3D &quot;defaults 72&quo=
t;<br>
<br>
+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Work around the for Makefile CC=3D$(if ....) =
by swapping out any<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# &quot;-Wa,&quot; assembly directives with &qu=
ot;-Xassembler<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D`echo &#39;${CC}&#39; | sed &#39;s/-Wa,/-X=
assembler /g&#39;`<br>
+}<br>
+<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/default/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 660 ${WORKDIR}/openvswitch-switch-<w=
br>setup ${D}/${sysconfdir}/default/<wbr>openvswitch-switch<br>
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
</div>

--001a114558be1c13270557e3c59e--
