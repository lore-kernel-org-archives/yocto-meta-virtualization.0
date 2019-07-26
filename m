Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C9B8E00D94; Thu, 25 Jul 2019 19:42:13 -0700 (PDT)
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
	*      [209.85.221.67 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0FFCE00D46
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:42:12 -0700 (PDT)
Received: by mail-wr1-f67.google.com with SMTP id r1so52721059wrl.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E+UuWlN9BbUEhoFqGajU5/0Eg8fK5W6v/tHuuT044Us=;
	b=LpsTxtlNpQq6V8UUrgFwmkMPDDsgwkQpkwgjsYhJNxjEmu6C7To7UN475lM3+TLP+T
	yx436WQvTHBmhUjmzmvOtjfeikWK+uZxvI95gs5AHMPIuQ0RyBd4TYaWDglS1NLO8O1H
	S7AF9OEmwLcKorDCUzLlbIFthNmkBP/i78ez2lHRE6fOKehiKP5+s9nWy153iSF9XwFv
	+mKcDZ07PV5ppBYfNkfCS8vgbakTyC5TtV03rCr+wJL4AdgS7g3AdA7i8az1BpaA5gxK
	kzM47YE9Fmi4Y4xetz1nztHq9pkBby6Pi6eA3JxGV8+Y2PJA9ZBvufDLJ8hmQOCKlOoh
	obYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E+UuWlN9BbUEhoFqGajU5/0Eg8fK5W6v/tHuuT044Us=;
	b=aXpQ8FM8nSZXRAvmkxyftUzCuBGY5EKRlLtdwIho9c2oPcUOuf4aJq9ZkEiKuqpkn/
	LCIumbJWkHLfHPtDy7PD8Tr4F23jlgiiXsutg/9FfD0BadBwPxArWqjGW3KHr+wMIDvj
	9oUIivdPH2Sxss2cjJ3PwtZaRG9rmpVNzNtUpd2dwc651WSwTVb/D9lTNaO5QA9xcUgl
	+e4rEB5DuP8Svfee/wRG8S6eCaUJx5Ec4zdhfM7L5B9Usm8JFTf/DmgN+w2k/3sb+pCE
	70KyE6FnJppgtPVWUKxKEZvPO2WMqMPRbI9/7Lvo9YNcWswZuRhPeSMTUe4SbbjK5ZQa
	MOeg==
X-Gm-Message-State: APjAAAVcH/xYgWCUPRRU2DPdEK0sUWFnFmLeGPV+0vkSiVdMq26ebPUp
	qP7YzFaauF9vuYo/JVenuOJHeCWYzU3O0Dqjd3w=
X-Google-Smtp-Source: APXvYqzmf2xIwErHPxvL5l+hlek5s35DM5wUXsBHJ7w9FqlTwfTwEzinjPA8zLWX8D9a1skbCckbo5G9xlkMjya1CpI=
X-Received: by 2002:a05:6000:4b:: with SMTP id
	k11mr93989972wrx.82.1564108931795; 
	Thu, 25 Jul 2019 19:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190726012233.13424-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190726012233.13424-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:42:00 -0400
Message-ID: <CADkTA4MSKhwyrBhPjQnEFdn9fnxOgsrhK-hzxuKPfLvWuehm0A@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-osprofiler: upgrade 2.8.0 -> 2.8.1
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
X-List-Received-Date: Fri, 26 Jul 2019 02:42:13 -0000
Content-Type: multipart/alternative; boundary="000000000000451300058e8c7d90"

--000000000000451300058e8c7d90
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Jul 25, 2019 at 9:24 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-osprofiler_2.8.0.bb => python-osprofiler_2.8.1.bb} |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-osprofiler_2.8.0.bb
> => python-osprofiler_2.8.1.bb} (83%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-osprofiler_2.8.0.bb b/meta-openstack/recipes-devtools/python/
> python-osprofiler_2.8.1.bb
> similarity index 83%
> rename from meta-openstack/recipes-devtools/python/
> python-osprofiler_2.8.0.bb
> rename to meta-openstack/recipes-devtools/python/
> python-osprofiler_2.8.1.bb
> index c33c52b..b299709 100644
> --- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>
> -SRC_URI[md5sum] = "c48561c6c6d2112d5b06d5c4af581790"
> -SRC_URI[sha256sum] =
> "56f8717c1c30193706ea6f9959f5f289edee910f90ebd763db38cfbd9c1c90d4"
> +SRC_URI[md5sum] = "ec8ef752caf49591941fba063ca40fb4"
> +SRC_URI[sha256sum] =
> "ee6d8a40daa3909b7c594378986b8c93ec2561dd8c329bad0aa54d4795c8fa57"
>
>  inherit setuptools pypi
>
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

--000000000000451300058e8c7d90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ju=
l 25, 2019 at 9:24 PM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=
=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fuj=
itsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-osprofiler_2.8.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-osprofiler_2.8.0.bb</a> =3D&gt; <a href=3D=
"http://python-osprofiler_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-osprofiler_2.8.1.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-osprofiler_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofi=
ler_2.8.0.bb</a> =3D&gt; <a href=3D"http://python-osprofiler_2.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python-osprofiler_2.8.1.bb</a>} (83%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-osprofiler_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofil=
er_2.8.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://=
python-osprofiler_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osp=
rofiler_2.8.1.bb</a><br>
similarity index 83%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-osprofiler_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofile=
r_2.8.0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-o=
sprofiler_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofiler_=
2.8.1.bb</a><br>
index c33c52b..b299709 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-ospro=
filer_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofiler_2.8.=
0.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-ospro=
filer_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofiler_2.8.=
1.bb</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D19cbd64715b51267a47bf=
3750cc6a8a5&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;c48561c6c6d2112d5b06d5c4af581790&quot;<br>
-SRC_URI[sha256sum] =3D &quot;56f8717c1c30193706ea6f9959f5f289edee910f90ebd=
763db38cfbd9c1c90d4&quot;<br>
+SRC_URI[md5sum] =3D &quot;ec8ef752caf49591941fba063ca40fb4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ee6d8a40daa3909b7c594378986b8c93ec2561dd8c329=
bad0aa54d4795c8fa57&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<br>
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

--000000000000451300058e8c7d90--
