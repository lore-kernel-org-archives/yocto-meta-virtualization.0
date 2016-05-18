Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5B8EE00E14; Tue, 17 May 2016 20:49:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35AD3E00E11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 May 2016 20:49:20 -0700 (PDT)
Received: by mail-oi0-f67.google.com with SMTP id i2so7335525oib.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 May 2016 20:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=fpYHrzTfow9u1xFSHyWlNnCAHM98+guSBu0oSSF1z6s=;
	b=BdxWTsZeGLU3Z+ibf1XhaTJLa2EBle85/dNwvHOQ1/ChTSrGbmjrQsFEWijFalkXLF
	D80CyzHNp5GXKy69b0AIVn4pBz2wUgkZtNng79A9HjKfQlOGbK7gD25U6F445DDP7F+d
	yyTOFhow9PPOfmLEDGVq1HcCghMEvJQNqf1S6j198xPoI/h1nGLBlT80wCB5czT1UxHv
	yJdfE2gFAKRnZXiD5KfzuuJHIM7YBD/2R31XtMdWbaLo7kbSFAgnyr89fPBcYxlBPYhq
	6OCwdh7C8m7x0EWvWeAR1XXXR6EfucmhQT+RcPoY0pnxmgkn97y+Y7SnXvLVUUYQKLV/
	7s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=fpYHrzTfow9u1xFSHyWlNnCAHM98+guSBu0oSSF1z6s=;
	b=lcJfI9lys2tKZLMJJsKSup/TahPhQiVa5VoGQvrZEx16f6vTiVGKh/PVk0q9tBmJoE
	LjAahUFZD/apE8UiJueVBJuyDc2cX0fWCaAtxKpwkM0cE3HcGYV6tY/i4HOahbYbuwKZ
	s8dPTljVNkl2U11fqf3sRGLKJgGFsNNJzqHo9TF0C2erzKllfTD3xLjDLMZQVRy9zAE8
	WV2+TdiHMGMxtKh0vsXdGG5SeNJ2fFL2dwArwuVIecC/zhECxy9GHn2NQ178h7ywC/8R
	53QbF4kCfkNxc1EWxWfDv1VOGhywnEqryBtOtf4rJi4za7TknJ9fDIhFLJokucR6A0Bq
	qxPA==
X-Gm-Message-State: AOPr4FUiqRC/P0Qc2AQVwfwQ359bkBlO855+yj40paZE/eU5L+E0NaVgkyq7cMOyMc2OXrY23gPwXOeXn0BbFg==
MIME-Version: 1.0
X-Received: by 10.202.214.208 with SMTP id n199mr3059739oig.144.1463543360179; 
	Tue, 17 May 2016 20:49:20 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 17 May 2016 20:49:20 -0700 (PDT)
In-Reply-To: <1463492150-4296-1-git-send-email-anders.roxell@linaro.org>
References: <1463492150-4296-1-git-send-email-anders.roxell@linaro.org>
Date: Tue, 17 May 2016 23:49:20 -0400
Message-ID: <CADkTA4O5nn4oYhwcczK6+qkNsXtB-R3eSEPADxcTz8W98aiFnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: workaround to ignore deprecated
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
X-List-Received-Date: Wed, 18 May 2016 03:49:23 -0000
Content-Type: multipart/alternative; boundary=001a113b135818d759053315beb6

--001a113b135818d759053315beb6
Content-Type: text/plain; charset=UTF-8

On Tue, May 17, 2016 at 9:35 AM, Anders Roxell <anders.roxell@linaro.org>
wrote:

> Recent patch did deprecate a standard POSIX function [1].
>
> This is the build error:
> | ../../../lxc-2.0.0/src/lxc/cgfs.c: In function 'cgroup_rmdir':
> | ../../../lxc-2.0.0/src/lxc/cgfs.c:172:2: error: 'readdir_r' is
> deprecated [-Werror=deprecated-declarations]
> |   while (!readdir_r(dir, &dirent, &direntp)) {
> |   ^
> | In file included from ../../../lxc-2.0.0/src/lxc/cgfs.c:30:0:
> | /.../build/tmp-glibc/sysroots/qemux86-64/usr/include/dirent.h:183:12:
> note: declared here
> |  extern int readdir_r (DIR *__restrict __dirp,
> |             ^
>
> [1] https://www.sourceware.org/ml/libc-alpha/2016-02/msg00093.html
>
>
Good timing, just ran into this myself .. saved me workign it out :D

Merged.

Bruce


> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  recipes-containers/lxc/lxc_2.0.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/
> lxc_2.0.0.bb
> index 9f01edd..5004b9e 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -47,6 +47,8 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'systemd', '', d)}"
>
>  EXTRA_OECONF += "--enable-log-src-basename"
>
> +CFLAGS_append = " -Wno-error=deprecated-declarations"
> +
>  PACKAGECONFIG ??= "templates \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}
> \
>  "
> --
> 1.9.1
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

--001a113b135818d759053315beb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 17, 2016 at 9:35 AM, Anders Roxell <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:anders.roxell@linaro.org" target=3D"_blank">anders.roxell@l=
inaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Recent p=
atch did deprecate a standard POSIX function [1].<br>
<br>
This is the build error:<br>
| ../../../lxc-2.0.0/src/lxc/cgfs.c: In function &#39;cgroup_rmdir&#39;:<br=
>
| ../../../lxc-2.0.0/src/lxc/cgfs.c:172:2: error: &#39;readdir_r&#39; is de=
precated [-Werror=3Ddeprecated-declarations]<br>
|=C2=A0 =C2=A0while (!readdir_r(dir, &amp;dirent, &amp;direntp)) {<br>
|=C2=A0 =C2=A0^<br>
| In file included from ../../../lxc-2.0.0/src/lxc/cgfs.c:30:0:<br>
| /.../build/tmp-glibc/sysroots/qemux86-64/usr/include/dirent.h:183:12: not=
e: declared here<br>
|=C2=A0 extern int readdir_r (DIR *__restrict __dirp,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
[1] <a href=3D"https://www.sourceware.org/ml/libc-alpha/2016-02/msg00093.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://www.sourceware.org/ml/libc=
-alpha/2016-02/msg00093.html</a><br>
<br></blockquote><div><br></div><div>Good timing, just ran into this myself=
 .. saved me workign it out :D</div><div><br></div><div>Merged.</div><div><=
br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org=
">anders.roxell@linaro.org</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.0.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_2.0.0.bb</a> b/recipes-containers/lxc/<a =
href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">lxc_2.0.0=
.bb</a><br>
index 9f01edd..5004b9e 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.0.0.bb</a><br>
@@ -47,6 +47,8 @@ ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-log-src-basename&quot;<br>
<br>
+CFLAGS_append =3D &quot; -Wno-error=3Ddeprecated-declarations&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ??=3D &quot;templates \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;se=
linux&#39;, &#39;selinux&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113b135818d759053315beb6--
