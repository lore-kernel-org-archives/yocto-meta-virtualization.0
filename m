Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8F41E00CEA; Fri, 22 Jun 2018 11:39:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20 autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2A53E00C5B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jun 2018 11:39:34 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id v25-v6so270570lji.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jun 2018 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7BOAi5go8sbSnydE3J5T47GEtTX8r8AA2oDAF31/6nQ=;
	b=ne/ByvanO9xYRo6VfCPNN9cmpdZaQ4GrXLhVcfrfpo1uGphYOk784K+AmCNCwV1+cg
	1MHRcvRY/SgvEImiPkTLLXFkyL4gI9vZ1sM+zY7sFLGGWMxaZc14cCKTSTcw7vAjx0yx
	z/cxhouyVyA3A6dN3Hll1XS6Ma3bWpWYqanIuuby0K9diRAOLv8x554696eViKER/qxr
	RnKeoPXsJPw7Bee+3MMeLDNN/QkzA/2ZxWVOCROr0zLNPNd3HHMSpc32a2ow5bWCALlH
	h1FcoQokuXrSC3ioHwj3M2c0uU69Lu8VjvZtE7GGSZH5+VDxIMipRu5pl+x9K//+x3mS
	ImRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7BOAi5go8sbSnydE3J5T47GEtTX8r8AA2oDAF31/6nQ=;
	b=SG5NBRF2hyO0yp42GiKQJFr3Z5jOiMgiAcXCdhe+7SP5eJ16DddoXkMAQinangJXzC
	tyA4wN/ZnUWPJs8LKlaMEQSLioPtRBhHm3e3tc9xH5Ao5xfKuGgW7yzw33WA6zZjEHyq
	Ux58D42bc+C8OyptJfq7xl096HBg3HKo7mVPFUQ5+JBu3xn9K8EWaQjm77BkHgc+QhaJ
	dKr1E9vJ830gjk8HoGucMW0x0vhDMRT5UpAm1AOKuijbNuYIwgOkmfZgPXP4Mb9uzunA
	iEXBRP7sh92wFQ58y0WOc/Tre2jWlUA26D0xYqZUuerJ73500gm//Uge07Aaqw4AGzjh
	QaWA==
X-Gm-Message-State: APt69E0aR1oIzpMtDIrRl3JNtG48dS3w86fOlK/GhJpSuxp30hEB0k0T
	p3L6z6DMnnNpBKHOE+5wAl8NIeaebemC8BO7+OQRvw==
X-Google-Smtp-Source: ADUXVKI0T4fUIO85h3e3zM7/gSXcWSRoD54yBXc9xdyWSQZKrfUBkvyVUSbO+ieLyJoXk7s22CcRqQ+W5ptfcRrLAAc=
X-Received: by 2002:a2e:29cf:: with SMTP id
	p76-v6mr1998820ljp.12.1529692773745; 
	Fri, 22 Jun 2018 11:39:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:17ca:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 11:39:33
	-0700 (PDT)
In-Reply-To: <1529520415-13251-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1529520415-13251-1-git-send-email-ricardo@opensourcefoundries.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 22 Jun 2018 14:39:33 -0400
Message-ID: <CADkTA4ObG1A_GmuPTQ0-fur1bTRqXfg7k4BWOV54m6o_KgqBsw@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] python3-docker-pycreds: update to 0.3.0
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
X-List-Received-Date: Fri, 22 Jun 2018 18:39:35 -0000
Content-Type: multipart/alternative; boundary="0000000000006506f1056f3f5aa0"

--0000000000006506f1056f3f5aa0
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jun 20, 2018 at 2:46 PM, Ricardo Salveti <
ricardo@opensourcefoundries.com> wrote:

> Update python3-docker-pycreds from 0.2.1 to 0.3.0.
>
> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
> ---
>  ...ocker-pycreds_0.2.1.bb => python3-docker-pycreds_0.3.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-devtools/python/{python3-docker-pycreds_0.2.1.bb =>
> python3-docker-pycreds_0.3.0.bb} (63%)
>
> diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
> similarity index 63%
> rename from recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> rename to recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
> index 4038410..4d39f52 100644
> --- a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> +++ b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
> @@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 3b83ef96387f14655fc854ddc3c6bd57"
>
>  inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
> -SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b81215304
> 13250c6cd4ffed2c1cf085f335262f7348"
> +SRC_URI[md5sum] = "2370ea3b62198b788a26231ab58844af"
> +SRC_URI[sha256sum] = "8b0e956c8d206f832b06aa93a710ba
> 2c3bcbacb5a314449c040b0b814355bbff"
> --
> 2.17.1
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

--0000000000006506f1056f3f5aa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jun 20, 2018 at 2:46 PM=
, Ricardo Salveti <span dir=3D"ltr">&lt;<a href=3D"mailto:ricardo@opensourc=
efoundries.com" target=3D"_blank">ricardo@opensourcefoundries.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Update python3-docker-pycred=
s from 0.2.1 to 0.3.0.<br>
<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo@opensourcefoun=
dries.com">ricardo@opensourcefoundries.<wbr>com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ocker-pycreds_0.2.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ocker-pycreds_0.2.1.bb</a> =3D&gt; <a href=3D"http://python3-d=
ocker-pycreds_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker=
-pycreds_0.3.0.<wbr>bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-devtools/python/{<a href=3D"http://python3-docker-pycr=
eds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho<wbr>n3-docker-pycr=
eds_0.2.1.bb</a> =3D&gt; <a href=3D"http://python3-docker-pycreds_0.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-docker-pycreds_0.3.0.<wbr>bb<=
/a>} (63%)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-docker-pycre=
ds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker-pycre=
ds_0.2.1.bb</a> b/recipes-devtools/python/<a href=3D"http://python3-docker-=
pycreds_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker-=
pycreds_0.3.0.bb</a><br>
similarity index 63%<br>
rename from recipes-devtools/python/<a href=3D"http://python3-docker-pycred=
s_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3-docker-pycred=
s_0.2.1.bb</a><br>
rename to recipes-devtools/python/<a href=3D"http://python3-docker-pycreds_=
0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3-docker-pycreds_=
0.3.0.bb</a><br>
index 4038410..4d39f52 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python3-docker-pycreds_0.2.=
1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker-pycreds_0.2.=
1.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-docker-pycreds_0.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker-pycreds_0.3.=
0.bb</a><br>
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>3b83ef=
96387f14655fc854ddc3c6bd<wbr>57&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>0d80d5aebab771faf7e422b759c305<wbr>5b&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>93833a2cf280b7d8abbe1b81215304<wbr>13250=
c6cd4ffed2c1cf085f335262f<wbr>7348&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>2370ea3b62198b788a26231ab58844<wbr>af&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>8b0e956c8d206f832b06aa93a710ba<wbr>2c3bc=
bacb5a314449c040b0b814355<wbr>bbff&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.1<br>
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

--0000000000006506f1056f3f5aa0--
