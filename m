Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8144EE00C71; Thu, 29 Nov 2018 09:12:09 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0916E00BFD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 09:12:07 -0800 (PST)
Received: by mail-lf1-f67.google.com with SMTP id i26so2037089lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 09:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WvDYY8yoI3FZUuv/Sen2FVH6cZCS3rZvX2sP3Mqez4Y=;
	b=a47cRRCb+jAwzl5diFQ/jPDJ+OXpaHqWXlSkrW8nEnZQtPjohHcAbg2ERqeyOKYTOF
	YX18txD7y+2/9Sd9+ABcXpq1du3l7YtvFA3om2Eo3l77G4z+Dok4NAC/i4JqJEvK0tAI
	KbmEG3/uksqti7HBFOJGUJGtYTjK7oSUae3XZEr/XJbwhi33ibMCR4aXKrE8YVNxbC3F
	k2psGpQuqeHAlRnQ0Pqb2vNvn+VCCD8P1kTtBpc/wN2tRIQDz15CAjiNjIQNeyI7OkbR
	lj/6y16OrJ7RqjdRxvy0KmMWQsV+cz1hhupVj9sbN1cbauQrMWpEMuzU+BLxPoqBlxSM
	p1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WvDYY8yoI3FZUuv/Sen2FVH6cZCS3rZvX2sP3Mqez4Y=;
	b=eQ8W1YN0bkCzqZbHQxfjICuMd9vvnmDZgc6nec5WR64U3JiX0c8QrZI7k2jdoQScra
	f5Oird6Oqwc9iC9XpdesZkiCKfZHqQd6ZXC6QHowe8fEpiz1WuUA/lmfXgTBHy+r+JGt
	+N9TCW5i9xQL/apy4Dt9oZf1AnAFhRgqJDuWaJMorcAHUD/LoCm9s2drZHlrNJg2YJD3
	nhjhNFTXFqMu7GYV5KfyNUX/oK6cE8W1gm0MHtXnUcIXDupjaIGqgzwbX9uUzDY5fZLl
	uS2yCUxzf/6C5VT89+hPi7o97pgMaG1o4UphoTryK/rOOBcGMtW7r74xciidoGm4dQE8
	3F9Q==
X-Gm-Message-State: AA+aEWbji3Ld/H9TBOhAKmBfJdF+0VtfM3e8fur5ByBPEouFDS1nrVhB
	8a/qRtNujashqbJWR4x5Xz3l3NW6pgWj9KpR3HQ=
X-Google-Smtp-Source: AFSGD/UlG1dDvwlf04AQhn+JLS3iKzmeuN4QfqoFUSfSWrBKOLDLRB5TD3GL951GnRpT94eyiUqUUfGI/cbgnl7OP8M=
X-Received: by 2002:a19:5059:: with SMTP id z25mr1547170lfj.120.1543511526588; 
	Thu, 29 Nov 2018 09:12:06 -0800 (PST)
MIME-Version: 1.0
References: <1543285335-129138-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1543285335-129138-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Nov 2018 12:11:54 -0500
Message-ID: <CADkTA4OPvQxbiuJvkcGfm5mYK-FJNtG0XizvdhJ7bi2da5AoUg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] criu: Don't open /run/criu.kdat if doesn't exists
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
X-List-Received-Date: Thu, 29 Nov 2018 17:12:09 -0000
Content-Type: multipart/alternative; boundary="0000000000003fc602057bd0c8d6"

--0000000000003fc602057bd0c8d6
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Nov 26, 2018 at 9:22 PM Hongzhi.Song <hongzhi.song@windriver.com>
wrote:

> When CRIU is called for a first time and the /run/criu.kdat file does
> not exists, the following warning is shown:
>         Warn  (criu/kerndat.c:847): Can't load /run/criu.kdat
>
> This patch is replacing this warning with a more appropriate debug
> message.
>         File /run/criu.kdat does not exist
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb                |  1 +
>  ...on-t-open-run-criu.kdat-if-doesn-t-exists.patch | 42
> ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644
> recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
>
> diff --git a/recipes-containers/criu/criu_git.bb
> b/recipes-containers/criu/criu_git.bb
> index 00de417..45195ea 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git
> \
>             file://0002-criu-Skip-documentation-install.patch \
>             file://0001-criu-Change-libraries-install-directory.patch \
>
> file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> +
>  file://0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch \
>            "
>
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> diff --git
> a/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
> b/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
> new file mode 100644
> index 0000000..805f799
> --- /dev/null
> +++
> b/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
> @@ -0,0 +1,42 @@
> +From b9760919eb3f805dd3d2af5692b49cba9c468595 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Mon, 26 Nov 2018 02:39:59 -0500
> +Subject: [PATCH] kdat: Don't open /run/criu.kdat if doesn't exists
> +
> +When CRIU is called for a first time and the /run/criu.kdat file does
> +not exists, the following warning is shown:
> +       Warn  (criu/kerndat.c:847): Can't load /run/criu.kdat
> +
> +This patch is replacing this warning with a more appropriate debug
> +message.
> +       File /run/criu.kdat does not exist
> +
> +Signed-off-by: Radostin Stoyanov <rstoyanov1@gmail.com>
> +Signed-off-by: Andrei Vagin <avagin@virtuozzo.com>
> +
> +Upstream-Status: Backport [
> https://github.com/checkpoint-restore/criu/commit/868de91a099c00f099d8a41557d660d173f72521
> ]
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + criu/kerndat.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/criu/kerndat.c b/criu/kerndat.c
> +index 8cb5690..9fb475c 100644
> +--- a/criu/kerndat.c
> ++++ b/criu/kerndat.c
> +@@ -789,7 +789,10 @@ static int kerndat_try_load_cache(void)
> +
> +       fd = open(KERNDAT_CACHE_FILE, O_RDONLY);
> +       if (fd < 0) {
> +-              pr_warn("Can't load %s\n", KERNDAT_CACHE_FILE);
> ++              if(ENOENT == errno)
> ++                      pr_debug("File %s does not exist\n",
> KERNDAT_CACHE_FILE);
> ++              else
> ++                      pr_warn("Can't load %s\n", KERNDAT_CACHE_FILE);
> +               return 1;
> +       }
> +
> +--
> +2.8.1
> +
> --
> 2.8.1
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

--0000000000003fc602057bd0c8d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Nov 26, 2018 at 9:22 P=
M Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.com">hongzhi.so=
ng@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Whe=
n CRIU is called for a first time and the /run/criu.kdat file does<br>
not exists, the following warning is shown:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Warn=C2=A0 (criu/kerndat.c:847): Can&#39;t load=
 /run/criu.kdat<br>
<br>
This patch is replacing this warning with a more appropriate debug<br>
message.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 File /run/criu.kdat does not exist<br>
<br>
Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.co=
m" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...on-t-open-run-criu.kdat-if-doesn-t-exists.patch | 42 +++++++++++++=
+++++++++<br>
=C2=A02 files changed, 43 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/criu/files/0001-kdat-Don-t-open=
-run-criu.kdat-if-doesn-t-exists.patch<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"=
noreferrer" target=3D"_blank">criu_git.bb</a> b/recipes-containers/criu/<a =
href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu_git.b=
b</a><br>
index 00de417..45195ea 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/xemu=
l/criu.git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/=
xemul/criu.git;protocol=3Dgit</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-criu-Skip-documentati=
on-install.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-criu-Change-libraries=
-install-directory.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lib-Makefile-overwrite-ins=
tall-lib-to-allow-multiarc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-kdat-Don-t-open-run-c=
riu.kdat-if-doesn-t-exists.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
diff --git a/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kd=
at-if-doesn-t-exists.patch b/recipes-containers/criu/files/0001-kdat-Don-t-=
open-run-criu.kdat-if-doesn-t-exists.patch<br>
new file mode 100644<br>
index 0000000..805f799<br>
--- /dev/null<br>
+++ b/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-d=
oesn-t-exists.patch<br>
@@ -0,0 +1,42 @@<br>
+From b9760919eb3f805dd3d2af5692b49cba9c468595 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@windrive=
r.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
+Date: Mon, 26 Nov 2018 02:39:59 -0500<br>
+Subject: [PATCH] kdat: Don&#39;t open /run/criu.kdat if doesn&#39;t exists=
<br>
+<br>
+When CRIU is called for a first time and the /run/criu.kdat file does<br>
+not exists, the following warning is shown:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Warn=C2=A0 (criu/kerndat.c:847): Can&#39;t load=
 /run/criu.kdat<br>
+<br>
+This patch is replacing this warning with a more appropriate debug<br>
+message.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0File /run/criu.kdat does not exist<br>
+<br>
+Signed-off-by: Radostin Stoyanov &lt;<a href=3D"mailto:rstoyanov1@gmail.co=
m" target=3D"_blank">rstoyanov1@gmail.com</a>&gt;<br>
+Signed-off-by: Andrei Vagin &lt;<a href=3D"mailto:avagin@virtuozzo.com" ta=
rget=3D"_blank">avagin@virtuozzo.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/checkpoint-restor=
e/criu/commit/868de91a099c00f099d8a41557d660d173f72521" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/checkpoint-restore/criu/commit/868de91=
a099c00f099d8a41557d660d173f72521</a>]<br>
+<br>
+Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.c=
om" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
+---<br>
+ criu/kerndat.c | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/criu/kerndat.c b/criu/kerndat.c<br>
+index 8cb5690..9fb475c 100644<br>
+--- a/criu/kerndat.c<br>
++++ b/criu/kerndat.c<br>
+@@ -789,7 +789,10 @@ static int kerndat_try_load_cache(void)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D open(KERNDAT_CACHE_FILE, O_RDONLY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn(&quot;Can&#39;t =
load %s\n&quot;, KERNDAT_CACHE_FILE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(ENOENT =3D=3D errno)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_debug(&quot;File %s does not exist\n&quot;, KERNDAT_CACHE_FILE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_warn(&quot;Can&#39;t load %s\n&quot;, KERNDAT_CACHE_FILE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-- <br>
+2.8.1<br>
+<br>
-- <br>
2.8.1<br>
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
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature">- Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end<br=
>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><br></div>

--0000000000003fc602057bd0c8d6--
