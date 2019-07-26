Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F749E00D30; Thu, 25 Jul 2019 19:42:00 -0700 (PDT)
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
	*      [209.85.128.52 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9A6BE00961
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:41:59 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id s3so46605116wms.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VLUL40IAVS6ZOU9snYYqe7uZsjRBt50jNtR22kC6O9M=;
	b=I6U/motYqs+t+LvwybTL2boRUQbBJEmvEfj5brio4iYgNIveiOWnphK7mn2o05qzmD
	On2D8Kz4ZcB1i18rpuzlec3CnhFPs46wcZ0TKg0NhpRmjl1wKt9nstpR1D/lYBNzJblw
	L4jimoeagxqNNWyYMb/Z7FrhOy0ga2rXlZif/hWUEVuN7yE4Yqyn7d3wBQEkcrHldLp3
	s6Q0nH64NUt2CSfuTEOt7gpFrIvLe3LpfC69yenFWGOZ6l5pJONEVa82d34eJC0DBiFv
	C1Xsy5cNT5ms5PQ1spV68WH1rYjF0FjykoGL/uRhoAAmtxRN9SF+GrPbeGXddsfMz5Cj
	Xy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VLUL40IAVS6ZOU9snYYqe7uZsjRBt50jNtR22kC6O9M=;
	b=Bk/KTeILx7cJcacIOTT7KDaxt5VCgSfXqpgjpVVaz/PEvD5YvWEOvP4EBLi8B1z38K
	Gm6OgbBNLzqUtK5FT51RgUuBsM2UT8pEArmEXfykGA0ymoIpnOgcDsFt/GSOV5yqB297
	Hn2FLBYiNc8vdCHewWkD1eaigA9Ng3fVL7du0dt/iqnVi/GpV4eb9xzeZBBJrEfrH5f0
	iwQkD5W8FJADgmABoI0pq/CHkXngUv+KaWNIk1jbpyLF6CFfuXstgT8YqsoSoLzw779F
	xUhuwmy7AJUNucWlqcSM4SJOxrOdZZBxQ19hJTBaUqm21gGv+6lzsjrA3R8yQ2QU4RAA
	MGsA==
X-Gm-Message-State: APjAAAXu8PGmSWx3kZx4vr8nsKdy+NMUJ1h6ZnojYq1LLN9DS7SrI0B8
	4oLU0neNnf5X0cAZhQcvwZLJOSU/adK4YLZeZZ9QW482
X-Google-Smtp-Source: APXvYqz4Sej0bk6t2yfuK/eLSmASJKF8PkxZZtLU0m6gRBVBj5if4c+f79FHnmM8SWuC8kVYwTtwg94QLAIOLxiFZzQ=
X-Received: by 2002:a1c:a6c8:: with SMTP id p191mr77668966wme.99.1564108918828;
	Thu, 25 Jul 2019 19:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190726010604.13003-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190726010604.13003-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:41:47 -0400
Message-ID: <CADkTA4Np5W2fCbwkHsx-LTQUBRAJnG4bmz-=gSWByGchBfhTcQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-swiftclient: upgrade 3.7.0 -> 3.8.0
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
X-List-Received-Date: Fri, 26 Jul 2019 02:42:00 -0000
Content-Type: multipart/alternative; boundary="0000000000007f3322058e8c7c79"

--0000000000007f3322058e8c7c79
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Jul 25, 2019 at 9:09 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/
> python-swiftclient_git.bb
> index f00fab5..15449e4 100644
> --- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> @@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
>
>  SRC_URI = "git://
> github.com/openstack/python-swiftclient.git;branch=master"
>
> -PV = "3.7.0+git${SRCPV}"
> -SRCREV = "991a6cebb900f9ece5279f1c3c2bf33bcbb74086"
> +PV = "3.8.0+git${SRCPV}"
> +SRCREV = "47d5f44c3dbb5b9172a6ac7e894bf2b940ad5707"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools python-dir
> --
> 2.7.4
>
>
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

--0000000000007f3322058e8c7c79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ju=
l 25, 2019 at 9:09 PM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=
=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fuj=
itsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-swift=
client_git.bb" rel=3D"noreferrer" target=3D"_blank">python-swiftclient_git.=
bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-swiftclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-swiftclie=
nt_git.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://py=
thon-swiftclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-swiftc=
lient_git.bb</a><br>
index f00fab5..15449e4 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-swift=
client_git.bb" rel=3D"noreferrer" target=3D"_blank">python-swiftclient_git.=
bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-swift=
client_git.bb" rel=3D"noreferrer" target=3D"_blank">python-swiftclient_git.=
bb</a><br>
@@ -9,8 +9,8 @@ SRCNAME =3D &quot;swiftclient&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/openstack/python=
-swiftclient.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/openstack/python-swiftclient.git;branch=3Dmaster</a>&quot;<br>
<br>
-PV =3D &quot;3.7.0+git${SRCPV}&quot;<br>
-SRCREV =3D &quot;991a6cebb900f9ece5279f1c3c2bf33bcbb74086&quot;<br>
+PV =3D &quot;3.8.0+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;47d5f44c3dbb5b9172a6ac7e894bf2b940ad5707&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit setuptools python-dir<br>
-- <br>
2.7.4<br>
<br>
<br>
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

--0000000000007f3322058e8c7c79--
