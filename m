Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0B9AE00D53; Fri, 10 May 2019 13:43:40 -0700 (PDT)
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
	*      [209.85.167.51 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1F9AE00C78
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:43:39 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id h13so5049884lfc.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P0uw6HAyOkY7USSbj9IfjbWqtKPS+jdxeh6ifs6TS6M=;
	b=ov9VETpRpMm6l3H2nWr9C7z6i4cXVmIgVzhkAgDmLgAl21H98+T4QmKv3rkBC7zHZJ
	ANC4oy6HTOtxvr01KcuX1H7jFbqsMgh8g5bzZeQloIzpK5EGmqNSfna31PkwsIm8Yiwr
	35CcWE/6ity9QsDzpHU1QF5XHfZCiTuhT2dbBVQlqVe0iiKKlAx5/6HayqahO78t461f
	LHvCnnBOwNP3Rze/d8mGvHtgGYISo/OReDy4hXilxr93o7RzWNrF2wNrJAADhDmXvWE7
	H28QJYfQ/1S4LCK1bcHUp83dbQZosFgWIcGNx6ifZDS9BkaaTxQU7kjnNHHKLLDYk88j
	clqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P0uw6HAyOkY7USSbj9IfjbWqtKPS+jdxeh6ifs6TS6M=;
	b=FNdsR7MTGcykZRQT8oFNwBm/57vTzSprX2twjPpBjBaObHgHC08eyuMohRGIPTu2Ci
	J0zdh6sFeoAUEkl8c6Nn8ODsaHqZbFZMLd9BUr6PGocSOHUJbLo2XaEJ1NfyC/mbcDuU
	fTXQABoQZV5ML/20aMpgGM0LlKOx5GfkPizYswkc7ifXCQcq5SXjyGJCdeTpSPTPrViT
	smvu5ZspSSnuPeJpkNRq9Pmjt7Ln1B1TjS1TyvRL+ygdJhO25Nv8F5IHNS6uG72CBb9X
	Zt85MykMZdP6PD41Wk9Un2foqVTa8Pov8qvhQmxAIq3YrGp84M40r3uRotw7NsVetAAO
	is1g==
X-Gm-Message-State: APjAAAUZHMhm09u2xyzHiYyxALrbDHLilqN9ME/rVPhawtN9orKqzuFo
	+5BI7jeIYVy+aVSLE4vBVUxUQyVqh4Y3jQ/PxaHagmt/
X-Google-Smtp-Source: APXvYqydLftrXBEW/TQ/1tWoBIISa/5mftLGnujOrPwUDkwx0hRUG4qziegfspvTdaHqGoVc62k5zBF5vgPT0oSwfBA=
X-Received: by 2002:ac2:4217:: with SMTP id y23mr7123981lfh.134.1557521018477; 
	Fri, 10 May 2019 13:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <1555713609-10594-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1555713609-10594-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 May 2019 16:43:27 -0400
Message-ID: <CADkTA4NV+7q9UUOqOqgVVA-Bna_fBc6_2m0wjtMniQKfTeQ2iQ@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] python-kombu:Upgrade to 4.5.0.
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
X-List-Received-Date: Fri, 10 May 2019 20:43:40 -0000
Content-Type: multipart/alternative; boundary="0000000000000967d105888e9fb2"

--0000000000000967d105888e9fb2
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, May 9, 2019 at 9:10 PM Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> The kombu 4.2.2 can't be download any more.
> Refrence to https://pypi.org/project/kombu/#history, the newest version
> is 4.5.0.
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../python/{python-kombu_4.2.2.bb => python-kombu_4.5.0.bb}           |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.2.2.bb =>
> python-kombu_4.5.0.bb} (70%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
> b/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
> similarity index 70%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
> index 3cf1035..6db89cc 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "0c98ce669cb7a05c5046ea6009c77cba"
> -SRC_URI[sha256sum] =
> "52763f41077e25fe7e2f17b8319d8a7b7ab953a888c49d9e4e0464fceb716896"
> +SRC_URI[md5sum] = "6a9f0d07ec3f8b784e9358d04a4709c3"
> +SRC_URI[sha256sum] =
> "389ba09e03b15b55b1a7371a441c894fd8121d174f5583bbbca032b9ea8c9edd"
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

--0000000000000967d105888e9fb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ma=
y 9, 2019 at 9:10 PM Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.=
com">leimaohui@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">The kombu 4.2.2 can&#39;t be download any more=
.<br>
Refrence to <a href=3D"https://pypi.org/project/kombu/#history" rel=3D"nore=
ferrer" target=3D"_blank">https://pypi.org/project/kombu/#history</a>, the =
newest version is 4.5.0.<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com" t=
arget=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-kombu_4.2.2.bb" rel=3D"noreferre=
r" target=3D"_blank">python-kombu_4.2.2.bb</a> =3D&gt; <a href=3D"http://py=
thon-kombu_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.=
0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-kombu_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.2.2.=
bb</a> =3D&gt; <a href=3D"http://python-kombu_4.5.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python-kombu_4.5.0.bb</a>} (70%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-kombu_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.2.2.b=
b</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kom=
bu_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.bb</a>=
<br>
similarity index 70%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-kombu_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.2.2.bb=
</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-k=
ombu_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.bb</=
a><br>
index 3cf1035..6db89cc 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kombu=
_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.2.2.bb</a><b=
r>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kombu=
_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.bb</a><b=
r>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaea7c168428449fbee05=
e644df929f4&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;0c98ce669cb7a05c5046ea6009c77cba&quot;<br>
-SRC_URI[sha256sum] =3D &quot;52763f41077e25fe7e2f17b8319d8a7b7ab953a888c49=
d9e4e0464fceb716896&quot;<br>
+SRC_URI[md5sum] =3D &quot;6a9f0d07ec3f8b784e9358d04a4709c3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;389ba09e03b15b55b1a7371a441c894fd8121d174f558=
3bbbca032b9ea8c9edd&quot;<br>
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

--0000000000000967d105888e9fb2--
