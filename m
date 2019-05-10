Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F19BE00D53; Fri, 10 May 2019 13:43:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.172 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77A24E00C78
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:42:56 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id d15so6178642ljc.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wp+0UXCqNhLxQjPbuVRsNYOc9Zap/TLJacgW381brgQ=;
	b=pF6x0RBKFEvsLVY97PE5cWjw7U0oXYu3Kbwg1U8HzNlQpk/87zB4UnDV7nVnJi5XHK
	OdAcf9+KY104nOx71t7s9GYw0vNC1KkSvp6X8TbV6i2E9YuiSqaZI1LprNQ2SYksLRc5
	/6SujzflIjG9uD6Lm/qOfq+SWH2pTETFtSqqoTYfCwf9oQusXpWxX8a61PQpJ0qJ54WV
	N42UXcMeHwN+cPwaBnFTlWxa8EObCi/Zvn4R4C2k5ELCOmBJbt/GFHHyrdzcWEbK0Rh0
	5pd54RtFGSrTvuX08XCLfxNFCnx4FgLSPRn1VUs6yIJgj45vvVYCcpTEXvIGneXySUhH
	FlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wp+0UXCqNhLxQjPbuVRsNYOc9Zap/TLJacgW381brgQ=;
	b=YMmB1uP9n5W+5KVsp7mF5GNSftpyfO6kCwCf8yxrbdEk/RQEPMfU9U8OqMB+6g2oqR
	93erpg/clbbOEp1oFBMMGx3AqIEaxKV3AlJp9qjhLxbAtyEMWMaOQDR7BlxHDlVf/Swj
	8Sw+QuoaYNZXdgS1JjRJmSauqS0Kq0iqeNtJ1LgURv0lYsQdC7mLHgrSILA3Gpb75xrm
	GUA/n6673J6CIv4EhiNbdpX+Bo8CgjnR3c4FpM01heoJSkKlEFJT6AR0P91d0wAv+sTd
	T6wNPzj+ySwRz4qOk8G0neyZrPjrhar+FLY79wkUFC+h+JpT0ioadhziRK9Gde07nTx0
	sCMQ==
X-Gm-Message-State: APjAAAUK230+inNyA/6As1iql0JCQ9ntFbDdcr5vxrZD6nGOxBwAhL9W
	HA2jYT2ogGNt9n4Ru6XmCLKnOQ7pOuaXzbh8DNQ=
X-Google-Smtp-Source: APXvYqwIyuQMsQ4q9Gj0F6dFYCJs4PlpLvij8VnbnVhfXRq8XYEzpDsOgca45TPI2NICZ9NZu0VfQ1wD1yiXElei4+4=
X-Received: by 2002:a2e:96d9:: with SMTP id d25mr6762457ljj.78.1557520975571; 
	Fri, 10 May 2019 13:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <1557210848-16359-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1557210848-16359-1-git-send-email-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 May 2019 16:42:44 -0400
Message-ID: <CADkTA4O9oW_YRTeqCZLF0fxaa7eDX8WpPEKMt2b6DzMSCLgqHQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] nagios-core: add CVE_PRODUCT
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
X-List-Received-Date: Fri, 10 May 2019 20:43:10 -0000
Content-Type: multipart/alternative; boundary="0000000000007ab38d05888e9c8e"

--0000000000007ab38d05888e9c8e
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, May 7, 2019 at 2:46 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/nagios/nagios-core_4.4.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/nagios/nagios-core_4.4.3.bb
> b/recipes-extended/nagios/nagios-core_4.4.3.bb
> index cf37924..fcf04e9 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.3.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.3.bb
> @@ -149,3 +149,5 @@ USERADD_PARAM_${SRCNAME}-base = "-r -M -g
> ${NAGIOS_GROUP} ${NAGIOS_USER}"
>
>  INITSCRIPT_NAME = "nagios"
>  INITSCRIPT_PARAMS = "defaults"
> +
> +CVE_PRODUCT = "nagios_core"
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
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007ab38d05888e9c8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Ma=
y 7, 2019 at 2:46 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Q=
i.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@wi=
ndriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb=
" rel=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a> b/recipes-e=
xtended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">nagios-core_4.4.3.bb</a><br>
index cf37924..fcf04e9 100644<br>
--- a/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a><br>
+++ b/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a><br>
@@ -149,3 +149,5 @@ USERADD_PARAM_${SRCNAME}-base =3D &quot;-r -M -g ${NAGI=
OS_GROUP} ${NAGIOS_USER}&quot;<br>
<br>
=C2=A0INITSCRIPT_NAME =3D &quot;nagios&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;defaults&quot;<br>
+<br>
+CVE_PRODUCT =3D &quot;nagios_core&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000007ab38d05888e9c8e--
