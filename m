Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18DBAE009BF; Tue,  3 May 2016 19:22:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
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
	*      [209.85.218.54 listed in list.dnswl.org]
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29C66E00B04
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 May 2016 19:22:38 -0700 (PDT)
Received: by mail-oi0-f54.google.com with SMTP id x201so49576679oif.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 May 2016 19:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=eyA1p32jMlGNFf68DGBL7LIcZr0trSbVpfMofTkOqUI=;
	b=wyc6LXe9W5lCV6HmW9h+jgPGQc68SpCe373WHWFD28IlyQ4VkAflYvNvpOaerlukEa
	sQsZXO/2Z0nS53QLC5nb4W6oywk/Wf02bV1QymV9jDUib2AXYG8bR7fOvazVtd50L74h
	vrvNzx5HZIGwH2n/i1X8gk/cPAhp9Eepy5rQYON/+zcQw1qN3POn+kDxiZ/8xsAyfmaf
	SY9Zb1Kcv0Gvn7xzQGQCROFxkjSGl+8vwp6IrroaJialZtieIFRKfjBW9CrlbWa54xjG
	rW6wWFhym+kXCmWZusBfuNhqAC5m8PqSjHd5+8vF3k2scnAB5cB/Gp3ME+DqRdJz0pGK
	3ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=eyA1p32jMlGNFf68DGBL7LIcZr0trSbVpfMofTkOqUI=;
	b=J1jUmQf4MO81E5jMI0w87fwdFL+Ob5U40FScFz0qTNHwoJ4QFZlNLbwF/CMwa/WYOM
	eU9SeM9ijkqk4ub7SALkHHCtpAdjbEW8CiyG6qjz27I0StwliVLsuA5VcuNX4kZw9ILa
	7nLimP3I4KA2cYV3LI9jaCVkaIXBh8NxnUuEjeqGono0OQnyJ93EXhULftbQMdMOrooF
	Zyi/9BbN2vLWnlheK8lTi2fatKmiMZ7yMm84dkL7DOnCKxEJLi6fsiEulVJVCenh1Etm
	pJW1mXZuqR5Rqa+YrKIVV9aEjNQ0e47ILwvpurVzPLdkW6D9YrmPYUL+QzbGpn8fYryn
	OUiw==
X-Gm-Message-State: AOPr4FXBwL7x7uMumzQ0O9Vm9aWXvF5pyEDScdFja+B9u3q+estuG2N+2+Eo+P9Sx/he87xVhPSqaRAr/GXhTQ==
MIME-Version: 1.0
X-Received: by 10.157.16.27 with SMTP id h27mr3046678ote.118.1462328558543;
	Tue, 03 May 2016 19:22:38 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 3 May 2016 19:22:38 -0700 (PDT)
In-Reply-To: <1462245231-87060-1-git-send-email-yunguo.wei@windriver.com>
References: <1462245231-87060-1-git-send-email-yunguo.wei@windriver.com>
Date: Tue, 3 May 2016 22:22:38 -0400
Message-ID: <CADkTA4Ods2_9pMz9rPfWbJBNU9bpgdrZeeUf3qLWZw3bons8wQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yunguo Wei <yunguo.wei@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] criu: Fix QA warning
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
X-List-Received-Date: Wed, 04 May 2016 02:22:45 -0000
Content-Type: multipart/alternative; boundary=001a113dffc046f7f40531fae621

--001a113dffc046f7f40531fae621
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, May 2, 2016 at 11:13 PM, Yunguo Wei <yunguo.wei@windriver.com>
wrote:

> This is fixing:
>
> QA Issue: criu rdepends on libbsd, but it isn't a build dependency?
> [build-deps]
>
> Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/criu/criu_git.bb
> b/recipes-containers/criu/criu_git.bb
> index 48bcdc2..816c806 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -25,7 +25,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git
> \
>
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>
> -DEPENDS += "protobuf-c-native protobuf-c"
> +DEPENDS += "protobuf-c-native protobuf-c libbsd"
>
>  S = "${WORKDIR}/git"
>
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

--001a113dffc046f7f40531fae621
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 2, 2016 at 11:13 PM=
, Yunguo Wei <span dir=3D"ltr">&lt;<a href=3D"mailto:yunguo.wei@windriver.c=
om" target=3D"_blank">yunguo.wei@windriver.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">This is fixing:<br>
<br>
QA Issue: criu rdepends on libbsd, but it isn&#39;t a build dependency? [bu=
ild-deps]<br>
<br>
Signed-off-by: Yunguo Wei &lt;<a href=3D"mailto:yunguo.wei@windriver.com">y=
unguo.wei@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"=
noreferrer" target=3D"_blank">criu_git.bb</a> b/recipes-containers/criu/<a =
href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu_git.b=
b</a><br>
index 48bcdc2..816c806 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
@@ -25,7 +25,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/xemu=
l/criu.git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/=
xemul/criu.git;protocol=3Dgit</a> \<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
<br>
-DEPENDS +=3D &quot;protobuf-c-native protobuf-c&quot;<br>
+DEPENDS +=3D &quot;protobuf-c-native protobuf-c libbsd&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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
</div>

--001a113dffc046f7f40531fae621--
