Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BD52E00BAA; Mon,  6 May 2019 12:48:54 -0700 (PDT)
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
	*      [209.85.167.47 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66635E00ADB
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 May 2019 12:48:53 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id w23so10039954lfc.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 May 2019 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rDUpHIrH3vPKeQ6+pdLmkPiCJgf6T5tMjsVZE5c1wKY=;
	b=h0qu6N3u/heNgkQanpJDLqt3TdZPoYVj4jKuebaH/LXxi5E0apC0QByEUC4OckynIp
	fo+o3CDlTAUNjkVcRpfmls8vyH8mKZICIqt0Imqcmn83mwlphEjYYoxzBhdrNmD2PFHs
	yfmRi3mveyOJcfWO6IOfW2o6SQFkRlb6XgzQrvXBGVQvs+pBwqp1/Hc2PzgpJIAaI4oZ
	6iLFknfRpC2G1v7tpPyu72O1aEY2thcH1aHBs8uI8N5/3SkUraWC+y7CzCfPjPSGw2IO
	0lwxGMA0Sz5WvTQDcz9nFDA0sviNn7vD9ATOFgu7hQljN86Du+l/45LI+I1PwWuDIArA
	gcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rDUpHIrH3vPKeQ6+pdLmkPiCJgf6T5tMjsVZE5c1wKY=;
	b=PpoBlBxSBfDi9X4RCYkPvt/jlxXNdppgkld2h1/gQBMNhhM7ZoOBkfjN7gjL/q9zpZ
	KBMo3n2jTLfCtnx8gKwAI/6KXo1nufLPfxqkYS1a+lydNJouSnaOmrpgr/UZCISB6Pzv
	Fz+ae7AoEZpdD7JxDblrLaRy33Ig4xbhhAPvi5vN6O+WNV85moMTiWYsdhSkO1qIuEW1
	VcNdKtW7NQ4NNSn9m0InCJ4G2dc5HXp3GWDzpw9GGfot6om6/jA5jCHyD3q+fd464m5u
	gcsaSyiIW7W4BQVPrmbTZ7z/gw5hkZPFdNWJscq5EBsKAObp8cpFfRBQYQiLm17Hb7L/
	XobQ==
X-Gm-Message-State: APjAAAXgYMEA8lm9V8rtYD4PRIdmDsIcLTL8xx7XR/jtusd9qnLLzWL2
	zs1FaKfJgSJUADLaeDR4RMmsUIAHC761MnobdO1wZwVF
X-Google-Smtp-Source: APXvYqwi+axf9GRA98NRRM+tjU9B+K05Jyl1OrjV8RR4mnrgJ4gRZwUCmy/SGZ811eczMwQYhWxuwzy3hlYg8ewm3CU=
X-Received: by 2002:a19:40d8:: with SMTP id n207mr14605540lfa.70.1557172132250;
	Mon, 06 May 2019 12:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <1557035015-10126-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1557035015-10126-1-git-send-email-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 May 2019 15:48:41 -0400
Message-ID: <CADkTA4PKdAWMxPejAYNgL_KRNjY97W3nhg+v8tXSx8qtWms3Kg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] glusterfs: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 06 May 2019 19:48:54 -0000
Content-Type: multipart/alternative; boundary="000000000000cc0d4405883d630e"

--000000000000cc0d4405883d630e
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sun, May 5, 2019 at 1:55 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/glusterfs/glusterfs.inc
> b/recipes-extended/glusterfs/glusterfs.inc
> index 3fc04ff..3ae6d7d 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -216,3 +216,4 @@ pkg_postinst_${PN}() {
>      fi
>  }
>
> +CVE_PRODUCT = "glusterfs gluster_storage"
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

--000000000000cc0d4405883d630e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Ma=
y 5, 2019 at 1:55 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Q=
i.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@wi=
ndriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/glusterfs/glusterfs.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/gl=
usterfs/glusterfs.inc<br>
index 3fc04ff..3ae6d7d 100644<br>
--- a/recipes-extended/glusterfs/glusterfs.inc<br>
+++ b/recipes-extended/glusterfs/glusterfs.inc<br>
@@ -216,3 +216,4 @@ pkg_postinst_${PN}() {<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
+CVE_PRODUCT =3D &quot;glusterfs gluster_storage&quot;<br>
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

--000000000000cc0d4405883d630e--
