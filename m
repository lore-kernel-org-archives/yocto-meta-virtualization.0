Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD61BE00E1E; Fri, 21 Oct 2016 08:42:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
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
	*      [209.85.216.181 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.181 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85E93E00BF8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Oct 2016 08:42:35 -0700 (PDT)
Received: by mail-qt0-f181.google.com with SMTP id q7so91593949qtq.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Oct 2016 08:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tp3MZsB6vvcctLV3AxnNEloSjc72Q1wXuK6rUZatFRI=;
	b=sl6jyCGaPwDbp9McSsCddLjNmCp3P7XHJeSCuAolojikm9WHg2Jrf59AZyz2MgMT6V
	yyzBhl55J+ZNjf7dMKpRwiCcv2ClqxPfVUyfP1Tm/O6DYkMiMdJdD2RAUOqHjYwGSSX+
	ZkeQqhTIiXP99Y9dgghX6sAH91q74/grvGRfkPZCN/m3EuQBDYTvOEUQkvUl6bsbF8WN
	RFL/1T4bMSNZePn/8wNqwBpjVjq6VWRmTgMABGsXcEPa7PnaQmgNWeBM6iLegE7BmRJ1
	Fump1NmkpBOEaN0zUC2tdSkRNQGqAmnsITqDhLnd53cpfp2Azh+yxE/emBvvOOrm7Cyz
	4ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tp3MZsB6vvcctLV3AxnNEloSjc72Q1wXuK6rUZatFRI=;
	b=AujcbOPjORySnhSKQdY/XcrfJ3V4u0OgzZYBk8PXxL5FcHhqXIx9A+ji7YHYAicc2i
	j/hjY6zj690EfyTtZsf5nuPJzOPZ07ilv1HhOOH115yyWoafeD91b+Kxo9V9Bq1H7ktp
	pp/FkLDRExA5kHBY4f8EWDB7EtWqtAMQd1t7Ds5HxTAiVDhwEAzIkZPaDz/0wErWCiMx
	mPYefI1cs6s2MLdbm9fV4PEg9X2C4rQs/hO06YzUsaOyVvk6o75lK7P8gFigCk15+iCc
	dhw2sq5XqwuaJx5mAP5qAgiRi5StfBXIyJWQS+ERvK3EZcs/stiY5q9j4YIqI0KPcnMi
	BttA==
X-Gm-Message-State: ABUngve40QMN/d80bOsXPbBF5thEWfr+135cmKw5wvUDMlUT7GlSeGiUdrHAt+4oJmALJpX79zQKkw6PjwwwPw==
X-Received: by 10.200.38.219 with SMTP id 27mr1781079qtp.125.1477064555327;
	Fri, 21 Oct 2016 08:42:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Fri, 21 Oct 2016 08:42:34 -0700 (PDT)
In-Reply-To: <20161020024918.32049-1-zhe.he@windriver.com>
References: <20161020024918.32049-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Oct 2016 11:42:34 -0400
Message-ID: <CADkTA4MskfEzBNz2fayz-NXGpPPoyW_2Uy74tr1=Y_kU0T2T+A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] protobuf: Fix QA error for GNU_HASH
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
X-List-Received-Date: Fri, 21 Oct 2016 15:42:41 -0000
Content-Type: multipart/alternative; boundary=001a114043302178d0053f61e4cf

--001a114043302178d0053f61e4cf
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Oct 19, 2016 at 10:49 PM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Add LDFLAGS to examples makefile to pass default ld flags.
>
> "ERROR: protobuf-3.0.0-r0 do_package_qa: QA Issue: No GNU_HASH in the
> elf binary: '.../protobuf/3.0.0-r0/packages-split/protobuf-ptest/usr/
> lib/protobuf/ptest/add_person_cpp'"
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-devtools/protobuf/protobuf_3.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/protobuf/protobuf_3.0.0.bb
> b/recipes-devtools/protobuf/protobuf_3.0.0.bb
> index e1deeac..0445ae4 100644
> --- a/recipes-devtools/protobuf/protobuf_3.0.0.bb
> +++ b/recipes-devtools/protobuf/protobuf_3.0.0.bb
> @@ -36,7 +36,7 @@ do_compile() {
>
>  do_compile_ptest() {
>         # Modify makefile to use the cross-compiler
> -       sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
> +       sed -e "s|c++|${CXX} \$(LDFLAGS)|g" -i "${S}/${TEST_SRC_DIR}/
> Makefile"
>
>         mkdir -p "${B}/${TEST_SRC_DIR}"
>
> --
> 2.8.3
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

--001a114043302178d0053f61e4cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Wed, Oct 19, 2016 at 10:49 PM, =
 <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_b=
lank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@win=
driver.com</a>&gt;<br>
<br>
Add LDFLAGS to examples makefile to pass default ld flags.<br>
<br>
&quot;ERROR: protobuf-3.0.0-r0 do_package_qa: QA Issue: No GNU_HASH in the<=
br>
elf binary: &#39;.../protobuf/3.0.0-r0/<wbr>packages-split/protobuf-ptest/<=
wbr>usr/<br>
lib/protobuf/ptest/add_person_<wbr>cpp&#39;&quot;<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">prot<wbr>obuf_3.0.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a> b/recipes-=
devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a><br>
index e1deeac..0445ae4 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a><br>
@@ -36,7 +36,7 @@ do_compile() {<br>
<br>
=C2=A0do_compile_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Modify makefile to use the cross-compiler<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s|c++|${CXX}|g&quot; -i &quot;${S}=
/${TEST_SRC_DIR}/<wbr>Makefile&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s|c++|${CXX} \$(LDFLAGS)|g&quot; -=
i &quot;${S}/${TEST_SRC_DIR}/<wbr>Makefile&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;${B}/${TEST_SRC_DIR}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a114043302178d0053f61e4cf--
