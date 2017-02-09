Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48A0EE00A51; Thu,  9 Feb 2017 06:16:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4B6AE00A3B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 06:16:35 -0800 (PST)
Received: by mail-qk0-f194.google.com with SMTP id i34so734672qkh.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Feb 2017 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TFvdrlVZt5c/6YdWn4qOvo3jowNhojdjM3AWw1efmZw=;
	b=I6yFqO3026hnjvpLb41TIf6Qwq04wH1S8j0vRQ6mA2CC5d1aYjsZJfXV1BdLs9GxD2
	9tZIh9nbCBZWUiIlSMlY9MlFpr6sLfDvkZUnAHAzekCadGLimal54jL/RzRha0lBfgSM
	7nDG/QeF0XScUS3GcCf/7wuiCBdGtpoLoKsVFpUYrzhF6uZJj5ps2CQdPgoZRehGMiFN
	Oe9H2rUzqNTRNsWek+Bc1seGAB8VdskyDkdac8CsBL4+2qR9wYtmDlln3fDT1vicEidQ
	cf0JzpAcPCDDKxUuRnGObdETiGrGBCniDaOAtsWTds++tkK64RdGEDOyLBUCjztguwdB
	K+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TFvdrlVZt5c/6YdWn4qOvo3jowNhojdjM3AWw1efmZw=;
	b=tJBV/NSMSzncxrD2EUvUPfdYDKTO4cQ0fHpHr/ZDR7QnDqBaFvswEB9MXra3GH0ECJ
	fA443bJnk6hCcRPPIxfu4PvFOhMKtr3tFtYdHXIp3dT7ed2pIcoqqY3GYzmDrIezMvg/
	o2iXF6e1r2z0ScafqYhP0lrPyp/b6zF/CgLzKfyQuZrYUs/De3CpbnLhVR7izcvmCfkq
	CfGUJ46gvkJ+hCOJUW5jTFh16uxYFhEXqzWgJ1aX11tvmCneu2gThFP653xzvsbH7z2U
	SjESgzm80VRv57wvKRkq6Bg/JVMVN1QBcWuwRaQiIcIYdbz5virYs47nRw5wGqJ0Q6/c
	Etqw==
X-Gm-Message-State: AMke39lmqONkUBpmnk8CcVthuYFADeUDyQyl0gjNRItTqIROQ2U+bVc8qkYqyPFdBcGUzw32Re0IiT5DfzcS3Q==
X-Received: by 10.55.22.97 with SMTP id g94mr2889910qkh.287.1486649794872;
	Thu, 09 Feb 2017 06:16:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Thu, 9 Feb 2017 06:16:34 -0800 (PST)
In-Reply-To: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
References: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 Feb 2017 09:16:34 -0500
Message-ID: <CADkTA4MWW-B0qcu2n_atNAO+jHLZ7E_Pmak5GebbVUL6dGZ-rA@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] containerd: Replace /lib/systemd/system with ${systemd_system_unitdir}
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
X-List-Received-Date: Thu, 09 Feb 2017 14:16:37 -0000
Content-Type: multipart/alternative; boundary=001a114967eaedd0c4054819a07b

--001a114967eaedd0c4054819a07b
Content-Type: text/plain; charset=UTF-8

All 4 patches in this series are now merged.

Bruce

On Wed, Feb 8, 2017 at 8:46 AM, Amarnath Valluri <amarnath.valluri@intel.com
> wrote:

> Make use of bitbake variable where appropriate, this makes the recipe
> portable.
>
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  recipes-containers/containerd/containerd_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb
> b/recipes-containers/containerd/containerd_git.bb
> index ca99e55..77c3e93 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -83,6 +83,6 @@ do_install() {
>         fi
>  }
>
> -FILES_${PN} += "/lib/systemd/system/*"
> +FILES_${PN} += "${systemd_system_unitdir}/*"
>
>  INHIBIT_PACKAGE_STRIP = "1"
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
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114967eaedd0c4054819a07b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All 4 patches in this series are now merged.<br><br><=
/div>Bruce<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Wed, Feb 8, 2017 at 8:46 AM, Amarnath Valluri <span dir=3D"ltr">&lt;<=
a href=3D"mailto:amarnath.valluri@intel.com" target=3D"_blank">amarnath.val=
luri@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Make=
 use of bitbake variable where appropriate, this makes the recipe portable.=
<br>
<br>
Signed-off-by: Amarnath Valluri &lt;<a href=3D"mailto:amarnath.valluri@inte=
l.com">amarnath.valluri@intel.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>containerd_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/<wbr>containerd/<a href=3D"http://container=
d_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> b/reci=
pes-containers/<wbr>containerd/<a href=3D"http://containerd_git.bb" rel=3D"=
noreferrer" target=3D"_blank">containerd_git.bb</a><br>
index ca99e55..77c3e93 100644<br>
--- a/recipes-containers/<wbr>containerd/<a href=3D"http://containerd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
+++ b/recipes-containers/<wbr>containerd/<a href=3D"http://containerd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
@@ -83,6 +83,6 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-FILES_${PN} +=3D &quot;/lib/systemd/system/*&quot;<br>
+FILES_${PN} +=3D &quot;${systemd_system_unitdir}/*&quot;<br>
<br>
=C2=A0INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a114967eaedd0c4054819a07b--
