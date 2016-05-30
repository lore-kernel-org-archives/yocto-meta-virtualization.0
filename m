Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 124FDE00C97; Mon, 30 May 2016 11:20:03 -0700 (PDT)
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
	*      [209.85.213.66 listed in list.dnswl.org]
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9154AE00C39
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 May 2016 11:20:00 -0700 (PDT)
Received: by mail-vk0-f66.google.com with SMTP id c189so18260622vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 May 2016 11:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=anOov1+MJSfFqv1s4aJTYW0c2rCWeMefK25y0p4gvOI=;
	b=eE5jAEMusoyb2m4Q1JHJPqve5xqbpVfcloXNSW5PpKZncTz/AWG0LMsfUV9gN0N88g
	Dma6h6Qj3csaQoRN002TtbQTRgGvPY/yMg26WEpRQxBkNL1Vd5akS23GRtCm3Avud1bn
	6OfOkLCCU6fwS4fL6nggvU0Dz0oT8ePeT6BLaq03xjSbbpuGcFRGFHe2yzwn2pLy5x3C
	jzxzBH+r08dKvJGUanbNt26mFd5gmuPX5zTPt25KgJMf/dnwInUEzQzEWdMRcX0yGoGA
	tOjlxH8zQK7rBt0NGJ/dK+6Fxw6wFz7hT07YrxD2HKBKC/OEDDTjzWhm7d5r0/lbLs95
	Tf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=anOov1+MJSfFqv1s4aJTYW0c2rCWeMefK25y0p4gvOI=;
	b=L6sdkKXWIMt9ayTpyzsVa+e0abi/GhOogLQ8lZj2Rwy38Aw5Y6AyU4JXd1KUAGF9uy
	rSu+FqQkisRRXefBGpmBdSziAhGsk78bsyopbXBLYawr//WkZoXQkKfU9WLb/7lDiEeH
	iQYySp7Hq4RoV9Kz6o9pu1et58nkkan46gt+FDIu3MuzyONeDfNBgp1eo5xg7dLP0qZN
	meRKfEhGWGkokrZmNYpZ3FOkQT/n3AKGgOTRdYjmpHuzv8dR1unU0MPxRnHu8plTsHoS
	Wwm0dooBY1N+1UaypthOumzlXowkCs2AayMm8TroxCwCggDA1gsoxIy0EIoHfNCq59N1
	FHjQ==
X-Gm-Message-State: ALyK8tJjB7FWxxFLqorlauzOkQ7AHIcNSV0TKwjoQYUgPNWK/aRSH69FJvs7amPrDZCjwXgKzce8IjYLTTPggw==
MIME-Version: 1.0
X-Received: by 10.176.1.235 with SMTP id 98mr15445080ual.46.1464632399275;
	Mon, 30 May 2016 11:19:59 -0700 (PDT)
Received: by 10.159.35.226 with HTTP; Mon, 30 May 2016 11:19:59 -0700 (PDT)
In-Reply-To: <1464593666-14304-1-git-send-email-yunguo.wei@windriver.com>
References: <1464593666-14304-1-git-send-email-yunguo.wei@windriver.com>
Date: Mon, 30 May 2016 14:19:59 -0400
Message-ID: <CADkTA4OfUUJoBFBsnT7AVNrDUxyfsWGavzS9RbdALV3N-XHzUQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yunguo Wei <yunguo.wei@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: override GOROOT at build time
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
X-List-Received-Date: Mon, 30 May 2016 18:20:03 -0000
Content-Type: multipart/alternative; boundary=001a11469b72e2ae2a0534134d5b

--001a11469b72e2ae2a0534134d5b
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, May 30, 2016 at 3:34 AM, Yunguo Wei <yunguo.wei@windriver.com>
wrote:

> Usually $GOROOT is set by go tool, but if sstate is specified, $GOROOT
> is set to the path in the first project. If docker is built in the
> another project(with same SSTATE_DIR) later, and the first project is
> removed,
> the following error will be seen:
>
> | go: cannot find GOROOT directory:
>
> /path/to/previous/project/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/x86_64-wrs-linux/go
>
> This commit is overriding $GOROOT stored in the go tool in sstate cache,
> making sure it is set to the correct path in current project.
>
> See more information here: https://golang.org/doc/install#install
>
> Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 597ff4f..4eea3f4 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -82,6 +82,7 @@ do_compile() {
>         mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
>         ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
>         export
> GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> +       export
> GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
>         cd -
>
>         # Pass the needed cflags/ldflags so that cgo
> --
> 1.9.1
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11469b72e2ae2a0534134d5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, May 30, 2016 at 3:34 AM, Y=
unguo Wei <span dir=3D"ltr">&lt;<a href=3D"mailto:yunguo.wei@windriver.com"=
 target=3D"_blank">yunguo.wei@windriver.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Usually $GOROOT is set by go tool, but if sstate i=
s specified, $GOROOT<br>
is set to the path in the first project. If docker is built in the<br>
another project(with same SSTATE_DIR) later, and the first project is remov=
ed,<br>
the following error will be seen:<br>
<br>
| go: cannot find GOROOT directory:<br>
/path/to/previous/project/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/x=
86_64-wrs-linux/go<br>
<br>
This commit is overriding $GOROOT stored in the go tool in sstate cache,<br=
>
making sure it is set to the correct path in current project.<br>
<br>
See more information here: <a href=3D"https://golang.org/doc/install#instal=
l" rel=3D"noreferrer" target=3D"_blank">https://golang.org/doc/install#inst=
all</a><br>
<br>
Signed-off-by: Yunguo Wei &lt;<a href=3D"mailto:yunguo.wei@windriver.com">y=
unguo.wei@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">docker_git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker_git.bb</a> b/recipes-containers/do=
cker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_blank">=
docker_git.bb</a><br>
index 597ff4f..4eea3f4 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">docker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">docker_git.bb</a><br>
@@ -82,6 +82,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p .gopath/src/&quot;$(dirname &quot;${DO=
CKER_PKG}&quot;)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../.. .gopath/src/&quot;${DOCKER_P=
KG}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/.gopath:${S}/vendor:=
${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOROOT=3D&quot;${STAGING_DIR_NATIVE}/${n=
onarch_libdir}/${HOST_SYS}/go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a11469b72e2ae2a0534134d5b--
