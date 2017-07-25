Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36954E00C2E; Tue, 25 Jul 2017 06:09:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.67 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86DC5E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:09:33 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id y15so5249554lfd.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/AUh0R4Rt8QNPMkIFfEQu0x6Qm79APTFA8icaSsM8bU=;
	b=W2iCDlZyQVKaq3mMmwQpVPLysWsrDLGOFYVPv58D0+AMYMiHJ8aG0NkzVddD0Ti0Jo
	WKcMhxBJ53yp3E3GSiXDoZZyokFs/vjjNSY7beZOsJqSL8bOFuGtF+c5L+kk/0+1dKxg
	Sha6n4yNAIYCv5azh/3xh7oVB/k73QaZ5ptToPdiqYd5FXYD9cqW7QVY6WSwrtENgMIR
	cfXlMBmia6Tp8f1cIVI82rMdl7u16XXdxGIQHM9di8b70A0On+LKF17PKbSS30/PY9Fb
	82FpmLVzDnu7he0ZnEbvGG0PWHqkH5vkvQu9PDRuIPW3b25w2ueZbWtbSEQelRFsHBA6
	6/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/AUh0R4Rt8QNPMkIFfEQu0x6Qm79APTFA8icaSsM8bU=;
	b=c/+nMJEufPeqg5qgh8Y7XcvCZVk0YKOqHYK0YGCtYkLUjLBTLFkE7TzOhSN2YiYt9J
	wrRG8nrgFbNUSzIS4CuLEI+Ybv0elgOPcl87NJ4ikyUrQP4zOVhlW+HRZ9xHfBj7LfiW
	csbXoMzF/eI8osNQnbys67yusX6CgdnUDxFA6Qbj61Goj7sQ0fFVrkVPA+Mi/bZlcg4w
	/+yRHMK2k2h5epJPf0ux01M/o4QN/S9gxBnyGPqG0To1lo4NeM3SL6tNJU9fY4GNUxBp
	6xD+h0hndfGCvzHeJpNPjKYXvfjyBUps+QQGh6nB5uC0BoTLYO9OF8HCPoPyQKJvdHFp
	6IIA==
X-Gm-Message-State: AIVw11060ickZxMn7ppgprxsFGi4JvezrkrfUCqE2f2jthEB2Fpb3Zxw
	tDq0RS9CAT8TbAq0mJrlKIJ4Sbuxkg==
X-Received: by 10.25.203.8 with SMTP id b8mr5504193lfg.212.1500988172370; Tue,
	25 Jul 2017 06:09:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.2 with HTTP; Tue, 25 Jul 2017 06:09:31 -0700 (PDT)
In-Reply-To: <64f97a6c-0430-1441-ffa5-0c218d1635c5@web.de>
References: <64f97a6c-0430-1441-ffa5-0c218d1635c5@web.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jul 2017 09:09:31 -0400
Message-ID: <CADkTA4Nsdw5984RCUYrzbrPvBrAUboJBcAGRKXK-abex-q3_Pw@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] kernel-features: Fix CONFIG_BLK_CGROUP enabling
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
X-List-Received-Date: Tue, 25 Jul 2017 13:09:34 -0000
Content-Type: multipart/alternative; boundary="94eb2c1a08c4d38b7b0555240a5a"

--94eb2c1a08c4d38b7b0555240a5a
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jul 18, 2017 at 2:23 AM, Jan Kiszka <jan.kiszka@web.de> wrote:

> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> Meanwhile, this became boolean, and trying to make it a module just
> leaves it off.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>
> Do we still needs these config fragments? yocto-kernel-cache seems to
> carry similar things by now.
>
>  recipes-kernel/linux/linux-yocto/lxc.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg
> b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index fa2344a..c25d60f 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -15,7 +15,7 @@ CONFIG_PID_NS=y
>  CONFIG_NET_NS=y
>
>  CONFIG_CLS_CGROUP=m
> -CONFIG_BLK_CGROUP=m
> +CONFIG_BLK_CGROUP=y
>  CONFIG_NETPRIO_CGROUP=m
>
>  CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
> --
> 2.12.3
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c1a08c4d38b7b0555240a5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jul 18, 2017 at 2:23 AM=
, Jan Kiszka <span dir=3D"ltr">&lt;<a href=3D"mailto:jan.kiszka@web.de" tar=
get=3D"_blank">jan.kiszka@web.de</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com=
">jan.kiszka@siemens.com</a>&gt;<br>
<br>
Meanwhile, this became boolean, and trying to make it a module just<br>
leaves it off.<br>
<br>
Signed-off-by: Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan=
.kiszka@siemens.com</a>&gt;<br>
---<br>
<br>
Do we still needs these config fragments? yocto-kernel-cache seems to<br>
carry similar things by now.<br>
<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto/lxc.cfg | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto/lxc.cfg b/recipes-kernel=
/linux/linux-<wbr>yocto/lxc.cfg<br>
index fa2344a..c25d60f 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto/lxc.cfg<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto/lxc.cfg<br>
@@ -15,7 +15,7 @@ CONFIG_PID_NS=3Dy<br>
=C2=A0CONFIG_NET_NS=3Dy<br>
<br>
=C2=A0CONFIG_CLS_CGROUP=3Dm<br>
-CONFIG_BLK_CGROUP=3Dm<br>
+CONFIG_BLK_CGROUP=3Dy<br>
=C2=A0CONFIG_NETPRIO_CGROUP=3Dm<br>
<br>
=C2=A0CONFIG_DEVPTS_MULTIPLE_<wbr>INSTANCES=3Dy<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.3<br>
--<br>
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

--94eb2c1a08c4d38b7b0555240a5a--
